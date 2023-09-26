const asyncHandler = require("express-async-handler");
const slugify = require("slugify");
const bcrypt = require("bcrypt"); // Adicionando bcrypt para hash de senha
const { genereToken } = require("../config/jwtToken");

const regiterEscola = asyncHandler(async (req, res) => {
  try {
    const { name, email, password } = req.body;

    // Validação dos campos de entrada
    if (!name) {
      return res.status(400).json({ error: 'Por favor, forneça o nome de usuario' });
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

    // Criar um slug amigável para URL
    
    
    // Criar o documento da escola no banco de dados
    const newEscola = await escolaModel.create({
      name,
      email,
      password,
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
    const findUser = await escolaModel.findOne({
      email: email
    });
    if (!findUser) {
      return res.status(400).json({ error: 'O email Não corresponde a nenhuma escola' });
    }
    if(findUser && (await findUser.isPasswordMatched(password))){
      res.status(201).json({
        status: true,
        message: "Login feto com sucesso",
        token: genereToken(findUser?._id),
        escola: findUser.escola
      });

    }else {
      return res.status(400).json({ error: 'Senha incorreta' });
    }
  }catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Ocorreu um erro interno no servidor' });
  }
});

module.exports = { regiterEscola, loginEscola };
