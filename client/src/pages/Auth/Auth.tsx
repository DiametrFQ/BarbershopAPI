import { useState, useContext } from 'react'
import { useNavigate } from "react-router-dom"
import { loginPost } from '../../http/userAPI'
import { Context } from '../../context/context'
import ErrorMassage from '../../components/ErrorMessage/ErrorMessage'
import './Auth.css'

function Auth() {
  const [login, setLogin] = useState("")
  const [pas, setPas] = useState("")
  const [correct, setCorrect] = useState(false)

  const setRole = useContext(Context)!.setRole
  const role = useContext(Context)!.role

  const setId = useContext(Context)!.setId
  const id = useContext(Context)!.id

  const navigate = useNavigate();

  const signIn = async () => {
    try {
      const response = await loginPost(login, pas)
      if(response.data.function === 'noWorker'){
        return
      }
      console.log(response.data.function)
      setCorrect(() => false)
      setId(response.data.worker_id)
      setRole(response.data.function)
      navigate(`/${response.data.function}`)
      console.log(id)
      console.log(role)
    } catch (error) {
      setCorrect(() => true)
    }
  }

  return (
    <>
      <div className='signIn'> Sign In </div>

      <ErrorMassage correct={correct} massage={'Не правильно введен логин или пароль'}/>

      <input type="text" onChange={e => setLogin(e.target.value)}/><br />

      <input type="password" onChange={e => setPas(e.target.value)} /><br />

      <button className='bottomSignIn' onClick={signIn}>
        Войти
      </button>
    </>
  )
}

export default Auth