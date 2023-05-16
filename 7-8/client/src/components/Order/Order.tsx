import './Order.css'

interface IOrderProps{
    order:any, 
}

function Order(props:IOrderProps) {

  return (
    <>
        <div className="orderContainer">
            <span className="client">{props.order.fullname_client}</span>
            {/* <span className="worker">{props.order.fullname_worker}</span> */}
            <span className="nameOrder">{props.order.name_order}</span>
            <span className="date">{props.order.date}</span>
            <span className="numberOrder">{props.order.number_order}</span>
        </div>
    </>
  )
}

export default Order