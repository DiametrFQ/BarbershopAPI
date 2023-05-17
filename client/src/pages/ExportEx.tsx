// import React from 'react'
// import * as FileServer from 'file-saver'
// import XLSX from 'sheetjs-style'

// interface ex{
//     excelData: any[],
//     fileName: string
//   }

// const ExportExcel = ({excelData,fileName}: ex) => {
//     const fileType = 'sad'
//     const fileExt = '.xlsx'

//     const exportToExcel = async () => {
//         const ws = XLSX.utils.json_to_sheet(excelData)
//         const wb: XLSX.WorkBook = { Sheets: {'data': ws}, SheetNames:['data']}
//         const exBuffer = XLSX.write(wb, {bookType: 'xlsx', type: 'array'})
//         const data = new Blob([exBuffer], {type: fileType})
//         FileServer.saveAs(data, fileName + fileExt)
//     }

//     return(
//         <div onClick={exportToExcel}>Export</div>
//     )
// }

// export default ExportExcel