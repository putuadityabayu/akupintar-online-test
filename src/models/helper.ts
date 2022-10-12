import { CopyPartial } from "../type"
import {Sequelize,DataTypes,Model as BaseModel} from 'sequelize'

export {DataTypes} from 'sequelize'
export const sequelize = new Sequelize({
    dialect:'mysql',
    database:process.env.DB_DATABASE,
    username: process.env.DB_USER,
    password: process.env.DB_PASS,
    host: process.env.DB_HOST,
    timezone:'+07:00',
    omitNull:true,
    logging:false
});

export const baseAttribute = {
    id:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    createdAt:{
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
        allowNull:false
    },
    updatedAt:{
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
        allowNull:false
    }
}

export abstract class Model<A extends {} = any,C extends keyof A = any, D extends {}={}> extends BaseModel<A,Creation<A,C> & D> {
    declare id: number
    declare createdAt: Date
    declare updatedAt: Date

    toJSON() {
        return super.toJSON()
    }
}

export type Creation<D extends {
    id?: number,
    createdAt?: Date,
    updatedAt?: Date
},Others extends keyof D = any> = CopyPartial<D,
Others | 'id'|'createdAt'|'updatedAt'
>

export type BaseAttribute = {
    id: number
    createdAt?: Date
    updatedAt?: Date
}