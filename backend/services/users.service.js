const User = require('../models/user.model'); // Fixed import
const bcrypt = require('bcrypt');
const auth = require('../middleware/auth');

async function login({ email, password }, callback) {
    try {
        const userModel = await User.findOne({ email });
        console.log("User found:", userModel);
        if (!userModel) {
            return callback({ message: "Invalid Email/password" });
        }

        const isPasswordValid = await bcrypt.compare(password, userModel.password);
        console.log("Stored Hashed Password:", userModel.password);
        console.log("Entered Password:", password);
        if (!isPasswordValid) {
            return callback({ message: "Invalid Email/password" });
        }

        const token = auth.generateAccessToken(userModel.toJSON());
        return callback(null, { ...userModel.toJSON(), token });
    } catch (error) {
        return callback(error);
    }
}

async function register(params, callback) {
    try {
        console.log("🔍 Register Params:", params);
        if (!params.email) {
            console.log("❌ Missing Fields!");
            return callback({ message: "Email Required!" });
        }

        console.log("🔍 Checking if user exists...");
        const isUserExist = await User.findOne({ email: params.email });
        if (isUserExist) {
            console.log("❌ Email already exists!");
            return callback({ message: "Email already exists" });
        }
        console.log("🔍 Hashing password...");
        const salt = await bcrypt.genSalt(10);
        params.password = await bcrypt.hash(params.password, salt);

        console.log("🔍 Saving new user...");
        const newUser = new User(params);
        const savedUser = await newUser.save();
        console.log("✅ User Registered:", savedUser);
        return callback(null, savedUser);
    } catch (error) {
        console.error("❌ Register Error:", error);
        return callback(error);
    }
}

module.exports = { login, register };
