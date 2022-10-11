import HttpException from "./exception";

export class BadParameterException extends HttpException {
    constructor(what_missing:string) {
        super(400,`Missing \`${what_missing}\` parameter`,"bad_parameter")
    }
}

export class InvalidParameterException extends HttpException {
    constructor(what_invalid:string,should?: string,text?:string) {
        super(400,`Invalid \`${what_invalid}\` parameter${text ? `. ${text}` : should ? `. \`${what_invalid}\` must be ${should}` : ""}`,"invalid_parameter")
    }
}