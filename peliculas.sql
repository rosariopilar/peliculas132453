-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33065
-- Tiempo de generación: 19-06-2022 a las 03:11:17
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `peliculas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `idalquiler` int(5) NOT NULL,
  `precio` double NOT NULL,
  `id_clientes` int(5) NOT NULL,
  `fecha_alquiler` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `estado_a` varchar(1) NOT NULL COMMENT 'A:activo I:inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`idalquiler`, `precio`, `id_clientes`, `fecha_alquiler`, `fecha_devolucion`, `estado_a`) VALUES
(1, 5.5, 1, '2022-06-18', '2022-06-25', 'A'),
(2, 12.5, 2, '2022-06-22', '2022-06-29', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(5) NOT NULL,
  `nomcliente` varchar(50) NOT NULL,
  `apecliente` varchar(50) NOT NULL,
  `telef` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `nomcliente`, `apecliente`, `telef`) VALUES
(1, 'Fernando', 'Martinez', '5632547'),
(2, 'Julio', 'Gomez', '925478589'),
(3, 'Rodolfo', 'Juarez', '963425178');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `idpriv` int(5) NOT NULL,
  `nompriv` varchar(100) NOT NULL,
  `estadopriv` varchar(1) NOT NULL COMMENT 'A:activo I:inactivo',
  `parent` int(1) NOT NULL,
  `modulo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`idpriv`, `nompriv`, `estadopriv`, `parent`, `modulo`) VALUES
(1, 'Gestion de Clientes', 'A', 0, 'GestionClientes'),
(2, 'Gestion de Alquiler', 'A', 0, 'GestionAlquiler');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idrol` int(5) NOT NULL,
  `nomrol` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estadorol` varchar(1) NOT NULL COMMENT 'A: activo I:inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idrol`, `nomrol`, `descripcion`, `estadorol`) VALUES
(1, 'Administrador', 'Control Total', 'A'),
(2, 'Trabajador', 'Ciertos privilegios', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_has_privilegios`
--

CREATE TABLE `roles_has_privilegios` (
  `id` int(5) NOT NULL,
  `idrol` int(5) NOT NULL,
  `idpriv` int(5) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT 'A:activo I:inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles_has_privilegios`
--

INSERT INTO `roles_has_privilegios` (`id`, `idrol`, `idpriv`, `estado`) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idusers` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `estadousers` varchar(1) NOT NULL COMMENT 'A: activo I:inactivo',
  `idrol` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idusers`, `name`, `password`, `email`, `estadousers`, `idrol`) VALUES
(1, 'cesar', '123456', 'cesar@gmail.com', 'A', 1),
(2, 'Rosario', '123456', 'rosario@gmail.com', 'A', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`idalquiler`),
  ADD KEY `id_clientes` (`id_clientes`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`idpriv`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `roles_has_privilegios`
--
ALTER TABLE `roles_has_privilegios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idrol` (`idrol`),
  ADD KEY `idpriv` (`idpriv`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`),
  ADD KEY `idrol` (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `idalquiler` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idpriv` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles_has_privilegios`
--
ALTER TABLE `roles_has_privilegios`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `alquiler_ibfk_1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles_has_privilegios`
--
ALTER TABLE `roles_has_privilegios`
  ADD CONSTRAINT `roles_has_privilegios_ibfk_1` FOREIGN KEY (`idpriv`) REFERENCES `privilegios` (`idpriv`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_has_privilegios_ibfk_2` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
