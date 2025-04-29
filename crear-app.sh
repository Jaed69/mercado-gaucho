#!/bin/bash

# Crear directorios
mkdir -p public src/components src/data

# Crear archivos de configuración
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

cat > postcss.config.js << 'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# Archivo index.css
cat > src/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
EOF

# Archivo index.js
cat > src/index.js << 'EOF'
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
EOF

# Archivo App.jsx
cat > src/App.jsx << 'EOF'
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
EOF

# Archivos de datos
cat > src/data/categorias.js << 'EOF'
const CATEGORIAS = [
  { id: 1, nombre: "Electrónica", descripcion: "Productos electrónicos y accesorios" },
  { id: 2, nombre: "Hogar", descripcion: "Artículos para el hogar" },
  { id: 3, nombre: "Moda", descripcion: "Ropa, calzado y accesorios" },
  { id: 4, nombre: "Juguetes", descripcion: "Juguetes y artículos para niños" },
  { id: 5, nombre: "Deportes", descripcion: "Artículos deportivos" }
];

export default CATEGORIAS;
EOF

cat > src/data/productos.js << 'EOF'
const PRODUCTOS_DESTACADOS = [
  {
    id: 1,
    titulo: "Smartphone XYZ última generación",
    precio: 599.99,
    estado: "nuevo",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "TechStore", tipo: "oficial" },
    envio_gratis: true,
    categoria_id: 1
  },
  {
    id: 2,
    titulo: "Laptop Ultradelgada 15.6 pulgadas",
    precio: 899.99,
    estado: "nuevo",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "ComputerWorld", tipo: "oficial" },
    envio_gratis: true,
    categoria_id: 1
  },
  {
    id: 3,
    titulo: "Zapatillas deportivas Running Pro",
    precio: 79.99,
    estado: "nuevo",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "SportShop", tipo: "personal" },
    envio_gratis: false,
    categoria_id: 3
  },
  {
    id: 4,
    titulo: "Set de sartenes antiadherentes",
    precio: 45.50,
    estado: "nuevo",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "HomeSupplies", tipo: "oficial" },
    envio_gratis: true,
    categoria_id: 2
  },
  {
    id: 5,
    titulo: "Consola de videojuegos (usado)",
    precio: 199.99,
    estado: "usado",
    imagen: "https://via.placeholder.com/300",
    vendedor: { nombre: "GamersUnited", tipo: "personal" },
    envio_gratis: false,
    categoria_id: 1
  }
];

export default PRODUCTOS_DESTACADOS;
EOF

cat > src/data/banners.js << 'EOF'
const BANNERS = [
  {
    id: 1,
    titulo: "Oferta especial",
    descripcion: "Descuentos de hasta 50% en electrónica",
    imagen: "https://via.placeholder.com/800x300",
    enlace: "#"
  },
  {
    id: 2,
    titulo: "Envío gratis",
    descripcion: "En compras mayores a $50",
    imagen: "https://via.placeholder.com/800x300",
    enlace: "#"
  }
];

export default BANNERS;
EOF

cat > src/data/promociones.js << 'EOF'
const PROMOCIONES = [
  {
    id: 1,
    titulo: "3x2 en juguetes",
    descripcion: "Lleva 3 y paga 2 en toda la categoría de juguetes",
    descuento: 33,
    banner: "https://via.placeholder.com/400x200"
  },
  {
    id: 2,
    titulo: "20% OFF en Hogar",
    descripcion: "Descuento directo en artículos para el hogar",
    descuento: 20,
    banner: "https://via.placeholder.com/400x200"
  }
];

export default PROMOCIONES;
EOF

# Archivos de componentes
cat > src/components/Header.jsx << 'EOF'
import React, { useState } from 'react';
import { Search, ShoppingCart, User, Heart, Bell, Menu, X, ChevronDown, MapPin } from 'lucide-react';

const Header = () => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [ubicacion] = useState("Ciudad de México");

  return (
    <header className="bg-yellow-400 shadow-md">
      <div className="container mx-auto p-4">
        <div className="flex flex-col md:flex-row items-center">
          {/* Logo */}
          <div className="flex items-center mb-4 md:mb-0">
            <h1 className="text-2xl font-bold text-blue-900">MercadoClone</h1>
            <button 
              className="md:hidden ml-auto" 
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}>
              {mobileMenuOpen ? <X size={24} /> : <Menu size={24} />}
            </button>
          </div>
          
          {/* Search Box */}
          <div className="flex-1 mx-4 w-full md:w-auto">
            <div className="relative w-full">
              <input 
                type="text" 
                placeholder="Buscar productos, marcas y más..." 
                className="w-full p-2 pl-10 rounded-md border border-gray-300"
              />
              <Search className="absolute top-2 left-2 text-gray-500" size={20} />
            </div>
          </div>
          
          {/* Location */}
          <div className="hidden md:flex items-center text-sm text-gray-700 mr-6">
            <MapPin size={16} className="mr-1" />
            <span>{ubicacion}</span>
          </div>
          
          {/* User Actions */}
          <div className={`${mobileMenuOpen ? 'flex' : 'hidden'} md:flex flex-col md:flex-row items-center space-y-4 md:space-y-0 md:space-x-6 w-full md:w-auto mt-4 md:mt-0`}>
            <div className="flex flex-col text-sm">
              <span className="text-xs text-gray-600">Hola, Ingresa</span>
              <div className="flex items-center">
                <span className="font-medium">Mi cuenta</span>
                <ChevronDown size={16} />
              </div>
            </div>
            
            <div className="flex items-center text-sm">
              <Bell size={20} className="mr-1" />
              <span>Notificaciones</span>
            </div>
            
            <div className="flex items-center text-sm">
              <Heart size={20} className="mr-1" />
              <span>Favoritos</span>
            </div>
            
            <div className="flex items-center text-sm">
              <ShoppingCart size={20} className="mr-1" />
              <span>Carrito</span>
            </div>
          </div>
        </div>
        
        {/* Categories Menu */}
        <nav className={`${mobileMenuOpen ? 'flex' : 'hidden'} md:flex flex-col md:flex-row mt-4 space-y-2 md:space-y-0 md:space-x-4 text-sm`}>
          <div className="flex items-center">
            <Menu size={16} className="mr-1" />
            <span className="font-medium">Categorías</span>
            <ChevronDown size={16} className="ml-1" />
          </div>
          <span>Ofertas</span>
          <span>Historial</span>
          <span>Tiendas oficiales</span>
          <span>Vender</span>
          <span>Ayuda</span>
        </nav>
      </div>
    </header>
  );
};

