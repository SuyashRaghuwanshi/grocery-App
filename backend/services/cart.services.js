const {cart}=require("../models/cart.model");
// var async= require("async");

// async function addCart(params,callback) {
//     if(!params.userId){
//         return callback({
//             message:"UserId Required"
//         });
//     }
//     cart.findOne({
//         userId:params.userId
//     },function(err,cartDB){
//         if(err){
//             return callback(err);
//         }else{
//             if(cartDB==null){
//                 const cartModel=new cart({
//                     userId:params.userId,
//                     products:params.products
//                 });
//                 cartModel.save().then((response)=>{
//                     return callback(null, response);
//                 })
//                 .catch((error)=>{
//                     return callback(error);
//                 });
//             }
//             else if(cartDB.products.length==0){
//                 cartDB.products=params.products;
//                 cartDB.save();
//                 return callback(null, cartDB);
//             }else{
//                 async.eachSeries(params.products, function(product, asyncDone){
//                     let itemIndex=cartDB.products.findIndex(p=>p.product==product.product);
//                     if(itemIndex===-1){
//                         cartDB.products.push({
//                             product:product.product,
//                             qty:product.qty
//                         });
//                         cartDB.save(asyncDone);
//                     }
//                     else{
//                         cartDB.products[itemIndex].qty=cartDB.products[itemIndex].qty+product.qty;
//                         cartDB.save(asyncDone);
//                     }
//                 });
//                 return callback(null, cartDB);
//             }
//         }
//     })
// }

const async = require("async");

async function addCart(params, callback) {
    try {
        if (!params.userId) {
            return callback({ message: "UserId Required" });
        }

        let cartDB = await cart.findOne({ userId: params.userId }); // ✅ Use `await`

        if (!cartDB) {
            const cartModel = new cart({
                userId: params.userId,
                products: params.products
            });

            const savedCart = await cartModel.save(); // ✅ Save the new cart
            return callback(null, savedCart);
        }

        if (cartDB.products.length === 0) {
            cartDB.products = params.products;
            await cartDB.save(); // ✅ Save updated cart
            return callback(null, cartDB);
        } else {
            // ✅ Fix async.eachSeries (convert to for-loop for async/await support)
            for (const product of params.products) {
                let itemIndex = cartDB.products.findIndex(p => p.product.toString() === product.product);
                
                if (itemIndex === -1) {
                    cartDB.products.push({
                        product: product.product,
                        qty: product.qty
                    });
                } else {
                    cartDB.products[itemIndex].qty += product.qty;
                }
            }

            await cartDB.save(); // ✅ Save the updated cart
            return callback(null, cartDB);
        }
    } catch (error) {
        return callback(error);
    }
}

async function getCart(params, callback){
    cart.findOne({
        userId:params.userId
    }).populate({
        path:"products",
        populate:{
            path:'Product',
            model:'Product',
            select: 'productName productPrice, productSalePrice productImage',
            populate:{
                path:'category',
                model:'Category',
                select:'categoryName'
            }
        }
    })
    .then((response)=>{
        return callback(null,response);
    })
    .catch((error)=>{
        return callback(error);
    });
}

async function removeCartItem(params, callback) {
    cart.findOne({
        userId:params.userId
    },function(err,cartDB){
        if(err){
            callback(err);
        }else{
            if(params.productId && params.qty){
                const productId=params.productId;
                const qty=params.qty;

                if(cartDB.products.length===0){
                    return callback(null,"Cart Empty!");
                }else{
                    let itemIndex=cartDB.products.findIndex(p=>p.product==productId);

                    if(itemIndex===-1){
                        return callback(null,"Invalid Product!")
                    }else{
                        if(cartDB.products[itemIndex].qty===qty){
                            cartDB.products.splice(itemIndex,1);
                        }
                        else if(cartDB.products[itemIndex].qty>qty){
                            cartDB.products[itemIndex].qty=cartDB.products[itemIndex].qty-qty;
                        }
                        else{
                            return callback(null,"enter lower Qty");
                        }
                        cartDB.save((err,cartM)=>{
                            if(err) return callback(err);
                            return callback(null, "Cart Updated!");
                        })
                    }
                }
            }
        }
    })
}

module.exports={
    addCart,
    getCart,
    removeCartItem
}

