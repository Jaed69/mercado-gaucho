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
          <p>&copy; 2025 Mercado Gaucho - Todos los derechos reservados</p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
