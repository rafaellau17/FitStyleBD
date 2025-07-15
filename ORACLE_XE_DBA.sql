
--creacion de tablas 
CREATE TABLE Colores (
  Id_Color NUMBER(9) NOT NULL,
  Nombre VARCHAR2(100) NOT NULL,
  CONSTRAINT Colores_PK PRIMARY KEY (Id_Color)
);

CREATE TABLE Marcas (
  Id_Marca NUMBER(9) NOT NULL,
  Nombre VARCHAR2(100) NOT NULL,
  Descuento NUMBER(3,2),
  CONSTRAINT Marcas_PK PRIMARY KEY (Id_Marca)
);

CREATE TABLE Ocasiones (
  Id_Ocasion NUMBER(9) NOT NULL,
  Nombre VARCHAR2(100) NOT NULL,
  CONSTRAINT Ocasiones_PK PRIMARY KEY (Id_Ocasion)
);

CREATE TABLE Pieles (
  Id_Piel NUMBER(9) NOT NULL,
  Nombre VARCHAR2(100) NOT NULL,
  CONSTRAINT Pieles_PK PRIMARY KEY (Id_Piel)
);

CREATE TABLE Temporadas (
  Id_Temporada NUMBER(9) NOT NULL,
  Nombre VARCHAR2(100) NOT NULL,
  CONSTRAINT Temporadas_PK PRIMARY KEY (Id_Temporada)
);

CREATE TABLE Tipo_Prendas (
  Id_Tipo_Prenda NUMBER(9) NOT NULL,
  Nombre VARCHAR2(100) NOT NULL,
  CONSTRAINT Tipo_Prendas_PK PRIMARY KEY (Id_Tipo_Prenda)
);

CREATE TABLE Usuarios (
  Id_Usuario NUMBER(9) NOT NULL,
  Nombre VARCHAR2(100) NOT NULL,
  Altura NUMBER(5,2),
  Email VARCHAR2(50),
  Contraseña VARCHAR2(50),
  Peso NUMBER(5,2),
  Genero NUMBER,
  Suscripcion NUMBER,
  Pieles_Id_Piel NUMBER(9) NOT NULL,
  CONSTRAINT Usuarios_PK PRIMARY KEY (Id_Usuario)
);

CREATE TABLE Outfits (
  Id_Outfit NUMBER(9) NOT NULL,
  Nombre VARCHAR2(20) NOT NULL,
  Usuarios_Id_Usuario NUMBER(9) NOT NULL,
  CONSTRAINT Outfits_PK PRIMARY KEY (Id_Outfit)
);

CREATE TABLE Prendas (
  Id_Prenda NUMBER(9) NOT NULL,
  Nombre VARCHAR2(50) NOT NULL,
  Descripcion VARCHAR2(500),
  Precio NUMBER(6,2),
  Genero NUMBER,
  Material VARCHAR2(50),
  URL VARCHAR2(200),
  Tipo_Prendas_Id_Tipo_Prenda NUMBER(9) NOT NULL,
  Temporadas_Id_Temporada NUMBER(9) NOT NULL,
  Colores_Id_Color NUMBER(9) NOT NULL,
  Ocasiones_Id_Ocasion NUMBER(9) NOT NULL,
  Marcas_Id_Marca NUMBER(9) NOT NULL,
  CONSTRAINT Prendas_PK PRIMARY KEY (Id_Prenda)
);

CREATE TABLE Prendas_Outfits (
  Prendas_Id_Prenda NUMBER(9) NOT NULL,
  Outfits_Id_Outfit NUMBER(9) NOT NULL,
  CONSTRAINT Prendas_Outfits_PK PRIMARY KEY (Prendas_Id_Prenda, Outfits_Id_Outfit)
);

CREATE TABLE Valoraciones (
  Id_Valoracion NUMBER(9) NOT NULL,
  Comentario VARCHAR2(500),
  Estrellas NUMBER(1) NOT NULL,
  Outfits_Id_Outfit NUMBER(9) NOT NULL,
  CONSTRAINT Valoraciones_PK PRIMARY KEY (Id_Valoracion)
);



-- 2. CLAVES FORÁNEAS

