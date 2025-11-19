import React, { useState } from 'react';
import { useAuth } from '../../context/AuthContext';
import { useNavigate, useLocation } from 'react-router-dom';
import NotificationBell from '../NotificationBell';

interface DashboardLayoutProps {
  children: React.ReactNode;
}

const DashboardLayout: React.FC<DashboardLayoutProps> = ({ children }) => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const [userMenuOpen, setUserMenuOpen] = useState(false);

  const handleLogout = async () => {
    await logout();
    navigate('/');
  };

  const handleGoHome = () => {
    navigate('/');
  };

  // Función para traducir roles al español
  const translateRole = (role: string) => {
    const translations = {
      'admin': 'Administrador',
      'instructor': 'Instructor',
      'student': 'Estudiante'
    };
    return translations[role as keyof typeof translations] || role;
  };

  const navigation = [
    {
      name: 'Panel Principal',
      href: `/dashboard/${user?.role}`,
      icon: '🏠',
      current: location.pathname === `/dashboard/${user?.role}`,
      roles: ['admin', 'instructor', 'student'],
    },
    {
      name: 'Cursos',
      href: '/dashboard/courses',
      icon: '📚',
      current: location.pathname.startsWith('/dashboard/courses'),
      roles: ['admin', 'instructor', 'student'],
    },
    {
      name: 'Cronograma',
      href: '/dashboard/schedule',
      icon: '📅',
      current: location.pathname.startsWith('/dashboard/schedule'),
      roles: ['instructor', 'student'], // Removed admin
    },
    {
      name: 'Asistente IA',
      href: '/dashboard/ai-assistant',
      icon: '🤖',
      current: location.pathname.startsWith('/dashboard/ai-assistant'),
      roles: ['admin', 'instructor', 'student'],
    },
  ];

  // Add role-specific navigation items
  if (user?.role === 'admin') {
    navigation.splice(1, 0, {
      name: 'Usuarios',
      href: '/dashboard/users',
      icon: '👥',
      current: location.pathname.startsWith('/dashboard/users'),
      roles: ['admin'],
    });
    navigation.splice(2, 0, {
      name: 'Instituciones',
      href: '/dashboard/institutions',
      icon: '🏫',
      current: location.pathname.startsWith('/dashboard/institutions'),
      roles: ['admin'],
    });
  }

  if (user?.role === 'instructor') {
    navigation.push({
      name: 'Tareas',
      href: '/dashboard/assignments',
      icon: '📝',
      current: location.pathname.startsWith('/dashboard/assignments'),
      roles: ['instructor'],
    });
    navigation.push({
      name: 'Estudiantes',
      href: '/dashboard/students',
      icon: '🎓',
      current: location.pathname.startsWith('/dashboard/students'),
      roles: ['instructor'],
    });
  }

  if (user?.role === 'student') {
    navigation.push({
      name: 'Mis Tareas',
      href: '/dashboard/assignments',
      icon: '📝',
      current: location.pathname.startsWith('/dashboard/assignments'),
      roles: ['student'],
    });
    navigation.push({
      name: 'Calificaciones',
      href: '/dashboard/grades',
      icon: '📈',
      current: location.pathname.startsWith('/dashboard/grades'),
      roles: ['student'],
    });
    navigation.push({
      name: 'Grupos',
      href: '/dashboard/groups',
      icon: '👥',
      current: location.pathname.startsWith('/dashboard/groups'),
      roles: ['student'],
    });
  }

  const handleNavigation = (href: string) => {
    navigate(href);
    setSidebarOpen(false);
  };

  return (
    <div className="min-h-screen bg-primary-50">
      {/* Mobile overlay */}
      {sidebarOpen && (
        <div
          className="fixed inset-0 z-40 bg-black bg-opacity-30 backdrop-blur-sm lg:hidden"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      {/* Nuevo menú lateral flotante */}
      <aside
        className={`fixed top-4 left-4 bottom-4 z-50 w-80 bg-white rounded-3xl shadow-xl border border-gray-200 transform transition-all duration-500 ease-out lg:translate-x-0 flex flex-col ${
          sidebarOpen ? 'translate-x-0' : '-translate-x-full'
        }`}
      >
        {/* Cabecera moderna con glassmorphism */}
        <div className="relative p-6 bg-primary-50 rounded-t-3xl border-b border-gray-200">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-4">
              <div className="relative">
                <div className="w-14 h-14 bg-primary-600 rounded-2xl flex items-center justify-center shadow-lg overflow-hidden">
                  <img src="/images/logo-gato.png" alt="LICEA Logo" className="w-10 h-10 object-contain" />
                </div>
                <div className="absolute -top-1 -right-1 w-6 h-6 bg-accent-500 rounded-full flex items-center justify-center text-xs text-white font-bold shadow-md">
                  L
                </div>
              </div>
              <div>
                <h1 className="text-2xl font-bold text-primary-700">
                  LICEA
                </h1>
                <p className="text-sm text-gray-500 font-medium">Sistema Educativo Integral</p>
              </div>
            </div>
            
            <button
              onClick={() => setSidebarOpen(false)}
              className="lg:hidden w-10 h-10 rounded-xl bg-gray-100 hover:bg-gray-200 flex items-center justify-center transition-colors duration-200"
            >
              <svg className="w-5 h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
        </div>

        {/* Menú de navegación con diseño de tarjetas flotantes */}
        <nav className="p-4 space-y-3 flex-1 overflow-y-auto scrollbar-hide">
          <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider px-2 mb-4">
            Navegación Principal
          </div>
          
          {navigation.filter(item => !item.roles || item.roles.includes(user?.role || '')).map((item, index) => (
            <div key={item.name} className="relative">
              <button
                onClick={() => handleNavigation(item.href)}
                className={`group w-full text-left p-4 rounded-xl transition-all duration-300 flex items-center space-x-4 relative border ${
                  item.current
                    ? 'bg-primary-600 text-white shadow-md border-primary-600'
                    : 'bg-white text-gray-700 hover:bg-primary-50 hover:text-primary-800 hover:shadow-sm border-gray-200 hover:border-primary-200'
                }`}
              >
                {/* Icono con efecto glassmorphism */}
                <div className={`relative w-12 h-12 rounded-lg flex items-center justify-center text-xl transition-all duration-300 ${
                  item.current 
                    ? 'bg-white/20 text-white' 
                    : 'bg-primary-100 text-primary-700 group-hover:bg-primary-200'
                }`}>
                  {item.icon}
                </div>
                
                {/* Contenido del botón */}
                <div className="flex-1">
                  <div className={`font-bold text-base transition-all duration-300 ${
                    item.current ? 'text-white' : 'text-gray-800 group-hover:text-primary-800'
                  }`}>
                    {item.name}
                  </div>
                  <div className={`text-xs mt-1 transition-all duration-300 ${
                    item.current ? 'text-white/80' : 'text-gray-500 group-hover:text-primary-600'
                  }`}>
                    Acceso rápido
                  </div>
                </div>
                
                {/* Indicador de estado activo */}
                {item.current && (
                  <div className="w-2 h-2 bg-white rounded-full"></div>
                )}
              </button>
            </div>
          ))}
        </nav>

        {/* Sección inferior del sidebar (sin tarjeta de usuario) */}
        <div className="p-4 bg-white rounded-b-3xl border-t border-gray-200">
          {/* Espacio reservado por si quieres agregar algo más adelante */}
        </div>
      </aside>

      {/* Área de contenido principal moderna con diseño adaptativo */}
      <main className="lg:ml-96 transition-all duration-500 ease-out">
        {/* Header flotante moderno */}
        <div className="sticky top-4 z-30 mx-4 mb-6">
          <header className="bg-white rounded-2xl shadow-md border border-gray-200 p-4">
            <div className="flex items-center justify-between">
              <div className="flex items-center space-x-4">
                {/* Botón de menú móvil */}
                <button
                  onClick={() => setSidebarOpen(true)}
                  className="lg:hidden w-12 h-12 bg-primary-600 hover:bg-primary-700 text-white rounded-lg flex items-center justify-center shadow-md transition-all duration-200"
                >
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
                  </svg>
                </button>
                
                {/* Título de la sección */}
                <div>
                  <h1 className="text-2xl font-bold text-primary-700">
                    Panel de {translateRole(user?.role || '')}
                  </h1>
                  <p className="text-sm text-gray-500">Gestión y control educativo</p>
                </div>
              </div>

              {/* Sección de usuario en header */}
              <div className="flex items-center space-x-4">
                {/* Notificaciones */}
                <NotificationBell />

                {/* Perfil de usuario compacto + menú desplegable */}
                <div className="hidden sm:flex flex-col items-end space-y-2 relative">
                  <div
                    className="flex items-center space-x-3 bg-primary-50 px-4 py-2 rounded-lg border border-primary-200 cursor-pointer hover:bg-primary-100 transition-all duration-200 hover:shadow-sm"
                    onClick={() => setUserMenuOpen((open) => !open)}
                  >
                    <div className="w-10 h-10 bg-primary-600 rounded-lg flex items-center justify-center text-white font-bold shadow-sm">
                      {user?.name.charAt(0).toUpperCase()}
                    </div>
                    <div>
                      <p className="text-sm font-bold text-gray-800 truncate max-w-32">{user?.name}</p>
                      <p className="text-xs text-gray-500">{translateRole(user?.role || '')}</p>
                    </div>
                  </div>

                  {/* Botones Mi Perfil, Inicio, Salir debajo del usuario (desplegable en lista vertical, sobrepuesto, con animación) */}
                  <div
                    className={`absolute right-0 top-full mt-1 bg-white rounded-xl shadow-xl border border-gray-200 w-full flex flex-col z-20 transform origin-top transition-all duration-200 ease-out ${
                      userMenuOpen
                        ? 'opacity-100 scale-100 translate-y-0 pointer-events-auto'
                        : 'opacity-0 scale-95 -translate-y-1 pointer-events-none'
                    }`}
                  >
                    <button
                      onClick={() => navigate('/dashboard/profile')}
                      className="w-full px-4 py-2 text-left text-xs font-semibold flex items-center space-x-2 text-primary-700 hover:bg-primary-50 hover:text-primary-900 transition-all duration-150 active:scale-[0.97]"
                    >
                      <span className="text-base">⚙️</span>
                      <span>Mi Perfil</span>
                    </button>
                    <button
                      onClick={handleGoHome}
                      className="w-full px-4 py-2 text-left text-xs font-semibold flex items-center space-x-2 text-gray-700 hover:bg-primary-50 hover:text-primary-900 border-t border-gray-100 transition-all duration-150 active:scale-[0.97]"
                    >
                      <span className="text-base">🏠</span>
                      <span>Inicio</span>
                    </button>
                    <button
                      onClick={handleLogout}
                      className="w-full px-4 py-2 text-left text-xs font-semibold flex items-center space-x-2 text-red-600 hover:bg-red-50 border-t border-gray-100 transition-all duration-150 active:scale-[0.97]"
                    >
                      <span className="text-base">🚪</span>
                      <span>Salir</span>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </header>
        </div>

        {/* Contenido principal con cards flotantes */}
        <div className="px-4 pb-8">
          <div className="max-w-7xl mx-auto">
            {/* Contenedor de contenido con glassmorphism */}
            <div className="card-muted p-8 min-h-[calc(100vh-12rem)]">
              {children}
            </div>
          </div>
        </div>
      </main>
    </div>
  );
};

export default DashboardLayout;