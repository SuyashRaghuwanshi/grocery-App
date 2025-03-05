// const mongoose = require("mongoose");

// const CategorySchema = new mongoose.Schema(
//   {
//     categoryName: {
//       type: String,
//       required: true, // ✅ Fixed typo (`require` → `required`)
//       unique: true,
//       trim: true, // ✅ Removes spaces from start & end
//     },
//     categoryDescription: {
//       type: String,
//       required: false,
//     },
//     categoryImage: {
//       type: String,
//       default: "", // ✅ Ensures it's always a string
//     },
//   },
//   {
//     toJSON: {
//       transform: function (doc, ret) {
//         ret.categoryId = ret._id.toString(); // ✅ Convert `_id` to `categoryId`
//         delete ret._id; // ✅ Remove original `_id`
//         delete ret.__v; // ✅ Remove Mongoose's version key
//       },
//     },
//   }
// );

// module.exports = mongoose.model("Category", CategorySchema);

const mongoose=require("mongoose");
const Category=
    new mongoose.Schema({
        categoryName:{
            type:String,
            required:true,
            unique: true,
        },
        categoryDescription:{
            type:String,
            required:false
        },
        categoryImage:{
            type:String,
        },
    },
    {
        toJSON:{
            transform:function(doc, ret){
                ret.categoryId=ret._id.toString();
                delete ret._id;
                delete ret.__v;
            }
        }

    }
);
module.exports= mongoose.model("Category", Category);
