import { prisma } from "../initializer/initprisma.js";
import { sendresponse } from "../utils/utils.js";

const get = async (req, res, next) =>{
    try {
        let color=await prisma.color.findMany();
        let size=await prisma.size.findMany();
        sendresponse(res,{color,size},200,req);
    } catch (e) {
        next(e);
    }
}

export default{ get };