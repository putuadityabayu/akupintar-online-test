import type { Campus } from "./campus";
import { BaseAttribute,sequelize,baseAttribute,Model,DataTypes } from "./helper";

export type EntranceAttribute = {
    registration_from: Date,
    registration_to: Date,
    level: string,
    fees: number,
    website: string,
    condition: string
    campus?: Campus[]
}

export class Entrance extends Model<EntranceAttribute> {
    declare registration_from: Date
    declare registration_to: Date
    declare level: string
    declare fees: number
    declare website: string
    declare condition: string

    declare campus?: Campus[]

}
Entrance.init({
    ...baseAttribute,
    registration_from: DataTypes.DATE,
    registration_to: DataTypes.DATE,
    level: DataTypes.STRING,
    fees: DataTypes.INTEGER,
    website: DataTypes.TEXT,
    condition: DataTypes.TEXT
},{
    sequelize,
    modelName:'entrance',
    tableName:"entrance",
    timestamps:true,
    deletedAt:false
})