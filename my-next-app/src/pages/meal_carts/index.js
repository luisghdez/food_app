import { useEffect, useState } from 'react';
import useSWR, { mutate } from 'swr';
import axios from 'axios';

const fetcher = url => axios.get(url).then(res => res.data);

const MealCarts = () => {
  const { data, error } = useSWR('http://localhost:3000/meal_carts', fetcher);

  if (error) return <div>Failed to load cart</div>
  if (!data) return <div>Loading...</div>

  const handleUpdateMeal = async (mealCartId, quantity) => {
    try {
      const response = await axios.post('http://localhost:3000/carts/update_meal', { id: mealCartId, quantity: quantity });
      if (response.status === 200) {
        // If the request was successful, refresh the data
        mutate('http://localhost:3000/meal_carts');
      } else {
        mutate('http://localhost:3000/meal_carts');
      }
    } catch (error) {
      alert(`Failed to update meal quantity: ${error.message}`);
    }
  };

  const handleRemoveMeal = async (mealCartId) => {
    try {
      const response = await axios.post('http://localhost:3000/carts/remove_meal', { id: mealCartId });
      if (response.status === 200) {
        // If the request was successful, refresh the data
        mutate('http://localhost:3000/meal_carts');
      } else {
        mutate('http://localhost:3000/meal_carts');
      }
    } catch (error) {
      alert(`Failed to remove meal: ${error.message}`);
    }
  };

  return (
    <div className="container">
      <h1>Your Cart</h1>
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
          {data.order.map((mealCart, index) => (
            <tr key={index}>
              <td>{mealCart.meal.strMeal}</td>
              <td>${mealCart.meal.price}.00</td>
              <td>
                <input type="number" min="0" className="form-control" value={mealCart.quantity} onChange={e => handleUpdateMeal(mealCart.meal.id, e.target.value)} />
                {/* <button className='btn btn-primary btn-sm mt-1' onClick={() => handleUpdateMeal(mealCart.meal.id, mealCart.quantity)}>Update</button> */}
              </td>
              <td>
                <button className='btn btn-danger btn-sm' onClick={() => handleRemoveMeal(mealCart.id)}>Remove</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <p className="text-right">Total: ${data.total}.00 </p>
    </div>
  );
}

export default MealCarts;
