import { prisma } from "../initializer/initprisma.js";
import crud from "../utils/crud.js"

let include ={product:true};

const get = async (req, res, next) => crud.get(req,res,next,prisma.cart,include);
const getbyid = async (req, res, next) => crud.getbyid(req,res,next,prisma.cart,include);
const deletebyid = async (req, res, next) => crud.deletebyid(req,res,next,prisma.cart,include);
const put = async (req, res, next) => crud.update(req,res,next,prisma.cart,required,include);

const post = async (req, res, next) => {
    let { product_id,user_id,quantity } = req.body;
    const required = { product_id,user_id,quantity };
    crud.create(req,res,next,prisma.cart,required,include,{product_id,user_id});
}

export default{ get, getbyid, post, put, deletebyid };