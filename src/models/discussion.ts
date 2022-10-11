import type { Campus } from './campus'
import type { Comment } from './commentar'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes, Creation} from './helper'
import type { Scholarship } from './scholarship'
import type { User } from './user'

export type DiscussionAttribute = BaseAttribute & {
    text: string
}
export type DiscussionCreation = {
    campus?: Campus,
    user?: User,
    comments?: Comment[]
}
export class Discussion extends Model<DiscussionAttribute,any,DiscussionCreation> {
    declare id: number
    declare createdAt: Date
    declare updatedAt: Date
    declare text: string
    declare user?: User
    declare campus?: Campus
    declare scholarship?: Scholarship
    declare comments?: Comment[]

    toAPI() {
        const {updatedAt:_,...data} = this.toJSON();
        const user = this.user?.toAPI();
        const campus = this.campus?.toAPI()
        const scholarship = this.scholarship?.toAPI()
        const comments = this.comments?.map(c=>c.toAPI())
        return {
            ...data,
            user,
            ...(campus ? {
                campus
            } : scholarship ? {
                scholarship
            } : {}),
            comments}
    }
}
Discussion.init({
    ...baseAttribute,
    text:{
        type: DataTypes.TEXT,
        allowNull:false
    },

},{
    sequelize,
    modelName:"discussion",
    tableName:"discussion",
    timestamps:true,
    deletedAt:false
})