import app,{express} from "./express";
import cors from 'cors'
import limiter from "./middleware/limiter";
import responseMiddleware from "./middleware/response";
import compression from 'compression';
import authorization, { loginMiddleware } from "./middleware/authorization";
import UserControllers from "@controllers/user";

app.use(compression())
app.disable("x-powered-by");
app.use(limiter)
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

app.use(responseMiddleware)

export default app