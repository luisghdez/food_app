import React, { useState } from 'react';
import axios from 'axios';

const UpdateQuantityButton = ({ mealId, quantity }) => {
  const [newQuantity, setNewQuantity] = useState(quantity);

  const updateQuantity = async () => {
    try {
      const data = { id: mealId, quantity: newQuantity };
      const response = await axios.post('http://localhost:3000/carts/update_meal', data);

      if (response.status === 200) {
        alert("Quantity updated successfully.");
      } else {
        alert("Failed to update quantity.");
      }
    } catch (error) {
      alert(`Failed to update quantity: ${error.message}`);
    }
  };

  return (
    <div>
      <input type="number" value={newQuantity} min="0" className="form-control" onChange={e => setNewQuantity(e.target.value)} />
      <button className="btn btn-primary btn-sm mt-1" onClick={updateQuantity}>Update</button>
    </div>
  );
};

export default UpdateQuantityButton;
