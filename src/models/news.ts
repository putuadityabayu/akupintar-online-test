import type { Campus } from './campus'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { User } from './user'

export type NewsAttribute = BaseAttribute & {
    title: string
    text: string
    campusId?: number|null
    authorId?: number|null
}

export type NewsCreation = {
    campus?: Campus
    author?: User
}
export class News extends Model<NewsAttribute,any,NewsCreation> {
    declare title: string
    declare text: string
    declare campus?: Campus
    declare author?: User

    toJSON() {
        const {campusId:_,authorId:_a,...data} = super.toJSON()
        return data
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
    modelName:"article",
    tableName:"news",
    timestamps:true,
    deletedAt:false
})