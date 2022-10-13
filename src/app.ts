import app,{express} from "./express";
import cors from 'cors'
import limiter from "./middleware/limiter";
import responseMiddleware from "./middleware/response";
import compression from 'compression';
import authorization, { loginMiddleware } from "./middleware/authorization";
import UserControllers from "./controllers/user";
import CampusControllers from "./controllers/campus";

app.use(compression())
app.disable("x-powered-by");
if(process.env.NODE_ENV !== "test") {
    app.use(limiter)
}
app.use(express.json());
app.use(express.urlencoded({extended:true}));

app.options("*",cors())
app.use(cors({origin:false}))

app.use(authorization)

app.get("/",(_,res)=>{
    return res.status(200).json({status:"API Uptime"})
})

app.get("/me",loginMiddleware,UserControllers.user);
app.post("/login",UserControllers.login)
app.post("/register",UserControllers.registration)

app.get("/campus",CampusControllers.search)
app.post("/campus/:id",loginMiddleware,CampusControllers.follow)
app.delete("/campus/:id",loginMiddleware,CampusControllers.unfollow)
app.get("/campus/:id/majors",CampusControllers.findMajors);

app.use(responseMiddleware)

export default app