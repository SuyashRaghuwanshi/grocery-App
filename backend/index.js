const express = require("express");
const app = express();
const mongoose = require("mongoose");
const { MONGO_DB_CONFIG } = require("./config/app.config");
const errors = require("./middleware/error.js");
const appRoutes = require("./routes/app.routes.js");
const swaggerUi = require("swagger-ui-express");
const swaggerDocument = require("./swagger.json");
const swaggerDoc= require("./swagger2.json");
const cors = require("cors");

// ✅ Enable CORS properly
app.use(cors({
    origin: "http://localhost:54008", // Allow all origins
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"]

}));

// ✅ Connect to MongoDB
mongoose
    .connect(MONGO_DB_CONFIG.DB)
    .then(() => console.log("✅ Database connected"))
    .catch((error) => console.error("❌ Database connection failed:", error));

// ✅ Middleware
app.use(express.json());
app.use("/uploads", express.static("uploads"));
console.log("✅ Routes loaded");

app.use("/api", appRoutes);
console.log("✅ API routes are registered. Test at http://localhost:5000/api/product");

app.use(errors.errorHandler);
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));
// app.use("/api-prod",swaggerUi.serve, swaggerUi.setup(swaggerDoc));

// ✅ Start Server
const PORT = process.env.PORT || 5000;
try{
    app.listen(PORT, () => {
    console.log(`🚀 Server running on port ${PORT}`);
})
}
catch(error){
    console.log(error);
}

