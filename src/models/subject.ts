import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { Major } from './major'

export type SubjectAttribute = BaseAttribute & {
    name: string
    sks: number
}

export class Subject extends Model<SubjectAttribute,any,{major?: Major}> {
    declare name: string
    declare sks: string
    declare major?: Major

    toAPI() {
        const {createdAt:_,updatedAt:_a,...rest} = this.toJSON()
        const major = this.major?.toAPI() as any
        return {...rest,major}
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