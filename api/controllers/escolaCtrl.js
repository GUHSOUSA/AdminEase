const escolaModel = require("../models/escolaModel");
const asyncHandler = require("express-async-handler");
const slugify = require("slugify");
const bcrypt = require("bcrypt"); // Adicionando bcrypt para hash de senha

const regiterEscola = asyncHandler(async (req, res) => {
  try {
    const { escola, password, email } = req.body;

    // Validação dos campos de entrada
    if (!escola) {
      return res.status(400).json({ error: 'Por favor, forneça o nome da escola' });
    }
    if (!email) {
      return res.status(400).json({ error: 'Por favor, forneça o email' });
    }
    if (!password) {
      return res.status(400).json({ error: 'Por favor, forneça a senha' });
    }

    // Verificar se o email já está registrado
    const existingEmail = await escolaModel.findOne({ email });
    if (existingEmail) {
      return res.status(400).json({ error: 'Este email já está sendo usado por outra conta' });
    }

    // Hash da senha usando bcrypt
    const hashedPassword = await bcrypt.hash(password, 10);

    // Criar um slug amigável para URL
    const slug = slugify(escola.toLowerCase());
    
    // Criar o documento da escola no banco de dados
    const newEscola = await escolaModel.create({
      escola,
      email,
      hash: hashedPassword,
      slug,
    });

    res.status(201).json(newEscola); // 201 Created para indicar sucesso na criação

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Ocorreu um erro interno no servidor' });
  }
});

module.exports = { regiterEscola };
