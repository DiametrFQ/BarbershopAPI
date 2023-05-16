//import { useState } from 'react'
import { Route, Routes } from "react-router-dom"
import { ControllerRoutes, analysstRoutes, authRoutes, managerRoutes, publicRoutes, workerRoutes } from "../routes"
import { useContext } from "react"
import { Context } from "../context/context"

function AppRouter() {
  //const [count, setCount] = useState(0)
  const isAuth = useContext(Context)?.role
  return (
    <Routes>
        {isAuth === 'admin' && authRoutes.map( ({path, Component}) => {
            return <Route path={path} Component={Component} key={1}></Route>
        })}
        {isAuth === 'worker' && workerRoutes.map( ({path, Component}) => {
            return <Route path={path} Component={Component} key={1}></Route>
        })}
        {isAuth === 'analyst' && analysstRoutes.map( ({path, Component}) => {
            return <Route path={path} Component={Component} key={1}></Route>
        })}
        {isAuth === 'manager' && managerRoutes.map( ({path, Component}) => {
            return <Route path={path} Component={Component} key={1}></Route>
        })}
        {isAuth === 'controller' && ControllerRoutes.map( ({path, Component}) => {
            return <Route path={path} Component={Component} key={1}></Route>
        })}
        {publicRoutes.map( ({path, Component}) => {
            return <Route path={path} Component={Component} key={1}></Route>
        })}   
    </Routes>
  )
}

export default AppRouter