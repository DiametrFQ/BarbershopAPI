import './ErrorMassege.css'
interface ErrorMassageProps{
    correct: boolean,
    massage: string
}
function ErrorMassage(props: ErrorMassageProps) {

    return (
        <>
            {props.correct && <div id='correct'>{props.massage}</div>}
        </>
    )
}

export default ErrorMassage