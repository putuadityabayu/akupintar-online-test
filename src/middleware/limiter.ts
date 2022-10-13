import RateLimitException from '../response/ratelimit_exception'
import rateLimit from 'express-rate-limit'

const limiter = rateLimit({
	windowMs: 1 * 60 * 1000, // 1 minutes
	max: 15, // Limit each IP to 15 requests per `window` (here, per 1 minutes)
	standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
	legacyHeaders: false, // Disable the `X-RateLimit-*` headers,
    handler: (request, response, next, options) => {
        next(new RateLimitException())
    },
})
export default limiter