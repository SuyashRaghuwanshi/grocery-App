const cartServices= require("../services/cart.services");

exports.create=(req,res, next)=>{
    var model={
        userId:req.user.userId,
        products:req.body.products
    };
    cartServices.addCart(model,(error,results)=>{
        if(error){
            return next(error);
        }
        return res.status(200).send({
            message:"Success",
            data: results,
        });
    });
}

exports.findAll=(req,res, next)=>{
    cartServices.getCart({userId:req.user.userId},(error,results)=>{
        if(error){
            return next(error);
        }
        return res.status(200).send({
            message:"Success",
            data: results,
        });
    });
}

exports.delete=(req,res, next)=>{
    var model={
        userId:req.user.userId,
        products:req.body.products,
        qty:req.body.qty
    };
    cartServices.removeCartItem(model,(error,results)=>{
        if(error){
            return next(error);
        }
        return res.status(200).send({
            message:"Success",
            data: results,
        });
    });
}