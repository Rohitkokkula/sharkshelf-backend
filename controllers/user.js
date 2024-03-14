import { sendresponse } from "../utils/utils.js";
import axios from "axios";
import { prisma } from "../initializer/initprisma.js";
import auth from "../middlewares/checkAuth.js";
import ApiError from "../utils/ApiError.js";
import dotenv from "dotenv";
dotenv.config();

async function gettoken(data) {
    const token = auth.getToken(data.email, data.id, data.role_id);
    const user = await prisma.users.findUnique({ where: { user_id: data.id } });
    if (!user) await prisma.users.create({ data: { user_id: data.id, token: token,email:data.email,name:data.name,created_on:new Date()} });
    else await prisma.users.update({ where: { user_id: data.id }, data: { token: token } });
    return token;
}

const profile = async (req) => {
    console.log(req.user);
    const data = await axios.get(process.env.OCEANAUTH + "/user/profile/"+req.user.id, { headers: { Authorization: "Bearer "+process.env.APP_TOKEN } });
    if (data.data.message != "success") throw new ApiError(401, data.data.message);
    return data.data.data;
}

const getprofile = async (req, res, next) => {
    try {
        const data = await profile(req);
        return sendresponse(res, { user: data }, 201,req);    
    } catch (e) {
        next(e);
    }
}

const updateprofile = async (req, res, next) => {
    try {
        const data = await axios.put(process.env.OCEANAUTH+"/user/profile/"+req.user.id,req.body,{ headers: { Authorization: "Bearer "+process.env.APP_TOKEN } });
        if(data.data.message!="success") throw new ApiError(401, data.data.message);
        const {email,name,id} = data.data.data;
        await prisma.users.update({ where: { user_id: id }, data: { email,name } });
        return sendresponse(res, { user: data.data.data }, 201,req);    
    } catch (e) {
        next(e);
    }
}

const deleteprofile = async (req, res, next) => {
    try {
        const data = await axios.delete(process.env.OCEANAUTH+"/user/deleteprofile/"+req.user.id,{ headers: { Authorization: "Bearer "+process.env.APP_TOKEN } });
        if(data.data.message!="success") throw new ApiError(401, data.data.message);
        const {id} = data.data.data;
        await prisma.users.update({ where: { user_id: id }, data: { status:"INACTIVE" } });
        return sendresponse(res, { user: data.data.data }, 201,req);    
    } catch (e) {
        next(e);
    }
}

const verifytoken = async (req) => {
    const data = await axios.get(process.env.OCEANAUTH+"/user/verifytoken",{ headers: { Authorization: req.headers.authorization } });
    if(data.data.message!="success") throw new ApiError(401, data.data.message);
    return data.data.data;
}

const login = async (req, res, next) => {
    try {
        const data = await verifytoken(req);
        const token = await gettoken(data);
        return sendresponse(res, { vtoken: token, user: data }, 201,req);    
    } catch (e) {
        next(e);
    }
}

const register = async (req, res, next) => {
    try {
        const data = await axios.post(process.env.OCEANAUTH+"/user/register",req.body);
        if(data.data.message!="success") throw new ApiError(401, data.data.message);
        const token = await gettoken(data.data.data);
        return sendresponse(res, { vtoken: token, user: data.data.data }, 201,req);    
    } catch (e) {
        next(e);
    }
}

const updatepassword = async (req, res, next) => {
    try {
        const data = await axios.post(process.env.OCEANAUTH+"/user/updatepassword",req.body,{ headers: { Authorization: req.headers.authorization } });
        if(data.data.message!="success") throw new ApiError(401, data.data.message);
        return sendresponse(res, { user: data.data.data }, 201,req);    
    } catch (e) {
        next(e);
    }
}

const forgotpassword = async (req, res, next) => {
    try {
        const data = await axios.post(process.env.OCEANAUTH+"/user/forgotpassword",req.body);
        if(data.data.message!="success") throw new ApiError(401, data.data.message);
        return sendresponse(res, { user: data.data.data }, 201,req);    
    } catch (e) {
        next(e);
    }
}

const resetpassword = async (req, res, next) => {
    try {
        const data = await axios.post(process.env.OCEANAUTH+"/user/resetpassword",req.body);
        if(data.data.message!="success") throw new ApiError(401, data.data.message);
        return sendresponse(res, { user: data.data.data }, 201,req);    
    } catch (e) {
        next(e);
    }
}

export default { login,register, getprofile,updateprofile,updatepassword,forgotpassword,resetpassword,deleteprofile};