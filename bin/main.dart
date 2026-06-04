import 'utils.dart/utils.dart';
String main(){
  bool ejecutando = true;
  String pantalla = Navegacion.inicio;
  while(ejecutando){
    switch(pantalla){
      case "pantallaPrincipal":
      pantalla = Navegacion.pantallaPrincipal();
      break;

    }
  }
}