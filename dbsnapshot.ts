import dookie from 'dookie';
import fs from 'fs';
import Mongo from '../../../services/mongo/schema';
import { deleteMongo } from '../../../services/mongo/resolvers';
import mongoose, { ConnectionOptions } from 'mongoose'

type DeleteCommand = {
    collection: any;
    filter: any;
}

/**
* delete data from biggest tables
*/
const executeCommands = async (commands: Array<DeleteCommand>) => {
    commands.forEach(async command => {
        await deleteMongo({
            context: ContextTest,
            mongoObject: command.collection,
            filter: command.filter,
        })
    });
}

/** 
* Connect to a Mongo database and return a connection (uses Mongoose ORM) 
*/
export async function createMongoConnection(mongoURI: string, options: ConnectionOptions, logger?: Logger) {
  let mongooseConnection: any
  try {
    mongoose.Promise = global.Promise
    mongoose.set('useCreateIndex', true)
    mongooseConnection = await mongoose.createConnection(mongoURI, options)
    logger?.log('Connected to MongoDB instance.')
  } catch (error) {
    if (!logger) console.log('Error connecting to MongoDB:', error)
    logger?.error('Error connecting to MongoDB:', error)
  }
  return mongooseConnection
}


/*
Add a script to create a snapshot of a staging database, 
delete most of the unneeded records, and save a JSON snapshot
in the smokeTest directory
*/
export const createDbSnapshot = async (mongoUri:string, stagingDbUrl: string, targetDate: string) => {
    console.log("...creating staging db snapshot");
    const localDb = `${mongoUri}$smokeTemp`;
    const localConnection = await createMongoConnection(localDb, null, null);
    const json = await dookie.pull(stagingDbUrl);
    await dookie.push(localDb, json);
    
    const DATE_FILTER = { $lte: new Date(targetDate).toISOString() };
    const ACTIONS: DeleteCommand = { collection: Mongo.UserAction, filter: {} };
    const STARTS: DeleteCommand = { collection: Mongo.UserStats, filter: { "createdOn": DATE_FILTER } };
    const CREDENTIALS: DeleteCommand = { collection: Mongo.UserStats, filter: { "createdOn": DATE_FILTER } };
    await executeCommands([ACTIONS, STARTS, CREDENTIALS]);
    await dookie.pull(localDb).then(function(res) {
        fs.writeFileSync('./databaseSnapshot.json', res);
    });
}