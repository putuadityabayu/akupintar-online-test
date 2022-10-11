import HttpException from "./exception";

class ServerException extends HttpException {
    constructor(msg?:string) {
        super(503,msg||"internal server error","server");
    }
}
export default ServerException;