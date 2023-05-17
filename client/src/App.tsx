import './App.css'
import { useState } from 'react'
import AppRouter from './components/AppRouter'
import { BrowserRouter} from "react-router-dom"
import { Context } from './context/context'

function App() {
  const [role, setRole] = useState<string>('none')
  const [id, setId] = useState<number>(-1)

  return (
    <Context.Provider value={{ role, setRole, id, setId, }}>
      <BrowserRouter>
        <AppRouter/>
      </BrowserRouter>
    </Context.Provider>
  );
}

export default App