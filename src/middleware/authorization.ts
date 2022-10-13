import { User } from '../models/user';
import AuthorizationException from '../response/authorization_exception';
import { jwtOptions } from '../config';
import { Request,Response,NextFunction } from 'express';
import jwt,{JsonWebTokenError} from 'jsonwebtoken'


export default async function authorization(req: Request,_: Response,next: NextFunction) {
    if(req?.headers?.authorization) {
        const auth_splice = req.headers.authorization.split(" ");
        const auth_type = auth_splice[0].toLowerCase();

        if(auth_type !== "bearer") return next(new AuthorizationException("not_supported"))
        const token_header = auth_splice[1];
        if(token_header.length <= 0) return next(new AuthorizationException("missing_access_token"))

        try {
            const result = jwt.verify(token_header,process.env.JWT_SECRET||"",{
                issuer: jwtOptions.issuer,
                audience: jwtOptions.audience
            }) as jwt.JwtPayload
            const userid = result.sub
            if(!userid) return next(new AuthorizationException("invalid_access_token"))
            const user = await User.findOne({
                where:{
                    id:userid
                }
            })
            if(!user) return next(new AuthorizationException("invalid_access_token"))
            req.context = {
                user
            }
            return next()
        } catch(e) {
            if(e instanceof JsonWebTokenError) {
                console.log(e.message)
                return next(new AuthorizationException("invalid_access_token"))
            }
        }
    }
    next()
}

export function loginMiddleware(req: Request,res: Response,next: NextFunction) {
    if(!req.context?.user) return next(new AuthorizationException("unauthorized"))
    next()
}