import { SignOptions } from "jsonwebtoken";

export const jwtOptions: SignOptions = {
    expiresIn:"1d",
    issuer:"akupintar.id",
    audience:"AKUPINTAR REST API"
}