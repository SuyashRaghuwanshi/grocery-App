const multer = require("multer");
const Path = require("path");

// Configure Storage
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "./uploads/sliders"); // Ensure this folder exists
    },
    filename: function (req, file, cb) { // Corrected from `fileName` to `filename`
        cb(null, Date.now() + "-" + file.originalname);
    },
});

// File Filter Function
const fileFilter = (req, file, cb) => {
    const allowedExtensions = [".png", ".jpg", ".jpeg"];
    const ext = Path.extname(file.originalname).toLowerCase();

    // Validate File Type
    if (!allowedExtensions.includes(ext)) {
        return cb(new Error("Invalid File Type. Only PNG and JPG are allowed"), false);
    }

    // Validate File Size (1MB)
    const fileSize = parseInt(req.headers["content-length"]);
    if (fileSize > 1048576) {
        return cb(new Error("Invalid File Size. Maximum allowed size is 1MB"), false);
    }

    cb(null, true);
};

// Multer Upload Config
let upload = multer({
    storage: storage,
    fileFilter: fileFilter,
    limits: { fileSize: 1048576 } // Corrected placement of fileSize inside `limits`
});

module.exports = upload.single("sliderImage");
