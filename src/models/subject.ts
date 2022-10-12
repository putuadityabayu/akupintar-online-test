import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { Major } from './major'

export type SubjectAttribute = BaseAttribute & {
    name: string
    sks: number
    majorId?: number|null
}

export type SubjectCreation = {
    major?: Major
}
export class Subject extends Model<SubjectAttribute,any,SubjectCreation> {
    declare name: string
    declare sks: string
    declare major?: Major

    toAPI() {
        const {createdAt:_,updatedAt:_a,majorId:_b,...rest} = this.toJSON()
        return rest
    }
}
Subject.init({
    ...baseAttribute,
    name:{
        type: DataTypes.TEXT,
        allowNull:false
    },
    sks:{
        type: DataTypes.INTEGER,
        allowNull:false
    }
},{
    sequelize,
    modelName:"subject",
    tableName:"subject",
    timestamps:true,
    deletedAt:false
})