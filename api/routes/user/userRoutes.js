const express = require("express");
const { regiterEscola, loginEscola } = require("../../controllers/escolaCtrl");
const userRoutes = express.Router();

userRoutes.post("/register", regiterEscola);
userRoutes.post("/login", loginEscola);


module.exports = userRoutes;