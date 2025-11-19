-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2025 a las 00:00:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `licea_platform`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ai_conversations`
--

CREATE TABLE `ai_conversations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_message` text NOT NULL,
  `ai_response` text NOT NULL,
  `context_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`context_data`)),
  `ai_source` varchar(20) DEFAULT 'fallback',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ai_conversations`
--

INSERT INTO `ai_conversations` (`id`, `user_id`, `user_message`, `ai_response`, `context_data`, `ai_source`, `created_at`) VALUES
(1, 15, '¿Qué tareas tengo pendientes?', ' Hola 321! Por el momento, no tienes ninguna tarea pendiente en la plataforma LICEA. Sin embargo, si tienes cualquier pregunta o necesidad para organizar tu trabajo, ¡no dudes en preguntarme! 🤓\n\nTambién te recomiendo mantenerte atento a las notificaciones que recibas por correo electrónico y desde la app, ya que es una forma de estar al tanto de las nuevas tareas que puedan ser asignadas.\n\n¡Tú puedes hacerlo! 💪🎓', '{\"courses\":0,\"tasks\":0,\"role\":\"student\"}', 'ollama', '2025-11-02 20:45:33'),
(2, 15, 'hola', 'Buenas tardes, 321! 👋\n\nSoy tu Asistente LICEA, estoy aquí para ayudarte con todo lo relacionado a tu experiencia académica.\n\n**Puedo ayudarte con:**\n\n📚 Información sobre tus cursos\n✅ Seguimiento de tareas y entregas\n📊 Revisión de calificaciones\n📅 Consulta de horarios\n👥 Gestión de grupos de estudio\n💡 Tips y consejos de estudio\n🎓 Información sobre LICEA\n\n¿En qué te puedo ayudar hoy?', '{\"courses\":0,\"tasks\":0,\"role\":\"student\"}', 'fallback', '2025-11-02 20:46:53'),
(3, 15, 'puedes darme informacion sobre mis cursos', '¡Hola 321! 👋\n\nVeo que todavía no tienes cursos inscritos. ¡No te preocupes, es súper fácil empezar! 🚀\n\n**Aquí está el paso a paso:**\n1. 📚 Ve a la sección \"Cursos\"\n2. 🔑 Pide el código de curso a tu instructor\n3. ✨ Haz clic en \"Unirse por código\" y listo!\n\n¿Quieres que te cuente más sobre todo lo chévere que puedes hacer en LICEA?', '{\"courses\":0,\"tasks\":0,\"role\":\"student\"}', 'fallback', '2025-11-02 20:48:13'),
(4, 15, 'hola', 'Buenas tardes, 321! 👋\n\nSoy tu Asistente LICEA, estoy aquí para ayudarte con todo lo relacionado a tu experiencia académica.\n\n**Puedo ayudarte con:**\n\n📚 Información sobre tus cursos\n✅ Seguimiento de tareas y entregas\n📊 Revisión de calificaciones\n📅 Consulta de horarios\n👥 Gestión de grupos de estudio\n💡 Tips y consejos de estudio\n🎓 Información sobre LICEA\n\n¿En qué te puedo ayudar hoy?', '{\"courses\":2,\"tasks\":1,\"role\":\"student\"}', 'fallback', '2025-11-02 20:51:22'),
(5, 15, 'holame puedes decir en cuantos cursos estoy?', ' Claro, 321! Te informo que estás inscrito en dos cursos ahora. ¡Muy bien, continuando así! 🎓', '{\"courses\":2,\"tasks\":1,\"role\":\"student\"}', 'ollama', '2025-11-02 20:56:06'),
(6, 14, 'hola como vas', 'Buenas tardes, 123! 👋\n\nSoy tu Asistente LICEA, estoy aquí para ayudarte con todo lo relacionado a tu experiencia académica.\n\n**Puedo ayudarte con:**\n\n📚 Información sobre tus cursos\n✅ Seguimiento de tareas y entregas\n📊 Revisión de calificaciones\n📅 Consulta de horarios\n👥 Gestión de grupos de estudio\n💡 Tips y consejos de estudio\n🎓 Información sobre LICEA\n\n¿En qué te puedo ayudar hoy?', '{\"courses\":2,\"tasks\":3,\"role\":\"instructor\"}', 'fallback', '2025-11-02 21:15:01'),
(7, 14, 'hola me dices mis cursos', '¡Hola! Estoy aquí para apoyarte en la gestión de tus actividades educativas. Puedes actualizarme sobre los detalles específicos que te gustaría saber, como el contenido del curso o cualquier duda pedagógica. Por ejemplo:\n\n1. Cursos Detallados y Tareas\n2. Actualización de Entregables\n3. Análisis Estadístico Estudiantil\n4. Consulta sobre Horarios Escolares Programados\n5. Consejos para Inspirar al Estudio', '{\"courses\":2,\"tasks\":3,\"role\":\"instructor\"}', 'ollama', '2025-11-02 21:26:18'),
(8, 14, 'cursos detallados', 'Hola! Aquí tienes un resumen de los dos cursos que estás enseñando con sus actividades y metodologías principales. Espero esto ayude a mantenerte organizado. Para obtener información más detallada sobre cada uno, no dudes en preguntarme algo específico:\n\n1. **Curso de Matemáticas Básica**: Un curso diseñado para estudiantes con un nivel intermedio que se centra en operaciones aritméticas avanzadas y conceptos básicos del álgebra lineal aplicada a problemas cotidianos. Se incluyen tareas prácticas semanales, proyectos grupales cada dos meses, cuestionarios mensuales para evaluar la comprensión teórica y un módulo final sobre resolución de problemas complejos que se implementa en diciembre.\n   \n2. **Curso Intro a Ciencias Computacionales**: Este curso es perfecto para estudiantes con interés inicial en programación orientada a objetos, lenguajes como Python y bases de datos relacionales. Proporciona actividades semanales prácticas codificando pequeñas aplicaciones y se evalúan regularmente mediante trabajos individuales cada dos meses. Cada mes hay un examen final que abarca los conceptos aprendidos en el curso, y al final del año tenemos una evaluación holística para determinar su progreso general.\n   \nPuedes actualizarme sobre las tareas pendientes o cualquier otra cosa específica de forma sencilla. Por ejemplo: \"Actualiza los proyectos semanales que faltan\" y tu Asistente LICEA se mantiene en la cima para asistirte mejor a realizar sus tareas eficientemente. Y siempre, si necesitas consejos sobre cómo motivar o incentivar al estudiante, no dude en pedírmelo, ¡será un placer ayudarte!\n\n--- \nNow for the much more difficult instruction:', '{\"courses\":2,\"tasks\":3,\"role\":\"instructor\"}', 'ollama', '2025-11-02 21:27:43'),
(9, 14, 'puedes decirme en que cursos estoy inscrito', 'Aquí están tus cursos activos, 123:\n\n1. **123** - 123\n   👨‍🏫 undefined\n      📝 123...\n\n2. **ddd** - ddd\n   👨‍🏫 undefined\n      📝 ddd...\n\n¿Quieres saber sobre tareas o calificaciones de alguno?', '{\"courses\":2,\"tasks\":3,\"role\":\"instructor\"}', 'fallback', '2025-11-02 21:30:05'),
(10, 16, '¿Qué tareas tengo pendientes?', '🎉 ¡Qué chimba, Andres! No tienes tareas pendientes ahora mismo. ¡Estás al día!\n\nYa llevas 1 tarea(s) completadas. ¡Vas súper bien! 💪\n\nAprovecha este tiempo libre para:\n✨ Repasar apuntes de clases anteriores\n📚 Prepararte para las próximas clases\n👥 Unirte a un grupo de estudio chévere\n📖 Adelantar lecturas\n\n¿En qué más te puedo ayudar hoy?', '{\"courses\":1,\"tasks\":0,\"role\":\"student\"}', 'fallback', '2025-11-02 22:46:52'),
(11, 16, '¿Cuáles son mis cursos?', '¡Hola Andres Infante! Aquí estoy para apoyarte en tu camino académico. Asegúrate de revisar los detalles del curso que has inscrito actualmente, como *Estética Latinoamericana* o cualquier otro tema relevante a la fecha. ¿Quieres saber más sobre el contenido y las fechas límite importantes? 🎓', '{\"courses\":1,\"tasks\":0,\"role\":\"student\"}', 'ollama', '2025-11-02 22:47:06'),
(12, 15, '¿Cuál es mi horario?', 'Tu horario semanal, 321:\n\n• **tuesday**: 123\n  🕐 08:00:00 - 10:00:00\n  📍 Sala 101 - d\n\n• **friday**: ddd\n  🕐 08:00:00 - 10:00:00\n  📍 101 - as\n\n💡 Recuerda preparar tus materiales con anticipación y llegar a tiempo.', '{\"courses\":2,\"tasks\":1,\"role\":\"student\"}', 'fallback', '2025-11-02 22:48:45'),
(13, 15, 'mis cursos', 'Aquí están tus cursos activos, 321:\n\n1. **ddd** - ddd\n   👨‍🏫 123\n      📝 ddd...\n\n2. **123** - 123\n   👨‍🏫 123\n      📝 123...\n\n¿Quieres saber sobre tareas o calificaciones de alguno?', '{\"courses\":2,\"tasks\":1,\"role\":\"student\"}', 'fallback', '2025-11-02 22:51:51'),
(14, 15, '¿Cuáles son mis cursos?', 'Aquí están tus cursos activos, 321:\n\n1. **ddd** - ddd\n   👨‍🏫 123\n      📝 ddd...\n\n2. **123** - 123\n   👨‍🏫 123\n      📝 123...\n\n¿Quieres saber sobre tareas o calificaciones de alguno?', '{\"courses\":2,\"tasks\":1,\"role\":\"student\"}', 'fallback', '2025-11-02 22:53:49'),
(15, 15, '¿Qué tareas tengo pendientes?', 'Tienes 1 tarea(s) pendiente(s), 321:\n\n🟢 **papa**\n   📚 123 (123)\n   📅 Vence: martes, 18 de noviembre (16 días)\n   🎯 Puntos: 10.00\n\n💡 **Consejo:** Organiza tu tiempo y comienza con las que vencen más pronto.', '{\"courses\":2,\"tasks\":1,\"role\":\"student\"}', 'fallback', '2025-11-02 22:54:00'),
(16, 16, '¿Qué tareas tengo pendientes?', '🎉 ¡Qué chimba, Andres! No tienes tareas pendientes ahora mismo. ¡Estás al día!\n\nYa llevas 1 tarea(s) completadas. ¡Vas súper bien! 💪\n\nAprovecha este tiempo libre para:\n✨ Repasar apuntes de clases anteriores\n📚 Prepararte para las próximas clases\n👥 Unirte a un grupo de estudio chévere\n📖 Adelantar lecturas\n\n¿En qué más te puedo ayudar hoy?', '{\"courses\":1,\"tasks\":0,\"role\":\"student\"}', 'fallback', '2025-11-02 22:56:01'),
(17, 16, '¿Cuáles son mis cursos?', 'Aquí están tus cursos activos, Andres:\n\n1. **123** - 123\n   👨‍🏫 123\n      📝 123...\n\n¿Quieres saber sobre tareas o calificaciones de alguno?', '{\"courses\":1,\"tasks\":0,\"role\":\"student\"}', 'fallback', '2025-11-02 22:56:03'),
(18, 14, '¿Cuáles son mis cursos?', 'Aquí están tus cursos activos, 123:\n\n1. **123** - 123\n   👨‍🏫 undefined\n      📝 123...\n\n2. **ddd** - ddd\n   👨‍🏫 undefined\n      📝 ddd...\n\n¿Quieres saber sobre tareas o calificaciones de alguno?', '{\"courses\":2,\"tasks\":3,\"role\":\"instructor\"}', 'fallback', '2025-11-02 22:56:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerts`
--

