const categoryController= require("../controllers/categories.controller.js");
const productController= require("../controllers/products.controller.js");
const userController= require("../controllers/users.controller.js");
const sliderController= require("../controllers/slider.controller.js");
const relatedProductController= require("../controllers/related_product.controller.js");
const cartController=require("../controllers/cart.controller.js");
const {authenticateToken}=require("../middleware/auth.js");
const express =require("express");
const { concat } = require("async");
const router=express.Router();

console.log("✅ Registering Category Routes");
console.log("✅ Registering Product Routes");

router.post("/category", categoryController.create);
router.get("/category", categoryController.findAll);
router.get("/category/:id", categoryController.findOne);
router.put("/category/:id", categoryController.update);
router.delete("/category/:id", categoryController.delete);

router.post("/product", productController.create);
router.get("/product", productController.findAll);
router.get("/product/:id", productController.findOne);
router.put("/product/:id", productController.update);
router.delete("/product/:id", productController.delete);

console.log("Slider Controller: ", sliderController);

router.post("/slider", sliderController.create);
router.get("/slider", sliderController.findAll);
router.get("/slider/:id", sliderController.findOne);
router.put("/slider/:id", sliderController.update);
router.delete("/slider/:id", sliderController.delete);

console.log(userController); // Debugging line

router.post("/register", userController.register);
router.post("/login", userController.login);

router.post("/relatedProduct", relatedProductController.create);
router.delete("/relatedProduct/:id", relatedProductController.delete);

router.post("/cart",[authenticateToken], cartController.create);
router.get("/cart",[authenticateToken], cartController.findAll);
router.delete("/cart",[authenticateToken], cartController.delete);
console.log("✅ Product route registered");
module.exports= router;