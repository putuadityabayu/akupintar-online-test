
export default abstract class HttpException extends Error {
    statusCode: number
    name: string

    constructor(statusCode: number,msg: string,name: string) {
        super(msg)
        this.statusCode=statusCode
        this.name = name
    }
}