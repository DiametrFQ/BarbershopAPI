import { useState } from 'react'
import ExitButtom from "../../components/ExitBottom/ExitButtom"
import { createOrderPost, findingFullNameClients, findingFullNameWorkers, findingNameService, reportGet } from "../../http/userAPI"
import './Manager.css'
import exportExcel from '../../scripts/exportExcel'

function Manager() {
  const [fullNameClient, setFullNameClient] = useState("")
  const [serviceName, setServiceName] = useState("")
  const [fullNameWorker, setFullNameWorker] = useState("")

  const [FullNamesClients, setFullNamesClients] = useState<any>([])
  const [NamesService, setNamesService] = useState<any>([])
  const [FullNamesWorkers, setFullNamesWorkers] = useState<any>()
  const [access, setAccess] = useState<any>(false)


  const createOrder = async () => {
    try {
      await createOrderPost(fullNameClient, serviceName, fullNameWorker)
    } catch (error) {
      
    }
  }

  const UpdateData = async () => {
    //console.log(fullNameClient, serviceName, fullNameWorker)
    const responseFullNamesClients = await findingFullNameClients()
    const responseNamesService = await findingNameService(fullNameWorker)
    const responseFullNamesWorkers = await findingFullNameWorkers()
    console.log(fullNameWorker)
    setFullNamesClients(responseFullNamesClients)
    setNamesService(responseNamesService)
    setFullNamesWorkers(responseFullNamesWorkers)
    setAccess(true)
  }

  const Excel = async () => {
    const response:any = await reportGet()
    console.log(response.data[0])
    exportExcel( true, response.data[0])
  }

  return (
    <>
      <div className='inputContainer'>
        <div className='text'>Заявка</div>
        <input className='clients' type="text" list="clientsList" placeholder="ФИО клиента" onChange={e => setFullNameClient(e.target.value)}/><br />
        <input className='service' type="text" list="serviceList" placeholder="Название услуги" onChange={e => setServiceName(e.target.value)}/><br />
        <input className='workers' type="text" list="workersList" placeholder="ФИО работника" onChange={e => setFullNameWorker(e.target.value)}/><br />
      </div>


          <datalist id='clientsList'>
            {access && FullNamesClients.data[0].map((fullName:any, Ind: number)=>{
                return <option key={Ind+10}>{fullName.client_name}</option>
            })}
          </datalist>

          <datalist id='serviceList'>
            {access && NamesService.data[0].map((fullName:any, Ind: number)=>{
                return <option key={Ind+210}>{fullName.service_name}</option>
            })}
          </datalist>

          <datalist id='workersList'>
            {access &&FullNamesWorkers.data[0].map((fullName:any, Ind: number)=>{
                return <option key={Ind+110}>{fullName.fullName}</option>
            })}
          </datalist>

      <div className='order'>
            <button  onClick={createOrder}> Создать заявку </button> <br />
            <button className='excel' onClick={UpdateData} style={{color:'#644CFF'}}>
              Обновить данные
            </button> <br />
            <button className='excel' onClick={Excel} style={{color:'green'}}>
              Вывод отчета по работникам и заказам
            </button> <br />
      </div>


      <ExitButtom />
    </>
  )
}

export default Manager