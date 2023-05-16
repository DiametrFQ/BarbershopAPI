const Router = require('express')
const router = new Router()
const InfoController = require('./../controller/infoController')

router.post('/findingClients', InfoController.findingClients)
router.get('/reporting', InfoController.reporting)

module.exports = router