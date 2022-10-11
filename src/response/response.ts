class HttpResponse {
    statusCode: number;
    data?: Record<string,any>|string
    constructor(data?: Record<string,any>|string,statusCode?: number) {
        this.statusCode = statusCode ? statusCode : !data ? 204 : 200;
        this.data=data;
    }
}
export default HttpResponse;