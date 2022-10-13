import { Campus, Category, Status } from "../models/campus";
import { Faculty } from "../models/faculty";
import { Major } from "../models/major";
import { Strata } from "../models/strata";
import { User } from "../models/user";
import EndpointNotFoundException from "../response/endpointnotfound_excepetion";
import NotFoundException from "../response/notfound_exception";
import HttpResponse from "../response/response";
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
                          '$status.name$':category,
                          '$category.name$':category
                        }
                    } : {})
                },
                offset:start,
                limit:page_size,
                include:[{
                  model:Status
                },{
                  model:Category
                }]
            })
            const total_pages = Math.ceil(total/page_size);
            const data = await Promise.all(rows?.map(async(c)=>{
                const is_followed = req.context?.user ? await c.hasFollower(req.context.user as User) : false
                const {followers:_,...rest} = c.toAPI();
                return {
                    ...rest,
                    is_followed
                }
            }))

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
        const id = req.params?.id
        try {
          const campus = await Campus.findOne({
            where:{
              id
            },
            include:[
              {
                model:User,
                as:"followers"
              }
            ]
          })
          if(!campus) throw new NotFoundException("campus",id)

          await campus.addFollower(req.context.user);

          next(new HttpResponse({success:true}))
        } catch(e) {
            next(e)
        }
    }

    export async function unfollow(req: Request,_: Response,next: NextFunction) {
        if(!req.context?.user) return next(new EndpointNotFoundException())
        const id = req.params?.id
        try {
          const campus = await Campus.findOne({
            where:{
              id
            },
            include:[
              {
                model:User,
                as:"followers"
              }
            ]
          })
          if(!campus) throw new NotFoundException("campus",id)

          await campus.removeFollower(req.context.user);

          next(new HttpResponse({success:true}))
        } catch(e) {
            next(e)
        }
    }

    export async function findMajors(req: Request,_: Response,next: NextFunction) {
        const id = req.params?.id
        const query = typeof req.query?.q === "string" ? decodeURIComponent(req.query?.q) : undefined
        const strata = typeof req.query?.strata === "string" ? decodeURIComponent(req.query?.strata) : undefined
        const page_size = Number(req.query?.page_size||15)
        const page = Number(req.query?.page||1)
        try {
          const start = page > 1 ? (page*page_size)-page_size : 0;
            const {count:total,rows} = await Major.findAndCountAll({
                where:{
                  ...(query ? {
                    name:{
                        [Op.like]: `%${query}%`
                    }
                  } : {}),
                  ...(strata ? {
                    '$strata.name$':strata,
                  } : {})
                },
                offset:start,
                limit:page_size,
                include:[{
                  model:Faculty,
                  required:true,
                  include:[{
                    model: Campus,
                    where:{
                      id
                    }
                  }]
                },{
                  model:Strata,
                  as:"strata",
                  required:true
                }]
            })
            const total_pages = Math.ceil(total/page_size);
            const data = rows?.map(c=>c.toAPI())

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
}

export default CampusControllers