ALTER TABLE Usuarios ADD CONSTRAINT Usuarios_Pieles_FK FOREIGN KEY (Pieles_Id_Piel) REFERENCES Pieles(Id_Piel);
ALTER TABLE Outfits ADD CONSTRAINT Outfits_Usuarios_FK FOREIGN KEY (Usuarios_Id_Usuario) REFERENCES Usuarios(Id_Usuario);
ALTER TABLE Prendas ADD CONSTRAINT Prendas_Colores_FK FOREIGN KEY (Colores_Id_Color) REFERENCES Colores(Id_Color);
ALTER TABLE Prendas ADD CONSTRAINT Prendas_Marcas_FK FOREIGN KEY (Marcas_Id_Marca) REFERENCES Marcas(Id_Marca);
ALTER TABLE Prendas ADD CONSTRAINT Prendas_Ocasiones_FK FOREIGN KEY (Ocasiones_Id_Ocasion) REFERENCES Ocasiones(Id_Ocasion);
ALTER TABLE Prendas ADD CONSTRAINT Prendas_Temporadas_FK FOREIGN KEY (Temporadas_Id_Temporada) REFERENCES Temporadas(Id_Temporada);
ALTER TABLE Prendas ADD CONSTRAINT Prendas_Tipo_Prendas_FK FOREIGN KEY (Tipo_Prendas_Id_Tipo_Prenda) REFERENCES Tipo_Prendas(Id_Tipo_Prenda);
ALTER TABLE Prendas_Outfits ADD CONSTRAINT Prendas_Outfits_Prendas_FK FOREIGN KEY (Prendas_Id_Prenda) REFERENCES Prendas(Id_Prenda);
ALTER TABLE Prendas_Outfits ADD CONSTRAINT Prendas_Outfits_Outfits_FK FOREIGN KEY (Outfits_Id_Outfit) REFERENCES Outfits(Id_Outfit);
ALTER TABLE Valoraciones ADD CONSTRAINT Valoraciones_Outfits_FK FOREIGN KEY (Outfits_Id_Outfit) REFERENCES Outfits(Id_Outfit);


-- 3. INSERTS
-- Tabla: Colores
INSERT INTO Colores VALUES (1, 'Rojo');
INSERT INTO Colores VALUES (2, 'Azul');
INSERT INTO Colores VALUES (3, 'Negro');
INSERT INTO Colores VALUES (4, 'Blanco');
INSERT INTO Colores VALUES (5, 'Verde');
INSERT INTO Colores VALUES (6, 'Amarillo');
INSERT INTO Colores VALUES (7, 'Naranja');
INSERT INTO Colores VALUES (8, 'Rosa');
INSERT INTO Colores VALUES (9, 'Morado');
INSERT INTO Colores VALUES (10, 'Marrón');
INSERT INTO Colores VALUES(11,'AmarilloAzul');
INSERT INTO Colores VALUES (12,'AmarilloBlanco');
INSERT INTO Colores VALUES (13,'AmarilloMarrón');
INSERT INTO Colores VALUES  (14,'AmarilloMorado');
INSERT INTO Colores VALUES  (15,'AmarilloNaranja');



-- Tabla: Marcas
INSERT INTO Marcas VALUES (1, 'HandM', 0.10);
INSERT INTO Marcas VALUES (2, 'Platanitos', 0.15);
INSERT INTO Marcas VALUES(3, 'Zara', 0.05);
INSERT INTO Marcas VALUES (4, 'Dockers', 0.20);


-- Tabla: Ocasiones
INSERT INTO Ocasiones VALUES (1, 'Casual');
INSERT INTO Ocasiones VALUES(2, 'Formal');
INSERT INTO Ocasiones VALUES(3, 'Deportivo');

-- Tabla: Pieles
INSERT INTO Pieles VALUES (1, 'Clara');
INSERT INTO Pieles VALUES (2, 'Media');
INSERT INTO Pieles VALUES (3, 'Oscura');

-- Tabla: Temporadas
INSERT INTO Temporadas VALUES (1, 'Verano');
INSERT INTO Temporadas VALUES (2, 'Otoño');
INSERT INTO Temporadas VALUES (3, 'Invierno');
INSERT INTO Temporadas VALUES (4, 'Primavera');

