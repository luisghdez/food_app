import UpdateQuantityButton from './UpdateQuantityButton';
import RemoveMealButton from './RemoveMealButton';

const CartTable = ({ cart }) => {
  console.log(cart.order[0]);
  return (
    <table className="table table-bordered table-hover">
      <thead>
        <tr>
          <th>Name</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {cart.order.map(item => (
          <tr key={item.id}>
            {/* <td>{item.meal.strMeal}</td>
            <td>{item.meal.price}</td>
            <td>
              <UpdateQuantityButton mealId={item.meal.id} quantity={item.quantity} />
            </td>
            <td>
              <RemoveMealButton mealCartId={item.id} />
            </td> */}
          </tr>
        ))}
      </tbody>
    </table>
  );
}

export default CartTable;
