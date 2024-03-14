import usercontroller from "../controllers/user.js"
import express from "express";
const router = express.Router()

router
.post("/login", usercontroller.login)
.post("/register", usercontroller.register)
export default router;