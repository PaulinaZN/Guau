import React, { useEffect, useState } from 'react';

export default function Catalogo() {
  const [productos, setProductos] = useState([]);

  return (
    <div className="container mx-auto p-4 bg-yellow-50 min-h-screen">
      <h2 className="text-4xl font-extrabold mb-8 text-fuchsia-600 drop-shadow-md">
        Catálogo Guao!
      </h2>
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-6">
        {productos.map((prod) => (
          <div key={prod.id} className="border-2 border-orange-400 rounded-xl p-4 shadow-lg bg-white">
            <h3 className="font-bold text-xl text-purple-700">{prod.nombre}</h3>
            <p className="text-2xl font-black text-orange-500 mt-2">${prod.precio}</p>
            <button className="mt-4 w-full bg-fuchsia-500 hover:bg-fuchsia-600 text-white font-bold py-2 rounded-lg transition-colors">
              Ver detalles
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}