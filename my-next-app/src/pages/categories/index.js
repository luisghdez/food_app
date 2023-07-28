import React from 'react';
import useSWR from 'swr';
import Link from 'next/link';
import axios from 'axios';
import Layout from '../../../components/Layout';


const fetcher = url => axios.get(url).then(res => res.data);

function Categories() {
  const { data: categories, error } = useSWR('http://localhost:3000/categories', fetcher);

  if (error) return <div>Failed to load</div>;
  if (!categories) return <div>Loading...</div>;

  return (
    <div>
      <head>
        <title>My Page Title</title>
        <meta name="viewport" content="initial-scale=1.0, width=device-width" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
        <link rel="stylesheet" href="my-next-app/src/app/globals.scss" />
      </head>
    <Layout>
    </Layout>
    <div className="container">
      {/* Search Bar */}
      <form className="form-inline my-2 my-lg-0">
        <input className="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"/>
        <button className="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>

      {/* Categories Section */}
      <div className="cat-row">
        {categories.map(category => (
          <div className="col-md-4 mb-4" key={category.id}>
            <Link href={`/categories/${category.id}`}>
              <div className="card cat-card">
                <img src={category.strCategoryThumb} className="card-img-top" alt={category.strCategory}/>
                <div className="card-body">
                  <h5 className="card-title">{category.strCategory}</h5>
                </div>
              </div>
            </Link>
          </div>
        ))}
      </div>

      {/* Popular Items Section */}
      <div>
        <h2>Popular Items</h2>
        {/* Add popular items content here */}
      </div>
    </div>
    </div>
  );
}

export default Categories;
