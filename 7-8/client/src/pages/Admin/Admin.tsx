import { useState } from 'react'
import { registrationPost, reportGet } from '../../http/userAPI'
import ExitButtom from '../../components/ExitBottom/ExitButtom'
import ErrorMassage from '../../components/ErrorMessage/ErrorMessage'
import './Admin.css'
import exportExcel from '../../scripts/exportExcel'

function Admin() {
  const [login, setLogin] = useState("")
  const [pas, setPas] = useState("")
  const [role, setRole] = useState("")
  const [phoneNumberInt, setPhoneNumberInt] = useState(80000000000)
  const [homeAddress, setHomeAddress] = useState("")
  const [fullName, setFullName] = useState("")
  const [experienceInt, setExperienceInt] = useState(0)
  const [salaryInt, setSalaryInt] = useState(24801)
  const [ageInt, setAgeInt] = useState(0)
  const [serviceName, setServiceName] = useState("")
  const [priceInt, setPriceInt] = useState(0)
  const [correct, setCorrect] = useState(false)

  const signIn = async () => {
    if(!(login && pas && role)){
      setCorrect(() => true)
      return
    }
    await registrationPost(login, pas, role, phoneNumberInt, homeAddress, fullName, experienceInt, salaryInt, ageInt, serviceName, priceInt)
    setCorrect(() => false)
  }

  const Excel = async () => {
    const response:any = await reportGet()
    console.log(response.data[0])
    exportExcel(true, response.data[0])
  }

  return (
  <>
      <ErrorMassage correct={correct} massage='Не введена вся информация'/>
      <div className='container'>
        <div className='role'> 
          <div className='text'>
            Role
          </div>
          <select className='role' onChange={e => setRole(e.target.value)}>
            <option></option>
            <option>analyst</option>
            <option>controller</option>
            <option>manager</option>
            <option>worker</option>
          </select>
        </div>

        <input className='Login'          type="text"   placeholder="Login"               onChange={value => setLogin(value.target.value)}/><br />
        <input className='Password'       type="text"   placeholder="Password"            onChange={e => setPas(e.target.value)}/><br />
        <input className='Phone'          type="number" placeholder="Phone (80000882323)" onChange={e => setPhoneNumberInt(+e.target.value) }/><br />
        <input className='Addres'         type="text"   placeholder="Home address"        onChange={e => setHomeAddress(e.target.value)} /><br />
        <input className='Fullname'       type="text"   placeholder="Fullname"            onChange={e => setFullName(e.target.value)}/><br />
        <input className='Experience'     type="number" placeholder="Experience (0-10)"   onChange={e => setExperienceInt(+e.target.value)} /><br />
        <input className='Salary'         type="number" placeholder="Salary"              onChange={e => setSalaryInt(+e.target.value)}/><br />
        <input className='Age'            type="number" placeholder="Age"                 onChange={e => setAgeInt(+e.target.value)} /><br />
        {role == "worker" && <>
          <input className='ServiceName'  type="text"   placeholder="Service name"        onChange={e => setServiceName(e.target.value)} /><br />
          <input className='Price'        type="number" placeholder="Price"               onChange={e => setPriceInt(+e.target.value)} /><br /> 
        </>}
      </div>

      <button onClick={signIn}>
        Создать пользователя
      </button><br />

      <button onClick={Excel} style={{color: 'green', marginTop: "10px"}}>
        Вывод отчета по работникам и заказам
      </button>
      
      <ExitButtom />
  </>
  )
}
export default Admin