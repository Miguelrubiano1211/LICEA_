import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useToast } from '../../context/ToastContext';

interface DashboardStats {
  totalUsers: number;
  totalInstructors: number;
  totalStudents: number;
  totalCourses: number;
  totalInstitutions: number;
  activeUsers: number;
}

const AdminDashboard: React.FC = () => {
  const [stats, setStats] = useState<DashboardStats>({
    totalUsers: 0,
    totalInstructors: 0,
    totalStudents: 0,
    totalCourses: 0,
    totalInstitutions: 0,
    activeUsers: 0,
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const { showToast } = useToast();

  useEffect(() => {
    fetchStats();
  }, []);

  const fetchStats = async () => {
    try {
      const token = localStorage.getItem('licea_access_token');
      const baseURL = process.env.REACT_APP_API_URL || 'http://localhost:3001/api';

      // Fetch users
      const usersRes = await axios.get(`${baseURL}/users?limit=1000`, {
        headers: { Authorization: `Bearer ${token}` },
      });

      const users = usersRes.data.data || [];
      const totalUsers = users.length;
      const totalInstructors = users.filter((u: any) => u.role === 'instructor').length;
      const totalStudents = users.filter((u: any) => u.role === 'student').length;
      const activeUsers = users.filter((u: any) => u.is_active).length;

      // Fetch courses
      const coursesRes = await axios.get(`${baseURL}/courses`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      const totalCourses = coursesRes.data.data?.length || 0;

      // Fetch institutions
      const institutionsRes = await axios.get(`${baseURL}/institutions`);
      const totalInstitutions = institutionsRes.data.data?.length || 0;

      setStats({
        totalUsers,
        totalInstructors,
        totalStudents,
        totalCourses,
        totalInstitutions,
        activeUsers,
      });
    } catch (error: any) {
      console.error('Error fetching stats:', error);
      const errorMsg = error.response?.data?.message || error.message || 'Error al cargar datos';
      setError(errorMsg);
      showToast({
        type: 'error',
        title: 'Error al cargar estadísticas',
        message: `${errorMsg}. Por favor, verifica que el servidor esté corriendo y recarga la página.`,
      });
    } finally {
      setLoading(false);
    }
  };

  const statCards = [
    { title: 'Total Usuarios', value: stats.totalUsers, icon: '👥', color: 'bg-primary-500' },
    { title: 'Estudiantes', value: stats.totalStudents, icon: '🎓', color: 'bg-accent-500' },
    { title: 'Instructores', value: stats.totalInstructors, icon: '👨‍🏫', color: 'bg-primary-400' },
    { title: 'Cursos Activos', value: stats.totalCourses, icon: '📚', color: 'bg-primary-600' },
    { title: 'Instituciones', value: stats.totalInstitutions, icon: '🏫', color: 'bg-secondary-700' },
    { title: 'Usuarios Activos', value: stats.activeUsers, icon: '✓', color: 'bg-success-600' },
  ];

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="bg-danger-50 border-2 border-danger-300 rounded-xl p-6">
        <h2 className="text-xl font-bold text-danger-900 mb-2">⚠️ Error al Cargar Datos</h2>
        <p className="text-danger-700 mb-4">{error}</p>
        <button
          onClick={() => { setError(null); setLoading(true); fetchStats(); }}
          className="btn-danger px-6 py-2"
        >
          Reintentar
        </button>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-bold text-primary-700">📊 Panel de Administración</h1>
        <p className="text-gray-600 mt-2">Vista general del sistema y estadísticas</p>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        {statCards.map((stat, index) => (
          <div key={index} className="card-primary hover:shadow-xl transition-shadow">
            <div className="flex items-center">
              <div className={`p-4 rounded-xl ${stat.color} shadow-lg`}>
                <span className="text-3xl text-white">{stat.icon}</span>
              </div>
              <div className="ml-5">
                <p className="text-sm font-medium text-secondary-700">{stat.title}</p>
                <p className="text-3xl font-bold text-secondary-900 mt-1">{stat.value}</p>
              </div>
            </div>
          </div>
        ))}
      </div>

      <div className="card-muted">
        <div className="p-6 border-b border-gray-200">
          <h3 className="text-xl font-bold text-primary-700">📈 Resumen del Sistema</h3>
        </div>
        <div className="p-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="p-4 bg-primary-50 rounded-lg">
              <h4 className="font-semibold text-primary-900 mb-2">👥 Usuarios</h4>
              <p className="text-sm text-primary-800">
                {stats.activeUsers} de {stats.totalUsers} usuarios están activos ({((stats.activeUsers / stats.totalUsers) * 100).toFixed(1)}%)
              </p>
            </div>
            <div className="p-4 bg-success-50 rounded-lg">
              <h4 className="font-semibold text-success-900 mb-2">📚 Cursos</h4>
              <p className="text-sm text-success-800">
                {stats.totalCourses} cursos disponibles en la plataforma
              </p>
            </div>
            <div className="p-4 bg-accent-50 rounded-lg">
              <h4 className="font-semibold text-accent-900 mb-2">🏫 Instituciones</h4>
              <p className="text-sm text-accent-800">
                {stats.totalInstitutions} instituciones registradas
              </p>
            </div>
            <div className="p-4 bg-warning-50 rounded-lg">
              <h4 className="font-semibold text-warning-900 mb-2">👨‍🏫 Distribución</h4>
              <p className="text-sm text-warning-800">
                {stats.totalInstructors} instructores y {stats.totalStudents} estudiantes
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminDashboard;
