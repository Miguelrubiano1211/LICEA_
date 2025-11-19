import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

const Home: React.FC = () => {
  const { isAuthenticated, user } = useAuth();
  const [showScrollTop, setShowScrollTop] = useState(false);

  // Detectar scroll para mostrar/ocultar botón
  useEffect(() => {
    const handleScroll = () => {
      setShowScrollTop(window.scrollY > 400);
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  // Función para volver arriba
  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  };

  const features = [
    {
      title: 'Gestión de Cursos',
      description: 'Crea y administra cursos fácilmente. Sube materiales, crea tareas y rastrea el progreso estudiantil.',
      icon: '📚',
      color: 'bg-primary-500'
    },
    {
      title: 'Analíticas con IA',
      description: 'Obtén insights del rendimiento estudiantil con analíticas impulsadas por IA y detección de riesgos.',
      icon: '🤖',
      color: 'bg-accent-500'
    },
    {
      title: 'Asistente Inteligente',
      description: 'Recibe ayuda instantánea con nuestro chatbot de IA para estudiantes e instructores.',
      icon: '💬',
      color: 'bg-primary-600'
    },
    {
      title: 'Programación Inteligente',
      description: 'Optimiza tu tiempo de estudio con programación inteligente y gestión de plazos.',
      icon: '📅',
      color: 'bg-accent-600'
    },
    {
      title: 'Colaboración en Tiempo Real',
      description: 'Colabora con compañeros e instructores en tiempo real con herramientas modernas.',
      icon: '🤝',
      color: 'bg-primary-400'
    },
    {
      title: 'Reportes Integrales',
      description: 'Genera reportes detallados sobre rendimiento, asistencia y compromiso académico.',
      icon: '📊',
      color: 'bg-accent-400'
    },
  ];

  return (
    <div className="min-h-screen bg-primary-50 relative overflow-x-hidden">
      {/* Elementos decorativos de fondo */}
      <div className="absolute inset-0 overflow-hidden">
        <div className="absolute top-20 left-10 w-72 h-72 bg-primary-100/30 rounded-full blur-3xl"></div>
        <div className="absolute top-96 right-10 w-96 h-96 bg-accent-100/20 rounded-full blur-3xl"></div>
        <div className="absolute bottom-20 left-1/3 w-64 h-64 bg-primary-50/40 rounded-full blur-3xl"></div>
      </div>

      {/* Header flotante futurista */}
      <header className="relative z-50 bg-white/95 backdrop-blur-xl border-b border-gray-200 shadow-lg">
        <div className="max-w-7xl mx-auto px-6 lg:px-8">
          <div className="flex justify-between items-center py-6">
            {/* Logo modernizado */}
            <div className="flex items-center space-x-4">
              <div className="relative">
                <div className="w-14 h-14 bg-primary-500 rounded-2xl flex items-center justify-center shadow-lg overflow-hidden">
                  <img src="/images/logo-gato.png" alt="LICEA Logo" className="w-10 h-10 object-contain" />
                </div>
                <div className="absolute -top-2 -right-2 w-6 h-6 bg-accent-500 rounded-full flex items-center justify-center text-xs text-white font-bold">
                  L
                </div>
              </div>
              <div>
                <div className="text-3xl font-black text-primary-700">
                  LICEA
                </div>
                <div className="text-sm font-semibold text-gray-600">Sistema Educativo del Futuro</div>
              </div>
            </div>

            {/* Navegación modernizada */}
            <div className="flex items-center space-x-4">
              {isAuthenticated ? (
                <div className="flex items-center space-x-4">
                  <div className="bg-primary-50 px-6 py-3 rounded-lg border border-primary-200">
                    <span className="text-primary-800 font-bold">Bienvenido/a, {user?.name}</span>
                  </div>
                  <Link to="/dashboard" className="bg-primary-600 hover:bg-primary-700 text-white px-8 py-3 rounded-lg font-bold transition-all duration-200 shadow-md hover:shadow-lg">
                    Ir al Panel
                  </Link>
                </div>
              ) : (
                <div className="flex items-center space-x-3">
                  <Link to="/login" className="bg-white text-gray-800 hover:bg-gray-50 px-6 py-3 rounded-lg font-bold transition-all duration-200 border border-gray-300">
                    Iniciar Sesión
                  </Link>
                  <Link to="/register" className="bg-primary-600 hover:bg-primary-700 text-white px-8 py-3 rounded-lg font-bold transition-all duration-200 shadow-md hover:shadow-lg">
                    Comenzar Ahora
                  </Link>
                </div>
              )}
            </div>
          </div>
        </div>
      </header>

      {/* Sección Hero futurista */}
      <section className="relative py-32 px-6 lg:px-8">
        <div className="max-w-6xl mx-auto text-center relative z-10">
          {/* Badge de novedad */}
          <div className="inline-flex items-center space-x-2 bg-primary-50 border border-primary-200 rounded-full px-6 py-2 mb-8">
            <span className="w-2 h-2 bg-primary-500 rounded-full"></span>
            <span className="text-sm font-bold text-primary-800">Nueva Era Educativa</span>
            <span className="text-xs bg-primary-600 text-white px-2 py-1 rounded-full font-bold">2025</span>
          </div>

          {/* Título principal impactante */}
          <h1 className="text-6xl lg:text-8xl font-black mb-8 leading-tight">
            <span className="block text-primary-700">
              Bienvenido al
            </span>
            <span className="block text-primary-600">
              Futuro Educativo
            </span>
          </h1>

          {/* Subtítulo moderno */}
          <div className="max-w-4xl mx-auto mb-12">
            <p className="text-xl lg:text-2xl text-gray-700 font-medium leading-relaxed">
              <span className="text-primary-700 font-bold">LICEA</span> 
              revoluciona la educación combinando tecnología avanzada con inteligencia artificial 
              para crear experiencias de aprendizaje extraordinarias para 
              <span className="text-primary-600 font-bold">estudiantes, instructores y administradores</span>.
            </p>
          </div>

          {/* Estadísticas impresionantes */}
          <div className="flex flex-wrap justify-center items-center space-x-8 mb-12">
            <div className="text-center">
              <div className="text-3xl font-black text-primary-600">10K+</div>
              <div className="text-sm text-gray-600 font-medium">Estudiantes Activos</div>
            </div>
            <div className="text-center">
              <div className="text-3xl font-black text-primary-600">500+</div>
              <div className="text-sm text-gray-600 font-medium">Cursos Disponibles</div>
            </div>
            <div className="text-center">
              <div className="text-3xl font-black text-primary-600">98%</div>
              <div className="text-sm text-gray-600 font-medium">Satisfacción</div>
            </div>
          </div>

          {/* Botones de acción futuristas */}
          {isAuthenticated && (
            <div className="flex justify-center">
              <Link 
                to="/dashboard" 
                className="group bg-primary-600 hover:bg-primary-700 text-white px-12 py-4 rounded-lg text-lg font-bold transition-all duration-200 shadow-lg hover:shadow-xl flex items-center space-x-3"
              >
                <span>Ir a mi Panel</span>
                <svg className="w-6 h-6 group-hover:translate-x-1 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" />
                </svg>
              </Link>
            </div>
          )}
        </div>
      </section>

      {/* Sección de características futurista */}
      <section className="relative py-32 px-6 lg:px-8">
        <div className="max-w-7xl mx-auto">
          {/* Título de sección impactante */}
          <div className="text-center mb-20">
            <div className="inline-flex items-center space-x-2 bg-primary-50 border border-primary-200 rounded-full px-6 py-2 mb-6">
              <span className="w-2 h-2 bg-primary-500 rounded-full"></span>
              <span className="text-sm font-bold text-primary-800">Características Innovadoras</span>
            </div>
            <h2 className="text-5xl lg:text-6xl font-black mb-6 text-primary-700">
              Tecnología de Vanguardia
            </h2>
            <p className="text-xl text-gray-600 max-w-3xl mx-auto font-medium">
              Descubre las herramientas más avanzadas para el aprendizaje del siglo XXI. 
              <span className="text-primary-600 font-bold">LICEA</span> integra lo mejor de la educación tradicional con innovación disruptiva.
            </p>
          </div>

          {/* Grid de características con diseño hexagonal */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {features.map((feature, index) => (
              <div 
                key={index} 
                className="group relative bg-white rounded-2xl p-8 border border-gray-200 shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
              >
                {/* Área del icono */}
                <div className="relative z-10">
                  <div className={`w-20 h-20 mx-auto mb-6 rounded-xl ${feature.color} flex items-center justify-center text-3xl text-white shadow-md group-hover:shadow-lg transition-all duration-300`}>
                    {feature.icon}
                  </div>
                  
                  {/* Contenido */}
                  <div className="text-center">
                    <h3 className="text-2xl font-bold text-gray-900 mb-4 group-hover:text-primary-700 transition-colors duration-300">
                      {feature.title}
                    </h3>
                  <p className="text-gray-600 leading-relaxed font-medium">
                      {feature.description}
                    </p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Footer futurista */}
      <footer className="relative bg-secondary-900 text-white py-20">
        <div className="max-w-7xl mx-auto px-6 lg:px-8 text-center relative z-10">
          {/* Logo y marca */}
          <div className="mb-12">
            <div className="inline-flex items-center space-x-4 mb-6">
              <div className="w-16 h-16 bg-primary-600 rounded-2xl flex items-center justify-center text-3xl shadow-lg overflow-hidden">
                <img src="/images/logo-gato.png" alt="LICEA Logo" className="w-12 h-12 object-contain" />
              </div>
              <div className="text-4xl font-black text-white">
                LICEA
              </div>
            </div>
            <p className="text-xl text-secondary-200 font-medium max-w-2xl mx-auto">
              Transformando la educación a través de la innovación y la tecnología avanzada
            </p>
          </div>

          {/* Estadísticas finales */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 mb-12">
            <div className="text-center">
              <div className="text-3xl font-black text-primary-400 mb-2">Aprendizaje</div>
              <div className="text-sm text-secondary-300">Continuo e Innovador</div>
            </div>
            <div className="text-center">
              <div className="text-3xl font-black text-primary-400 mb-2">Innovación</div>
              <div className="text-sm text-secondary-300">Tecnológica</div>
            </div>
            <div className="text-center">
              <div className="text-3xl font-black text-primary-400 mb-2">Colaboración</div>
              <div className="text-sm text-secondary-300">Global</div>
            </div>
            <div className="text-center">
              <div className="text-3xl font-black text-primary-400 mb-2">Excelencia</div>
              <div className="text-sm text-secondary-300">Educativa</div>
            </div>
          </div>


          {/* Copyright */}
          <div className="border-t border-secondary-700 pt-8">
            <p className="text-secondary-300 text-sm">
              © {new Date().getFullYear()} LICEA - Sistema Educativo del Futuro. Todos los derechos reservados.
            </p>
          </div>
        </div>
        
        {/* Elementos decorativos */}
        <div className="absolute top-10 left-10 w-32 h-32 bg-primary-500/5 rounded-full blur-2xl"></div>
        <div className="absolute bottom-10 right-10 w-40 h-40 bg-primary-400/5 rounded-full blur-2xl"></div>
      </footer>

      {/* Botón flotante para volver arriba */}
      {showScrollTop && (
        <button
          onClick={scrollToTop}
          className="fixed bottom-8 right-8 z-50 w-14 h-14 bg-primary-600 hover:bg-primary-700 text-white rounded-full shadow-lg hover:shadow-xl transition-all duration-200 flex items-center justify-center group"
          aria-label="Volver arriba"
        >
          <svg 
            className="w-6 h-6 transform group-hover:-translate-y-1 transition-transform duration-300" 
            fill="none" 
            stroke="currentColor" 
            viewBox="0 0 24 24"
          >
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={3} d="M5 10l7-7m0 0l7 7m-7-7v18" />
          </svg>
        </button>
      )}
    </div>
  );
};

export default Home;
