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
