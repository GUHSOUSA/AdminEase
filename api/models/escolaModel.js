const mongoose = require("mongoose");

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
    hash: {
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

module.exports = mongoose.model("Escola", escolaSchema)