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
