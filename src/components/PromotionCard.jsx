import React from 'react';
import { ChevronRight } from 'lucide-react';

const PromotionCard = ({ promo }) => {
  return (
    <div className="bg-white rounded-lg shadow overflow-hidden">
      <img src={promo.banner} alt={promo.titulo} className="w-full h-32 object-cover" />
      <div className="p-4">
        <div className="inline-block bg-red-600 text-white px-2 py-1 rounded-md text-sm font-bold mb-2">
          {promo.descuento}% OFF
        </div>
        <h3 className="font-bold">{promo.titulo}</h3>
        <p className="text-sm text-gray-600">{promo.descripcion}</p>
        <button className="mt-2 text-blue-600 text-sm font-medium flex items-center">
          Ver más <ChevronRight size={16} />
        </button>
      </div>
    </div>
  );
};

export default PromotionCard;
