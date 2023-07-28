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
    <>
      <Layout>
      </Layout>
      {/* Hero Section */}
      <header className="hero bg-primary text-white text-center">
        <div className="container">
          <h1>Welcome to Food App!</h1>
          <p>Discover new recipes and manage your meal plan easily.</p>
        </div>
      </header>

      {/* Main Content */}
      <main className="container my-4">
        {/* Search Bar */}

        {/* Categories Section */}
        <section>
          <h2 className="text-center my-4">Browse by Categories</h2>
          <div className="row">
            {categories.map(category => (
              <div className="col-md-4 mb-4" key={category.id}>
                <Link href={`/categories/${category.id}`}>
                    <div className="card h-100">
                      <img src={category.strCategoryThumb} className="card-img-top" alt={category.strCategory}/>
                      <div className="card-body">
                        <h5 className="card-title">{category.strCategory}</h5>
                      </div>
                    </div>
                </Link>
              </div>
            ))}
          </div>
        </section>
      </main>

      {/* Footer */}
      <footer className="bg-light text-center text-lg-start">
        <div className="text-center p-3" style={{backgroundColor: 'rgba(0, 0, 0, 0.2)'}}>
          © {new Date().getFullYear()} Food App
        </div>
      </footer>
    </>
  );
}

export default Categories;
