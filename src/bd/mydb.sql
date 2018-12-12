-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2018 a las 05:14:58
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `nombre_curso` varchar(95) DEFAULT NULL,
  `nivel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `nombre_curso`, `nivel`) VALUES
(1, 'ASCD', '1'),
(2, 'ADF', '1'),
(3, 'FF', '1'),
(4, 'pasar las materia', '1'),
(5, 'GRAMATICA', '1'),
(6, 'juegos mentales', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_cuenta`
--

CREATE TABLE `datos_cuenta` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(85) NOT NULL,
  `password` varchar(85) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_personales`
--

CREATE TABLE `datos_personales` (
  `id_datos` int(11) NOT NULL,
  `nombre` varchar(85) DEFAULT NULL,
  `a_paterno` varchar(85) DEFAULT NULL,
  `a_materno` varchar(85) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distractores_pregunta`
--

CREATE TABLE `distractores_pregunta` (
  `id_distractor` int(11) NOT NULL,
  `distractor` varchar(45) DEFAULT NULL,
  `id_ejercicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicios`
--

CREATE TABLE `ejercicios` (
  `id_ejercicio` int(11) NOT NULL,
  `nombre_ejercicio` varchar(45) DEFAULT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `id_temas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inteligencias`
--

CREATE TABLE `inteligencias` (
  `id_inteligencias` int(11) NOT NULL,
  `tipo_de_inteligencia` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_test_inteligencia`
--

CREATE TABLE `preguntas_test_inteligencia` (
  `id_pregunta_test` int(11) NOT NULL,
  `num_pregunta` int(11) DEFAULT NULL,
  `pregunta` blob,
  `id_inteligencias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `id_resultados` int(11) NOT NULL,
  `respuestas_correctas` int(11) DEFAULT NULL,
  `respuestas_incorrectas` int(11) DEFAULT NULL,
  `id_ejercicio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_ejercicios`
--

CREATE TABLE `resultados_ejercicios` (
  `id_resultado_ejercicio` int(11) NOT NULL,
  `acierto` tinyint(1) DEFAULT NULL,
  `id_ejercicio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_test_inteligencia`
--

CREATE TABLE `resultados_test_inteligencia` (
  `valor` int(11) DEFAULT NULL,
  `id_test` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retroalimentacion_preguntas`
--

CREATE TABLE `retroalimentacion_preguntas` (
  `id_retroalimentacion` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL,
  `id_temas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas_curso`
--

CREATE TABLE `temas_curso` (
  `id_temas` int(11) NOT NULL,
  `nombre_tema` varchar(45) DEFAULT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `temas_curso`
--

INSERT INTO `temas_curso` (`id_temas`, `nombre_tema`, `id_curso`) VALUES
(1, 'abc de l abecedario', 1),
(2, 'sdds', 1),
(3, 'asgfg', 2),
(5, 'asd', 5),
(6, 'drogas', 3),
(7, 'fffffss', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo` int(11) NOT NULL,
  `nombre_tipo_usuario` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `datos_cuenta`
--
ALTER TABLE `datos_cuenta`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario_UNIQUE` (`usuario`);

--
-- Indices de la tabla `datos_personales`
--
ALTER TABLE `datos_personales`
  ADD PRIMARY KEY (`id_datos`),
  ADD KEY `fk_datos_personales_tipo_usuario1_idx` (`id_tipo`),
  ADD KEY `fk_datos_personales_datos_cuenta1_idx` (`id_usuario`);

--
-- Indices de la tabla `distractores_pregunta`
--
ALTER TABLE `distractores_pregunta`
  ADD PRIMARY KEY (`id_distractor`),
  ADD KEY `fk_distractores_de_pregunta_ejercicios1_idx` (`id_ejercicio`);

--
-- Indices de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD PRIMARY KEY (`id_ejercicio`),
  ADD KEY `fk_ejercicios_temas_curso1_idx` (`id_temas`);

--
-- Indices de la tabla `inteligencias`
--
ALTER TABLE `inteligencias`
  ADD PRIMARY KEY (`id_inteligencias`);

--
-- Indices de la tabla `preguntas_test_inteligencia`
--
ALTER TABLE `preguntas_test_inteligencia`
  ADD PRIMARY KEY (`id_pregunta_test`),
  ADD KEY `fk_preguntas_test_inteligencia_inteligencias1_idx` (`id_inteligencias`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`id_resultados`),
  ADD KEY `fk_resultados_ejercicios1_idx` (`id_ejercicio`),
  ADD KEY `fk_resultados_datos_personales2_idx` (`id_usuario`);

--
-- Indices de la tabla `resultados_ejercicios`
--
ALTER TABLE `resultados_ejercicios`
  ADD PRIMARY KEY (`id_resultado_ejercicio`),
  ADD UNIQUE KEY `id_resultado_ejercicio_UNIQUE` (`id_resultado_ejercicio`),
  ADD KEY `fk_resultados_ejercicios_ejercicios1_idx` (`id_ejercicio`),
  ADD KEY `fk_resultados_ejercicios_datos_personales1_idx` (`id_usuario`);

--
-- Indices de la tabla `resultados_test_inteligencia`
--
ALTER TABLE `resultados_test_inteligencia`
  ADD KEY `fk_resultados_preguntas_test_inteligencia1_idx` (`id_test`),
  ADD KEY `fk_resultados_datos_personales1_idx` (`id_usuario`);

--
-- Indices de la tabla `retroalimentacion_preguntas`
--
ALTER TABLE `retroalimentacion_preguntas`
  ADD PRIMARY KEY (`id_retroalimentacion`),
  ADD KEY `fk_retroalimentacion_preguntas_ejercicios1_idx` (`id_ejercicio`),
  ADD KEY `fk_retroalimentacion_preguntas_temas_curso1_idx` (`id_temas`);

--
-- Indices de la tabla `temas_curso`
--
ALTER TABLE `temas_curso`
  ADD PRIMARY KEY (`id_temas`),
  ADD KEY `fk_temas_curso_curso1_idx` (`id_curso`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datos_personales`
--
ALTER TABLE `datos_personales`
  ADD CONSTRAINT `fk_datos_personales_datos_cuenta1` FOREIGN KEY (`id_usuario`) REFERENCES `datos_cuenta` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_personales_tipo_usuario1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_usuario` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `distractores_pregunta`
--
ALTER TABLE `distractores_pregunta`
  ADD CONSTRAINT `fk_distractores_de_pregunta_ejercicios1` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicios` (`id_ejercicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD CONSTRAINT `fk_ejercicios_temas_curso1` FOREIGN KEY (`id_temas`) REFERENCES `temas_curso` (`id_temas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `preguntas_test_inteligencia`
--
ALTER TABLE `preguntas_test_inteligencia`
  ADD CONSTRAINT `fk_preguntas_test_inteligencia_inteligencias1` FOREIGN KEY (`id_inteligencias`) REFERENCES `inteligencias` (`id_inteligencias`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD CONSTRAINT `fk_resultados_datos_personales2` FOREIGN KEY (`id_usuario`) REFERENCES `datos_personales` (`id_datos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_resultados_ejercicios1` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicios` (`id_ejercicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `resultados_ejercicios`
--
ALTER TABLE `resultados_ejercicios`
  ADD CONSTRAINT `fk_resultados_ejercicios_datos_personales1` FOREIGN KEY (`id_usuario`) REFERENCES `datos_personales` (`id_datos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_resultados_ejercicios_ejercicios1` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicios` (`id_ejercicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `resultados_test_inteligencia`
--
ALTER TABLE `resultados_test_inteligencia`
  ADD CONSTRAINT `fk_resultados_datos_personales1` FOREIGN KEY (`id_usuario`) REFERENCES `datos_personales` (`id_datos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_resultados_preguntas_test_inteligencia1` FOREIGN KEY (`id_test`) REFERENCES `preguntas_test_inteligencia` (`id_pregunta_test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `retroalimentacion_preguntas`
--
ALTER TABLE `retroalimentacion_preguntas`
  ADD CONSTRAINT `fk_retroalimentacion_preguntas_ejercicios1` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicios` (`id_ejercicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_retroalimentacion_preguntas_temas_curso1` FOREIGN KEY (`id_temas`) REFERENCES `temas_curso` (`id_temas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `temas_curso`
--
ALTER TABLE `temas_curso`
  ADD CONSTRAINT `fk_temas_curso_curso1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
