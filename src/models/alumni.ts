import type { Campus } from './campus'
import {sequelize,BaseAttribute,baseAttribute,Model,DataTypes} from './helper'

export type AlumniAttribute = BaseAttribute & {
    name: string
    position: string
    image: string|null
    campusId?: string|null
    campus?: Campus
}
export class Alumni extends Model<AlumniAttribute> {
    declare name: string
    declare position: string
    declare image: string|null
    declare campus?: Campus

    toAPI() {
        const {createdAt:_,updatedAt:_a,campusId:_b,...rest} = this.toJSON()
        const campus = this.campus?.toAPI()
        return {...rest,campus};
    }
}
Alumni.init({
    ...baseAttribute,
    name:{
        type: DataTypes.TEXT,
        allowNull:false
    },
    position:{
        type: DataTypes.TEXT,
        allowNull:false
    },
    image:{
        type: DataTypes.TEXT
    }
},{
    sequelize,
    modelName:"alumni",
    tableName:"alumni",
    timestamps:true,
    deletedAt:false,
})