import { ucwords } from "@portalnesia/utils";
import HttpException from "./exception";

class NotFoundException extends HttpException {
    constructor(type: string|string[],id: string|number|(string|number)[],id_name: string|string[]="id",extra_msg?:string) {
        let typ = typeof type === 'string' ? [type] : type;
        let idd = Array.isArray(id) ? id : [id];
        let id_nam = Array.isArray(id_name) ? id_name : [id_name];
        let msg = typ.map((t,i)=>{
            return `${ucwords(t)} with ${id_nam[i]} \`${idd[i]}\``
        }).join(" and ");
        if(typ.length === 1) msg+=(extra_msg||"");
        
        super(404,`${msg} not found`,"notfound")
    }
}
export default NotFoundException;