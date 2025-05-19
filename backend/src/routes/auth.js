const express = require("express");
const router = express.Router();
const { registerUser, verifyCode } = require("../controllers/authController");

router.post("/register", registerUser);
router.post("/verify", verifyCode);

module.exports = router;
