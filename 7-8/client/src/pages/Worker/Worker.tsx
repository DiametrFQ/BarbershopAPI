import {  useContext, useEffect, useState } from 'react'
import { Context } from '../../context/context'
import ExitButtom from "../../components/ExitBottom/ExitButtom"
import { findOrders } from "../../http/userAPI"
import Order from '../../components/Order/Order'
import './Worker.css'
import exportExcel from '../../scripts/exportExcel'

function Worker() {
  const [correct, setCorrect] = useState(false)
  const [response, setResponse] = useState<any>([])
  const id = useContext(Context)!.id

  const orders = async () => {
    setResponse(await findOrders(id))
    console.log(response)
    setCorrect(true)
    exportExcel(true, response.data[0])
  }

  return (
    <>
        <div className='Order'>
          {correct && response.data[0].map((order:any, ind:number)=>{
            return <Order key={ind+1000} order={order}/>
          })}
        </div>

        <button onClick={ orders }> Вывести </button>

        <ExitButtom />
    </>
  )
}

export default Worker