-- Tabla: Tipo_Prendas
INSERT INTO Tipo_Prendas VALUES (1, 'Polo');
INSERT INTO Tipo_Prendas VALUES (2, 'Pantalón');
INSERT INTO Tipo_Prendas VALUES (3, 'Camisa');
INSERT INTO Tipo_Prendas VALUES(4, 'Polera');
INSERT INTO Tipo_Prendas VALUES (5, 'Chaleco');
INSERT INTO Tipo_Prendas VALUES(6, 'Casaca');
INSERT INTO Tipo_Prendas VALUES (7, 'Falda');
INSERT INTO Tipo_Prendas VALUES (8, 'Shorts');
INSERT INTO Tipo_Prendas VALUES (9, 'Vestido');
INSERT INTO Tipo_Prendas VALUES (10, 'Traje');




-- Tabla: Usuarios
INSERT INTO Usuarios VALUES (1, 'Ana Pérez', 1.65, 'ana@example.com', 'clave123', 58.0, 1, 1, 1);

INSERT INTO Usuarios VALUES (2, 'Pedro López', 1.8, 'pedro lópez40@example.com', 'clave2', 80.8, 1, 0, 3);

INSERT INTO Usuarios VALUES (3, 'Pedro García', 1.7, 'pedro garcía45@example.com', 'clave3', 55.0, 1, 0, 1);

INSERT INTO Usuarios VALUES (4, 'Juan Pérez', 1.54, 'juan pérez68@example.com', 'clave4', 58.3, 2, 0, 3);

INSERT INTO Usuarios VALUES (
  5, 'Luis Gómez', 1.75, 'luisgomez@example.com', 'clave5', 72.0, 1, 0, 2
);


INSERT INTO Usuarios VALUES (6, 'Carlos García', 1.71, 'carlos garcía28@example.com', 'clave6', 63.6, 1, 0, 3);

INSERT INTO Usuarios VALUES (7, 'Pedro López', 1.83, 'pedro lópez77@example.com', 'clave7', 56.5, 2, 1, 3);

INSERT INTO Usuarios VALUES (8, 'Juan López', 1.88, 'juan lópez79@example.com', 'clave8', 56.4, 1, 1, 1);

INSERT INTO Usuarios VALUES (9, 'Ana Pérez', 1.51, 'ana pérez95@example.com', 'clave9', 79.4, 1, 0, 3);

INSERT INTO Usuarios VALUES (10, 'Luis Pérez', 1.65, 'luis pérez92@example.com', 'clave10', 71.5, 1, 1, 3);

--insercion de outfits
INSERT INTO Outfits VALUES (2, 'Look 2', 2);
INSERT INTO Outfits VALUES (3, 'Look 3', 3);
INSERT INTO Outfits VALUES (4, 'Look 4', 4);
INSERT INTO Outfits VALUES (5, 'Look 5', 5);

-- Tabla: Valoraciones

INSERT INTO Valoraciones VALUES (1, 'Muy cómodo y con buen estilo para el día a día.', 5, 2);
INSERT INTO Valoraciones VALUES (2, 'Los colores no combinan del todo bien.', 3, 2);
INSERT INTO Valoraciones VALUES (3, 'Perfecto para eventos casuales, me encantó.', 4, 3);
INSERT INTO Valoraciones VALUES (4, 'El material no es tan cómodo como esperaba.', 2, 4);
INSERT INTO Valoraciones VALUES (5, 'Excelente combinación, muy elegante.', 5, 2);
INSERT INTO Valoraciones VALUES (6, 'Demasiado simple, no destaca.', 2, 3);
INSERT INTO Valoraciones VALUES (7, 'Buena calidad y diseño moderno.', 4, 3);
INSERT INTO Valoraciones VALUES (8, 'No es mi estilo, pero está bien hecho.', 3, 4);
INSERT INTO Valoraciones VALUES (9, 'Fantástico para el clima frío.', 5, 4);
INSERT INTO Valoraciones VALUES (10, 'Muy original, recibí muchos cumplidos.', 5, 2);
INSERT INTO Valoraciones (Id_Valoracion, Comentario, Estrellas, Outfits_Id_Outfit) VALUES (11, 'Excelente combinación, muy elegante.', 5, 5);
INSERT INTO Valoraciones (Id_Valoracion, Comentario, Estrellas, Outfits_Id_Outfit) VALUES (12, 'Muy original, recibí muchos cumplidos.', 5, 5);

