import React from 'react';
import Header from './components/Header';
import Footer from './components/Footer';
import Banner from './components/Banner';
import CategoryList from './components/CategoryList';
import ProductCard from './components/ProductCard';
import PromotionCard from './components/PromotionCard';
import { ChevronRight } from 'lucide-react';

import PRODUCTOS_DESTACADOS from './data/productos';
import PROMOCIONES from './data/promociones';

function App() {
  return (
    <div className="flex flex-col min-h-screen bg-gray-100">
      <Header />

      <main className="flex-1 container mx-auto py-6 px-4">
        <Banner />
        
        <CategoryList />
        
        {/* Promotions */}
        <div className="mb-8">
          <h2 className="text-xl font-bold mb-4">Promociones y ofertas especiales</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {PROMOCIONES.map(promo => (
              <PromotionCard key={promo.id} promo={promo} />
            ))}
          </div>
        </div>
        
        {/* Featured Products */}
        <div className="mb-8">
          <div className="flex justify-between items-center mb-4">
            <h2 className="text-xl font-bold">Productos destacados</h2>
            <button className="text-blue-600 text-sm font-medium flex items-center">
              Ver más <ChevronRight size={16} />
            </button>
          </div>
          
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
            {PRODUCTOS_DESTACADOS.map(producto => (
              <ProductCard key={producto.id} producto={producto} />
            ))}
          </div>
        </div>
        
        {/* Recently viewed */}
        <div className="mb-8">
          <div className="flex justify-between items-center mb-4">
            <h2 className="text-xl font-bold">Basado en tu última visita</h2>
            <button className="text-blue-600 text-sm font-medium flex items-center">
              Ver historial <ChevronRight size={16} />
            </button>
          </div>
          
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4">
            {PRODUCTOS_DESTACADOS.slice(0, 4).map(producto => (
              <ProductCard key={producto.id} producto={producto} />
            ))}
          </div>
        </div>
        
        {/* Call to action */}
        <div className="bg-white rounded-lg shadow p-6 text-center mb-8">
          <h2 className="text-xl font-bold mb-2">¿Quieres vender tus productos?</h2>
          <p className="text-gray-600 mb-4">Únete a miles de vendedores y accede a millones de compradores potenciales</p>
          <button className="bg-blue-600 text-white font-medium py-2 px-6 rounded hover:bg-blue-700">
            Comenzar a vender
          </button>
        </div>
      </main>

      <Footer />
    </div>
  );
}

export default App;
