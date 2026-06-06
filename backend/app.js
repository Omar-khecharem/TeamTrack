const express = require("express");
const cors = require("cors");

// ===============================
// ROUTES IMPORTS
// ===============================
const authRoutes = require("./routes/auth.routes");
const settingsRoutes = require("./routes/settings.routes");

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
app.use("/api/settings", settingsRoutes);

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