-- insercion de prendas 
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (1, 'Casaca Denim Hombre Hancko', 'Casaca denim con forro de peluche, ideal para clima frío.', 189.90, 1, 'Algodón', 'https://simple.ripley.com.pe/casaca-denim-para-hombre-hancko-pmp00003517075?color_80=cianYs=mdco', 2, 4, 2, 2, 2);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (2, 'Polo Estampado Hombre Umbro DR22036-V92', 'Polo básico estampado, cómodo y versátil.', 59.90, 1, 'Algodón', 'https://simple.ripley.com.pe/polo-umbro-para-hombre-basico-estampado-dr22036-v92-2020310542104', 3, 3, 3, 3, 3);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (3, 'Camisa Oxford Hombre Premium Largo UV Indusbord', 'Camisa Oxford con protección UV, ideal para uso diario.', 89.50, 1, 'Algodón', 'https://simple.ripley.cl/camisa-oxford-hombre-premium-largo-uv-indusbordr_-mpm10001858967', 4, 2, 4, 3, 4);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (4, 'Pantalón Chino Dockers Original Fit', 'Pantalón chino de corte clásico, cómodo y elegante.', 129.00, 1, 'Algodón', 'https://simple.ripley.com.pe/pantalon-casual-skinny-hombre-dockers-original-chino-fit-pmp20000419775', 5, 3, 5, 1, 4);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (5, 'Short Deportivo Hombre Nike Challenger', 'Short deportivo ligero, ideal para correr.', 79.90, 1, 'Poliéster', 'https://simple.ripley.com.pe/short-deportivo-challenger-nike-para-hombre-2020319648692?color_80=negroYs=mdco', 1, 2, 6, 1, 1);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (6, 'Casaca Denim Mujer Pionier Azul Nyna', 'Casaca denim para mujer, estilo clásico.', 149.90, 2, 'Algodón', 'https://simple.ripley.com.pe/casaca-denim-mujer-nyna-pmp20000308987', 2, 2, 7, 2, 2);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (7, 'Polo Básico Estampado DR22037-LMG Umbro', 'Polo estampado multicolor, cómodo y casual.', 59.90, 1, 'Algodón', 'https://simple.ripley.com.pe/polo-basico-estampado-dr22037-lmg-umbro-para-hombre-2020310542258?color_80=multicolorYs=mdco', 3, 4, 8, 3, 3);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (8, 'Camisa Oxford Hombre Arrow', 'Camisa Oxford de alta calidad, ideal para ocasiones formales.', 89.50, 1, 'Algodón', 'https://simple.ripley.cl/camisa-oxford-arrow-2000395171895', 4, 1, 9, 2, 4);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (9, 'Pantalón Chino Slim Fit Dockers', 'Pantalón chino slim fit, versátil y moderno.', 129.00, 1, 'Algodón', 'https://simple.ripley.cl/pantalon-hombre-algodon-slim-fit-dockers-chino-2000392240280', 5, 2, 10, 1, 3);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (10, 'Short Deportivo Hombre Joma Maxi Azul Marino', 'Short deportivo cómodo, ideal para entrenamientos.', 79.90, 1, 'Poliéster', 'https://simple.ripley.cl/short-deportivo-hombre-maxi-joma-or-azul-marino-mpm10001429399', 1, 3, 1, 1, 1);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (11, 'Casaca Denim Mujer Gzuck Meredak', 'Casaca denim con diseño moderno para mujer.', 149.90, 2, 'Algodón', 'https://simple.ripley.com.pe/casaca-denim-mujer-gzuck-meredak-pmp20000309003?color_80=azulYs=mdco', 2, 4, 2, 2, 2);
INSERT INTO Prendas (Id_Prenda, Nombre, Descripcion, Precio, Genero, Material, URL, Tipo_Prendas_Id_Tipo_Prenda, Temporadas_Id_Temporada, Colores_Id_Color, Ocasiones_Id_Ocasion, Marcas_Id_Marca) VALUES (12, 'Polo Estampado Hombre Umbro DR22039-LMG', 'Polo estampado con diseño llamativo, ideal para uso diario.', 59.90, 1, 'Algodón', 'https://simple.ripley.com.pe/polo-basico-estampado-dr22039-lmg-umbro-para-hombre-2020310542609', 3, 1, 3, 3, 3);


