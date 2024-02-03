import controller from "../controllers/variant.js"
import express from "express";
const router = express.Router();
router
  .get('/', controller.get)
export default router;