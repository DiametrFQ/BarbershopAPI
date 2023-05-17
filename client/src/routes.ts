import Admin from "./pages/Admin/Admin"
import Analyst from "./pages/Analyst/Analyst"
import Auth from "./pages/Auth/Auth"
import Manager from "./pages/Manager/Manager"
import Worker from "./pages/Worker/Worker"

import { ADMIN_ROUTE, ANALYST_ROUTE, CONTROLLER_ROUTE, LOGIN_ROUTE, MANAGER_ROUTE, REG_ROUTE, WORKER_ROUTE } from "./untils/consts"

export interface Routes{
    path: string,
    Component: () => JSX.Element
}

export const authRoutes = [
    {
        path: ADMIN_ROUTE,
        Component: Admin
    },
    {
        path: REG_ROUTE,
        Component: Auth
    },

]
export const workerRoutes = [
    {
        path: WORKER_ROUTE,
        Component: Worker
    },
]
export const analysstRoutes = [
    {
        path: ANALYST_ROUTE,
        Component: Analyst
    },
]
export const managerRoutes = [
    {
        path: MANAGER_ROUTE,
        Component: Manager
    },
]
export const ControllerRoutes = [
    {
        path: CONTROLLER_ROUTE,
        Component: Manager
    },
]
export const publicRoutes = [
    {
        path: LOGIN_ROUTE,
        Component: Auth
    },
]