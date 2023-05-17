const Router = require('express')
const router = new Router()

const workerRouter = require('./workerRouter')
const clientRouter = require('./clientRouter')
const userRouter = require('./userRouter')
const analystRouter = require('./analystRouter')
const managerController = require('./managerRouter')

router.use('/worker', workerRouter)
router.use('/client', clientRouter)
router.use('/user', userRouter)
router.use('/analyst', analystRouter)
router.use('/manager', managerController)

module.exports = router