import React from 'react';
import { Truck } from 'lucide-react';

const ProductCard = ({ producto }) => {
  return (
    <div className="bg-white rounded-lg shadow overflow-hidden hover:shadow-md transition-shadow">
      <div className="h-48 overflow-hidden">
        <img src={producto.imagen} alt={producto.titulo} className="w-full h-full object-cover" />
      </div>
      <div className="p-3">
        <div className="flex justify-between">
          <span className="text-gray-500 text-xs">
            {producto.vendedor.tipo === 'oficial' ? (
              <span className="text-green-600 font-medium">Tienda oficial</span>
            ) : 'Vendedor particular'}
          </span>
          <span className="text-xs uppercase border border-gray-300 rounded px-1">
            {producto.estado}
          </span>
        </div>
        
        <h3 className="mt-1 text-sm font-medium line-clamp-2">{producto.titulo}</h3>
        
        <div className="mt-2">
          <span className="text-xl font-semibold">${producto.precio.toLocaleString('es-MX')}</span>
          {producto.precio > 100 && (
            <span className="block text-xs text-gray-500">
              en 12x ${(producto.precio / 12).toFixed(2)}
            </span>
          )}
        </div>
        
        {producto.envio_gratis && (
          <span className="text-green-600 text-sm font-medium mt-1 flex items-center">
            <Truck size={14} className="mr-1" /> Envío gratis
          </span>
        )}
      </div>
    </div>
  );
};

export default ProductCard;
