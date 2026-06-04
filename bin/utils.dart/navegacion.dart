import 'dart:io';

abstract class Navegacion {
  static String inicio = "pantallaPrincipal";
  static String pantallaPrincipal() {
    String? respuesta;
    do {
      stdout.writeln("Bienvenido, seleccione que desea hacer");
      stdout.writeln("1. Visualizar tareas");
      stdout.writeln("2. Crear tarea");
      stdout.writeln("3. Modificar tarea");
      stdout.writeln("4. Salir");
      respuesta = stdin.readLineSync() ?? "";
    } while (respuesta != "1" &&
        respuesta != "2" &&
        respuesta != "3" &&
        respuesta != "4");
    switch (respuesta) {
      case "1":
        return "mostrarTareas";
      case "2":
        return "crearTarea";
      case "3":
        return "modificarTarea";
      default:
        return "salir";
    }
  }
}
