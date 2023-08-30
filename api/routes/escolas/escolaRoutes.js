const express = require("express");
const { regiterEscola, loginEscola } = require("../../controllers/escolaCtrl");
const escolaRoutes = express.Router();

escolaRoutes.post("/register", regiterEscola);
escolaRoutes.post("/login", loginEscola);


module.exports = escolaRoutes;