export default Header;
EOF

cat > src/components/Footer.jsx << 'EOF'
import React from 'react';

const Footer = () => {
  return (
    <footer className="bg-white py-8 border-t border-gray-200">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div>
            <h4 className="font-bold text-sm mb-4">Acerca de</h4>
            <ul className="text-sm text-gray-600 space-y-2">
              <li>Quiénes somos</li>
              <li>Términos y condiciones</li>
              <li>Privacidad</li>
              <li>Ayuda</li>
            </ul>
          </div>
          <div>
            <h4 className="font-bold text-sm mb-4">Comprar</h4>
            <ul className="text-sm text-gray-600 space-y-2">
              <li>Cómo comprar</li>
              <li>Métodos de pago</li>
              <li>Envíos</li>
              <li>Devoluciones</li>
            </ul>
          </div>
          <div>
            <h4 className="font-bold text-sm mb-4">Vender</h4>
            <ul className="text-sm text-gray-600 space-y-2">
              <li>Cómo vender</li>
              <li>Programa de vendedores</li>
              <li>Comisiones</li>
              <li>Centro de vendedores</li>
            </ul>
          </div>
          <div>
            <h4 className="font-bold text-sm mb-4">Contacto</h4>
            <ul className="text-sm text-gray-600 space-y-2">
              <li>Atención al cliente</li>
              <li>Defensa del consumidor</li>
              <li>Oficinas comerciales</li>
              <li>Trabaja con nosotros</li>
            </ul>
          </div>
        </div>
        
        <div className="mt-8 pt-6 border-t border-gray-200 text-center text-sm text-gray-500">
          <p>&copy; 2025 MercadoClone - Todos los derechos reservados</p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
EOF

cat > src/components/Banner.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { ArrowLeft, ArrowRight } from 'lucide-react';
import BANNERS from '../data/banners';

const Banner = () => {
  const [currentBanner, setCurrentBanner] = useState(0);
  
  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentBanner((prev) => (prev + 1) % BANNERS.length);
    }, 5000);
    return () => clearInterval(interval);
  }, []);

  return (
    <div className="relative mb-8 rounded-lg overflow-hidden">
      <div className="relative h-48 md:h-64">
        <img 
          src={BANNERS[currentBanner].imagen} 
          alt={BANNERS[currentBanner].titulo}
          className="w-full h-full object-cover"
        />
        <div className="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/50 to-transparent p-4">
          <h3 className="text-white text-xl font-bold">{BANNERS[currentBanner].titulo}</h3>
          <p className="text-white">{BANNERS[currentBanner].descripcion}</p>
        </div>
      </div>
      
      <div className="absolute top-1/2 left-2 transform -translate-y-1/2">
        <button 
          className="bg-white/80 rounded-full p-1 hover:bg-white"
          onClick={() => setCurrentBanner((prev) => (prev - 1 + BANNERS.length) % BANNERS.length)}
        >
          <ArrowLeft size={20} />
        </button>
      </div>
      
      <div className="absolute top-1/2 right-2 transform -translate-y-1/2">
        <button 
          className="bg-white/80 rounded-full p-1 hover:bg-white"
          onClick={() => setCurrentBanner((prev) => (prev + 1) % BANNERS.length)}
        >
          <ArrowRight size={20} />
        </button>
      </div>
      
      <div className="absolute bottom-2 left-0 right-0 flex justify-center space-x-2">
        {BANNERS.map((_, idx) => (
          <button
            key={idx}
            className={`h-2 w-2 rounded-full ${idx === currentBanner ? 'bg-white' : 'bg-white/50'}`}
            onClick={() => setCurrentBanner(idx)}
          />
        ))}
      </div>
    </div>
  );
};

export default Banner;
EOF

cat > src/components/CategoryList.jsx << 'EOF'
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
EOF

cat > src/components/ProductCard.jsx << 'EOF'
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
EOF

cat > src/components/PromotionCard.jsx << 'EOF'
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
EOF

# Archivo index.html
cat > public/index.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="E-commerce tipo Mercado Libre creado con React"
    />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>MercadoClone - Compra y vende online</title>
  </head>
  <body>
    <noscript>Necesitas habilitar JavaScript para ejecutar esta aplicación.</noscript>
    <div id="root"></div>
  </body>
</html>
EOF

# Hacer ejecutable el script
chmod +x "$0"

echo "Todos los archivos han sido creados exitosamente."