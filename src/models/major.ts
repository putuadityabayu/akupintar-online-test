import type { HasManyAddAssociationsMixin, HasManyRemoveAssociationMixin, HasManyHasAssociationMixin, HasManyAddAssociationMixin, HasManyHasAssociationsMixin, HasManyRemoveAssociationsMixin, HasManyCreateAssociationMixin } from 'sequelize'
import type { Faculty } from './faculty'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { Strata } from './strata'
import type { Subject } from './subject'
import type { User } from './user'

export type MajorAttribute = BaseAttribute & {
    name: string
    accreditation: string
    ukt_maximum: number
    ukt_minimum: number
    website: string|null
    prospect: string|null
    learned: string|null
    strataId?: number|null
    facultyId?: number|null
}

type MajorCreation = {
    strata?: Strata
    faculty?: Faculty
    subjects?: Subject[]
}
export class Major extends Model<MajorAttribute,any,MajorCreation> {
    declare name: string
    declare accreditation: string
    declare ukt_maximum: number
    declare ukt_minimum: number
    declare website: string|null
    declare prospect: string|null
    declare learned: string|null
    declare strata?: Strata
    declare subjects?: Subject[]
    declare likes?: User[]
    declare faculty?: Faculty
    declare faculties?: Faculty
    declare strataId: number|null

    declare addLike: HasManyAddAssociationMixin<User, number>;
    declare removeLike: HasManyRemoveAssociationMixin<User, number>;
    declare hasLike: HasManyHasAssociationMixin<User, number>;
    declare addLikes: HasManyAddAssociationsMixin<User, number>;
    declare removeLikes: HasManyRemoveAssociationsMixin<User, number>;
    declare hasLikes: HasManyHasAssociationsMixin<User, number>;

    declare addSubject: HasManyAddAssociationMixin<Subject, number>;
    declare removeSubject: HasManyRemoveAssociationMixin<Subject, number>;
    declare hasSubject: HasManyHasAssociationMixin<Subject, number>;
    declare addSubjects: HasManyAddAssociationsMixin<Subject, number>;
    declare removeSubjects: HasManyRemoveAssociationsMixin<Subject, number>;
    declare hasSubjects: HasManyHasAssociationsMixin<Subject, number>;
    declare createSubject: HasManyCreateAssociationMixin<Subject,'majorId'>;
    
    toAPI() {
        const {createdAt:_,updatedAt:_a,strataId:_c,ukt_maximum:maximum,ukt_minimum:minimum,facultyId:_d,...data} = this.toJSON()
        const faculty = this.faculty?.toAPI();
        const strata = this.strata?.toAPI();
        return {
            ...data,
            ukt:{
                minimum,
                maximum
            },
            faculty,
            strata
        }
    }
}
Major.init({
    ...baseAttribute,
    name: DataTypes.TEXT,
    accreditation:{
        type: DataTypes.STRING(1),
    },
    ukt_maximum:{
        type: DataTypes.BIGINT
    },
    ukt_minimum:{
        type: DataTypes.BIGINT
    },
    website:{
        type: DataTypes.TEXT
    },
    prospect:{
        type: DataTypes.TEXT
    },
    learned: {
        type: DataTypes.TEXT
    },
    strataId:{
        type: DataTypes.INTEGER
    }
},{
    sequelize,
    modelName:"major",
    tableName:"major",
    timestamps:true,
    deletedAt:false
})