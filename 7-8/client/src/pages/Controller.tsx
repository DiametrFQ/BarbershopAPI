import { Link } from "react-router-dom"

function Controller() {
  //const [count, setCount] = useState(0)
  return (
    <>
        <div>
            Controller
        </div>
        <button>
            <Link to="/login">login</Link>
        </button>
        {/* <ExportExcel excelData={test} fileName={"asdasd"}/> */}
    </>
  )
}

export default Controller