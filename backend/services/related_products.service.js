const {RelatedProduct}=require("../models/related_products.model");

const Product=require("../models/product.model");
const { response } = require("express");

async function addRelatedProduct(params, callback){
    if(!params.product){
        return callback({
            message: "Product Id Required"
        });
    }
    if(!params.relatedProduct){
        return callback({
            message: "Related Product Id Required"
        });
    }

    const relatedProductModel = new RelatedProduct({
        product: params.product,
        relatedProduct: params.relatedProduct
    });
    
    relatedProductModel.save().then(async(response)=>{
        await Product.findOneAndUpdate(
            { _id: params.product },
            { $addToSet: { relatedProducts: relatedProductModel._id} } // Use _id only
        );
        
        return callback(null, response)
    })
    .catch((error)=>{
        return callback(error);
    })
}

async function removeRelatedProducts(params, callback){
    const id=params.id;
    RelatedProduct.findByIdAndRemove(id).then((response)=>{
        if(!response){
            callback({ message: "Product Id not found" });
        }else{
            callback(null, response);
        }
    })
    .catch((error)=>{
        return callback(error);
    });
}

module.exports={
    addRelatedProduct,
    removeRelatedProducts
}