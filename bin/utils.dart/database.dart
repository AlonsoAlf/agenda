import 'package:mysql1/mysql1.dart';

abstract class DataBase {
  static final String _host = "localhost";
  static final int _port = 3306;
  static final String _user = "root";
  static final String _dbName = "basedatosagenda_db";

  static Future<void> instalacion() async {
    var settings = ConnectionSettings(
      host: _host,
      port: _port,
      user: _user,
      db: _dbName,
    );
    MySqlConnection conn = await MySqlConnection.connect(settings);
    await conn.query("CREATE DATABASE IF NOT EXISTS basedatosagenda_db");
    await conn.query("USE $_dbName");
    await crearTablaContactos(conn);
    await crearTablaGrupos(conn);
    await conn.close(); 
  }

  static Future<MySqlConnection> establecerConexion() async {
    var settings = ConnectionSettings(
      host: _host,
      port: _port,
      user: _user,
      db: _dbName,
    );
    MySqlConnection conn = await MySqlConnection.connect(settings);
    return conn;
  }

  static Future<void> crearTablaContactos(MySqlConnection conn) async {
    await conn.query("""CREATE TABLE IF NOT EXIST contactos(
    idcontacto INT PRIMARY_KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(150) NOT NULL,
    telefono INT NOT NULL,
    correo VARCHAR(150) NOT NULL,
    direccion VARCHAR(250),
    notas VARCHAR(350)
    );
    """);
  }

  static Future<void> crearTablaGrupos(MySqlConnection conn) async {
    await conn.query("""CREATE TABLE IF NOT EXIST grupos(
    idgrupo INT PRIMARY_KEY AUTOINCREMENT,
    nombre_grupo VARCHAR(100) NOT NULL,
    );
    """);
  }
  static Future<void> crearTablaAgrupacion(MySqlConnection conn) async{
    await conn.query("""CREATE TABLE IF NOT EXIST contactos_grupo(
    idcontacto INT NOT NULL,
    idgrupo INT NOT NULL,
    PRIMARY KEY (idcontacto, idgrupo),

    FOREIGN KEY (idcontacto) 
    REFERENCES contactos(id) 
    ON DELETE CASCADE,

    FOREIGN KEY (idgrupo) 
    REFERENCES grupos(id) 
    ON DELETE CASCADE
    );
  """);
  }
  static Future<void> crearTablaEventos(MySqlConnection conn) async{
    await conn.query("""CREATE TABLE IF NOT EXIST eventos(
    idevento INT PRIMARY_KEY AUTOINCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL
    );
  """);
  }
}