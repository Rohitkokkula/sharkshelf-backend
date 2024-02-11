import { prisma } from "../initializer/initprisma.js";
import crud from "../utils/crud.js"

let include ={product:true};

const get = async (req, res, next) => crud.get(req,res,next,prisma.wishlist,include,{user_id:Number(req.user.id)});
const getbyid = async (req, res, next) => crud.getbyid(req,res,next,prisma.wishlist,include);
const deletebyid = async (req, res, next) => crud.deletebyid(req,res,next,prisma.wishlist,include);
const put = async (req, res, next) => crud.update(req,res,next,prisma.wishlist,required,include);

const post = async (req, res, next) => {
    let { product_id } = req.body;
    const required = { product_id };
    const user_id = Number(req.user.id);
    req.body.user_id = user_id;
    crud.create(req,res,next,prisma.wishlist,required,include,{product_id,user_id});
}

export default{ get, getbyid, post, put, deletebyid };