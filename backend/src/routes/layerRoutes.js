const express = require("express");
const router = express.Router();
const { getLayerData } = require("../controllers/layerController");

router.get("/", getLayerData);

module.exports = router;
