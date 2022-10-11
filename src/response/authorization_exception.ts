import HttpException from "./exception";

export default class AuthorizationException extends HttpException {
    static message = {
        missing_access_token:"No `bearer token` provided",
        missing_authorization:"Missing authorization token",
        expired_token:"The `access token` provided has expired",
        invalid_access_token:"The `bearer token` provided is invalid",
        not_supported:"`Authorization` not supported",
        unauthorized:"You must login to make this request.",
        login_invalid_username: "Invalid username",
        login_invalid_password: "Invalid password"
    }
    constructor(msg: keyof typeof AuthorizationException.message,statusCode=401) {
        super(statusCode,AuthorizationException.message[msg],"authorization")
    }
}