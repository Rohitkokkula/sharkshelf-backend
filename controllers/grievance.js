import { prisma } from "../initializer/initprisma.js";
import crud from "../utils/crud.js"

let include ={};

const get = async (req, res, next) => crud.get(req,res,next,prisma.grievance,include,{user_id:Number(req.user.id)});
const getbyid = async (req, res, next) => crud.getbyid(req,res,next,prisma.grievance,include);
const deletebyid = async (req, res, next) => crud.deletebyid(req,res,next,prisma.grievance,include);
const put = async (req, res, next) => crud.update(req,res,next,prisma.grievance,required,include);

const post = async (req, res, next) => {
    let { title,description } = req.body;
    const required = { title,description };
    const user_id = Number(req.user.id);
    req.body.user_id = user_id;
    crud.create(req,res,next,prisma.grievance,required,include);
}

export default{ get, getbyid, post, put, deletebyid };