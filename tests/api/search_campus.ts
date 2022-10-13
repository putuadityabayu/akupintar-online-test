import app from "../../src/app";
import supertest from "supertest";

export default function search_campus() {
    it("List all campus",async()=>{
        const response = await supertest(app)
            .get("/campus")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.data?.[0]?.name).toBeDefined()
    })

    it("With page size",async()=>{
        const response = await supertest(app)
            .get("/campus?page_size=5")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.data?.length).toBe(5)
    })

    it("With page",async()=>{
        const response = await supertest(app)
            .get("/campus?page=2")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.page).toBe(2)
    })

    it("With category",async()=>{
        const response = await supertest(app)
            .get("/campus?category=swasta")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.data?.[0]?.category?.name).toBe("SWASTA")
    })

    it("With query",async()=>{
        const response = await supertest(app)
            .get("/campus?q=UB")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.data?.[0]?.name).toBe("Universitas Brawijaya (UB)")
    })
}