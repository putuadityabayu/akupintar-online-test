import { HasManyAddAssociationsMixin, HasManyRemoveAssociationMixin, HasManyHasAssociationMixin } from "sequelize";
import type { Alumni } from "./alumni";
import type { Discussion } from "./discussion";
import type { Entrance } from "./entrance";
import type { Faculty } from "./faculty";
import { BaseAttribute,sequelize,baseAttribute,Model,DataTypes } from "./helper";
import type { News } from "./news";
import type { Scholarship } from "./scholarship";
import type { User } from "./user";

export type CampusAttribute = BaseAttribute & {
    accreditation: string
    category: string
    status: string
    profile: string|null
    history: string|null
    achievement: string|null
    location: string
    image: string|null
    phone_number: string|null
    fax: string|number,
    rangking: number|null
}

export type CampusCreation = {
    faculties?: Faculty[]
    news?: News[]
    alumni?: Alumni[]
    discussions?: Discussion[]
    scholarship?: Scholarship[]
    entrances?: Entrance[]
}
export class Campus extends Model<CampusAttribute,any,CampusCreation> {
    declare accreditation: string
    declare category: string
    declare status: string
    declare profile: string|null
    declare history: string|null
    declare achievement: string|null
    declare location: string
    declare faculties?: Faculty[]
    declare news?: News[]
    declare alumni?: Alumni[]
    declare discussions?: Discussion[]
    declare followers?: User[]
    declare scholarship?: Scholarship[]
    declare entrances?: Entrance[]

    declare addFollowers: HasManyAddAssociationsMixin<User, number>;
    declare removeFollowers: HasManyRemoveAssociationMixin<User, number>;
    declare hasFollowers: HasManyHasAssociationMixin<User, number>;
    
    toAPI() {
        const {createdAt:_,updatedAt:_a,...rest} = this.toJSON()
        const news = this.news?.map(c=>c.toAPI()) as any[]
        const faculties = this.faculties?.map(c=>c.toAPI()) as any[]
        const alumni = this.alumni?.map(c=>c.toAPI()) as any[]
        const discussions = this.discussions?.map(c=>c.toAPI()) as any[]
        const followers = this.followers?.map(c=>c.toAPI()) as any[]
        const scholarship = this.scholarship?.map(c=>c.toAPI()) as any[]
        const entrances = this.entrances?.map(c=>c.toAPI()) as any[]

        return {...rest,news,faculties,alumni,discussions,followers,scholarship,entrances}
    }
}
Campus.init({
    ...baseAttribute,
    accreditation:{
        type: DataTypes.STRING(1),
        allowNull:false
    },
    category:{
        type: DataTypes.TEXT,
        allowNull:false
    },
    status:{
        type: DataTypes.TEXT,
        allowNull:false
    },
    profile:{
        type: DataTypes.TEXT
    },
    history:{
        type: DataTypes.TEXT
    },
    achievement:{
        type: DataTypes.TEXT
    },
    location:{
        type: DataTypes.TEXT,
        allowNull:false
    },
    image:{
        type: DataTypes.TEXT
    },
    phone_number:{
        type: DataTypes.TEXT
    },
    fax:{
        type: DataTypes.TEXT
    },
    rangking:{
        type: DataTypes.INTEGER
    }
},{
    sequelize,
    modelName:"campus",
    tableName:"campus",
    timestamps:true,
    deletedAt:false
})