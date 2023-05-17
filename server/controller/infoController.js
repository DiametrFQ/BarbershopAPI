const db = require('../db')

class InfoController{
    async findingClients(req, res){
        const {like} = req.body
        res.json(
            await db.query(`select * from client where "client_name" like '%${like}%'`)
        )
    }

    async reporting(req, res){
        const newselect = await db.query(`
        WITH orders AS (
            SELECT
            "fullName" AS ФИО,
            order_id AS Номер_заказа,
            order_date AS Дата_оформления_заказа,
            order_final_date AS Дата_выполнения_заказа
            FROM
            worker
            INNER JOIN service USING (worker_id)
            INNER JOIN order_info USING (service_id)
            INNER JOIN "order" USING (order_id)
            )
            SELECT
            ФИО,
            Номер_заказа,
            Дата_оформления_заказа,
            Дата_выполнения_заказа,
            CASE
            WHEN Дата_выполнения_заказа IS NOT NULL THEN 'выполнено'
            ELSE 'не выполнено'
            END AS "Статус"
            FROM
            orders;
        `)
        res.json(
            newselect
        )
    }
}

module.exports = new InfoController()