const Router = require('express')
const router = new Router()
const analystController = require('./../controller/analystController')

router.post('/bdquery', analystController.bdquery)

module.exports = router