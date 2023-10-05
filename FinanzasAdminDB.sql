CREATE DATABASE FinanzasAdminDBtest;
GO

USE FinanzasAdminDBtest;
GO

CREATE TABLE TiposOperaciones (
    Id INT IDENTITY(1,1),
    Descripcion NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_TiposOperaciones PRIMARY KEY (Id),
);
GO

CREATE TABLE Usuarios (
    Id INT IDENTITY(1,1),
    Email NVARCHAR(256) NOT NULL,
    EmailNormalizado NVARCHAR(256) NOT NULL,
    PasswordHash NVARCHAR(MAX) NOT NULL,
    CONSTRAINT PK_Usuarios PRIMARY KEY (Id),
);
GO

CREATE TABLE Categorias (
    Id INT IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    TipoOperacionId INT NOT NULL,
    UsuarioId INT NOT NULL,
    CONSTRAINT PK_Categorias PRIMARY KEY (Id),
    CONSTRAINT FK_Categorias_TiposOperaciones FOREIGN KEY (TipoOperacionId) REFERENCES TiposOperaciones(Id),
    CONSTRAINT FK_Categorias_Usuarios FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id)
);
GO

CREATE TABLE TiposCuentas (
    Id INT IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    UsuarioId INT NOT NULL,
    Orden INT NOT NULL,
    CONSTRAINT PK_TiposCuentas PRIMARY KEY (Id),
    CONSTRAINT FK_TiposCuentas_Usuarios FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id)
);
GO

CREATE TABLE Cuentas (
    Id INT IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    TipoCuentaId INT NOT NULL,
    Balance DECIMAL(18,2) NOT NULL,
    Descripcion NVARCHAR(1000),
    CONSTRAINT PK_Cuentas PRIMARY KEY (Id),
    CONSTRAINT FK_Cuentas_TiposCuentas FOREIGN KEY (TipoCuentaId) REFERENCES TiposCuentas(Id)
);
GO

CREATE TABLE Transacciones (
    Id INT IDENTITY(1,1),
    UsuarioId INT NOT NULL,
    FechaTransaccion DATETIME NOT NULL,
    Monto DECIMAL(18, 2) NOT NULL,
    TipoOperacionId INT NOT NULL,
    Nota NVARCHAR(1000),
    CuentaId INT NOT NULL,
    CategoriaId INT NOT NULL,
    CONSTRAINT PK_Transacciones PRIMARY KEY (Id),
    CONSTRAINT FK_Transacciones_Usuarios FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id),
    CONSTRAINT FK_Transacciones_TiposOperaciones FOREIGN KEY (TipoOperacionId) REFERENCES TiposOperaciones(Id),
    CONSTRAINT FK_Transacciones_Cuentas FOREIGN KEY (CuentaId) REFERENCES Cuentas(Id),
    CONSTRAINT FK_Transacciones_Categorias FOREIGN KEY (CategoriaId) REFERENCES Categorias(Id)
);
GO
