const Router = require('express')
const workerController = require('../controller/workerController')
const router = new Router()

router.post('/findingOrders', workerController.findingOrders)

module.exports = router