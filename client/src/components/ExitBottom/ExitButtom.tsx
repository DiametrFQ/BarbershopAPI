import { Link } from 'react-router-dom'
import './ExitButtom.css'

function ExitButtom() {

    return (
        <button className='Exit'>
            <Link to="/">Exit</Link>
        </button>
    )
}

export default ExitButtom