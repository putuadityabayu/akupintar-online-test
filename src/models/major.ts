import type { Faculty } from './faculty'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'
import type { Subject } from './subject'

export type MajorAttribute = BaseAttribute & {
    accreditation: string
    ukt_maximum: number
    ukt_minimum: number
    website: string|null
    prospect: string|null
    learned: string|null
    campusId: number|null
}

type MajorCreation = {
    faculty?: Faculty
    subjects?: Subject[]
}
export class Major extends Model<MajorAttribute,any,MajorCreation> {
    declare accreditation: string
    declare ukt_maximum: number
    declare ukt_minimum: number
    declare website: string|null
    declare prospect: string|null
    declare learned: string|null
    declare faculty?: Faculty
    declare subjects?: Subject[]
    
    toAPI() {
        const {createdAt:_,updatedAt:_a,ukt_maximum:maximum,ukt_minimum:minimum,...data} = this.toJSON()
        const faculty = this.faculty?.toAPI() as any
        const subjects = this.subjects?.map(c=>c.toAPI())
        return {
            ...data,
            ukt:{
                minimum,
                maximum
            },
            faculty,
            subjects
        }
    }
}
Major.init({
    ...baseAttribute,
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
    campusId: DataTypes.INTEGER
},{
    sequelize,
    modelName:"major",
    tableName:"major",
    timestamps:true,
    deletedAt:false
})