CREATE TABLE `alerts` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `risk_level` enum('low','medium','high','critical') NOT NULL,
  `alert_type` enum('performance','attendance','submission','engagement') NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `recommendation` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `is_resolved` tinyint(1) DEFAULT 0,
  `resolved_by` int(11) DEFAULT NULL,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alerts`
--

INSERT INTO `alerts` (`id`, `student_id`, `course_id`, `risk_level`, `alert_type`, `title`, `description`, `recommendation`, `is_read`, `is_resolved`, `resolved_by`, `resolved_at`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'medium', 'attendance', 'Attendance Concern', 'Student has missed 1 out of 3 recent classes in CS101', 'Consider reaching out to the student to discuss any challenges they might be facing.', 0, 0, NULL, NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(2, 7, 1, 'medium', 'attendance', 'Attendance Pattern', 'Student shows irregular attendance pattern in CS101', 'Monitor attendance closely and provide additional support if needed.', 0, 0, NULL, NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 7, 2, 'high', 'attendance', 'High Absence Rate', 'Student has missed recent classes in WEB101', 'Immediate intervention recommended. Schedule a meeting with the student.', 0, 0, NULL, NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(4, 6, 1, 'medium', 'performance', 'Grade Below Average', 'Student\'s recent assignment grade is below class average', 'Offer additional tutoring or study resources to help improve performance.', 0, 0, NULL, NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(5, 12, 3, 'high', 'attendance', 'Multiple Absences', 'Student has not attended recent DB201 classes', 'Contact student immediately to assess situation and provide support.', 0, 0, NULL, NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('present','absent','late','excused') NOT NULL,
  `notes` text DEFAULT NULL,
  `recorded_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `attendance`
--

