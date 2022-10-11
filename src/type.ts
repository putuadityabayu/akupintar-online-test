import { User } from "@models/user"

export type CopyPartial<Base,WhichPartial extends keyof Base> = Omit<Base,WhichPartial> & Partial<Base>

export type Context = {
    user?: User
}

declare global {
    namespace Express {
        export interface Request {
            /**
             * Context
             */
            context: Context
        }
    }
}