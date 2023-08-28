const express = require("express");
const app = express();
// aqui eu to decidindo qual porta vou usar no servidor/ pode ser a que eu passar no .env
// ou a porta 5000 caso nao consiga ler.
const dotenv = require("dotenv").config();
const PORT = process.env.PORT || 5000;

// Aqui e a rota inicial do app. quando eu colar http://localhost:5000/ no navegador vai aparecer.
//me ajuda muito a ter uma base
app.get("/", (req, res) => {
    res.send("Rota inicial da StartUp. Vamo com tudo!!!!")
})

app.listen(PORT, () => {
    console.log(`O Servidor esta rodando na porta: ${PORT}`)
})