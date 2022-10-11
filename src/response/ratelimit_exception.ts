import HttpException from "./exception";

class RateLimitException extends HttpException {
    constructor(code?:number) {
        super(429,"Too many requests","ratelimit");
    }
}
export default RateLimitException;