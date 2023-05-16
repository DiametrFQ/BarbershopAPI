import { $host } from "."

export const registrationPost = async (
    login: string, pas: string, role: string, phoneNumberInt: number,
    homeAddress: string, fullName: string, experienceInt: number,
    salaryInt: number, ageInt: number, serviceName: string, priceInt: number
) => {
    const response = await $host.post('api/user/registration', { 
        login, pas, role, phoneNumberInt, homeAddress, fullName,
        experienceInt, salaryInt, ageInt, serviceName, priceInt 
    })
    return response
}

export const loginPost = async (login: string, pas: string) => {
    const response = await $host.post('api/user/login', { login, pas })
    return response
}

export const dbQueryPost = async ( query: string) => {
    const response = await $host.post('api/analyst/bdquery', { query })
    return response
}

export const reportGet = async () => {
    const response = await $host.get('api/client/reporting')
    return response
}

export const findOrders = async (workerIdInt: number) => {
    const response = await $host.post('api/worker/findingOrders', {workerIdInt})
    return response
}

export const createOrderPost = async (
    fullNameClient: string, serviceName: string, fullNameWorker: string) => {
    const response = await $host.post('api/manager/createOrder', 
    {fullNameClient, serviceName, fullNameWorker})
    return response
}

export const findingFullNameWorkers = async () => {
    const response = await $host.get('api/manager/findingWorkers')
    return response
}

export const findingFullNameClients = async () => {
    const response = await $host.get('api/manager/findingClients')
    return response
}

export const findingNameService = async (fullNameWorker: string) => {
    const response = await $host.post('api/manager/findingService', { fullNameWorker})
    return response
}