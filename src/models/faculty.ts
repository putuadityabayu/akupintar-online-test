import type { Campus } from './campus'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { Major } from './major'

export type FacultyAttribute = BaseAttribute & {
    name: string
}

type FacultyCreation = {
    majors?: Major[]
    campus?: Campus
}
export class Faculty extends Model<FacultyAttribute,any,FacultyCreation> {
    declare name: string
    declare majors?: Major[]
    declare campus?: Campus

    toAPI() {
        const {createdAt:_,updatedAt:_a,...data} = this.toJSON()
        const campus = this.campus?.toAPI()
        const major = this.majors?.map(c=>c.toAPI())
        return {...data,campus,major}
    }
}
Faculty.init({
    ...baseAttribute,
    name:{
        type: DataTypes.TEXT,
        allowNull:false
    }
},{
    sequelize,
    modelName:"faculty",
    tableName:"faculty",
    timestamps:true,
    deletedAt:false
})
