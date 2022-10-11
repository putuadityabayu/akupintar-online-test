import { Campus } from "@models/campus";
import { Major } from "@models/major";
import { User } from "@models/user";
import EndpointNotFoundException from "@response/endpointnotfound_excepetion";
import HttpResponse from "@response/response";
import { Request,Response,NextFunction } from "express";
import { Op } from "sequelize";

module CampusControllers {
    export async function search(req: Request,_: Response,next: NextFunction) {
        const query = typeof req.query?.q === "string" ? decodeURIComponent(req.query?.q) : undefined
        const category = typeof req.query?.category === "string" ? decodeURIComponent(req.query?.category).toLowerCase() : undefined
        const page_size = Number(req.query?.page_size||15)
        const page = Number(req.query?.page||1)
        try {
            const start = page > 1 ? (page*page_size)-page_size : 0;
            const {count:total,rows} = await Campus.findAndCountAll({
                where:{
                    ...(query ? {
                        name:{
                            [Op.like]: `%${query}%`
                        }
                    } : {}),
                    ...(category ? {
                        [Op.or]:{
                            category,
                            status:category
                        }
                    } : {})
                },
                offset:start,
                limit:page_size
            })
            const total_pages = Math.ceil(total/page_size);

            const data = req.context?.user ? await Promise.all(rows?.map(async(c)=>{
                const is_followed = await c.hasFollowers(req.context.user as User)
                return {
                    ...c.toAPI(),
                    is_followed
                }
            })) : rows?.map(c=>c.toAPI())

            const result = {
                page,
                total,
                total_pages,
                data
            }
            next(new HttpResponse(result))
        } catch(e) {
            next(e)
        }
    }

    export async function follow(req: Request,_: Response,next: NextFunction) {
        if(!req.context?.user) return next(new EndpointNotFoundException())
        try {

        } catch(e) {
            next(e)
        }
    }

    export async function unfollow(req: Request,_: Response,next: NextFunction) {
        if(!req.context?.user) return next(new EndpointNotFoundException())
        try {

        } catch(e) {
            next(e)
        }
    }

    export async function findMajors(req: Request,_: Response,next: NextFunction) {

        try {
            const majors = Major.findAndCountAll({
                where:{
                    
                }
            })
        } catch(e) {
            next(e)
        }
    }

    /**
     * Internal development function
     */
     export async function create(req: Request,res: Response,next: NextFunction) {

        try {
            /*const campus = await Campus.create({

            })*/
        } catch(e) {
            next(e)
        }
    }
}