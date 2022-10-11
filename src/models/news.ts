import type { Campus } from './campus'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'

export type NewsAttribute = BaseAttribute & {
    title: string
    text: string
}

export class News extends Model<NewsAttribute,any,{campus?: Campus}> {
    declare title: string
    declare text: string
    declare campus?: Campus

    toAPI() {
        const data = this.toJSON()
        const campus = this.campus?.toAPI()
        return {...data,campus}
    }
}
News.init({
    ...baseAttribute,
    title:{
        type: DataTypes.TEXT,
        allowNull:false
    },
    text:{
        type: DataTypes.TEXT,
    }
},{
    sequelize,
    modelName:"news",
    tableName:"news",
    timestamps:true,
    deletedAt:false
})