require("dotenv").config({path:".env"})
const db = require('../db')
const ApiError = require('../error/ApiError')
// const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const crypto = require('crypto')

function checkPassword2(salthashPasse, pas){
    const [salt, hash256] = salthashPasse.split(':')
    console.log([salt, hash256])
    const newencodedPas = crypto.scryptSync(pas, salt, 64).toString('hex')
    const newhash256 = crypto.createHash('sha256').update(newencodedPas).digest('base64');

    return hash256 === newhash256;
}

function saltSha256(pas){
    const salt = crypto.randomBytes(64).toString('hex')
    const encodedPas = crypto.scryptSync(pas, salt, 64).toString('hex')
    const hash256 = crypto.createHash('sha256').update(encodedPas).digest('base64');
    return `${(salt)}:${hash256}`
}

class UserController{

    async registration(req, res, next){
        const {login, pas, role, phoneNumberInt, homeAddress, fullName, experienceInt, salaryInt, ageInt, serviceName, priceInt} = req.body

        if(!login){
            return next(ApiError.badRequest('Не введен логин'))
        }
        else if(!pas){
            return next(ApiError.badRequest('Не введен пароль'))
        }
        try {
            const hashPassword = saltSha256(pas)//crypto.createHash('sha256').update(pas).digest('hex');

            await db.query(`
                CREATE USER ${login} WITH PASSWORD '${pas}';
                GRANT ${role} TO ${login};
                UPDATE pg_authid SET rolpassword = '${hashPassword}' WHERE rolname like '${login}';

                INSERT INTO worker_contacts(phone_number, home_address) 
                VALUES( '${phoneNumberInt}', '${homeAddress}');

                INSERT INTO worker("fullName", function, experience, salary, age, contacts_id, login)
                VALUES ('${fullName}', '${role}', '${experienceInt}', '${salaryInt}', '${ageInt}', (SELECT max(contacts_id) FROM worker_contacts), '${login}');
            `)

            if(role !== "worker"){
                return
            }

            await db.query(`
                INSERT INTO service(service_name, price, worker_id)
                VALUES('${serviceName}', '${priceInt}', (SELECT MAX(worker_id) FROM worker));
            `)
            
            const token = jwt.sign(
                {login, pas, role},
                process.env.SECRET_WORD,
                {experienceInt:'24h'}
            )
            res.json(token)

        } catch (error) {
            console.log(error)
            return next(ApiError.badRequest('Пользователь уже создан'))
        }
    }

    async login(req, res, next){
        const {login, pas} = req.body

        if(!login){
            return next(ApiError.badRequest('Не введен логин'))
        }
        else if(!pas){
            return next(ApiError.badRequest('Не введен пароль'))
        }
        try {
            await db.query(`
                SELECT rolname FROM pg_authid WHERE rolname LIKE '${login}';
            `)
            try {
                const pasUser = await db.query(
                    ` SELECT rolpassword FROM pg_authid WHERE rolname LIKE '${login}';`
                )
                if(!checkPassword2(pasUser[0][0].rolpassword, pas)){
                    return next(ApiError.badRequest('неверный пароль!'))
                }
                try {
                    const roleUser = await db.query(
                        ` SELECT * FROM pg_authid as auth, worker where worker.login = auth.rolname and worker.login = '${login}'`
                    )
                    res.json(roleUser[0][0])

                } catch (error) {
                    res.json("noWorker")
                    return next(ApiError.badRequest('пздц где роль???'))
                }
                res.json(checkPassword(pasUser[0][0].rolpassword, pas))

            } catch (error) {
                return next(ApiError.badRequest('пиздец'))
            }
        } catch (error) {
            return next(ApiError.badRequest('Такого пользователя нет'))
        }
        res.json("isworked")
    }

    async auth(req, res, next){
        const {id} = req.query
        if(!id){
            return next(ApiError.badRequest('Не задан ID'))
        }
        res.json(id)
    }
}
module.exports = new UserController()