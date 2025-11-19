import React, { useState, useEffect } from 'react';
import { useAuth } from '../context/AuthContext';
import axios from 'axios';

const apiBaseUrl = process.env.REACT_APP_API_URL || 'http://localhost:3001/api';

interface Task {
  id: number;
  title: string;
  description: string;
  instructions?: string;
  course_id: number;
  course_name: string;
  course_code: string;
  instructor_name?: string;
  due_date: string;
  max_grade: number;
  submission_type: string;
  is_published: boolean;
  attachment_url?: string;
  my_submission?: Submission;
  statistics?: {
    total_students: number;
    total_submissions: number;
    submitted_count: number;
    graded_count: number;
    average_grade: number;
  };
}

interface Submission {
  id: number;
  student_id: number;
  student_name?: string;
  task_id: number;
  submission_text?: string;
  attachment_url?: string; // compatibilidad
  file_path?: string;
  file_url?: string;
  grade?: number;
  feedback?: string;
  status: string;
  submitted_at: string;
}

const Tasks: React.FC = () => {
  const { user } = useAuth();
  const [tasks, setTasks] = useState<Task[]>([]);
  const [selectedTask, setSelectedTask] = useState<Task | null>(null);
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [showSubmitModal, setShowSubmitModal] = useState(false);
  const [showGradeModal, setShowGradeModal] = useState(false);
  const [selectedSubmission, setSelectedSubmission] = useState<Submission | null>(null);
  const [myCourses, setMyCourses] = useState<any[]>([]);
  
  const [taskForm, setTaskForm] = useState({
    title: '',
    description: '',
    instructions: '',
    course_id: '',
    start_date: '',
    due_date: '',
    max_grade: 10,
    submission_type: 'both',
    is_published: true
  });

  const [submissionForm, setSubmissionForm] = useState({
    submission_text: '',
    file: null as File | null
  });

  const [gradeForm, setGradeForm] = useState({
    grade: 0,
    feedback: ''
  });

  // Valor mínimo para fechas (no permitir fechas vencidas)
  const minDateTime = new Date().toISOString().slice(0, 16);

  useEffect(() => {
    fetchTasks();
    if (user?.role === 'instructor') {
      fetchMyCourses();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const fetchTasks = async () => {
    try {
      setLoading(true);
      const token = localStorage.getItem('licea_access_token');
      const response = await axios.get(`${process.env.REACT_APP_API_URL || 'http://localhost:3001/api'}/tasks`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      setTasks(response.data.data || []);
    } catch (error) {
      setError('Error al cargar las tareas');
      console.error('Error fetching tasks:', error);
    } finally {
      setLoading(false);
    }
  };

  const fetchMyCourses = async () => {
    try {
      const token = localStorage.getItem('licea_access_token');
      const response = await axios.get(`${process.env.REACT_APP_API_URL || 'http://localhost:3001/api'}/courses/my/courses`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      setMyCourses(response.data.data || []);
    } catch (error) {
      console.error('Error fetching courses:', error);
    }
  };

  const fetchTaskDetails = async (taskId: number) => {
    try {
      const token = localStorage.getItem('licea_access_token');
      const baseURL = process.env.REACT_APP_API_URL || 'http://localhost:3001/api';
      const response = await axios.get(`${baseURL}/tasks/${taskId}`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      setSelectedTask(response.data.data);

      // Si es instructor, obtener todas las entregas
      if (user?.role === 'instructor' || user?.role === 'admin') {
        const submissionsRes = await axios.get(`${baseURL}/submissions?task_id=${taskId}`, {
          headers: { Authorization: `Bearer ${token}` }
        });
        setSubmissions(submissionsRes.data.data || []);
      }
    } catch (error) {
      console.error('Error fetching task details:', error);
    }
  };

  const handleCreateTask = async (e: React.FormEvent) => {
    e.preventDefault();

    // Validar fechas: inicio y fin no vencidas y fin >= inicio
    const now = new Date();

    if (taskForm.start_date) {
      const start = new Date(taskForm.start_date);
      if (start <= now) {
        alert('La fecha y hora de inicio debe ser mayor a la fecha y hora actual.');
        return;
      }
    }

    if (taskForm.due_date) {
      const end = new Date(taskForm.due_date);
      if (end <= now) {
        alert('La fecha de entrega debe ser mayor a la fecha y hora actual.');
        return;
      }

      if (taskForm.start_date) {
        const start = new Date(taskForm.start_date);
        if (end <= start) {
          alert('La fecha de entrega debe ser mayor a la fecha de inicio de la tarea.');
          return;
        }
      }
    }

    try {
      const token = localStorage.getItem('licea_access_token');
      const baseURL = process.env.REACT_APP_API_URL || 'http://localhost:3001/api';
      console.log('Creating task with data:', taskForm);
      const response = await axios.post(`${baseURL}/tasks`, taskForm, {
        headers: { Authorization: `Bearer ${token}` }
      });
      console.log('Task created successfully:', response.data);
      
      alert('¡Tarea creada exitosamente!');
      setShowCreateModal(false);
      setTaskForm({
        title: '',
        description: '',
        instructions: '',
        course_id: '',
        start_date: '',
        due_date: '',
        max_grade: 10,
        submission_type: 'both',
        is_published: true
      });
      fetchTasks();
    } catch (error: any) {
      console.error('Error creating task:', error.response?.data || error);
      const errorMsg = error.response?.data?.errors 
        ? error.response.data.errors.map((e: any) => e.msg).join(', ')
        : error.response?.data?.message || 'Error al crear la tarea';
      alert(errorMsg);
    }
  };

  const handleSubmitTask = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedTask) return;

    try {
      const token = localStorage.getItem('licea_access_token');
      const baseURL = process.env.REACT_APP_API_URL || 'http://localhost:3001/api';
      const formData = new FormData();
      formData.append('task_id', selectedTask.id.toString());
      if (submissionForm.submission_text) {
        formData.append('submission_text', submissionForm.submission_text);
      }
      if (submissionForm.file) {
        formData.append('file', submissionForm.file);
      }

      await axios.post(`${baseURL}/submissions`, formData, {
        headers: { 
          Authorization: `Bearer ${token}`,
          'Content-Type': 'multipart/form-data'
        }
      });
      
      alert('¡Tarea entregada exitosamente!');
      setShowSubmitModal(false);
      setSubmissionForm({ submission_text: '', file: null });
      setSelectedTask(null);
      
      // Refrescar tareas inmediatamente
      await fetchTasks();
      
      // Recargar página después de 1 segundo para actualizar el dashboard también
      setTimeout(() => {
        window.location.reload();
      }, 1000);
    } catch (error: any) {
      alert(error.response?.data?.message || 'Error al entregar la tarea');
    }
  };

  const handleGradeSubmission = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedSubmission) return;

    try {
      const token = localStorage.getItem('licea_access_token');
      const baseURL = process.env.REACT_APP_API_URL || 'http://localhost:3001/api';
      await axios.put(`${baseURL}/submissions/${selectedSubmission.id}/grade`, gradeForm, {
        headers: { Authorization: `Bearer ${token}` }
      });
      
      alert('¡Calificación guardada!');
      setShowGradeModal(false);
      setGradeForm({ grade: 0, feedback: '' });
      setSelectedSubmission(null);
      if (selectedTask) {
        fetchTaskDetails(selectedTask.id);
      }
    } catch (error: any) {
      alert(error.response?.data?.message || 'Error al calificar');
    }
  };

  const getSubmissionFileUrl = (submission: Submission): string | null => {
    if (submission.file_url) return submission.file_url;
    if (submission.attachment_url) return submission.attachment_url;
    if (submission.file_path) {
      return `${apiBaseUrl}/submissions/${submission.id}/download`;
    }
    return null;
  };

  const getStatusBadge = (task: Task) => {
    if (user?.role === 'student') {
      if (task.my_submission) {
        if (task.my_submission.status === 'graded') {
          return <span className="text-xs px-2 py-1 bg-green-100 text-green-800 rounded-full">✓ Calificado</span>;
        }
        return <span className="text-xs px-2 py-1 bg-blue-100 text-blue-800 rounded-full">📤 Entregado</span>;
      }
      const isOverdue = new Date(task.due_date) < new Date();
      if (isOverdue) {
        return <span className="text-xs px-2 py-1 bg-red-100 text-red-800 rounded-full">⏰ Vencido</span>;
      }
      return <span className="text-xs px-2 py-1 bg-yellow-100 text-yellow-800 rounded-full">⏳ Pendiente</span>;
    }
    return <span className="text-xs px-2 py-1 bg-gray-100 text-gray-800 rounded-full">
      {task.statistics?.submitted_count || 0}/{task.statistics?.total_students || 0} entregas
    </span>;
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Tareas</h1>
          <p className="text-gray-600">
            {user?.role === 'student' ? 'Mis tareas y entregas' : 
             user?.role === 'instructor' ? 'Gestiona tareas de tus cursos' :
             'Todas las tareas del sistema'}
          </p>
        </div>
        {user?.role === 'instructor' && (
          <button
            onClick={() => setShowCreateModal(true)}
            className="btn-primary flex items-center space-x-2"
          >
            <span>➕</span>
            <span>Nueva Tarea</span>
          </button>
        )}
      </div>

      {error && (
        <div className="bg-red-50 border border-red-200 rounded-md p-4">
          <p className="text-red-800">{error}</p>
        </div>
      )}

      {/* Lista de tareas */}
      <div className="space-y-4">
        {tasks.map((task) => (
          <div key={task.id} className="card hover:shadow-lg transition-shadow">
            <div className="flex justify-between items-start">
              <div className="flex-1">
                <div className="flex items-center gap-3 mb-2">
                  <h3 className="text-lg font-semibold text-gray-900">{task.title}</h3>
                  {getStatusBadge(task)}
                </div>
                <p className="text-sm text-gray-600 mb-2">{task.description}</p>
                <div className="flex items-center gap-4 text-sm text-gray-500">
                  <span>📚 {task.course_code} - {task.course_name}</span>
                  {task.instructor_name && <span>👨‍🏫 {task.instructor_name}</span>}
                  <span>📅 Vence: {new Date(task.due_date).toLocaleDateString()}</span>
                  <span>🎯 Puntos: {task.max_grade}</span>
                </div>
                {/* Mostrar información de entrega del estudiante */}
                {user?.role === 'student' && task.my_submission && (
                  <div className="mt-3 space-y-2">
                    {task.my_submission.grade !== undefined && task.my_submission.grade !== null ? (
                      <div className="p-3 bg-green-50 border-l-4 border-green-400 rounded">
                        <div className="flex items-center justify-between mb-1">
                          <span className="text-green-800 font-bold text-lg">
                            ✅ Calificación: {task.my_submission.grade}/{task.max_grade}
                          </span>
                          <span className="text-green-600 text-sm">
                            {((task.my_submission.grade / task.max_grade) * 100).toFixed(0)}%
                          </span>
                        </div>
                        {task.my_submission.feedback && (
                          <p className="text-sm text-green-700 mt-2">
                            💬 Retroalimentación: {task.my_submission.feedback}
                          </p>
                        )}
                      </div>
                    ) : (
                      <div className="p-3 bg-blue-50 border-l-4 border-blue-400 rounded">
                        <span className="text-blue-800 font-medium">
                          ✅ Tarea entregada el {new Date(task.my_submission.submitted_at).toLocaleDateString()}
                        </span>
                        <p className="text-sm text-blue-600 mt-1">
                          En espera de calificación
                        </p>
                      </div>
                    )}
                    {getSubmissionFileUrl(task.my_submission) && (
                      <div>
                        <a
                          href={getSubmissionFileUrl(task.my_submission)!}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-sm text-primary-600 hover:underline"
                        >
                          📎 Ver archivo entregado
                        </a>
                      </div>
                    )}
                  </div>
                )}
              </div>
              <div className="flex gap-2">
                <button
                  onClick={() => fetchTaskDetails(task.id)}
                  className="btn-secondary text-sm"
                >
                  Ver Detalles
                </button>
                {user?.role === 'student' && !task.my_submission && (
                  <button
                    onClick={() => {
                      setSelectedTask(task);
                      setShowSubmitModal(true);
                    }}
                    className="btn-primary text-sm"
                  >
                    Entregar tarea
                  </button>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>

      {tasks.length === 0 && !loading && (
        <div className="text-center py-12">
          <div className="text-gray-400 mb-4">
            <svg className="mx-auto h-16 w-16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
          </div>
          <p className="text-gray-500 text-lg">No hay tareas disponibles</p>
        </div>
      )}

      {/* Modal crear tarea */}
      {showCreateModal && (
        <div className="fixed inset-0 bg-black bg-opacity-40 backdrop-blur-sm flex items-center justify-center p-4 z-[9999]">
          <div className="bg-gradient-to-br from-primary-50 to-white rounded-3xl shadow-2xl max-w-xl w-full max-h-[90vh] overflow-y-auto border border-primary-100">
            <div className="p-6 space-y-4">
              <div className="flex justify-between items-center mb-4 border-b border-primary-100 pb-3">
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-2xl bg-primary-600 flex items-center justify-center text-xl shadow-md text-white">
                    📝
                  </div>
                  <h2 className="text-2xl font-extrabold text-primary-800 tracking-tight">
                    Crear Tarea
                  </h2>
                </div>
                <button
                  onClick={() => setShowCreateModal(false)}
                  className="text-gray-400 hover:text-gray-600 rounded-full w-8 h-8 flex items-center justify-center hover:bg-gray-100 transition"
                >
                  ✕
                </button>
              </div>
              
              <form onSubmit={handleCreateTask} className="space-y-5">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Curso *
                  </label>
                  <select
                    required
                    value={taskForm.course_id}
                    onChange={(e) => setTaskForm({...taskForm, course_id: e.target.value})}
                    className="w-full px-3 py-2 border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary-200 focus:border-primary-400"
                  >
                    <option value="">Selecciona un curso</option>
                    {myCourses.map((course) => (
                      <option key={course.id} value={course.id}>
                        {course.code} - {course.name}
                      </option>
                    ))}
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Título *
                  </label>
                  <input
                    type="text"
                    required
                    value={taskForm.title}
                    onChange={(e) => setTaskForm({...taskForm, title: e.target.value})}
                    placeholder="Ej: Tarea 1 - Variables en Python"
                    className="w-full px-3 py-2 border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary-200 focus:border-primary-400"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Descripción *
                  </label>
                  <textarea
                    required
                    value={taskForm.description}
                    onChange={(e) => setTaskForm({...taskForm, description: e.target.value})}
                    rows={3}
                    placeholder="Descripción breve de la tarea"
                    className="w-full px-3 py-2 border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary-200 focus:border-primary-400"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Instrucciones
                  </label>
                  <textarea
                    value={taskForm.instructions}
                    onChange={(e) => setTaskForm({...taskForm, instructions: e.target.value})}
                    rows={4}
                    placeholder="Instrucciones detalladas para los estudiantes"
                    className="w-full px-3 py-2 border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary-200 focus:border-primary-400"
                  />
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Fecha de Inicio *
                    </label>
                    <input
                      type="datetime-local"
                      required
                      min={minDateTime}
                      value={taskForm.start_date}
                      onChange={(e) => setTaskForm({ ...taskForm, start_date: e.target.value })}
                      className="w-full px-3 py-2 border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary-200 focus:border-primary-400"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Fecha de Entrega *
                    </label>
                    <input
                      type="datetime-local"
                      required
                      min={minDateTime}
                      value={taskForm.due_date}
                      onChange={(e) => setTaskForm({ ...taskForm, due_date: e.target.value })}
                      className="w-full px-3 py-2 border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary-200 focus:border-primary-400"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Puntos Máximos
                    </label>
                    <input
                      type="number"
                      min="1"
                      max="100"
                      value={taskForm.max_grade}
                      onChange={(e) => setTaskForm({...taskForm, max_grade: parseInt(e.target.value)})}
                      className="w-full px-3 py-2 border rounded-md"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Tipo de Entrega
                  </label>
                  <select
                    value={taskForm.submission_type}
                    onChange={(e) => setTaskForm({...taskForm, submission_type: e.target.value})}
                    className="w-full px-3 py-2 border rounded-md"
                  >
                    <option value="both">Texto y Archivo</option>
                    <option value="file">Solo Archivo</option>
                    <option value="text">Solo Texto</option>
                  </select>
                </div>

                <div className="flex justify-end space-x-3 pt-4 border-t border-gray-100 mt-2">
                  <button
                    type="button"
                    onClick={() => setShowCreateModal(false)}
                    className="btn-secondary"
                  >
                    Cancelar
                  </button>
                  <button type="submit" className="btn-primary">
                    Crear Tarea
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      )}

      {/* Modal entregar tarea */}
      {showSubmitModal && selectedTask && (
        <div className="fixed inset-0 bg-black bg-opacity-40 backdrop-blur-sm flex items-center justify-center p-4 z-[9999]">
          <div className="bg-white rounded-2xl shadow-2xl max-w-xl w-full border border-gray-200">
            <div className="p-6">
              <div className="flex justify-between items-center mb-4">
                <h2 className="text-2xl font-bold text-gray-900">Entregar Tarea</h2>
                <button
                  onClick={() => setShowSubmitModal(false)}
                  className="text-gray-400 hover:text-gray-600"
                >
                  ✕
                </button>
              </div>
              
              <div className="mb-4 p-3 bg-gray-50 rounded">
                <h3 className="font-semibold text-gray-900">{selectedTask.title}</h3>
                <p className="text-sm text-gray-600">{selectedTask.course_name}</p>
              </div>

              <form onSubmit={handleSubmitTask} className="space-y-4">
                {(selectedTask.submission_type === 'both' || selectedTask.submission_type === 'text') && (
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Respuesta en Texto
                    </label>
                    <textarea
                      value={submissionForm.submission_text}
                      onChange={(e) => setSubmissionForm({...submissionForm, submission_text: e.target.value})}
                      rows={5}
                      placeholder="Escribe tu respuesta aquí..."
                      className="w-full px-3 py-2 border rounded-md"
                    />
                  </div>
                )}

                {(selectedTask.submission_type === 'both' || selectedTask.submission_type === 'file') && (
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Archivo Adjunto
                    </label>
                    <input
                      type="file"
                      onChange={(e) => setSubmissionForm({
                        ...submissionForm, 
                        file: e.target.files ? e.target.files[0] : null
                      })}
                      className="w-full px-3 py-2 border rounded-md"
                    />
                    <p className="text-xs text-gray-500 mt-1">
                      Formatos aceptados: PDF, DOC, DOCX, ZIP (Máx: 10MB)
                    </p>
                  </div>
                )}

                <div className="flex justify-end space-x-3 pt-4 border-t">
                  <button
                    type="button"
                    onClick={() => setShowSubmitModal(false)}
                    className="btn-secondary"
                  >
                    Cancelar
                  </button>
                  <button type="submit" className="btn-primary">
                    Entregar Tarea
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      )}

      {/* Modal detalles de tarea */}
      {selectedTask && !showSubmitModal && (
        <div className="fixed inset-0 bg-black bg-opacity-40 backdrop-blur-sm flex items-center justify-center p-4 z-[9999]">
          <div className="bg-white rounded-2xl shadow-2xl max-w-xl w-full max-h-[90vh] overflow-y-auto border border-gray-200">
            <div className="p-6">
              <div className="flex justify-between items-center mb-4">
                <div>
                  <h2 className="text-2xl font-bold text-gray-900">{selectedTask.title}</h2>
                  <p className="text-gray-600">{selectedTask.course_name}</p>
                  {selectedTask.instructor_name && (
                    <p className="text-sm text-gray-500">👨‍🏫 {selectedTask.instructor_name}</p>
                  )}
                </div>
                <button
                  onClick={() => {
                    setSelectedTask(null);
                    setSubmissions([]);
                  }}
                  className="text-gray-400 hover:text-gray-600"
                >
                  ✕
                </button>
              </div>

              {/* Meta de la tarea */}
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6 text-sm text-gray-700">
                <div>
                  <p>📅 Vence: {new Date(selectedTask.due_date).toLocaleString()}</p>
                  <p>🎯 Puntos máximos: {selectedTask.max_grade}</p>
                </div>
                <div>
                  <p>
                    📂 Tipo de entrega{' '}
                    {selectedTask.submission_type === 'file'
                      ? 'Solo archivo'
                      : selectedTask.submission_type === 'text'
                      ? 'Solo texto'
                      : 'Texto y archivo'}
                  </p>
                  <p>{selectedTask.is_published ? '✅ Publicada' : '⏳ Borrador (no visible para estudiantes)'}</p>
                </div>
              </div>

              {/* Descripción e instrucciones */}
              <div className="mb-6">
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Descripción</h3>
                <p className="text-sm text-gray-700 whitespace-pre-line">
                  {selectedTask.description}
                </p>
              </div>

              {selectedTask.instructions && (
                <div className="mb-6">
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Instrucciones</h3>
                  <p className="text-sm text-gray-700 whitespace-pre-line">
                    {selectedTask.instructions}
                  </p>
                </div>
              )}

              {/* Vista específica para estudiante */}
              {user?.role === 'student' && (
                <div className="mb-6">
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Mi estado</h3>
                  {selectedTask.my_submission ? (
                    <div className="space-y-2">
                      {selectedTask.my_submission.grade !== undefined &&
                      selectedTask.my_submission.grade !== null ? (
                        <div className="p-3 bg-green-50 border-l-4 border-green-400 rounded">
                          <p className="text-green-800 font-semibold">
                            ✅ Calificación: {selectedTask.my_submission.grade}/{selectedTask.max_grade}
                          </p>
                          {selectedTask.my_submission.feedback && (
                            <p className="text-sm text-green-700 mt-2">
                              💬 Retroalimentación: {selectedTask.my_submission.feedback}
                            </p>
                          )}
                        </div>
                      ) : (
                        <div className="p-3 bg-blue-50 border-l-4 border-blue-400 rounded">
                          <p className="text-blue-800 font-medium">
                            ✅ Entregada el{' '}
                            {new Date(selectedTask.my_submission.submitted_at).toLocaleString()}
                          </p>
                          <p className="text-sm text-blue-600 mt-1">
                            En espera de calificación
                          </p>
                        </div>
                      )}
                      {getSubmissionFileUrl(selectedTask.my_submission) && (
                        <div>
                          <a
                            href={getSubmissionFileUrl(selectedTask.my_submission)!}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-sm text-primary-600 hover:underline"
                          >
                            📎 Ver archivo entregado
                          </a>
                        </div>
                      )}
                    </div>
                  ) : (
                    <div className="space-y-3">
                      <p className="text-sm text-gray-700">
                        Aún no has entregado esta tarea.
                      </p>
                    </div>
                  )}
                </div>
              )}

              {/* Vista específica para instructor/admin: estadísticas y entregas */}
              {(user?.role === 'instructor' || user?.role === 'admin') && (
                <>
                  {selectedTask.statistics && (
                    <div className="grid grid-cols-4 gap-4 mb-6">
                      <div className="card text-center">
                        <div className="text-2xl font-bold text-primary-600">
                          {selectedTask.statistics.total_students}
                        </div>
                        <div className="text-sm text-gray-600">Estudiantes</div>
                      </div>
                      <div className="card text-center">
                        <div className="text-2xl font-bold text-blue-600">
                          {selectedTask.statistics.submitted_count}
                        </div>
                        <div className="text-sm text-gray-600">Entregas</div>
                      </div>
                      <div className="card text-center">
                        <div className="text-2xl font-bold text-green-600">
                          {selectedTask.statistics.graded_count}
                        </div>
                        <div className="text-sm text-gray-600">Calificadas</div>
                      </div>
                      <div className="card text-center">
                        <div className="text-2xl font-bold text-purple-600">
                          {selectedTask.statistics.average_grade != null 
                            ? Number(selectedTask.statistics.average_grade).toFixed(1) 
                            : '—'}
                        </div>
                        <div className="text-sm text-gray-600">Promedio</div>
                      </div>
                    </div>
                  )}

                  <h3 className="text-lg font-semibold mb-3">Entregas de Estudiantes</h3>
                  <div className="space-y-3">
                    {submissions.map((submission) => (
                      <div key={submission.id} className="card flex justify-between items-center">
                        <div className="flex-1">
                          <p className="font-medium text-gray-900">{submission.student_name}</p>
                          <p className="text-sm text-gray-600">
                            Entregado: {new Date(submission.submitted_at).toLocaleString()}
                          </p>
                          {getSubmissionFileUrl(submission) && (
                            <p className="text-sm mt-1">
                              <a
                                href={getSubmissionFileUrl(submission)!}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-primary-600 hover:underline"
                              >
                                📎 Ver archivo
                              </a>
                            </p>
                          )}
                          {submission.grade !== undefined && submission.grade !== null && (
                            <p className="text-sm text-green-600 font-medium mt-1">
                              Calificación: {submission.grade}/{selectedTask.max_grade}
                            </p>
                          )}
                        </div>
                        <button
                          onClick={() => {
                            setSelectedSubmission(submission);
                            setGradeForm({
                              grade: submission.grade || 0,
                              feedback: submission.feedback || ''
                            });
                            setShowGradeModal(true);
                          }}
                          className="btn-primary text-sm"
                        >
                          {submission.grade ? 'Revisar' : 'Calificar'}
                        </button>
                      </div>
                    ))}
                    {submissions.length === 0 && (
                      <p className="text-center text-gray-500 py-8">
                        No hay entregas aún
                      </p>
                    )}
                  </div>
                </>
              )}
            </div>
          </div>
        </div>
      )}

      {/* Modal calificar */}
      {showGradeModal && selectedSubmission && selectedTask && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-lg max-w-2xl w-full max-h-[90vh] overflow-y-auto">
            <div className="p-6">
              <div className="flex justify-between items-center mb-4">
                <h2 className="text-2xl font-bold text-gray-900">Calificar Entrega</h2>
                <button
                  onClick={() => setShowGradeModal(false)}
                  className="text-gray-400 hover:text-gray-600"
                >
                  ✕
                </button>
              </div>

              <div className="mb-4 p-3 bg-gray-50 rounded">
                <p className="font-semibold">{selectedSubmission.student_name}</p>
                <p className="text-sm text-gray-600">{selectedTask.title}</p>
              </div>

              {selectedSubmission.submission_text && (
                <div className="mb-4">
                  <h3 className="text-sm font-medium text-gray-700 mb-2">Respuesta del Estudiante:</h3>
                  <div className="p-3 bg-gray-50 rounded">
                    <p className="text-gray-900 whitespace-pre-wrap">{selectedSubmission.submission_text}</p>
                  </div>
                </div>
              )}

              {getSubmissionFileUrl(selectedSubmission) && (
                <div className="mb-4">
                  <h3 className="text-sm font-medium text-gray-700 mb-2">Archivo Adjunto:</h3>
                  <a 
                    href={getSubmissionFileUrl(selectedSubmission)!} 
                    target="_blank" 
                    rel="noopener noreferrer"
                    className="text-primary-600 hover:underline"
                  >
                    📎 Ver/Descargar archivo
                  </a>
                </div>
              )}

              <form onSubmit={handleGradeSubmission} className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Calificación (0 - {selectedTask.max_grade}) *
                  </label>
                  <input
                    type="number"
                    required
                    min="0"
                    max={selectedTask.max_grade}
                    step="0.1"
                    value={gradeForm.grade}
                    onChange={(e) => setGradeForm({...gradeForm, grade: parseFloat(e.target.value)})}
                    className="w-full px-3 py-2 border rounded-md"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Retroalimentación
                  </label>
                  <textarea
                    value={gradeForm.feedback}
                    onChange={(e) => setGradeForm({...gradeForm, feedback: e.target.value})}
                    rows={4}
                    placeholder="Comentarios para el estudiante..."
                    className="w-full px-3 py-2 border rounded-md"
                  />
                </div>

                <div className="flex justify-end space-x-3 pt-4 border-t">
                  <button
                    type="button"
                    onClick={() => setShowGradeModal(false)}
                    className="btn-secondary"
                  >
                    Cancelar
                  </button>
                  <button type="submit" className="btn-primary">
                    Guardar Calificación
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default Tasks;
