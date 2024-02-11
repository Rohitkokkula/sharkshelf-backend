import errorHandler from '../middlewares/error.js';
import categoryRoutes from "../routes/category.js";
import subcategoryRoutes from "../routes/subcategory.js";
import orderRoutes from "../routes/order.js";
import imageRoutes from "../routes/image.js";
import productRoutes from "../routes/product.js";
import faqRoutes from "../routes/faq.js";
import auth from "../middlewares/checkAuth.js";
import ApiError from '../utils/ApiError.js';
import { sendresponse } from '../utils/utils.js';
import cartRoutes from "../routes/cart.js";
import contactRoutes from "../routes/contact.js";
import grievanceRoutes from "../routes/grievance.js";
import bannerRoutes from "../routes/banner.js";
import wishlistRoutes from "../routes/wishlist.js";

export default (app) => {
    app.get('/', async (req, res) => res.send('Hello! Welcome To SHARKSHELF'));
    app.get('/ping', async (req, res) => res.send('Pong!'));
    app.use(auth.checkToken);
    app.use("/order",orderRoutes);
    app.use("/product",productRoutes);
    app.use("/faq", faqRoutes);
    app.use("/category", categoryRoutes);
    app.use("/subcategory", subcategoryRoutes);
    app.use("/image",imageRoutes);
    app.use("/cart",cartRoutes);
    app.use("/contact",contactRoutes);
    app.use("/grievance",grievanceRoutes);
    app.use("/banner",bannerRoutes);
    app.use("/wishlist",wishlistRoutes);
    app.use("/contact",(req,res,next)=>sendresponse(res, {"contact":"Contact Us" },200,req));
    app.use("/about",(req,res,next)=>sendresponse(res, {"about":"About Us" },200,req));
    app.use("/privacy",(req,res,next)=>sendresponse(res, {"privacy":"Privacy Policy" },200,req));
    app.use("/terms",(req,res,next)=>sendresponse(res, {"terms":"Terms and Conditions" },200,req));
    app.use((req, res, next) => next(new ApiError(401,'Not found')));
    app.use(errorHandler);
}