DELETE FROM prendas_outfits;
INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (1, 2);
INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (2, 2);

INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (3, 3);
INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (2, 3);

INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (7, 4);
INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (6, 4);

INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (7, 5);
INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (2, 5);



--PONER DESPUES DE LAS CLAVES FORANEAS ANTES DE LOS INSERTS
-- FUNCION 13 TRIGGER--
ALTER TABLE Usuarios ADD Activo NUMBER(1) DEFAULT 0;

CREATE OR REPLACE TRIGGER usuario_activoValoracion
AFTER INSERT ON Valoraciones
FOR EACH ROW
DECLARE
  valor_idUsuario number;
BEGIN
  
  SELECT O.Usuarios_Id_Usuario
  INTO valor_idUsuario
  FROM Outfits O
  WHERE O.Id_Outfit = :NEW.Outfits_Id_Outfit;

  UPDATE Usuarios
  SET Activo = 1
  WHERE Id_Usuario = valor_idUsuario;
END;
/

------------------------------------------------

DELETE FROM Valoraciones;
COMMIT;


—------------------------------------------
-- funcion 12: halla el fit mas valorado por el usuario
CREATE OR REPLACE FUNCTION fit_masValorado_id(id_usuarioPedido NUMBER)
return number is
id_fit number;
begin
    select v.Outfits_Id_Outfit
    into id_fit
    from Valoraciones v
    JOIN Outfits O ON v.Outfits_Id_Outfit = O.Id_Outfit
    WHERE O.Usuarios_Id_Usuario= id_usuarioPedido
    GROUP BY v.Outfits_Id_Outfit
    ORDER BY AVG(Estrellas) DESC
    fetch first 1 rows only;

    RETURN id_fit;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
     RETURN NULL;
    END;
    /

select fit_masValorado_id(2) from dual;    

------------------
--13 FUNCION DEL TRIGGER
CREATE OR REPLACE FUNCTION esta_activo(idUsuario_pedir number)
return VARCHAR2 is 
  valor_estado number;
BEGIN
  SELECT Activo INTO valor_estado FROM Usuarios WHERE Id_Usuario = idUsuario_pedir;

  IF valor_estado = 1 THEN
    RETURN 'activo';
  ELSE
    RETURN 'inactivo';
  END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'no existe usuario';
END;
/

SELECT Id_Usuario, Nombre, Activo FROM Usuarios ORDER BY Id_Usuario;
SELECT esta_activo(1) FROM dual;




CREATE OR REPLACE TRIGGER email_unico
BEFORE INSERT OR UPDATE ON Usuarios
FOR EACH ROW
DECLARE
  contador NUMBER;
BEGIN
  IF INSERTING THEN
    SELECT COUNT(*) INTO contador FROM Usuarios WHERE Email = :NEW.Email;
  ELSE
    SELECT COUNT(*) INTO contador FROM Usuarios WHERE Email = :NEW.Email AND Id_Usuario <> :NEW.Id_Usuario;
  END IF;
  IF contador > 0 THEN
    RAISE_APPLICATION_ERROR(-20020,' No se inserto ya existe ese email "' || :NEW.Email || '".');
  END IF;
END;
/
- 
—----------TRIGGER—--------
CREATE OR REPLACE TRIGGER limitar_outfits_para_no_suscritos
BEFORE INSERT ON Outfits
FOR EACH ROW
DECLARE
  contador NUMBER;
  sub   NUMBER;
BEGIN
  SELECT COUNT(*) INTO contador
    FROM Outfits
   WHERE Usuarios_Id_Usuario = :NEW.Usuarios_Id_Usuario;

  SELECT Suscripcion INTO sub
    FROM Usuarios
   WHERE Id_Usuario = :NEW.Usuarios_Id_Usuario;

  IF sub = 0 AND contador >= 5 THEN
    RAISE_APPLICATION_ERROR(-20040,'Los usuarios sin suscripción solo pueden guardar hasta 5 outfits. Deneggado' ||'Por favor, suscríbete para crear más looks.');
  END IF;
END;
/

----- Insercion necesaria

INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (1, 2);
INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (2, 2);

INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (3, 3);
INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (2, 3);

INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (7, 4);
INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (6, 4);

INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (7, 5);
INSERT INTO Prendas_Outfits (Prendas_Id_Prenda, Outfits_Id_Outfit) VALUES (2, 5);

-----------------------------------------------

CREATE OR REPLACE FUNCTION prenda_mas_usada
  RETURN VARCHAR2
IS
  prendaaux VARCHAR2(100);
BEGIN
  SELECT p.Nombre
    INTO prendaaux
    FROM Prendas p
    JOIN (
      SELECT Prendas_Id_Prenda id_prenda,
             COUNT(*) veces
        FROM Prendas_Outfits
       GROUP BY Prendas_Id_Prenda
       ORDER BY veces DESC
    ) VecesXprenda
      ON p.Id_Prenda = VecesXprenda.id_prenda
   WHERE ROWNUM = 1;

  RETURN prendaaux;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
/

—--------PRUEBA—------------
SELECT prenda_mas_usada() AS top_prenda
  FROM dual;


--secuencia de prendas para el procedimiento agregar_prenda
CREATE SEQUENCE seq_prendas
    START WITH 12
    INCREMENT BY 1;

--procedimiento que agrega una prenda con validaciones
CREATE OR REPLACE PROCEDURE usp_agregar_prenda(
    p_nombre IN prendas.nombre%TYPE,
    p_desc IN prendas.descripcion%TYPE,
    p_precio IN prendas.precio%TYPE,
    p_genero IN prendas.genero%TYPE,
    p_material IN prendas.material%TYPE,
    p_id_tipo_prenda IN prendas.tipo_prendas_id_tipo_prenda%TYPE,
    p_id_temporada IN prendas.temporadas_id_temporada%TYPE,
    p_id_color IN prendas.colores_id_color%TYPE,
    p_id_ocasion IN prendas.ocasiones_id_ocasion%TYPE,
    p_id_marca IN prendas.marcas_id_marca%TYPE
) AS
    v_tipo_prenda_check NUMBER(1);
    v_color_check NUMBER(1);
    v_marca_check NUMBER(1);
    v_temporada_check NUMBER(1);
    v_ocasion_check NUMBER(1);
BEGIN
    IF p_precio <= 0 THEN
        DBMS_OUTPUT.PUT_LINE('El precio debe ser mayor a cero.');
        RETURN;
    END IF;

    IF p_nombre IS NULL OR LENGTH(TRIM(p_nombre)) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('El nombre no puede estar vacío.');
        RETURN;
    END IF;

    SELECT COUNT(*) INTO v_tipo_prenda_check FROM tipo_prendas WHERE id_tipo_prenda = p_id_tipo_prenda;
        IF v_tipo_prenda_check = 0 THEN
            DBMS_OUTPUT.PUT_LINE('El tipo de prenda no existe.');
            RETURN;
        END IF;
        
        SELECT COUNT(*) INTO v_color_check FROM colores WHERE id_color = p_id_color;
        IF v_color_check = 0 THEN
            DBMS_OUTPUT.PUT_LINE('El color no existe.');
            RETURN;
        END IF;
        
        SELECT COUNT(*) INTO v_temporada_check FROM temporadas WHERE id_temporada = p_id_temporada;
        IF v_temporada_check = 0 THEN
            DBMS_OUTPUT.PUT_LINE('La temporada no existe.');
            RETURN;
        END IF;
            
        SELECT COUNT(*) INTO v_ocasion_check FROM ocasiones WHERE id_ocasion = p_id_ocasion;
        IF v_ocasion_check = 0 THEN
            DBMS_OUTPUT.PUT_LINE('La ocasión no existe.');
            RETURN;
        END IF;        
        
        SELECT COUNT(*) INTO v_marca_check FROM marcas WHERE id_marca = p_id_marca;
        IF v_marca_check = 0 THEN
            DBMS_OUTPUT.PUT_LINE('La marca no existe.');
            RETURN;
        END IF;

    INSERT INTO Prendas (
        Id_Prenda, 
        Nombre, 
        Descripcion,
        Precio,
        Genero,
        Material,
        Tipo_Prendas_Id_Tipo_Prenda, 
        Temporadas_Id_Temporada,
        Colores_Id_Color, 
        Ocasiones_Id_Ocasion,
        Marcas_Id_Marca
        ) 
    VALUES (
        seq_prendas.NEXTVAL, 
        p_nombre, 
        p_desc,
        p_precio,
        p_genero,
        p_material,
        p_id_tipo_prenda, 
        p_id_temporada,
        p_id_color, 
        p_id_ocasion,
        p_id_marca);
    
    DBMS_OUTPUT.PUT_LINE('Prenda agregada correctamente.');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('No se pudo agregar la prenda.');
        ROLLBACK;
