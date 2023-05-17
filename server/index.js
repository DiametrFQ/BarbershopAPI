require("dotenv").config({path:"./server/.env"})
const express = require('express')
const cors = require('cors')
const sequelize = require('./db')

const mainRouter = require('./routes/mainRouters')
const ErrorHandler = require("./middleware/ErrorHandingMiddleware")


const PORT = process.env.PORT || 8080

const app = express()

app.get('/', (req, res) => {
    res.send('HI asd')
})
app.use(cors())
app.use(express.json())
app.get('/', (req, res) => {
    res.status(200).json({message:'Working'})
})
app.use('/api', mainRouter)


app.use(ErrorHandler)

const start = async () => {
    try {
        await sequelize.authenticate()
        await sequelize.sync()

        app.listen(PORT, () => {console.log(`server started on port ${PORT}`)})
    } catch (e) {
        console.log(e)
    }
}
start()