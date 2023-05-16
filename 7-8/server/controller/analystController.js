const db = require('../db')

class AnalystController{
    async bdquery(req, res){
        const {query} = req.body

        try {
            const response = await db.query(`${query}`)
            res.json( [response[0]]  )
        } catch (error) {
            res.json( [error.parent.position, error.parent.routine ] )
        }
    }
}

module.exports = new AnalystController()