-- Extensión para IDs únicos (opcional)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tabla de Categorías (Alimento, Juguetes, Servicios, etc.)
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('PRODUCTO', 'SERVICIO'))
);

-- Tabla de Productos
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio NUMERIC(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    imagen_url VARCHAR(255),
    categoria_id INT REFERENCES categorias(id) ON DELETE SET NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Servicios (Peluquería, Veterinaria, Paseos, etc.)
CREATE TABLE servicios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio_base NUMERIC(10, 2) NOT NULL,
    duracion_minutos INT,
    categoria_id INT REFERENCES categorias(id) ON DELETE SET NULL
);

-- Tabla de Solicitudes/Reservas de Servicios
CREATE TABLE reservas (
    id SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    telefono_cliente VARCHAR(20) NOT NULL,
    email_cliente VARCHAR(100),
    servicio_id INT REFERENCES servicios(id),
    fecha_servicio DATE NOT NULL,
    hora_servicio TIME NOT NULL,
    estado VARCHAR(20) DEFAULT 'PENDIENTE' CHECK (estado IN ('PENDIENTE', 'CONFIRMADO', 'CANCELADO')),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);