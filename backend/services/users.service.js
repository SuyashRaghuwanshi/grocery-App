const User = require('../models/user.model'); // Fixed import
const bcrypt = require('bcrypt');
const auth = require('../middleware/auth');

async function login({ email, password }, callback) {
    try {
        const userModel = await User.findOne({ email });
        if (!userModel) {
            return callback({ message: "Invalid Email/password" });
        }

        const isPasswordValid = await bcrypt.compare(password, userModel.password);
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
        if (!params.email) {
            return callback({ message: "Email Required!" });
        }

        const isUserExist = await User.findOne({ email: params.email });
        if (isUserExist) {
            return callback({ message: "Email already exists" });
        }
        
        const salt = await bcrypt.genSalt(10);
        params.password = await bcrypt.hash(params.password, salt);

        const newUser = new User(params);
        const savedUser = await newUser.save();

        return callback(null, savedUser);
    } catch (error) {
        return callback(error);
    }
}

module.exports = { login, register };
