import type { Faculty } from "./faculty"
import { DataTypes,Model,BaseAttribute, baseAttribute, sequelize } from "./helper"
import type { Major } from "./major"


export type StrataAttribute = BaseAttribute & {
    name: string
}

type StrataCreation = {
    majors?: Major[]
}
export class Strata extends Model<StrataAttribute,any,StrataCreation> {
    declare name: string
    declare majors?: Major[]

    // @ts-ignore
    toJSON() {
        const {createdAt:_,updatedAt:_a,...data} = super.toJSON()
        return {...data}
    }
}
Strata.init({
    ...baseAttribute,
    name:{
        type: DataTypes.TEXT,
        allowNull:false
    }
},{
    sequelize,
    modelName:"strata",
    tableName:"strata",
    timestamps:true,
    deletedAt:false
})