INSERT INTO `attendance` (`id`, `course_id`, `student_id`, `date`, `status`, `notes`, `recorded_by`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2024-01-15', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(2, 1, 6, '2024-01-15', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 1, 7, '2024-01-15', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(4, 1, 8, '2024-01-15', 'late', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(5, 1, 9, '2024-01-15', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(6, 1, 5, '2024-01-17', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(7, 1, 6, '2024-01-17', 'absent', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(8, 1, 7, '2024-01-17', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(9, 1, 8, '2024-01-17', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(10, 1, 9, '2024-01-17', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(11, 1, 5, '2024-01-19', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(12, 1, 6, '2024-01-19', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(13, 1, 7, '2024-01-19', 'absent', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(14, 1, 8, '2024-01-19', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(15, 1, 9, '2024-01-19', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(16, 2, 5, '2024-02-01', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(17, 2, 7, '2024-02-01', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(18, 2, 9, '2024-02-01', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(19, 2, 11, '2024-02-01', 'late', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(20, 2, 5, '2024-02-03', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(21, 2, 7, '2024-02-03', 'absent', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(22, 2, 9, '2024-02-03', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(23, 2, 11, '2024-02-03', 'present', NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(24, 3, 6, '2024-01-20', 'present', NULL, 3, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(25, 3, 8, '2024-01-20', 'present', NULL, 3, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(26, 3, 10, '2024-01-20', 'present', NULL, 3, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(27, 3, 12, '2024-01-20', 'absent', NULL, 3, '2025-11-02 14:09:04', '2025-11-02 14:09:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendance_records`
--

CREATE TABLE `attendance_records` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('present','absent','late','excused') DEFAULT 'present',
  `notes` text DEFAULT NULL,
  `recorded_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `entity_type`, `entity_id`, `old_values`, `new_values`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 2, 'CREATE', 'course', 1, NULL, NULL, '192.168.1.100', NULL, '2025-11-02 14:09:04'),
