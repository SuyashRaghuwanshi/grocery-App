const sliderService = require("../services/slider.service");
const upload = require("../middleware/slider.upload");

exports.create = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            return next(err);
        }

        const path = req.file ? req.file.path.replace(/\\/g, "/") : "";

        var model = {
            sliderName: req.body.sliderName,
            sliderDescription: req.body.sliderDescription,
            sliderImage: path ? "/" + path : "",
        };

        sliderService.createSlider(model, (error, result) => {
            if (error) {
                return next(error);
            }
            return res.status(200).send({
                message: "Success",
                data: result,
            });
        });
    });
};

// ✅ Find All Sliders
exports.findAll = (req, res, next) => {
    var model = {
        sliderName: req.query.sliderName,
        pageSize: req.query.pageSize,
        page: req.query.page,
    };

    sliderService.getSliders(model, (error, result) => {
        if (error) {
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: result,
        });
    });
};

// ✅ Find One Slider by ID
exports.findOne = (req, res, next) => {
    var model = {
        sliderId: req.params.id, // Fixed from req.query.sliderName
    };

    sliderService.getSliderById(model, (error, result) => {
        if (error) {
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: result,
        });
    });
};

// ✅ Update Slider
exports.update = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            return next(err);
        }

        const path = req.file ? req.file.path.replace(/\\/g, "/") : "";

        var model = {
            sliderId: req.params.id, // Fixed from req.params.Id
            sliderName: req.body.sliderName,
            sliderDescription: req.body.sliderDescription,
            sliderImage: path ? "/" + path : "",
        };

        sliderService.updateSlider(model, (error, result) => {
            if (error) {
                return next(error);
            }
            return res.status(200).send({
                message: "Success",
                data: result,
            });
        });
    });
};

// ✅ Delete Slider
exports.delete = (req, res, next) => {
    var model = {
        sliderId: req.params.id,
    };

    sliderService.deleteSlider(model, (error, result) => {
        if (error) {
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: result,
        });
    });
};
