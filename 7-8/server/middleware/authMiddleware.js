require("dotenv").config({path:".env"})
const jwt = require('jsonwebtoken')

module.exports = function (req, res, next){
    if(req.method === "OPTIONS"){

    }
    try {
        const token = req.headers.authorization.split(' ')[1] //Bearer
        if(!token){
            res.json({message:"Вы не авторизованы"})
        }   
        const decode = jwt.verify(token, process.env.SECRET_WORD)
        req.user = decode
        next()
    } catch (e) {
        res.status(401).json({message: "Вы не авторизованы"})
    }
}