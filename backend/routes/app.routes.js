const categoryController= require("../controllers/categories.controller.js");
const productController= require("../controllers/products.controller.js");
const express =require("express");
const router=express.Router();

console.log("✅ Registering Category Routes");
console.log("✅ Registering Product Routes");

router.post("/category", categoryController.create);
router.get("/category", categoryController.findAll);
router.get("/category/:id", categoryController.findOne);
router.put("/category/:id", categoryController.update);
router.delete("/category/:id", categoryController.delete);

// router.get("/product", (req, res) => {
//     console.log("✅ GET /product called");
//     productController.findAll(req, res);
// });
router.post("/product", productController.create);
router.get("/product", productController.findAll);
router.get("/product/:id", productController.findOne);
router.put("/product/:id", productController.update);
router.delete("/product/:id", productController.delete);

console.log("✅ Product route registered");
module.exports= router;