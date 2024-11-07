//el modelo define que datos debe
//tener la aplicacion. Investigar MVC = datos = patron de diseño de software
//vista: pantalla, controlador: logica

class YesNoModel {
  //atributos de clase
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});
}
