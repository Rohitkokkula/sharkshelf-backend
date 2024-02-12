import { prisma } from "../initializer/initprisma.js";
import crud from "../utils/crud.js"
import { sendresponse } from "../utils/utils.js";

let include ={product:true};

const get = async (req, res, next) => crud.get(req,res,next,prisma.cart,include,{user_id:Number(req.user.id)});
const getbyid = async (req, res, next) => crud.getbyid(req,res,next,prisma.cart,include);
const deletebyid = async (req, res, next) => crud.deletebyid(req,res,next,prisma.cart,include);
const put = async (req, res, next) => crud.update(req,res,next,prisma.cart,required,include);


const post = async (req, res, next) => {
    try {
        let { cart } = req.body;
        const user_id = Number(req.user.id);
        const created_on = new Date();
        for (let i = 0; i < cart.length; i++) {
            cart[i].user_id = user_id;
            cart[i].created_on = created_on;
        }
        req.body.user_id = user_id;
        await prisma.cart.deleteMany({ where: { user_id } });
        const data = await prisma.cart.createMany({ data: cart });
        sendresponse(res, data, 201, req);
    } catch (e) {
        next(e);
    }
}

export default{ get, getbyid, post, put, deletebyid };