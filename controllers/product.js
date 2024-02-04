import { prisma } from "../initializer/initprisma.js";
import crud from "../utils/crud.js"

const include = { category: true,subcategory:true };

const get = async (req, res, next) => crud.get(req, res, next, prisma.product,include);
const getbyid = async (req, res, next) => crud.getbyid(req, res, next, prisma.product,include);
const deletebyid = async (req, res, next) => crud.deletebyid(req, res, next, prisma.product,include);
const put = async (req, res, next) => crud.update(req, res, next, prisma.product,{},include);

const post = async (req, res, next) => {
    let { price, offer_price, status,name,description,category_id,subcategory_id,imageurl } = req.body;
    const required = { price, offer_price, status,name,description,category_id,subcategory_id,imageurl };
    crud.create(req, res, next, prisma.product, required,include,{name});
}

export default { get, getbyid, post, put, deletebyid };