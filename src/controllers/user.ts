import { User } from "../models/user";
import AuthorizationException from "../response/authorization_exception";
import EndpointNotFoundException from "../response/endpointnotfound_excepetion";
import { BadParameterException } from "../response/parameter_exception";
import HttpResponse from "../response/response";
import { Request,Response,NextFunction } from "express";
import md5 from 'md5'
import jwt from 'jsonwebtoken'
import { jwtOptions } from "../config";

module UserControllers {
    export async function login(req: Request,res: Response,next: NextFunction) {
        const {username,password} = req.body
        try {
            if(typeof username !== "string") throw new BadParameterException("username")
            if(typeof password !== "string") throw new BadParameterException("password")

            const user =await User.findOne({where:{username}})
            if(!user) throw new AuthorizationException("login_invalid_username");

            const hashPassword = md5(password)
            if(user.password !== hashPassword) throw new AuthorizationException("login_invalid_password");

            const token = jwt.sign({},process.env.JWT_SECRET||"",{
                ...jwtOptions,
                subject:`${user.id}`
            })

            const result = {
                token,
                user: user.toAPI()
            }

            next(new HttpResponse(result))
        } catch(e) {
            next(e)
        }
    }
    /**
     * Internal development function
     */
    export async function registration(req: Request,res: Response,next: NextFunction) {
        const {username,name,password} = req.body
        
        try {
            if(typeof username !== "string") throw new BadParameterException("username")
            if(typeof name !== 'string') throw new BadParameterException("name")
            if(typeof password !== "string") throw new BadParameterException("password")

            const data = await User.create({
                username,
                name,
                password: md5(password)
            })

            next(new HttpResponse(data.toAPI()))
        } catch(e) {
            next(e)
        }
    }
    export async function user(req: Request,res: Response,next: NextFunction) {
        if(!req.context?.user) return next(new EndpointNotFoundException())

        next(new HttpResponse(req.context.user.toAPI()))
    }
}
export default UserControllers