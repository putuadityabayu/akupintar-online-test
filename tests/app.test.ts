import path from 'path';
require('dotenv').config({path:path.resolve('./.test.env')})
import app from "../src/app";
import { afterTest, beforeTest } from "./setup";
import supertest = require("supertest");
import loginTest from './api/login';
import searchCampus from './api/search_campus';
import list_majors from './api/list_majors';
import {follow_campus,unfollow_campus} from './api/follow_campus';

jest.setTimeout(500000)
beforeAll(async()=>{
    await beforeTest();
})
afterAll(async()=>{
    await afterTest();
})

describe("Aku Pintar Test",()=>{
    it("Server running",async()=>{
        const resp = await supertest(app)
            .get("/")
            .set('accept', 'application/json')
            .set('Content-Type', 'application/json')
        expect(resp.statusCode).toBe(200)
        expect(resp.body?.status).toBe("API Uptime")
    })
    /**
     * Login
     */
    describe("Login",loginTest)

    /**
     * Search Campus
     */
    describe("Search Campus",searchCampus)

    /**
     * List Majors
     */
    describe("List Majors",list_majors)

    /**
     * Follow campus
     */
    describe("Follow Campus",follow_campus)

    /**
     * Unfollow campus
     */
     describe("Unfollow Campus",unfollow_campus)
})