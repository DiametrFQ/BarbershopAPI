const db = require('../db')

class ManagerController{
    async createOrder(req){
        const {fullNameClient, serviceName, fullNameWorker} = req.body

        await db.query(`
            INSERT INTO "order"(order_date, client_id) VALUES(now(),(SELECT client_id from client WHERE client_name LIKE '${fullNameClient}'));
            INSERT INTO order_info(order_id, service_id) VALUES ((SELECT max(order_id) FROM "order"),
            (SELECT service_id FROM service JOIN worker USING(worker_id)
            WHERE service_name LIKE '${serviceName}' AND "fullName" LIKE '${fullNameWorker}'));
        `)
    }

    async findingFullNameWorkers(req, res){
        res.json(
            await db.query(`select "fullName" from worker where "function" like 'worker'`)
        )
    }
    async findingFullNameClients(req, res){
        res.json(
            await db.query(`select client_name from client`)
        )
    }
    async findingNameService(req, res){
        const {fullNameWorker} = req.body
        res.json(
            await db.query(`SELECT service_name FROM service JOIN worker USING(worker_id) WHERE "fullName" LIKE '${fullNameWorker}';`)
        )
    }
}

module.exports = new ManagerController()