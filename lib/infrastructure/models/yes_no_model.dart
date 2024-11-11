//el modelo define que datos debe
//tener la aplicacion. Investigar MVC = datos = patron de diseño de software
//vista: pantalla, controlador: logica

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:yes_no_app_javier_martinez_4sa/domain/entities/message.dart';

class YesNoModel {
  String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() => Message(
      //condicional ternario para darle valor a los personajes
      text: answer == "yes"
          ? "si"
          : answer == "no"
              ? "No"
              : "Quizas",
      fromWho: FromWho.hers,
      //seria el gif
      imageUrl: image);
}
