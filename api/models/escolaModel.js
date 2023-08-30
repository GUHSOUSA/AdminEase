const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
let escolaSchema = new mongoose.Schema({
    escola: {
        type: String,
        required: true,
        unique: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true,
        
    },
    slug: {
        type: String,
        required: true,
        unique: true
    }
},
{
    timestamps: true
}
);

escolaSchema.pre("save", async function (next) {
    const salt = await bcrypt.genSalt(10);
    this.password = await bcrypt.hash(this.password, salt);
    next();
});

escolaSchema.methods.isPasswordMatched = async function(
    enteredPassword
){
    return await bcrypt.compare(enteredPassword, this.password);
}

module.exports = mongoose.model("Escola", escolaSchema)