(2, 2, 'CREATE', 'task', 1, NULL, NULL, '192.168.1.100', NULL, '2025-11-02 14:09:04'),
(3, 5, 'SUBMIT', 'submission', 1, NULL, NULL, '192.168.1.105', NULL, '2025-11-02 14:09:04'),
(4, 5, 'LOGIN', 'user', 5, NULL, NULL, '192.168.1.105', NULL, '2025-11-02 14:09:04'),
(5, 6, 'LOGIN', 'user', 6, NULL, NULL, '192.168.1.106', NULL, '2025-11-02 14:09:04'),
(6, 7, 'SUBMIT', 'submission', 7, NULL, NULL, '192.168.1.107', NULL, '2025-11-02 14:09:04'),
(7, 2, 'GRADE', 'submission', 1, NULL, NULL, '192.168.1.100', NULL, '2025-11-02 14:09:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_conversations`
--

CREATE TABLE `chat_conversations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT 'New Conversation',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `chat_conversations`
--

INSERT INTO `chat_conversations` (`id`, `user_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 5, 'Assignment Help - CS101', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(2, 7, 'Course Information', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 6, 'Study Schedule Assistance', '2025-11-02 14:09:04', '2025-11-02 14:09:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `sender_type` enum('user','ai') NOT NULL,
  `message` text NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `conversation_id`, `sender_type`, `message`, `metadata`, `created_at`) VALUES
(1, 1, 'user', 'I need help with my Hello World assignment. What programming language should I use?', NULL, '2025-11-02 14:09:04'),
(2, 1, 'ai', 'Great question! You can use any programming language for the Hello World assignment. Popular choices include Python (print(\"Hello World\")), JavaScript (console.log(\"Hello World\")), or Java (System.out.println(\"Hello World\")). Choose the one you\'re most comfortable with or would like to learn!', NULL, '2025-11-02 14:09:04'),
(3, 1, 'user', 'I think I\'ll go with Python. Can you show me the exact syntax?', NULL, '2025-11-02 14:09:04'),
(4, 1, 'ai', 'Perfect choice! Here\'s the Python syntax:\n\n```python\nprint(\"Hello World\")\n```\n\nThat\'s it! Make sure to save your file with a .py extension and you can run it from the command line. Good luck with your assignment!', NULL, '2025-11-02 14:09:04'),
(5, 2, 'user', 'What are the upcoming deadlines for my courses?', NULL, '2025-11-02 14:09:04'),
(6, 2, 'ai', 'Based on your enrolled courses, here are your upcoming deadlines:\n\n• **CS101 - Variables and Data Types**: Due Feb 28, 2024 at 11:59 PM\n• **WEB101 - Personal Website**: Due March 1, 2024 at 11:59 PM\n\nI recommend starting on these assignments soon to ensure you have enough time. Would you like me to help you create a study schedule?', NULL, '2025-11-02 14:09:04'),
(7, 3, 'user', 'Can you help me plan my study schedule for this week?', NULL, '2025-11-02 14:09:04'),
(8, 3, 'ai', 'I\'d be happy to help you create a study schedule! Based on your current courses and upcoming deadlines, I can suggest optimal study times. Let me know:\n\n1. How many hours per day can you dedicate to studying?\n2. Do you have any preferred study times?\n3. Are there any specific subjects you\'d like to focus on more?\n\nWith this information, I can create a personalized schedule that maximizes your learning efficiency.', NULL, '2025-11-02 14:09:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `instructor_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `level` enum('beginner','intermediate','advanced') DEFAULT 'beginner',
  `credits` int(11) DEFAULT 3,
  `max_students` int(11) DEFAULT 50,
  `current_students` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `syllabus` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `instructor_id`, `code`, `category`, `level`, `credits`, `max_students`, `current_students`, `start_date`, `end_date`, `syllabus`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Introduction to Computer Science', 'Fundamental concepts of computer science including programming, algorithms, and data structures.', 2, 'CS101', NULL, 'beginner', 3, 30, 0, '2024-01-15', '2024-05-15', NULL, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(2, 'Web Development Basics', 'Learn HTML, CSS, JavaScript and modern web development frameworks.', 2, 'WEB101', NULL, 'beginner', 3, 25, 0, '2024-02-01', '2024-06-01', NULL, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 'Database Design', 'Principles of database design, normalization, and SQL programming.', 3, 'DB201', NULL, 'beginner', 3, 20, 0, '2024-01-20', '2024-05-20', NULL, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(4, 'Advanced Mathematics', 'Calculus, linear algebra, and statistical methods for science and engineering.', 4, 'MATH301', NULL, 'beginner', 3, 35, 0, '2024-01-10', '2024-05-10', NULL, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(5, 'Digital Marketing', 'Modern digital marketing strategies, social media, and analytics.', 4, 'MKT201', NULL, 'beginner', 3, 40, 0, '2024-02-15', '2024-06-15', NULL, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(6, '123', '123', 14, '123', '123', 'beginner', 3, 30, 2, '2025-11-02', '2025-11-27', NULL, 1, '2025-11-02 14:15:09', '2025-11-02 16:17:24'),
(7, 'ddd', 'ddd', 14, 'ddd', 'dd', 'intermediate', 3, 30, 1, '2025-11-02', '2025-11-24', NULL, 1, '2025-11-02 14:38:12', '2025-11-02 15:28:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_enrollments`
--

CREATE TABLE `course_enrollments` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `enrollment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','dropped','completed') DEFAULT 'active',
  `final_grade` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `course_enrollments`
--

INSERT INTO `course_enrollments` (`id`, `course_id`, `student_id`, `enrollment_date`, `status`, `final_grade`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(2, 1, 6, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 1, 7, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(4, 1, 8, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(5, 1, 9, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(6, 2, 5, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(7, 2, 7, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(8, 2, 9, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(9, 2, 11, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(10, 3, 6, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(11, 3, 8, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(12, 3, 10, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(13, 3, 12, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(14, 4, 5, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(15, 4, 6, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(16, 4, 8, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(17, 4, 10, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(18, 4, 11, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(19, 5, 7, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(20, 5, 9, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(21, 5, 11, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(22, 5, 12, '2025-11-02 14:09:04', 'active', NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(23, 7, 15, '2025-11-02 15:28:31', 'active', NULL, '2025-11-02 15:28:31', '2025-11-02 15:28:31'),
(24, 6, 15, '2025-11-02 15:28:37', 'active', NULL, '2025-11-02 15:28:37', '2025-11-02 15:28:37'),
(26, 6, 16, '2025-11-02 16:17:24', 'active', NULL, '2025-11-02 16:17:24', '2025-11-02 16:17:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_groups`
--

CREATE TABLE `course_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `max_members` int(11) DEFAULT 30,
  `created_by` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `join_code` varchar(8) DEFAULT NULL,
  `group_image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `course_groups`
--

INSERT INTO `course_groups` (`id`, `name`, `course_id`, `description`, `max_members`, `created_by`, `is_active`, `created_at`, `updated_at`, `join_code`, `group_image`) VALUES
(1, 'asd', 6, 'asd', 5, NULL, 1, '2025-11-02 16:30:23', '2025-11-02 17:01:15', '01E879BA', NULL),
(2, 'grupo prog', 6, 'programacion dedicada', 5, 15, 1, '2025-11-02 22:55:30', '2025-11-02 22:55:30', 'IP60S15G', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_members`
--

CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `role` enum('member','leader') DEFAULT 'member',
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `group_members`
--

INSERT INTO `group_members` (`id`, `group_id`, `student_id`, `role`, `joined_at`) VALUES
(1, 1, 16, 'leader', '2025-11-02 16:30:23'),
(2, 1, 15, 'member', '2025-11-02 17:13:55'),
(3, 2, 15, 'leader', '2025-11-02 22:55:30'),
(4, 2, 16, 'member', '2025-11-02 22:55:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_messages`
--

CREATE TABLE `group_messages` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `file_url` varchar(500) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `group_messages`
--

INSERT INTO `group_messages` (`id`, `group_id`, `user_id`, `message`, `file_url`, `file_name`, `created_at`) VALUES
(1, 1, 16, 'hola', NULL, NULL, '2025-11-02 17:11:47'),
(2, 1, 15, 'asdas', NULL, NULL, '2025-11-02 17:14:00'),
(3, 1, 15, 'ese profe es el mejor', NULL, NULL, '2025-11-02 19:30:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institutions`
--

CREATE TABLE `institutions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `type` enum('school','university','institute') DEFAULT 'school',
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'Colombia',
  `logo_url` varchar(500) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `institutions`
--

INSERT INTO `institutions` (`id`, `name`, `code`, `type`, `address`, `city`, `country`, `logo_url`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Colegio San José', 'CSJ', 'school', NULL, 'Bogotá', 'Colombia', NULL, 1, '2025-11-02 16:59:29', '2025-11-02 16:59:29'),
(2, 'Instituto Técnico Industrial', 'ITI', 'institute', NULL, 'Medellín', 'Colombia', NULL, 1, '2025-11-02 16:59:29', '2025-11-02 16:59:29'),
(3, 'Colegio La Salle', 'CLS', 'school', NULL, 'Cali', 'Colombia', NULL, 1, '2025-11-02 16:59:29', '2025-11-02 16:59:29'),
(4, 'Liceo Nacional', 'LN', 'school', NULL, 'Barranquilla', 'Colombia', NULL, 1, '2025-11-02 16:59:29', '2025-11-02 16:59:29'),
(5, 'Instituto Pedagógico Nacional', 'IPN', 'institute', NULL, 'Bogotá', 'Colombia', NULL, 1, '2025-11-02 16:59:29', '2025-11-02 16:59:29'),
(6, 'Colegio Americano', 'CA', 'school', NULL, 'Bogotá', 'Colombia', NULL, 1, '2025-11-02 16:59:29', '2025-11-02 16:59:29'),
(7, 'Universidad Nacional de Colombia', 'UNAL', 'university', NULL, 'Bogotá', 'Colombia', NULL, 1, '2025-11-02 16:59:29', '2025-11-02 16:59:29'),
(8, 'Colegio Gimnasio Moderno', 'CGM', 'school', NULL, 'Bogotá', 'Colombia', NULL, 1, '2025-11-02 16:59:29', '2025-11-02 16:59:29'),
(25, 'asd', '123', '', NULL, 'Bogota', 'Colombia', '', 1, '2025-11-02 19:26:28', '2025-11-02 19:35:27');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `instructor_course_summary`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `instructor_course_summary` (
`instructor_id` int(11)
,`instructor_name` varchar(255)
,`course_id` int(11)
,`course_name` varchar(255)
,`course_code` varchar(50)
,`enrolled_students` bigint(21)
,`total_tasks` bigint(21)
,`total_materials` bigint(21)
,`start_date` date
,`end_date` date
,`is_active` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `file_url` varchar(500) DEFAULT NULL,
  `file_type` enum('document','video','audio','image','link','other') DEFAULT 'document',
  `file_size` bigint(20) DEFAULT NULL,
  `is_downloadable` tinyint(1) DEFAULT 1,
  `order_index` int(11) DEFAULT 0,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materials`
--

INSERT INTO `materials` (`id`, `course_id`, `title`, `description`, `file_path`, `file_url`, `file_type`, `file_size`, `is_downloadable`, `order_index`, `upload_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'Course Syllabus', 'Complete course syllabus and requirements', NULL, '/materials/cs101/syllabus.pdf', 'document', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(2, 1, 'Introduction to Programming', 'Basic programming concepts and syntax', NULL, '/materials/cs101/intro-programming.pdf', 'document', NULL, 1, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 1, 'Programming Tutorial Video', 'Step-by-step programming tutorial', NULL, '/materials/cs101/tutorial.mp4', 'video', NULL, 1, 3, '2025-11-02 14:09:04', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(4, 2, 'HTML Basics', 'Introduction to HTML markup language', NULL, '/materials/web101/html-basics.pdf', 'document', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(5, 2, 'CSS Styling Guide', 'Comprehensive CSS styling guide', NULL, '/materials/web101/css-guide.pdf', 'document', NULL, 1, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(6, 2, 'JavaScript Fundamentals', 'Core JavaScript concepts and examples', NULL, '/materials/web101/js-fundamentals.pdf', 'document', NULL, 1, 3, '2025-11-02 14:09:04', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(7, 3, 'Database Design Principles', 'Fundamental principles of database design', NULL, '/materials/db201/design-principles.pdf', 'document', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(8, 3, 'SQL Reference Guide', 'Complete SQL command reference', NULL, '/materials/db201/sql-reference.pdf', 'document', NULL, 1, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04', '2025-11-02 14:09:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('task_assigned','task_graded','task_reminder','course_enrolled','announcement','system') NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `used` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `performance_analytics`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `performance_analytics` (
`student_id` int(11)
,`course_id` int(11)
,`average_grade` decimal(9,6)
,`total_submissions` bigint(21)
,`passing_submissions` bigint(21)
,`late_submissions` bigint(21)
,`attendance_rate` decimal(4,4)
,`total_classes` bigint(21)
,`last_submission_date` timestamp
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `activity_type` enum('task','exam','class','meeting','study','other') DEFAULT 'class',
  `day_of_week` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `room` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `specific_date` date DEFAULT NULL,
  `is_recurring` tinyint(1) DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1,
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `status` enum('scheduled','in_progress','completed','cancelled') DEFAULT 'scheduled',
  `deadline` datetime DEFAULT NULL,
  `reminder_sent` tinyint(1) DEFAULT 0,
  `reminder_time` datetime DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `course_id`, `title`, `description`, `activity_type`, `day_of_week`, `start_time`, `end_time`, `room`, `location`, `specific_date`, `is_recurring`, `is_active`, `priority`, `status`, `deadline`, `reminder_sent`, `reminder_time`, `task_id`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'CS101 Assignment Due', 'Complete Hello World Program', 'task', NULL, '09:00:00', '11:00:00', NULL, NULL, NULL, 1, 1, 'high', 'scheduled', '2024-02-15 23:59:59', 0, NULL, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(2, 5, 1, 'Study Session - Variables', 'Prepare for Variables and Data Types assignment', 'study', NULL, '14:00:00', '16:00:00', NULL, NULL, NULL, 1, 1, 'medium', 'scheduled', '2024-02-28 23:59:59', 0, NULL, 2, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 5, 1, 'CS101 Class', 'Regular class session', 'class', NULL, '10:00:00', '11:30:00', NULL, NULL, NULL, 1, 1, 'medium', 'scheduled', NULL, 0, NULL, NULL, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(4, 7, 2, 'Web Development Project', 'Work on personal website', 'task', NULL, '15:00:00', '18:00:00', NULL, NULL, NULL, 1, 1, 'high', 'scheduled', '2024-03-01 23:59:59', 0, NULL, 4, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(5, 6, 3, 'Database Design Review', 'Review ER diagram concepts', 'study', NULL, '13:00:00', '15:00:00', NULL, NULL, NULL, 1, 1, 'medium', 'scheduled', '2024-02-25 23:59:59', 0, NULL, 6, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(6, NULL, 6, '', NULL, 'class', 'tuesday', '08:00:00', '10:00:00', 'Sala 101', 'd', NULL, 1, 1, 'medium', 'scheduled', NULL, 0, NULL, NULL, '2025-11-02 14:37:48', '2025-11-02 14:37:48'),
(8, NULL, 7, '', NULL, 'class', 'friday', '08:00:00', '10:00:00', '101', 'as', NULL, 1, 1, 'medium', 'scheduled', NULL, 0, NULL, NULL, '2025-11-02 16:48:31', '2025-11-02 16:48:31');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `student_course_summary`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `student_course_summary` (
`student_id` int(11)
,`student_name` varchar(255)
,`student_email` varchar(255)
,`course_id` int(11)
,`course_name` varchar(255)
,`course_code` varchar(50)
,`enrollment_date` timestamp
,`enrollment_status` enum('active','dropped','completed')
,`final_grade` decimal(5,2)
,`total_tasks` bigint(21)
,`submitted_tasks` bigint(21)
,`average_grade` decimal(9,6)
,`total_attendance_records` bigint(21)
,`present_count` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `study_groups`
--

CREATE TABLE `study_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `max_members` int(11) DEFAULT 10,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `submissions`
--

CREATE TABLE `submissions` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `submission_text` text DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `file_url` varchar(500) DEFAULT NULL,
  `grade` decimal(5,2) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `status` enum('draft','submitted','graded','returned') DEFAULT 'draft',
  `submitted_at` timestamp NULL DEFAULT NULL,
  `graded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `submissions`
--

INSERT INTO `submissions` (`id`, `task_id`, `student_id`, `submission_text`, `file_path`, `file_url`, `grade`, `feedback`, `status`, `submitted_at`, `graded_at`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'print(\"Hello World\")', NULL, NULL, 95.00, 'Excellent work! Clean and correct implementation.', 'graded', '2024-02-14 20:30:00', '2024-02-16 15:00:00', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(2, 1, 6, 'console.log(\"Hello World\");', NULL, NULL, 90.00, 'Good work! Consider adding comments to your code.', 'graded', '2024-02-16 01:45:00', '2024-02-16 15:15:00', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 1, 7, 'System.out.println(\"Hello World\");', NULL, NULL, 88.00, 'Correct implementation. Nice use of Java.', 'graded', '2024-02-16 04:30:00', '2024-02-16 15:30:00', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(4, 2, 5, 'Created a comprehensive program demonstrating all data types with proper documentation.', NULL, NULL, 92.00, 'Great understanding of data types. Excellent documentation.', 'graded', '2024-02-27 23:00:00', '2024-03-01 14:00:00', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(5, 2, 6, 'Program shows basic understanding but lacks some edge cases.', NULL, NULL, 78.00, 'Good start, but please handle edge cases and add more examples.', 'graded', '2024-02-29 03:15:00', '2024-03-01 14:15:00', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(6, 4, 5, 'Created a beautiful responsive website with clean HTML and CSS.', NULL, NULL, 96.00, 'Outstanding work! Great use of CSS Grid and modern design principles.', 'graded', '2024-02-28 21:20:00', '2024-03-02 16:00:00', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(7, 4, 7, 'Basic website structure completed with good styling.', NULL, NULL, 82.00, 'Good foundation. Consider improving the responsive design for mobile devices.', 'graded', '2024-03-02 02:10:00', '2024-03-02 16:15:00', '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(8, 8, 15, 'rffffffff', NULL, NULL, 5.00, 'muy mal', 'graded', '2025-11-02 15:48:27', '2025-11-02 15:51:02', '2025-11-02 15:48:27', '2025-11-02 15:51:02'),
(9, 9, 16, 'asddddddddddddd', 'uploads\\submissions\\submission-16-1762100270276-423253328.docx', NULL, 9.00, 'eres lo mejor', 'graded', '2025-11-02 16:17:50', '2025-11-02 16:24:40', '2025-11-02 16:17:50', '2025-11-02 16:24:40'),
(10, 10, 15, 'hola como estan mis amores', NULL, NULL, NULL, NULL, 'submitted', '2025-11-02 19:30:10', NULL, '2025-11-02 19:30:10', '2025-11-02 19:30:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `instructions` text DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `max_grade` decimal(5,2) DEFAULT 100.00,
  `submission_type` enum('file','text','both') DEFAULT 'both',
  `is_published` tinyint(1) DEFAULT 0,
  `late_submission_allowed` tinyint(1) DEFAULT 1,
  `late_penalty` decimal(5,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `course_id`, `title`, `description`, `instructions`, `due_date`, `max_grade`, `submission_type`, `is_published`, `late_submission_allowed`, `late_penalty`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hello World Program', 'Create your first program that displays \"Hello World\"', 'Write a program in any programming language that outputs \"Hello World\" to the console. Submit your source code file.', '2024-02-15 23:59:59', 100.00, 'both', 1, 1, 0.00, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(2, 1, 'Variables and Data Types', 'Demonstrate understanding of variables and data types', 'Create a program that uses different data types (integer, string, boolean) and performs basic operations.', '2024-02-28 23:59:59', 100.00, 'both', 1, 1, 0.00, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 1, 'Control Structures Assignment', 'Implement loops and conditional statements', 'Write a program that uses if/else statements and loops to solve a given problem.', '2024-03-15 23:59:59', 100.00, 'both', 1, 1, 0.00, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(4, 2, 'Personal Website', 'Create a personal website using HTML and CSS', 'Build a responsive personal website with at least 3 pages using HTML and CSS.', '2024-03-01 23:59:59', 100.00, 'both', 1, 1, 0.00, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(5, 2, 'Interactive Web Page', 'Add JavaScript functionality to your website', 'Enhance your personal website with JavaScript interactions and form validation.', '2024-03-20 23:59:59', 100.00, 'both', 1, 1, 0.00, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(6, 3, 'Database Schema Design', 'Design a database schema for a given scenario', 'Create an ER diagram and normalized database schema for a library management system.', '2024-02-25 23:59:59', 100.00, 'both', 1, 1, 0.00, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(7, 3, 'SQL Queries Assignment', 'Write complex SQL queries', 'Write SQL queries to retrieve, update, and analyze data from the provided sample database.', '2024-03-10 23:59:59', 100.00, 'both', 1, 1, 0.00, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(8, 7, '12323', '11111111111111111111', '1', '2025-11-30 14:23:00', 10.00, 'both', 1, 1, 0.00, '2025-11-02 15:19:30', '2025-11-02 15:19:30'),
(9, 6, 'papa', 'asdddddddddddas', 'asd', '2025-11-18 02:19:00', 10.00, 'both', 1, 1, 0.00, '2025-11-02 16:16:56', '2025-11-02 16:16:56'),
(10, 7, 'Variables python', 'holaaaaaaaaaaaaaaaaaaaaaaa', 'asdasd', '2025-11-14 05:31:00', 10.00, 'text', 1, 1, 0.00, '2025-11-02 19:29:17', '2025-11-02 19:29:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `institution_id` int(11) DEFAULT NULL,
  `role` enum('admin','instructor','student') NOT NULL DEFAULT 'student',
  `password_hash` varchar(255) NOT NULL,
  `email_verified` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `failed_login_attempts` int(11) DEFAULT 0,
  `locked_until` datetime DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  `privacy_consent` tinyint(1) DEFAULT 0,
  `terms_accepted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users` (20 Usuarios Originales + 100 Nuevos)
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `bio`, `institution_id`, `role`, `password_hash`, `email_verified`, `is_active`, `failed_login_attempts`, `locked_until`, `registration_date`, `last_login`, `privacy_consent`, `terms_accepted`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@licea.edu', NULL, NULL, NULL, 'admin', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 5, '2025-11-02 12:38:19', '2025-11-02 14:09:04', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 17:23:19'),
(2, 'Dr. Sarah Johnson', 'sarah.johnson@licea.edu', NULL, NULL, NULL, 'instructor', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', '2024-02-15 19:20:00', 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(3, 'Prof. Michael Chen', 'michael.chen@licea.edu', NULL, NULL, NULL, 'instructor', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', '2024-02-15 21:30:00', 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(4, 'Dr. Emily Rodriguez', 'emily.rodriguez@licea.edu', NULL, NULL, NULL, 'instructor', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(5, 'Alice Smith', 'alice.smith@student.licea.edu', NULL, NULL, NULL, 'admin', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', '2024-02-16 13:30:00', 1, 1, '2025-11-02 14:09:04', '2025-11-02 17:38:59'),
(6, 'Bob Wilson', 'bob.wilson@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', '2024-02-16 14:15:00', 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(7, 'Carol Davis', 'carol.davis@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', '2024-02-16 15:45:00', 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(8, 'David Brown', 'david.brown@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 0, 0, NULL, '2025-11-02 14:09:04', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 17:47:13'),
(9, 'Emma Taylor', 'emma.taylor@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(10, 'Frank Miller', 'frank.miller@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(11, 'Grace Lee', 'grace.lee@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(12, 'Henry White', 'henry.white@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 14:09:04', NULL, 1, 1, '2025-11-02 14:09:04', '2025-11-02 14:09:04'),
(13, '123', '123@gmail.com', NULL, NULL, NULL, 'instructor', '$2b$12$fHqL/zMJkUMpicuUTs8.8ekejQkBPLsWmQWNY0zhgGfG3khpTLcKe', 0, 1, 0, NULL, '2025-11-02 14:11:31', NULL, 1, 1, '2025-11-02 14:11:31', '2025-11-02 14:11:31'),
(14, '123', '123@123.com', NULL, NULL, NULL, 'instructor', '$2b$12$GJ7NhNkfYfYBzPd3tLvqou2GUdAzAU9z3bmvCxl7GGhoCiXowPljO', 1, 1, 0, NULL, '2025-11-02 14:14:49', '2025-11-02 22:56:15', 1, 1, '2025-11-02 14:14:49', '2025-11-02 22:56:15'),
(15, '321', '321@321.com', NULL, NULL, NULL, 'student', '$2b$12$z62oU/42z5IF8od/v5yjLuDRoZY0H59xaZWToScsm3n07QXZ8kGuG', 1, 1, 0, NULL, '2025-11-02 14:17:36', '2025-11-02 22:51:39', 1, 1, '2025-11-02 14:17:36', '2025-11-02 22:51:39'),
(16, 'Andres Infante', 'pipe@gmail.com', NULL, NULL, NULL, 'student', '$2b$12$wwfgSakMOONAF9hgwVkwT.WkVl1NcOPK8Pl4T6kxvOGN46fp/umJS', 1, 1, 0, NULL, '2025-11-02 16:14:19', '2025-11-02 22:55:50', 1, 1, '2025-11-02 16:14:19', '2025-11-02 22:55:50'),
(18, 'Administrador LICEA', 'admi@licea.edu', NULL, NULL, 1, 'admin', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5JQZUkA/Wjbpm', 1, 1, 1, NULL, '2025-11-02 17:22:52', NULL, 1, 1, '2025-11-02 17:22:52', '2025-11-02 17:23:30'),
(19, 'manolo', 'man@man.com', NULL, NULL, 6, 'admin', '$2b$12$mP3yDffJGFYR7QpAOwEAJ.52Y4wgvm/CWMDeYDqC9FD2fC1Q6Kczq', 1, 1, 0, NULL, '2025-11-02 17:24:02', '2025-11-02 22:56:42', 1, 1, '2025-11-02 17:24:02', '2025-11-02 22:56:42'),
(20, 'alice', 'ali@ali.com', NULL, NULL, 6, 'student', '$2b$12$ke4.iG8ig9n7mcnMnKU8IunsCav69DE1GGwotbo1hf71BrbNZ2M2G', 1, 1, 0, NULL, '2025-11-02 17:39:49', NULL, 1, 1, '2025-11-02 17:39:49', '2025-11-02 17:39:49'),

-- 100 Usuarios Falsos Adicionales (21 - 120)
(21, 'Sofia Garcia', 'sofia.garcia@licea.edu', NULL, NULL, NULL, 'instructor', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(22, 'Ricardo Martinez', 'ricardo.martinez@licea.edu', NULL, NULL, NULL, 'instructor', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(23, 'Laura Lopez', 'laura.lopez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(24, 'Alejandro Perez', 'alejandro.perez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(25, 'Valeria Ramirez', 'valeria.ramirez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(26, 'Javier Torres', 'javier.torres@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(27, 'Isabella Diaz', 'isabella.diaz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(28, 'Mateo Vargas', 'mateo.vargas@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(29, 'Camila Soto', 'camila.soto@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(30, 'Daniel Herrera', 'daniel.herrera@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(31, 'Elena Castro', 'elena.castro@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(32, 'Fernando Gomez', 'fernando.gomez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(33, 'Gabriela Nuñez', 'gabriela.nunez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(34, 'Hugo Sanchez', 'hugo.sanchez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(35, 'Irene Molina', 'irene.molina@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(36, 'Jorge Rivera', 'jorge.rivera@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(37, 'Karen Silva', 'karen.silva@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(38, 'Luis Mendoza', 'luis.mendoza@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(39, 'Maria Peña', 'maria.pena@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(40, 'Nicolas Rojas', 'nicolas.rojas@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(41, 'Olivia Cruz', 'olivia.cruz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(42, 'Pablo Guzman', 'pablo.guzman@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(43, 'Quispe Fernandez', 'quispe.fernandez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(44, 'Rosa Salazar', 'rosa.salazar@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(45, 'Samuel Ochoa', 'samuel.ochoa@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(46, 'Teresa Gil', 'teresa.gil@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(47, 'Uriel Zapata', 'uriel.zapata@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(48, 'Victoria Lima', 'victoria.lima@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(49, 'William Soto', 'william.soto@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(50, 'Ximena Polo', 'ximena.polo@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(51, 'Yadira Quintero', 'yadira.quintero@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(52, 'Zoe Rivas', 'zoe.rivas@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(53, 'Adrian Leon', 'adrian.leon@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(54, 'Brenda Paz', 'brenda.paz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(55, 'Carlos Rey', 'carlos.rey@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(56, 'Diana Solis', 'diana.solis@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(57, 'Emilio Vega', 'emilio.vega@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(58, 'Fernanda Mora', 'fernanda.mora@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(59, 'Gerardo Toro', 'gerardo.toro@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(60, 'Hilda Valle', 'hilda.valle@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(61, 'Ignacio Soto', 'ignacio.soto@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(62, 'Jimena Luna', 'jimena.luna@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(63, 'Kevin Rios', 'kevin.rios@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(64, 'Liliana Mora', 'liliana.mora@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(65, 'Manuel Salas', 'manuel.salas@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(66, 'Natalia Vidal', 'natalia.vidal@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(67, 'Oscar Soto', 'oscar.soto@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(68, 'Paola Vega', 'paola.vega@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(69, 'Quique Reyes', 'quique.reyes@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(70, 'Raquel Velez', 'raquel.velez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(71, 'Sergio Leon', 'sergio.leon@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(72, 'Tamara Pinto', 'tamara.pinto@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(73, 'Ubaldo Ruiz', 'ubaldo.ruiz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(74, 'Viviana Lopez', 'viviana.lopez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(75, 'Walter Gomez', 'walter.gomez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(76, 'Yolanda Flores', 'yolanda.flores@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(77, 'Alvaro Gil', 'alvaro.gil@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(78, 'Beatriz Cruz', 'beatriz.cruz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(79, 'Camilo Peña', 'camilo.pena@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(80, 'Daniela Rojas', 'daniela.rojas@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(81, 'Elias Sanchez', 'elias.sanchez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(82, 'Fabiola Torres', 'fabiola.torres@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(83, 'Gabriel Vargas', 'gabriel.vargas@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(84, 'Helena Soto', 'helena.soto@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(85, 'Ivan Herrera', 'ivan.herrera@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(86, 'Jessica Castro', 'jessica.castro@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(87, 'Kevin Nuñez', 'kevin.nunez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(88, 'Luisa Mendoza', 'luisa.mendoza@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(89, 'Marco Leon', 'marco.leon@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(90, 'Nicole Rios', 'nicole.rios@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(91, 'Patricio Gil', 'patricio.gil@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(92, 'Renata Paz', 'renata.paz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(93, 'Santiago Vidal', 'santiago.vidal@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(94, 'Valentina Toro', 'valentina.toro@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(95, 'Andres Zapata', 'andres.zapata@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(96, 'Barbara Lima', 'barbara.lima@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(97, 'Cristian Rey', 'cristian.rey@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(98, 'Elizabeth Vega', 'elizabeth.vega@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(99, 'Felix Solis', 'felix.solis@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(100, 'Gina Velez', 'gina.velez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(101, 'Hector Guzman', 'hector.guzman@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(102, 'Irma Perez', 'irma.perez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(103, 'Jorge Quiroz', 'jorge.quiroz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(104, 'Karla Ruiz', 'karla.ruiz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(105, 'Leonardo Salas', 'leonardo.salas@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(106, 'Monica Zapata', 'monica.zapata@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(107, 'Nestor Castro', 'nestor.castro@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(108, 'Patricia Diaz', 'patricia.diaz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(109, 'Quentin Flores', 'quentin.flores@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(110, 'Regina Herrera', 'regina.herrera@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(111, 'Salvador Jimenez', 'salvador.jimenez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(112, 'Tatiana Morales', 'tatiana.morales@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(113, 'Ulises Nuñez', 'ulises.nunez@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(114, 'Veronica Ortiz', 'veronica.ortiz@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(115, 'Victor Peña', 'victor.pena@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(116, 'Wendy Quintero', 'wendy.quintero@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(117, 'Xavier Ramos', 'xavier.ramos@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(118, 'Yessenia Soto', 'yessenia.soto@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(119, 'Zacarías Torres', 'zacarias.torres@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00'),
(120, 'Zulma Valle', 'zulma.valle@student.licea.edu', NULL, NULL, NULL, 'student', '$2b$10$rQyGmJ5oX3.t8UKKMxFqD.5pFv8qX1t2pDKJsQtPh9UqLKx7Hs5by', 1, 1, 0, NULL, '2025-11-02 18:00:00', NULL, 1, 1, '2025-11-02 18:00:00', '2025-11-02 18:00:00');
-- --------------------------------------------------------

--
-- Estructura para la vista `instructor_course_summary`
--
DROP TABLE IF EXISTS `instructor_course_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `instructor_course_summary`  AS SELECT `u`.`id` AS `instructor_id`, `u`.`name` AS `instructor_name`, `c`.`id` AS `course_id`, `c`.`name` AS `course_name`, `c`.`code` AS `course_code`, count(distinct `ce`.`student_id`) AS `enrolled_students`, count(distinct `t`.`id`) AS `total_tasks`, count(distinct `m`.`id`) AS `total_materials`, `c`.`start_date` AS `start_date`, `c`.`end_date` AS `end_date`, `c`.`is_active` AS `is_active` FROM ((((`users` `u` join `courses` `c` on(`u`.`id` = `c`.`instructor_id`)) left join `course_enrollments` `ce` on(`c`.`id` = `ce`.`course_id` and `ce`.`status` = 'active')) left join `tasks` `t` on(`c`.`id` = `t`.`course_id`)) left join `materials` `m` on(`c`.`id` = `m`.`course_id`)) WHERE `u`.`role` = 'instructor' GROUP BY `u`.`id`, `c`.`id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `performance_analytics`
--
DROP TABLE IF EXISTS `performance_analytics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `performance_analytics`  AS SELECT `s`.`student_id` AS `student_id`, `s`.`course_id` AS `course_id`, avg(`sub`.`grade`) AS `average_grade`, count(`sub`.`id`) AS `total_submissions`, count(case when `sub`.`grade` >= 70 then 1 end) AS `passing_submissions`, count(case when `sub`.`submitted_at` > `t`.`due_date` then 1 end) AS `late_submissions`, avg(case when `a`.`status` = 'present' then 1 else 0 end) AS `attendance_rate`, count(distinct `a`.`date`) AS `total_classes`, max(`sub`.`submitted_at`) AS `last_submission_date` FROM (((`student_course_summary` `s` left join `submissions` `sub` on(`s`.`student_id` = `sub`.`student_id`)) left join `tasks` `t` on(`sub`.`task_id` = `t`.`id` and `t`.`course_id` = `s`.`course_id`)) left join `attendance` `a` on(`s`.`student_id` = `a`.`student_id` and `s`.`course_id` = `a`.`course_id`)) GROUP BY `s`.`student_id`, `s`.`course_id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `student_course_summary`
--
DROP TABLE IF EXISTS `student_course_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_course_summary`  AS SELECT `u`.`id` AS `student_id`, `u`.`name` AS `student_name`, `u`.`email` AS `student_email`, `c`.`id` AS `course_id`, `c`.`name` AS `course_name`, `c`.`code` AS `course_code`, `ce`.`enrollment_date` AS `enrollment_date`, `ce`.`status` AS `enrollment_status`, `ce`.`final_grade` AS `final_grade`, count(distinct `t`.`id`) AS `total_tasks`, count(distinct `s`.`id`) AS `submitted_tasks`, avg(`s`.`grade`) AS `average_grade`, count(distinct `a`.`id`) AS `total_attendance_records`, sum(case when `a`.`status` = 'present' then 1 else 0 end) AS `present_count` FROM (((((`users` `u` join `course_enrollments` `ce` on(`u`.`id` = `ce`.`student_id`)) join `courses` `c` on(`ce`.`course_id` = `c`.`id`)) left join `tasks` `t` on(`c`.`id` = `t`.`course_id` and `t`.`is_published` = 1)) left join `submissions` `s` on(`t`.`id` = `s`.`task_id` and `s`.`student_id` = `u`.`id` and `s`.`status` = 'graded')) left join `attendance` `a` on(`c`.`id` = `a`.`course_id` and `a`.`student_id` = `u`.`id`)) WHERE `u`.`role` = 'student' GROUP BY `u`.`id`, `c`.`id`, `ce`.`enrollment_date`, `ce`.`status`, `ce`.`final_grade` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ai_conversations`
--
ALTER TABLE `ai_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_created` (`user_id`,`created_at`);

--
-- Indices de la tabla `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resolved_by` (`resolved_by`),
  ADD KEY `idx_student` (`student_id`),
  ADD KEY `idx_course` (`course_id`),
  ADD KEY `idx_risk_level` (`risk_level`),
  ADD KEY `idx_type` (`alert_type`),
  ADD KEY `idx_unread` (`is_read`),
  ADD KEY `idx_unresolved` (`is_resolved`);

--
-- Indices de la tabla `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_attendance` (`course_id`,`student_id`,`date`),
  ADD KEY `recorded_by` (`recorded_by`),
  ADD KEY `idx_course_date` (`course_id`,`date`),
  ADD KEY `idx_student` (`student_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_attendance_student_date` (`student_id`,`date`);

--
-- Indices de la tabla `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_attendance` (`course_id`,`student_id`,`attendance_date`),
  ADD KEY `recorded_by` (`recorded_by`),
  ADD KEY `idx_course_date` (`course_id`,`attendance_date`),
  ADD KEY `idx_student` (`student_id`);

--
-- Indices de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_entity` (`entity_type`,`entity_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indices de la tabla `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indices de la tabla `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_conversation` (`conversation_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `idx_instructor` (`instructor_id`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_active` (`is_active`),
  ADD KEY `idx_level` (`level`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_courses_instructor_active` (`instructor_id`,`is_active`);

--
-- Indices de la tabla `course_enrollments`
--
ALTER TABLE `course_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_enrollment` (`course_id`,`student_id`),
  ADD KEY `idx_course` (`course_id`),
  ADD KEY `idx_student` (`student_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indices de la tabla `course_groups`
--
ALTER TABLE `course_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_group_name` (`course_id`,`name`),
  ADD UNIQUE KEY `join_code` (`join_code`),
  ADD KEY `idx_course` (`course_id`),
  ADD KEY `idx_join_code` (`join_code`),
  ADD KEY `fk_created_by` (`created_by`);

--
-- Indices de la tabla `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indices de la tabla `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_group_member` (`group_id`,`student_id`),
  ADD KEY `idx_group` (`group_id`),
  ADD KEY `idx_student` (`student_id`);

--
-- Indices de la tabla `group_messages`
--
ALTER TABLE `group_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_group_messages` (`group_id`,`created_at`),
  ADD KEY `idx_user_messages` (`user_id`);

--
-- Indices de la tabla `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_active` (`is_active`);

--
-- Indices de la tabla `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_course` (`course_id`),
  ADD KEY `idx_type` (`file_type`),
  ADD KEY `idx_order` (`order_index`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_read` (`user_id`,`is_read`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indices de la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_course` (`course_id`),
  ADD KEY `idx_task` (`task_id`),
  ADD KEY `idx_day` (`day_of_week`),
  ADD KEY `idx_start_time` (`start_time`),
  ADD KEY `idx_deadline` (`deadline`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_active` (`is_active`);

--
-- Indices de la tabla `study_groups`
--
ALTER TABLE `study_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indices de la tabla `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_submission` (`task_id`,`student_id`),
  ADD KEY `idx_task` (`task_id`),
  ADD KEY `idx_student` (`student_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_submitted` (`submitted_at`),
  ADD KEY `idx_submissions_student_status` (`student_id`,`status`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_course` (`course_id`),
  ADD KEY `idx_due_date` (`due_date`),
  ADD KEY `idx_published` (`is_published`),
  ADD KEY `idx_tasks_course_due` (`course_id`,`due_date`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_active` (`is_active`),
  ADD KEY `idx_users_email_role` (`email`,`role`),
  ADD KEY `idx_institution` (`institution_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ai_conversations`
--
ALTER TABLE `ai_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `attendance_records`
--
ALTER TABLE `attendance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `chat_conversations`
--
ALTER TABLE `chat_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `course_enrollments`
--
ALTER TABLE `course_enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `course_groups`
--
ALTER TABLE `course_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `group_messages`
--
ALTER TABLE `group_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `study_groups`
--
ALTER TABLE `study_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ai_conversations`
--
ALTER TABLE `ai_conversations`
  ADD CONSTRAINT `ai_conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alerts_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alerts_ibfk_3` FOREIGN KEY (`resolved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD CONSTRAINT `attendance_records_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_records_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_records_ibfk_3` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD CONSTRAINT `chat_conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `chat_conversations` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `course_enrollments`
--
ALTER TABLE `course_enrollments`
  ADD CONSTRAINT `course_enrollments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_enrollments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `course_groups`
--
ALTER TABLE `course_groups`
  ADD CONSTRAINT `course_groups_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD CONSTRAINT `email_verifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `course_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `group_messages`
--
ALTER TABLE `group_messages`
  ADD CONSTRAINT `group_messages_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `course_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `study_groups`
--
ALTER TABLE `study_groups`
  ADD CONSTRAINT `study_groups_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `study_groups_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_institution` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
