import { useState } from 'react'
import { dbQueryPost } from "../../http/userAPI"
import { JsonToTable } from "react-json-to-table";
import './Analyst.css'
import ExitButtom from "../../components/ExitBottom/ExitButtom";
import exportExcel from '../../scripts/exportExcel';

function Analyst() {
  const [query, setQuery] = useState("")
  const [response, setResponse] = useState<any>([ null, null])
  const [responseYes, setResponseYes] = useState(false)

  const DBQuery = async () => {
    const forbidden = [
      "pg_authid","insert","delete","update", 
      "drop","truncate","create","alter","grant",
      "revoke","vacuum","pg_database","pg_tablespace",
      "pg_class","pg_attribute","pg_index","pg_user",
      "pg_roles","pg_index","pg_constraint","pg_statistic",
      "pg_proc", "pg_trigger"
    ]

    const suspicion = forbidden.some((table)=> query.toLowerCase().indexOf(table)+1)

    console.log(suspicion)
    let responses:any

    responses = await dbQueryPost(query)
    responses.data = suspicion === false? responses.data : [suspicion, "вы занимаетесь не своим делом"]

    if( responses.data.length == 2){
      setResponse( responses.data )
      setResponseYes( false)
    }
    else{
      setResponse( responses.data[0] )
      setResponseYes( true)
    }
  }

  return (
    <>
      {responseYes && <div className="table"> <JsonToTable json={response}></JsonToTable></div> }
      {!responseYes && 
        <div> 
          Ошибка в позиции: {response[0]}<br/>
          Тип ошибки: {response[1]}    
        </div>
      }

      <div className="select">
        <textarea onChange={e => setQuery(e.target.value)}/>
      </div>

      <button className="buttomSelect" onClick={DBQuery}>
        Сделать запрос
      </button><br />

      <button className="buttomExcel" onClick={() => exportExcel(responseYes, response) } style={{color: "green"}}>
        Выгрузка
      </button><br />

      <ExitButtom/>
    </>
  )
}

export default Analyst