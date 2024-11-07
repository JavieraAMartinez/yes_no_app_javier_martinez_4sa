import 'package:dio/dio.dart';
import 'package:yes_no_app_javier_martinez_4sa/domain/entities/message.dart';

class GetYesNoAnswer {
  //se crea objeto de la clase dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //obtener la respuesta
  Future<Message> getAnswer() async {
    //Almacenar la peticion GET en una variable
    final response = await _dio.get('https://yesno.wtf/api');

    //Genenerar el error
    throw UnimplementedError();
  }
}
