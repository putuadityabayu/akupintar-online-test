import app from "../../src/app";
import supertest from "supertest";

export default function login() {
    it("Missing password",async()=>{
        const response = await supertest(app)
            .post("/login")
            .send({username:"akupintar",pass:"pass"})
            .set('accept', 'application/json')
            .set('Content-Type', 'application/json')
            
        expect(response.statusCode).toBe(400);
        expect(response.body?.error?.description).toBe("Missing `password` parameter")
    })

    it("Invalid username",async()=>{
        const response = await supertest(app)
            .post("/login")
            .send({username:"username",password:"password"})
            .set('accept', 'application/json')
            .set('Content-Type', 'application/json')
            
        expect(response.statusCode).toBe(401);
        expect(response.body?.error?.description).toBe("Invalid username")
    })

    it("Invalid password",async()=>{
        const response = await supertest(app)
            .post("/login")
            .send({username:"akupintar",password:"password"})
            .set('accept', 'application/json')
            .set('Content-Type', 'application/json')
            
        expect(response.statusCode).toBe(401);
        expect(response.body?.error?.description).toBe("Invalid password")
    })

    it("Success",async()=>{
        const response = await supertest(app)
            .post("/login")
            .send({username:"akupintar",password:"akupintar"})
            .set('accept', 'application/json')
            .set('Content-Type', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.token).toBeDefined()
        expect(response.body?.user?.username).toBe("akupintar")
        global.jwtToken = response.body.token
    })
}