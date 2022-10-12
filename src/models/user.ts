import type { Campus } from "./campus";
import { Model,DataTypes,BaseAttribute,sequelize,baseAttribute } from "./helper";
import type { Major } from "./major";

export type UserAttribute = BaseAttribute & {
    name: string|null
    username: string
    password: string
}
export class User extends Model<UserAttribute> {
    declare name: string|null
    declare username: string
    declare password: string
    declare createdAt: Date
    declare updatedAt: Date
    declare following?: Campus[]
    declare major_likes?: Major[]

    // @ts-ignore
    toJSON() {
        const {id,username,name} = this;
        return {id,username,name}
    }
}

User.init({
    ...baseAttribute,
    name:{
        type: DataTypes.TEXT,
    },
    username:{
        type: DataTypes.STRING,
        allowNull:false,
        unique:true
    },
    password:{
        type: DataTypes.STRING,
        allowNull:false
    }
},{
    sequelize,
    modelName:'user',
    tableName:"user",
    timestamps:true,
    deletedAt:false
})