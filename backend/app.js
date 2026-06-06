const express = require("express");
const cors = require("cors");

// ===============================
// ROUTES IMPORTS
// ===============================
const authRoutes = require("./routes/auth.routes");
const statisticsRoutes = require("./routes/statistics.routes");

const app = express();

// ===============================
// MIDDLEWARE GLOBAL
// ===============================
app.use(cors());
app.use(express.json());

// ===============================
// API ROUTES
// ===============================
app.use("/api/auth", authRoutes);
app.use("/api/statistics", statisticsRoutes);

// ===============================
// HEALTH CHECK (BONNE PRATIQUE)
// ===============================
app.get("/", (req, res) => {
  res.json({
    success: true,
    message: "TeamTrack API is running "
  });
});

module.exports = app;