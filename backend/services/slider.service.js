const Slider = require("../models/slider.model");
const { MONGO_DB_CONFIG } = require("../config/app.config");

async function createSlider(params, callback) {
    if (!params.sliderName) {
        return callback({ message: "Slider Name required" });
    }

    const model = new Slider(params);

    model.save()
        .then((response) => callback(null, response))
        .catch((error) => callback(error));
}

async function getSliders(params, callback) {
    const sliderName = params.sliderName;
    const condition = sliderName ? { sliderName: { $regex: new RegExp(sliderName), $options: "i" } } : {};

    let perPage = Math.abs(params.pageSize) || MONGO_DB_CONFIG.pageSize;
    let page = (Math.abs(params.page) || 1) - 1;

    Slider.find(condition, "sliderName sliderImage")
        .limit(perPage)
        .skip(perPage * page)
        .then((response) => callback(null, response))
        .catch((error) => callback(error));
}

async function getSliderById(params, callback) {
    const sliderId = params.sliderId;
    
    Slider.findById(sliderId)
        .then((response) => {
            if (!response) return callback("Not Found");
            callback(null, response);
        })
        .catch((error) => callback(error));
}

async function updateSlider(params, callback) {
    const sliderId = params.sliderId;

    Slider.findByIdAndUpdate(sliderId, params, { new: true })
        .then((response) => {
            if (!response) return callback("Not Found");
            callback(null, response);
        })
        .catch((error) => callback(error));
}

async function deleteSlider(params, callback) {
    const sliderId = params.sliderId;
    
    Slider.findByIdAndDelete(sliderId)
        .then((response) => {
            if (!response) return callback(
                {
                    message:"Slider Not Found"
                }
            );
            return callback(null, {
                message:"Delete successfully"
            });
        })
        .catch((error) => callback(error));
}

module.exports = {
    createSlider,
    getSliders,
    getSliderById,
    updateSlider,
    deleteSlider,
};
