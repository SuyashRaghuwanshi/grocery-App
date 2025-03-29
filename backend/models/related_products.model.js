const mongoose = require("mongoose");

const relatedProduct = new mongoose.Schema(
    {
        product: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Product",
            required: true,
        },
        relatedProduct: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Product",
            required: true,
        },
    },
    {
        toJSON: {
            transform: function (doc, ret) {
                delete ret._id;
                delete ret.__v; // Corrected from _v to __v
            },
        },
        timestamps: true,
    }
);

const RelatedProduct = mongoose.model("RelatedProduct", relatedProduct);

module.exports = { RelatedProduct };
