const  Category =require("../models/category.model.js");
const { MONGO_DB_CONFIG } = require("../config/app.config.js");

async function createCategory(params, callback) {
    if(!params.categoryName){
        return callback({
            message: "Category Name Required"
        },);
    }
    const model=new Category(params);
    model.save()
    .then((response)=>{
        return callback(null,response);
    }).catch((error)=>{
        return callback(error);
    });
}

async function getCategories(params, callback){
    const categoryName=params.categoryName;
    var condition=categoryName?{
        categoryName:{
            $regex:new RegExp(categoryName, "i")
        }
    }:{};
    let perPage = Math.abs(params.pageSize) || MONGO_DB_CONFIG.PAGE_SIZE;
    let page = (Math.abs(params.page)||1)-1;

    Category.find(condition, "categoryName categoryImage")
    .limit(perPage)
    .skip(perPage *page)
    .then(
        (response)=>{
            return callback(null,response);
        }).catch((error)=>{
            return callback(error);
        }
    );
}
async function getCategoryById(params, callback){
    const categoryId=params.categoryId;

    Category.findById(categoryId)
    .then(
        (response)=>{
            if(!response) callback("Not found category with Id"+categoryId)
            return callback(null,response);
        }).catch((error)=>{
            return callback(error);
        }
    );
}
async function updateCategory(params, callback){
    const categoryId=params.categoryId;

    Category.findByIdAndUpdate(categoryId, params, {useFindAndModify: false})
    .then(
        (response)=>{
            if(!response) callback("Not found category with Id"+categoryId)
            else callback(null,response);
        }).catch((error)=>{
            return callback(error);
        }
    );
}
async function deleteCategory(params, callback){
    const categoryId=params.categoryId;

    Category.findByIdAndUpdate(categoryId, params, {useFindAndModify: false})
    .then(
        (response)=>{
            if(!response) callback("Not found category with Id"+categoryId)
            else callback(null,response);
        }).catch((error)=>{
            return callback(error);
        }
    );
}

module.exports={
    createCategory,
    getCategories,
    getCategoryById,
    updateCategory,
    deleteCategory
}