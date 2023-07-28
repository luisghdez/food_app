import React from 'react';
import axios from 'axios';

function Category({ data }) {
  const { category, meals, cart } = data;

  return (
    <div className="container">
      <h1>{category.strCategory}</h1>
      <p>{category.strCategoryDescription}</p>

      <h2>Meals in this Category</h2>

      <div className="row">
        {meals.map(meal => (
          <div className="col-6 col-lg-3 mb-3" key={meal.id}>
            <div className="card h-100 meal-card">
              <img src={meal.strMealThumb} alt={meal.strMeal} className="card-img-top" />
              <div className="card-body d-flex flex-column align-items-center w-100">
                <h4 className="card-title">{meal.strMeal}</h4>
                <div className="d-flex align-items-baseline justify-content-around w-100">
                  <h5 className="card-text">${meal.price}.00</h5>
                  {/* You'll need to implement a way to add meals to the cart */}
                  <button className="btn btn-primary">+</button>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export async function getServerSideProps(context) {
  const { id } = context.query;

  const response = await axios.get(`http://localhost:3000/categories/${id}`);

  return { props: { data: response.data } };
}

export default Category;
