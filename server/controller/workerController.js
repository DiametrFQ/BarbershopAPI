const db = require('../db')

class WorkerController{
    async findingOrders(req, res){
        const {workerIdInt} = req.body
        res.json(
            await db.query(`
                SELECT "fullName" AS fullName_worker, client_name AS fullName_client,order_id AS number_order,service_name AS name_order, order_date AS date
                FROM worker JOIN service USING(worker_id) JOIN order_info USING(service_id) JOIN "order" USING(order_id) JOIN client USING(client_id)
                WHERE "worker_id" = ${workerIdInt};
            `)
        )
    }
}

module.exports = new WorkerController()