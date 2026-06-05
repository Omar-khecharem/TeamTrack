const express = require("express");
const router = express.Router();

const auth = require("../controllers/auth.controller");

router.post("/register", auth.register);
router.post("/login", auth.login);

// FORGOT PASSWORD
router.post("/forgot-password", auth.forgotPassword);

// RESET PASSWORD
router.post("/reset-password/:token", auth.resetPassword);

module.exports = router;