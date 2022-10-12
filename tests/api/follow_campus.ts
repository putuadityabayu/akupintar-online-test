import app from "../../src/app";
import supertest from "supertest";

export function follow_campus() {
    it("JWT TOKEN DEFINED",()=>{
        expect(global.jwtToken).toBeDefined()
    })

    it("Unauthorized following",async()=>{
        const response = await supertest(app)
            .post("/campus/2")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(401);
        expect(response.body?.error?.name).toBe("authorization")
    })

    it("Campus not found",async()=>{
        const response = await supertest(app)
            .post("/campus/200")
            .set('accept', 'application/json')
            .set('Authorization', 'Bearer ' + global.jwtToken)
            
        expect(response.statusCode).toBe(404);
        expect(response.body?.error?.name).toBe("notfound")
    })

    it("Follow campus",async()=>{
        const response = await supertest(app)
            .post("/campus/2")
            .set('accept', 'application/json')
            .set('Authorization', 'Bearer ' + global.jwtToken)
        
        const checkIsFollowing = await supertest(app)
        .get("/campus?q=UB")
        .set('accept', 'application/json')
        .set('Authorization', 'Bearer ' + global.jwtToken)

        expect(response.statusCode).toBe(200);
        expect(response.body?.success).toBe(true);

        expect(checkIsFollowing.statusCode).toBe(200);
        expect(checkIsFollowing.body?.data?.[0]?.is_followed).toBe(true);
    })
}

export function unfollow_campus() {
    it("JWT TOKEN DEFINED",()=>{
        expect(global.jwtToken).toBeDefined()
    })

    it("Unauthorized following",async()=>{
        const response = await supertest(app)
            .delete("/campus/2")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(401);
        expect(response.body?.error?.name).toBe("authorization")
    })

    it("Campus not found",async()=>{
        const response = await supertest(app)
            .post("/campus/200")
            .set('accept', 'application/json')
            .set('Authorization', 'Bearer ' + global.jwtToken)
            
        expect(response.statusCode).toBe(404);
        expect(response.body?.error?.name).toBe("notfound")
    })

    it("Unfollow campus",async()=>{
        const response = await supertest(app)
            .delete("/campus/2")
            .set('accept', 'application/json')
            .set('Authorization', 'Bearer ' + global.jwtToken)
        
        const checkIsFollowing = await supertest(app)
        .get("/campus?q=UB")
        .set('accept', 'application/json')
        .set('Authorization', 'Bearer ' + global.jwtToken)

        expect(response.statusCode).toBe(200);
        expect(response.body?.success).toBe(true);

        expect(checkIsFollowing.statusCode).toBe(200);
        expect(checkIsFollowing.body?.data?.[0]?.is_followed).toBe(false);
    })
}