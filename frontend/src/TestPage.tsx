import React from 'react';

const TestPage: React.FC = () => {
  return (
    <div className="min-h-screen bg-primary-600 p-8 flex flex-col items-start justify-center">
      <h1 className="text-white text-4xl font-bold mb-4">
        Tailwind CSS Test
      </h1>
      <p className="text-white text-lg">
        Si ves este texto en blanco con fondo verde (color primario), Tailwind CSS y tu paleta personalizada están funcionando.
      </p>
      <div className="mt-4 bg-accent-500 p-4 rounded-lg">
        <p className="text-white">
          Esta caja morada usa el color de acento definido en Tailwind.
        </p>
      </div>
      <button className="btn-primary mt-4">
        Botón con clase personalizada
      </button>
    </div>
  );
};

export default TestPage;
