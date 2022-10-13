import type { Discussion } from './discussion'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { User } from './user'

export type CommentAttribute = BaseAttribute & {
    text: string
    discussionId?: number|null
    discussion?: Discussion
}
export class Comment extends Model<CommentAttribute> {
    declare text: string
    declare user?: User
    declare discussion?: Discussion

    toAPI() {
        const {updatedAt:_,discussionId:_a,...data} = this.toJSON();
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