import HttpException from "@response/exception";
import HttpResponse from "@response/response";
import { NextFunction,Response,Request } from "express";

export default function responseMiddleware(response: any,req:Request,res: Response,next:NextFunction) {
    if(response instanceof HttpResponse) {
        const status = response.statusCode||200;
        res.status(status)
        if(response.data) {
            const data = response.data
            res.json(typeof data === 'string' ? {data} : data)
        }
    } else if(response instanceof HttpException) {
        const status = response.statusCode||503;
        const description = (response.message||"internal server error").replace(/\n/," ");
        const name=response.name;
        const json: {error: Record<string,string>} = {
            error:{
                name,
                description
            }
        }
        if(status.toString().startsWith('50')) res.setHeader("Retry-After",1 * 60 * 30);
        res.status(status).json(json);
    } else {
        console.error("ERROR: ", response)
        res.setHeader("Retry-After",1 * 60 * 30);
        res.status(503).json({error:{code:503,name:"server",description:"internal server error"}});   
    }
}