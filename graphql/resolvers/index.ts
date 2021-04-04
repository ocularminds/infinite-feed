export * as User from './User'
export * as Project from './Project'
export * as Query from './Query';
export const Feed = {
    __resolveType: (obj: any, context: any, info: any) => {
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
