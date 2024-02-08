import errorHandler from '../middlewares/error.js';
import variantRoutes from "../routes/variant.js";
import colorRoutes from "../routes/color.js";
import categoryRoutes from "../routes/category.js";
import subcategoryRoutes from "../routes/subcategory.js";
import orderRoutes from "../routes/order.js";
import imageRoutes from "../routes/image.js";
import productRoutes from "../routes/product.js";
import faqRoutes from "../routes/faq.js";
import auth from "../middlewares/checkAuth.js";
import ApiError from '../utils/ApiError.js';
import { sendresponse } from '../utils/utils.js';
import sizeRoutes from "../routes/size.js";
import cartRoutes from "../routes/cart.js";

export default (app) => {
    app.get('/', async (req, res) => res.send('Hello! Welcome To PAYX'));
    app.get('/ping', async (req, res) => res.send('Hiii Abhay!'));
    app.use(auth.checkToken);
    app.use("/order",orderRoutes);
    app.use("/product",productRoutes);
    app.use("/faq", faqRoutes);
    app.use("/variant", variantRoutes);
    app.use("/color", colorRoutes);
    app.use("/category", categoryRoutes);
    app.use("/subcategory", subcategoryRoutes);
    app.use("/image",imageRoutes);
    app.use("/size",sizeRoutes);
    app.use("/cart",cartRoutes);
    app.use("/terms",(req,res,next)=>sendresponse(res, {"terms":"Terms and Conditions" },200,req));
    app.use((req, res, next) => next(new ApiError(401,'Not found')));
    app.use(errorHandler);
}
