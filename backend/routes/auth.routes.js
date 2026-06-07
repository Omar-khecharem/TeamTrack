const express = require("express");
const router = express.Router();

const auth = require("../controllers/auth.controller");
const validate = require("../middlewares/validate.middleware");
const authMiddleware = require("../middlewares/auth.middleware");

router.get("/me", authMiddleware, auth.getMe);

router.post("/register",
  validate('nom', 'prenom', 'email', 'telephone', 'password', 'position.lat', 'position.lng'),
  auth.register
);
router.post("/login", auth.login);

module.exports = router;