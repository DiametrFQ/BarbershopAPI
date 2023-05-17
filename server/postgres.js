const db = require('./db')

//const newselect = await db.query('select * from worker')

async function select(){
    return await db.query('select * from worker')
}

console.log(select())
