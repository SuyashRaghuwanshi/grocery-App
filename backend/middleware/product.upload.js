const multer =require("multer");

const Path =require("path");

const storage=multer.diskStorage(
    {
        destination:function(req, file,cb){
            cb(null,"./uploads/products");
        },
        filename: function(req,file, cb){
            cb(null, Date.now()+"-"+file.originalname);
        }
    }
);

const fileFilter=(req, file, callback)=>{
    const validExts=[".png", ".jpg", ".jpeg"];
    if(!validExts.includes(Path.extname(file.originalname).toLowerCase())){
        return callback(new Error("Only .png ,.jpg,.jpeg format is allowed"));
    }
    callback(null, true);
}

const upload=multer({
    storage:storage,
    fileFilter:fileFilter,
    limits:{ fileSize: 1048576 }
})
module.exports=upload.single("productImage");