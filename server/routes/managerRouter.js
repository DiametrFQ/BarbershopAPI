const Router = require('express')
const router = new Router()
const managerController = require('../controller/managerController')

router.post('/createOrder', managerController.createOrder)
router.get('/findingWorkers', managerController.findingFullNameWorkers)
router.get('/findingClients', managerController.findingFullNameClients)
router.post('/findingService', managerController.findingNameService)

module.exports = router