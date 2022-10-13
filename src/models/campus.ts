import type { HasManyAddAssociationsMixin, HasManyRemoveAssociationMixin, HasManyHasAssociationMixin, HasManyAddAssociationMixin, HasManyHasAssociationsMixin, HasManyRemoveAssociationsMixin, HasManyCountAssociationsMixin, HasManyCreateAssociationMixin } from "sequelize";
import type { Alumni } from "./alumni";
import type { Discussion } from "./discussion";
import type { Entrance } from "./entrance";
import type { Faculty } from "./faculty";
import { BaseAttribute,sequelize,baseAttribute,Model,DataTypes } from "./helper";
import type { News } from "./news";
import type { Scholarship } from "./scholarship";
import type { User } from "./user";

export type StatusCategoryAttribute = BaseAttribute & {
    name: string
}
export class Status extends Model<StatusCategoryAttribute> {
    declare name: string

    toAPI() {
        const {createdAt:_,updatedAt:_a,...rest} = this.toJSON();
        return rest;
    }
}
Status.init({
    ...baseAttribute,
    name: {
        type: DataTypes.TEXT,
        allowNull:false
    }
},{
    sequelize,
    modelName:'status',
    tableName:'status',
    timestamps:true,
    deletedAt:false
})

export class Category extends Model<StatusCategoryAttribute> {
    declare name: string

    toAPI() {
        const {createdAt:_,updatedAt:_a,...rest} = this.toJSON();
        return rest;
    }
}
Category.init({
    ...baseAttribute,
    name: {
        type: DataTypes.TEXT,
        allowNull:false
    }
},{
    sequelize,
    modelName:'category',
    tableName:'category',
    timestamps:true,
    deletedAt:false
})

export type CampusAttribute = BaseAttribute & {
    name: string
    accreditation: string|null
    profile: string|null
    history: string|null
    achievement: string|null
    location: string
    image: string|null
    phone_number: string|null
    fax: string|number,
    rangking: number|null,
    politeknik?: boolean
    statusId?: number|null
    categoryId?: number|null
    faculties?: Faculty[]
    articles?: News[]
    alumni?: Alumni[]
    discussions?: Discussion[]
    scholarship?: Scholarship[]
    entrances?: Entrance[]
    category?: {
        name: string
    }
    status?: {
        name: string
    }
}

export class Campus extends Model<CampusAttribute> {
    declare name: string
    declare accreditation: string|null
    declare category?: Category
    declare status?: Status
    declare profile: string|null
    declare history: string|null
    declare achievement: string|null
    declare location: string
    declare image: string|null
    declare phone_number: string|null
    declare fax: string|number
    declare rangking: number|null
    declare politeknik: boolean
    declare faculties?: Faculty[]
    declare articles?: News[]
    declare alumnus?: Alumni[]
    declare discussions?: Discussion[]
    declare followers?: User[]
    declare scholarship?: Scholarship[]
    declare entrances?: Entrance[]

    declare addFollower: HasManyAddAssociationMixin<User, number>;
    declare removeFollower: HasManyRemoveAssociationMixin<User, number>;
    declare hasFollower: HasManyHasAssociationMixin<User, number>;
    declare addFollowers: HasManyAddAssociationsMixin<User, number>;
    declare removeFollowers: HasManyRemoveAssociationsMixin<User, number>;
    declare hasFollowers: HasManyHasAssociationsMixin<User, number>;

    declare addFaculty: HasManyAddAssociationMixin<Faculty, number>;
    declare removeFaculty: HasManyRemoveAssociationMixin<Faculty, number>;
    declare hasFaculty: HasManyHasAssociationMixin<Faculty, number>;
    declare addFaculties: HasManyAddAssociationsMixin<Faculty, number>;
    declare removeFaculties: HasManyRemoveAssociationsMixin<Faculty, number>;
    declare hasFaculties: HasManyHasAssociationsMixin<Faculty, number>;
    declare countFaculties: HasManyCountAssociationsMixin;
    declare createFaculty: HasManyCreateAssociationMixin<Faculty,'campusId'>;

    declare addAlumni: HasManyAddAssociationMixin<Alumni, number>;
    declare removeAlumni: HasManyRemoveAssociationMixin<Alumni, number>;
    declare hasAlumni: HasManyHasAssociationMixin<Alumni, number>;
    declare addAlumnus: HasManyAddAssociationsMixin<Alumni, number>;
    declare removeAlumnus: HasManyRemoveAssociationsMixin<Alumni, number>;
    declare hasAlumnus: HasManyHasAssociationsMixin<Alumni, number>;
    declare countAlumnus: HasManyCountAssociationsMixin;
    declare createAlumni: HasManyCreateAssociationMixin<Alumni,'campusId'>;

    toAPI() {
        const {createdAt:_,updatedAt:_a,statusId:_b,categoryId:_c,...rest} = this.toJSON()
        const status = this.status?.toAPI();
        const category = this.category?.toAPI();

        const faculties = this.faculties?.map(c=>c.toJSON())
        const articles = this.articles?.map(c=>c.toJSON())
        const alumnus = this.alumnus?.map(c=>c.toJSON()) as Record<string,any>|undefined
        const discussions = this.discussions?.map(c=>c.toJSON())
        const followers = this.followers?.map(c=>c.toJSON())
        const scholarship = this.scholarship?.map(c=>c.toJSON())
        const entrances = this.entrances?.map(c=>c.toJSON())

        return {...rest,status,category,faculties,articles,alumnus,discussions,followers,scholarship,entrances}
    }
}
Campus.init({
    ...baseAttribute,
    name: DataTypes.TEXT,
    accreditation: DataTypes.STRING(1),
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
    },
    politeknik:{
        type: DataTypes.BOOLEAN,
        defaultValue:false
    }
},{
    sequelize,
    modelName:"campus",
    tableName:"campus",
    timestamps:true,
    deletedAt:false
})