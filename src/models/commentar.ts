import type { Discussion } from './discussion'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { User } from './user'

export type CommentAttribute = BaseAttribute & {
    text: string
}
type CommentCreation = {
    discussion?: Discussion
}
export class Comment extends Model<CommentAttribute,any,CommentCreation> {
    declare text: string
    declare user?: User
    declare discussion?: Discussion

    toAPI() {
        const {updatedAt:_,...data} = this.toJSON();
        const discussion = this.discussion?.toAPI() as any
        const user = this.user?.toAPI()
        return {...data,discussion,user}
    }
}
Comment.init({
    ...baseAttribute,
    text:{
        type: DataTypes.TEXT,
        allowNull:false
    },
},{
    sequelize,
    modelName:"comment",
    tableName:"comment",
    timestamps:true,
    deletedAt:false
})