END;

--select * from prendas;

BEGIN
    usp_agregar_prenda(
        p_nombre => 'Jeans Platanitos',
        p_desc => 'Jeans azules corte recto',
        p_precio => 129.90,
        p_genero => 1,
        p_material => 'Jean',
        p_id_tipo_prenda => 2,
        p_id_temporada => 2,
        p_id_color => 2,
        p_id_ocasion => 1,
        p_id_marca => 2
    );
END;

-- trigger que valida si el descuento ingresado es correcto
CREATE OR REPLACE TRIGGER trig_validar_descuento_marca
BEFORE INSERT OR UPDATE ON Marcas
FOR EACH ROW
BEGIN
    IF :NEW.Descuento <= 0 OR :NEW.Descuento > 0.99 THEN
        RAISE_APPLICATION_ERROR(-20501, 'El descuento debe ser mayor a 0 y menor a 0.99');
    END IF;
END;


-- insertar outfit de prueba
INSERT INTO outfits VALUES (6, 'Look 6', '1');
INSERT INTO prendas_outfits VALUES (3, 6);
INSERT INTO prendas_outfits VALUES (9, 6);


-- calcular precio de un outfit con descuento de la marca (tmb se puede usar SELECT INTO)
CREATE OR REPLACE FUNCTION ufn_calcular_precio_outfit(p_id_outfit NUMBER)
 RETURN NUMBER 
 IS
    v_precio_total NUMBER (10, 2) := 0;
    
    CURSOR prendas_del_outfit IS
        SELECT p.nombre, p.precio, m.descuento
        FROM prendas_outfits o JOIN
        prendas p ON o.prendas_id_prenda = p.id_prenda JOIN
        marcas m ON m.id_marca = p.marcas_id_marca
        WHERE o.outfits_id_outfit = p_id_outfit;
    
BEGIN
    FOR r_prenda IN prendas_del_outfit 
    LOOP
        v_precio_total := v_precio_total + (r_prenda.precio * (1-r_prenda.descuento));
    END LOOP;
    
    RETURN v_precio_total;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('No se pudo calcular el outfit');
        RETURN NULL;
END;


SET SERVEROUTPUT ON;

-- procedimiento que imprime el precio total pero valida si el outfit existe primero
CREATE OR REPLACE PROCEDURE usp_mostrar_precio_outfit(p_id_outfit IN prendas_outfits.outfits_id_outfit %type)
 IS
    v_total NUMBER(10, 2) := 0;
    v_validar_id NUMBER;
BEGIN

    SELECT COUNT(*) INTO v_validar_id FROM outfits WHERE id_outfit = p_id_outfit;
    
    IF v_validar_id = 0 THEN
        DBMS_OUTPUT.PUT_LINE('El id no existe: ' || p_id_outfit);
        RETURN;
    END IF;
    
    v_total := ufn_calcular_precio_outfit(p_id_outfit);
    
    DBMS_OUTPUT.PUT_LINE('Precio total del outfit ' || p_id_outfit || ' es: '  || v_total);
    COMMIT;
END;

-- probar funcion
BEGIN
    usp_mostrar_precio_outfit(6);
END;

-- consulta inicial de join de outfit y el precio individual de cada prenda
SELECT p.precio FROM prendas_outfits v
 JOIN outfits o ON o.id_outfit = v.outfits_id_outfit
 JOIN prendas p ON p.id_prenda = v.prendas_id_prenda;



-- Contar valoraciones hechas por un usuario
CREATE OR REPLACE FUNCTION contar_valoraciones_usuario(p_id_usuario NUMBER)
RETURN NUMBER IS
  v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total FROM Valoraciones V
  JOIN Outfits O ON V.Outfits_Id_Outfit = O.Id_Outfit
  WHERE O.Usuarios_Id_Usuario = p_id_usuario;

  RETURN v_total;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
