import type { Discussion } from './discussion'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { User } from './user'

export type CommentAttribute = BaseAttribute & {
    text: string
    discussionId?: number|null
}
type CommentCreation = {
    discussion?: Discussion
}
export class Comment extends Model<CommentAttribute,any,CommentCreation> {
    declare text: string
    declare user?: User
    declare discussion?: Discussion

    // @ts-ignore
    toJSON() {
        const {updatedAt:_,discussionId:_a,...data} = super.toJSON();
        return data
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