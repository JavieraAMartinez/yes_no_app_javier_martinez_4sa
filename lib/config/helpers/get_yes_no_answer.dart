import 'package:dio/dio.dart';
import 'package:yes_no_app_javier_martinez_4sa/domain/entities/message.dart';
import 'package:yes_no_app_javier_martinez_4sa/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //se crea objeto de la clase dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //obtener la respuesta
  Future<Message> getAnswer() async {
    //Almacenar la peticion GET en unada variable
    final response = await _dio.get('https://yesno.wtf/api');

// Almacenar la data de la respuesta en una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

//Devolver la instancia de "message" creada en el modelo
    return yesNoModel.toMessageEntity();
  }
}
