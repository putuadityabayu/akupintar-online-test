import HttpException from "./exception";

class EndpointNotFoundException extends HttpException {
    constructor() {
        super(404,`Invalid endpoint`,'endpoint_not_found');
    }
}
export default EndpointNotFoundException;