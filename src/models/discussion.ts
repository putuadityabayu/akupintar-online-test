import type { HasManyAddAssociationsMixin, HasManyRemoveAssociationMixin, HasManyHasAssociationMixin } from 'sequelize'
import type { Campus } from './campus'
import type { Comment } from './comment'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes, Creation} from './helper'
import type { Scholarship } from './scholarship'
import { User } from './user'

export type DiscussionAttribute = BaseAttribute & {
    text: string
    campusId?: number|null
    scholarshipId?: number|null
    userId?: number|null
    campus?: Campus,
    user?: User,
    scholarship?: Scholarship
    comments?: Comment[],
    votes?: Votes[]
}

export class Discussion extends Model<DiscussionAttribute> {
    declare id: number
    declare createdAt: Date
    declare updatedAt: Date
    declare text: string
    declare user?: User
    declare campus?: Campus
    declare scholarship?: Scholarship
    declare comments?: Comment[]
    declare votes?: Votes[]

    declare addVote: HasManyAddAssociationsMixin<User, number>;
    declare removeVote: HasManyRemoveAssociationMixin<User, number>;
    declare hasVote: HasManyHasAssociationMixin<User, number>;

    toAPI() {
        const {updatedAt:_,campusId:_a,scholarshipId:_b,userId:_c,...data} = this.toJSON();
        return data
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

type VotesAttribute = {
    type: 'up'|'down'
}
export class Votes extends Model<VotesAttribute> {
    declare type: 'up'|'down'
}
Votes.init({
    type:{
        type: DataTypes.STRING(4),
        allowNull:false
    }
},{
    sequelize,
    modelName:'discussion_votes',
    tableName:'discussion_votes',
    timestamps:false
})