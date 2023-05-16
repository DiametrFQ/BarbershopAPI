import exportFromJSON from "export-from-json";

const exportExcel = (permission: boolean, data: any) => {
    if(!permission){
        return
    }
    const fileName = 'download'
    const exportType = 'csv'
  
    exportFromJSON({ data, fileName, exportType })
}

export default exportExcel