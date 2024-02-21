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
    if (!user) await prisma.users.create({ data: { user_id: data.id, token: token } });
    else await prisma.users.update({ where: { user_id: data.id }, data: { token: token } });
    return token;
}

const login = async (req, res, next) => {
    try {
        const data = await axios.get(process.env.OCEANAUTH+"/user/profile",{ headers: { Authorization: req.headers.authorization}});
        if(data.data.message!="success") throw new ApiError(401, data.data.message);
        const token = await gettoken(data.data.data);
        return sendresponse(res, { vtoken: token, user: data.data.data }, 201,req);    
    } catch (e) {
        next(e);
    }
}

const getprofile = async (req, res, next) => {
    try {
        const data = {
            "vtoken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJyb2xlIjoiUm9sZTIiLCJpYXQiOjE3MDc2NjIyNDEsImV4cCI6MTcxMDI1NDI0MX0.Izdms-VkIEj1egWurs9BfCSGnQ5ONxLcGLu1VA4VrI8",
        "user": {
            "id": 1,
            "email": "user1@example.com",
            "status": true,
            "name": "User1",
            "address": "Address 1",
            "profile_pic": "profile_pic_1.jpg",
            "created_on": "2024-02-11T17:23:06.000Z",
            "modified_on": "2024-02-11T17:23:06.000Z"
        }
        }
        return sendresponse(res, data, 200,req);
    } catch (e) {
        next(e);
    }
}

export default { login, getprofile};