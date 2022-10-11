import type { Campus } from "./campus";
import type { Discussion } from "./discussion";
import { Model,DataTypes,BaseAttribute,sequelize,baseAttribute } from "./helper";

export type ScholarshipAttribute = BaseAttribute & {
    by: string|null
    country: string|null
    education: string|null
    deadline_from: Date|null
    deadline_to: Date|null
    selection: Date|null
    announcement: Date|null
    description: string|null
    scholarship: string|null
    condition: string|null
    document: string|null
    procedure: string|null
    schedule: string|null
    campus?: Campus[]
    discussion?: Discussion[]
}

type ScholarshipCreation = {
    campus?: Campus[]
    discussion?: Discussion[]
}
export class Scholarship extends Model<ScholarshipAttribute,any,ScholarshipCreation> {
    declare by: string|null
    declare country: string|null
    declare education: string|null
    declare deadline_from: Date|null
    declare deadline_to: Date|null
    declare selection: Date|null
    declare announcement: Date|null
    declare description: string|null
    declare beasiswa: string|null
    declare syarat: string|null
    declare document: string|null
    declare procedure: string|null
    declare schedule: string|null

    declare campus?: Campus[]
    declare discussion?: Discussion[]

    toAPI() {
        const data = this.toJSON();
        const campus = this.campus?.map(c=>c.toAPI())

        return {...data,campus}
    }

}
Scholarship.init({
    ...baseAttribute,
    by: DataTypes.TEXT,
    country: DataTypes.TEXT,
    education: DataTypes.TEXT,
    deadline_from: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    },
    deadline_to:{
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    },
    selection: DataTypes.DATE,
    announcement: DataTypes.DATE,
    description: DataTypes.TEXT,
    scholarship: DataTypes.TEXT,
    condition: DataTypes.TEXT,
    document: DataTypes.TEXT,
    procedure: DataTypes.TEXT,
    schedule: DataTypes.TEXT
},{
    sequelize,
    modelName:"scholarship",
    tableName:"scholarship",
    timestamps:true,
    deletedAt:false
})