import app from "../../src/app";
import supertest from "supertest";

export default function list_majors() {
    it("Invalid campus id",async()=>{
        const response = await supertest(app)
            .get("/campus/200/majors")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.total).toBe(0)
        expect(response.body?.total_pages).toBe(0)
        expect(response.body?.data?.length).toBe(0)
    })

    it("List all majors",async()=>{
        const response = await supertest(app)
            .get("/campus/2/majors")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.data?.[0]?.name).toBeDefined()
    })

    it("With page size",async()=>{
        const response = await supertest(app)
            .get("/campus/2/majors?page_size=5")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.data?.length).toBe(5)
    })

    it("With page",async()=>{
        const response = await supertest(app)
            .get("/campus/2/majors?page=2")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.page).toBe(2)
    })

    it("With strata",async()=>{
        const response = await supertest(app)
            .get("/campus/2/majors?strata=sarjana")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.data?.[0]?.strata?.name).toBe("Sarjana")
    })

    it("With query",async()=>{
        const response = await supertest(app)
            .get("/campus/2/majors?q=bahasa")
            .set('accept', 'application/json')
            
        expect(response.statusCode).toBe(200);
        expect(response.body?.data?.[0]?.name).toMatch(/bahasa/i)
    })
}