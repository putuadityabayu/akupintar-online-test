import { Alumni } from "./alumni";
import {Campus} from "./campus";
import { Comment } from "./commentar";
import { Discussion } from "./discussion";
import { Entrance } from "./entrance";
import { Faculty } from "./faculty";
import { sequelize } from "./helper";
import { Major } from "./major";
import { News } from "./news";
import { Scholarship } from "./scholarship";
import { Subject } from "./subject";
import {User} from "./user";

export default async function modelInitialization() {
    initRelation();
    if(process.env.NODE_ENV !== "production") {
        /*await Promise.all([
            User.sync({alter:true}),
            Campus.sync({alter:true}),
        ])
        await Faculty.sync({alter:true}),
        await Major.sync({alter:true}),

        await Promise.all([
            Subject.sync({alter:true}),
            News.sync({alter:true}),
            Discussion.sync({alter:true}),
            Alumni.sync({alter:true})
        ])
        await Comment.sync({alter:true})*/
        await sequelize.sync({alter:true})
    }
    
}

function initRelation() {
    /**
     * Faculties
     */
    Campus.hasMany(Faculty,{onDelete:"CASCADE",as:"faculties"})
    Faculty.belongsTo(Campus,{onDelete:"CASCADE",as:"campus"})

    /**
     * Major
     */
    Faculty.hasMany(Major,{onDelete:"CASCADE",as:"majors"})
    Major.belongsTo(Faculty,{as:"faculty"})

    /**
     * Subject
     */
    Major.hasMany(Subject,{onDelete:"CASCADE",as:"subjects"})
    Subject.belongsTo(Major,{onDelete:"CASCADE",as:"major"})

    /**
     * News
     */
    Campus.hasMany(News,{onDelete:"CASCADE",as:"news"})
    News.belongsTo(Campus,{as:"campus"})

    /**
     * Discussion
     */
    Discussion.belongsTo(User,{onDelete:"CASCADE",as:"user"})
    Discussion.belongsTo(Campus,{onDelete:"CASCADE",as:"campus"})
    Campus.hasMany(Discussion,{onDelete:"CASCADE",as:"discussions"})

    /**
     * Comments
     */
    Comment.belongsTo(Discussion,{onDelete:"CASCADE",as:"discussion"})
    Discussion.hasMany(Comment,{onDelete:"CASCADE",as:"comments"})

    /**
     * Alumni
     */
    Campus.hasMany(Alumni,{onDelete:"CASCADE",as:"alumni"})
    Alumni.belongsTo(Campus,{onDelete:"CASCADE",as:"campus"})

    /**
     * Following List
     */
    Campus.belongsToMany(User,{through:'follow_list',as:'followers'})
    User.belongsToMany(Campus,{through:'follow_list',as:'following'})

    /**
     * Scholarship
     */
    Scholarship.belongsToMany(Campus,{through:"campus_scholarship",as:"campus"})
    Campus.belongsToMany(Scholarship,{through:"campus_scholarship",as:"scholarship"})
    Scholarship.hasMany(Discussion,{onDelete:"CASCADE",as:"discussions"})
    Discussion.belongsTo(Scholarship,{onDelete:"CASCADE",as:"scholarship"})

    /**
     * Entrance (Seleksi Masuk)
     */
    Entrance.belongsToMany(Campus,{through:"campus_entrance",as:"campus"})
    Campus.belongsToMany(Entrance,{through:"campus_entrance",as:"entrances"})
}