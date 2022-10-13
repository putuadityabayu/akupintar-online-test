import { HasManyAddAssociationMixin, HasManyRemoveAssociationMixin, HasManyHasAssociationMixin, HasManyAddAssociationsMixin, HasManyRemoveAssociationsMixin, HasManyHasAssociationsMixin, HasManyCreateAssociationMixin } from 'sequelize'
import type { Campus } from './campus'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { Major } from './major'
import type { Strata } from './strata'

export type FacultyAttribute = BaseAttribute & {
    name: string
    campusId?: number|null
    campus?: Campus
    majors?: Major[]
}

export class Faculty extends Model<FacultyAttribute> {
    declare name: string
    declare majors?: Major[]
    declare campus?: Campus

    declare addMajor: HasManyAddAssociationMixin<Major, number>;
    declare removeMajor: HasManyRemoveAssociationMixin<Major, number>;
    declare hasMajor: HasManyHasAssociationMixin<Major, number>;
    declare addMajors: HasManyAddAssociationsMixin<Major, number>;
    declare removeMajors: HasManyRemoveAssociationsMixin<Major, number>;
    declare hasMajors: HasManyHasAssociationsMixin<Major, number>;
    declare createMajor: HasManyCreateAssociationMixin<Major,'facultyId'>;

    toAPI() {
        const {createdAt:_,updatedAt:_a,campusId:_b,campus:_c,...data} = super.toJSON()
        const majors = this.majors?.map(c=>c.toAPI()) as Record<string,any>[]|undefined
        return {...data,majors}
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

