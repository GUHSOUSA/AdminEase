const escolaModel = require("../models/escolaModel");
const asyncHandler = require("express-async-handler");
const slugify = require("slugify");
const bcrypt = require("bcrypt"); // Adicionando bcrypt para hash de senha
const { genereToken } = require("../config/jwtToken");

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
    const existingEscola = await escolaModel.findOne({
      escola: escola
    })
    if(existingEscola){
      return res.status(400).json({ error: 'Esse nome de escola ja esta sendo usado por outra pessoa' });
    }
    
    // Verificar se o email já está registrado
    const existingEmail = await escolaModel.findOne({ email });
    if (existingEmail) {
      return res.status(400).json({ error: 'Este email já está sendo usado por outra conta' });
    }

    // Criar um slug amigável para URL
    const slug = slugify(escola.toLowerCase());
    
    // Criar o documento da escola no banco de dados
    const newEscola = await escolaModel.create({
      escola,
      email,
      password,
      slug,
    });

    res.status(201).json(newEscola); // 201 Created para indicar sucesso na criação

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Ocorreu um erro interno no servidor' });
  }
});

const loginEscola = asyncHandler(async (req, res ) => {
  try{
    const { password, email } = req.body;
    if (!email) {
      return res.status(400).json({ error: 'Por favor, forneça o email' });
    }
    if (!password) {
      return res.status(400).json({ error: 'Por favor, forneça a senha' });
    }
    const findEscola = await escolaModel.findOne({
      email: email
    });
    if (!findEscola) {
      return res.status(400).json({ error: 'O email Não corresponde a nenhuma escola' });
    }
    if(findEscola && (await findEscola.isPasswordMatched(password))){
      res.status(201).json({
        status: true,
        message: "Login feto com sucesso",
        token: genereToken(findEscola?._id),
        escola: findEscola.escola
      });

    }else {
      return res.status(400).json({ error: 'Senha incorreta' });
    }
  }catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Ocorreu um erro interno no servidor' });
  }
})

module.exports = { regiterEscola, loginEscola };
