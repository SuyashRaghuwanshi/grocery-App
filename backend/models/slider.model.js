const mongoose = require("mongoose");

const sliderSchema = new mongoose.Schema({
    sliderName: {
        type: String,
        required: true,
        unique: true,
    },
    sliderDescription: {
        type: String,
        required: false,
    },
    sliderURL: {
        type: String,
        required: false,
    },
    sliderImage: {
        type: String,
        required: false,
    },
});

const Slider = mongoose.model("Slider", sliderSchema);

module.exports = Slider;
