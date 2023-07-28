import React from 'react';
import axios from 'axios';

const RemoveMealButton = ({ mealCartId }) => {
  const removeMeal = async () => {
    try {
      const data = { id: mealCartId };
      const response = await axios.post('http://localhost:3000/carts/remove_meal', data);

      if (response.status === 200) {
        alert("Meal removed successfully.");
        // Optionally, you could force a page reload here to reflect the change in the UI
        window.location.reload();
      } else {
        alert("Failed to remove meal.");
      }
    } catch (error) {
      alert(`Failed to remove meal: ${error.message}`);
    }
  };

  return <button className="btn btn-danger btn-sm" onClick={removeMeal}>Remove</button>;
};

export default RemoveMealButton;
