const categoriesService = require("../services/categories.service.js");
const upload = require("../middleware/categories.uploads.js");
const Category = require("../models/category.model");  // ✅ Add this line


exports.create = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            return res.status(500).json({ message: "File upload failed", error: err });
        } else {
            const path = req.file?.path ? req.file.path.replace(/\\/g, "/") : "";

            var model = {
                categoryName: req.body.categoryName,
                categoryDescription: req.body.categoryDescription,
                categoryImage: path !== "" ? "/" + path : "",
            };

            categoriesService.createCategory(model, (error, results) => {
                if (error) {
                    return next(error);
                } else {
                    return res.status(200).json({
                        message: "Success",
                        data: results,
                    });
                }
            });
        }
    });
};

exports.findAll = async (req, res) => {
    try {
        const categories = await Category.find();

        // Add full image path
        if (!categories || categories.length === 0) {
            return res.status(404).json({ message: "No categories found" });
        }
        const updatedCategories = categories.map(category => ({
            _id: category._id,
            categoryName: category.categoryName,
            categoryDescription: category.categoryDescription,
            fullImagePath: `http://localhost:5000${category.categoryImage}` // Correct full URL
        }));

        res.status(200).json(updatedCategories);
    } catch (error) {
        console.error("Database Error:", error);
        res.status(500).json({ message: "Error retrieving categories" });
    }
};


exports.findOne = (req, res, next) => {
    var model = {
        categoryId: req.params.id,
    };

    categoriesService.getCategoryById(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).json({
                message: "Success",
                data: results,
            });
        }
    });
};

exports.update = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            return res.status(500).json({ message: "File upload failed", error: err });
        } else {
            const path = req.file?.path ? req.file.path.replace(/\\/g, "/") : "";

            var model = {
                categoryId: req.params.id,
                categoryName: req.body.categoryName,
                categoryDescription: req.body.categoryDescription,
                categoryImage: path !== "" ? "/" + path : "",
            };

            categoriesService.updateCategory(model, (error, results) => {
                if (error) {
                    return next(error);
                } else {
                    return res.status(200).json({
                        message: "Success",
                        data: results,
                    });
                }
            });
        }
    });
};

exports.delete = (req, res, next) => {
    var model = {
        categoryId: req.params.id,
    };

    categoriesService.deleteCategory(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).json({
                message: "Success",
                data: results,
            });
        }
    });
};
