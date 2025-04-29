import React from 'react';
import { Package, Shield, User, Star, Truck } from 'lucide-react';
import CATEGORIAS from '../data/categorias';

const CategoryList = () => {
  const getCategoryIcon = (id) => {
    switch(id) {
      case 1: return <Package className="text-blue-500" />;
      case 2: return <Shield className="text-blue-500" />;
      case 3: return <User className="text-blue-500" />;
      case 4: return <Star className="text-blue-500" />;
      case 5: return <Truck className="text-blue-500" />;
      default: return <Package className="text-blue-500" />;
    }
  };

  return (
    <div className="grid grid-cols-2 md:grid-cols-5 gap-4 mb-8">
      {CATEGORIAS.map(categoria => (
        <div key={categoria.id} className="bg-white rounded-lg shadow p-4 flex flex-col items-center justify-center text-center">
          <div className="h-12 w-12 bg-blue-100 rounded-full flex items-center justify-center mb-2">
            {getCategoryIcon(categoria.id)}
          </div>
          <h3 className="font-medium text-sm">{categoria.nombre}</h3>
        </div>
      ))}
    </div>
  );
};

export default CategoryList;