END;
/
-------------------------PRUEBA—------------------------
-- Probar funcion
SELECT contar_valoraciones_usuario(2) FROM dual;
SELECT 
  U.Id_Usuario,
  U.Nombre,
  contar_valoraciones_usuario(U.Id_Usuario) AS total_valoraciones
FROM Usuarios U;
—----------------------------------------------------------------
-- Promedio de estrellas dadas por un usuario
CREATE OR REPLACE FUNCTION promedio_estrellas_usuario(p_id_usuario NUMBER)
RETURN NUMBER IS 
  v_promedio NUMBER;
BEGIN
  SELECT AVG(Estrellas) INTO v_promedio FROM Valoraciones V
  JOIN Outfits O ON V.Outfits_Id_Outfit = O.Id_Outfit
  WHERE O.Usuarios_Id_Usuario = p_id_usuario;

  RETURN NVL(v_promedio, 0);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
END;
/
—-----------PRUEBA—------------------------
-- Probar funcion:
SELECT promedio_estrellas_usuario(2) FROM dual;
SELECT 
  U.Id_Usuario,
  U.Nombre,
  promedio_estrellas_usuario(U.Id_Usuario) AS promedio_estrellas
FROM Usuarios U;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- Roberto 


CREATE OR REPLACE FUNCTION promedio_valoracion(p_id_outfit IN NUMBER)
RETURN NUMBER IS
  v_promedio NUMBER;
BEGIN
  SELECT AVG(Estrellas) INTO v_promedio FROM Valoraciones WHERE Outfits_Id_Outfit = p_id_outfit;
  RETURN v_promedio;
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN NULL;
END;
/
--------------------------------------------
CREATE OR REPLACE FUNCTION contar_prendas_por_tipo(p_id_tipo NUMBER)
RETURN NUMBER IS
  v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total FROM Prendas WHERE Tipo_Prendas_Id_Tipo_Prenda = p_id_tipo;
  RETURN v_total;
END;
/
—-------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION tiene_suscripcion(p_id_usuario NUMBER)
RETURN NUMBER IS
  v_estado NUMBER;
BEGIN
  SELECT Suscripcion INTO v_estado FROM Usuarios WHERE Id_Usuario = p_id_usuario;
  RETURN v_estado;
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN NULL;
END;
/
—-----------------------------------------------------------------------------------------------
-- ========================
-- AUDITORÍA DE CAMBIOS EN PRECIOS DE PRENDAS
-- ========================

-- 1. Crear tabla de auditoría
CREATE TABLE Auditoria_Prenda (
  id_auditoria NUMBER GENERATED BY DEFAULT AS IDENTITY,
  id_prenda NUMBER,
  precio_anterior NUMBER(6,2),
  precio_nuevo NUMBER(6,2),
  fecha TIMESTAMP DEFAULT SYSTIMESTAMP,
  usuario VARCHAR2(100)
);
—-------TRIGGER—------------
-- 2. Crear TRIGGER para auditar cambios en precios
CREATE OR REPLACE TRIGGER trg_auditar_precio
BEFORE UPDATE OF Precio ON Prendas
FOR EACH ROW
WHEN (OLD.Precio IS DISTINCT FROM NEW.Precio)
BEGIN
  INSERT INTO Auditoria_Prenda (
    id_prenda,
    precio_anterior,
    precio_nuevo,
    usuario
  ) VALUES (
    :OLD.Id_Prenda,
    :OLD.Precio,
    :NEW.Precio,
    USER
  );
END;
/

--------OBJETO—-----------------
-- 3. (Opcional) Crear tipo de objeto PrendaObj para manejo procedural
CREATE OR REPLACE TYPE PrendaObj AS OBJECT (
  id_prenda NUMBER,
  nombre VARCHAR2(100),
  MEMBER PROCEDURE actualizar_precio(nuevo_precio IN NUMBER)
);
/

CREATE OR REPLACE TYPE BODY PrendaObj AS
  MEMBER PROCEDURE actualizar_precio(nuevo_precio IN NUMBER) IS
  BEGIN
    UPDATE Prendas
    SET Precio = nuevo_precio
    WHERE Id_Prenda = SELF.id_prenda;

    DBMS_OUTPUT.PUT_LINE('Precio actualizado a: ' || nuevo_precio);
  END;
END;
/










