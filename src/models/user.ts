import type { Campus } from "./campus";
import { Model,DataTypes,BaseAttribute,sequelize,baseAttribute } from "./helper";

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

    toAPI() {
        const {id,username,name} = this;
        const following = this.following?.map(c=>c.toAPI())
        return {id,username,name,following}
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