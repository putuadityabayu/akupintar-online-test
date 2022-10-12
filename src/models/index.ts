import { Alumni } from "./alumni";
import {Campus, Category, Status} from "./campus";
import { Comment } from "./comment";
import { Discussion, Votes } from "./discussion";
import { Entrance } from "./entrance";
import { Faculty } from "./faculty";
import { sequelize } from "./helper";
import { Major } from "./major";
import { News } from "./news";
import { Scholarship } from "./scholarship";
import { Strata } from "./strata";
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
        await sequelize.sync({alter:true,force:false})
    }
    
}

function initRelation() {
    /**
     * Faculties
     */
    Campus.hasMany(Faculty,{onDelete:"CASCADE",as:{singular:"faculty",plural:"faculties"}})
    Faculty.belongsTo(Campus,{onDelete:"CASCADE"})
    Campus.belongsTo(Status,{onDelete:"CASCADE"})
    Campus.belongsTo(Category,{onDelete:"CASCADE"})

    /**
     * Major
     */
    Faculty.hasMany(Major,{onDelete:"CASCADE"})
    Major.belongsTo(Faculty,{onDelete:"CASCADE"})
    Strata.hasMany(Major,{onDelete:"CASCADE",as:"majors",foreignKey:"strataId"})
    Major.belongsTo(Strata,{onDelete:"CASCADE",as:"strata",foreignKey:"strataId"})

    Major.belongsToMany(User,{through:'major_likes',as:{singular:"like",plural:"likes"}})
    User.belongsToMany(Major,{through:'major_likes'})


    /**
     * Subject
     */
    Major.hasMany(Subject,{onDelete:"CASCADE"})
    Subject.belongsTo(Major,{onDelete:"CASCADE"})

    /**
     * News
     */
    Campus.hasMany(News,{onDelete:"CASCADE"})
    News.belongsTo(Campus,{onDelete:"CASCADE"})
    News.belongsTo(User,{onDelete:"CASCADE",as:"author"})

    /**
     * Discussion
     */
    Discussion.belongsTo(User,{onDelete:"CASCADE"})
    Discussion.belongsTo(Campus,{onDelete:"CASCADE"})
    Campus.hasMany(Discussion,{onDelete:"CASCADE"})

    /**
     * Comments
     */
    Comment.belongsTo(Discussion,{onDelete:"CASCADE"})
    Discussion.hasMany(Comment,{onDelete:"CASCADE"})
    
    Comment.belongsTo(User,{onDelete:"CASCADE"})
    User.hasMany(Comment,{onDelete:"CASCADE"})

    /**
     * Alumni
     */
    Campus.hasMany(Alumni,{onDelete:"CASCADE",as:{singular:"alumni",plural:"alumnus"}})
    Alumni.belongsTo(Campus,{onDelete:"CASCADE"})

    /**
     * Following List
     */
    Campus.belongsToMany(User,{through:'follow_list',as:{singular:"follower",plural:"followers"}})
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

    /**
     * Votes
     */
    Discussion.belongsToMany(User,{through:Votes,as:{singular:'vote',plural:'votes'}})
}