export * as User from './User'
export * as Project from './Project'
export * as Query from './Query';
export const Feed = {
    __resolveType: (obj: any, context: any, info: any) => {
        console.log(typeof obj)
        console.log('resolving... body:',obj.body,' description: ',obj.description,' bio:', obj.bio)

        if (obj.body) {
            return 'Announcement';
        }
        if (obj.description) {
            return 'Project'
        }
        if (obj.name) {
            return 'User'
        }
        return null;
    }
}
