import usercontroller from "../controllers/user.js"
import express from "express";
const router = express.Router()

router
.post("/login", usercontroller.login)
.get("/profile", usercontroller.getprofile)
export default router;