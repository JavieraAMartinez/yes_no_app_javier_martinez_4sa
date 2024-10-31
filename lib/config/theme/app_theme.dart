import 'package:flutter/material.dart';

// Las variables o clases que tengan _ solo se pueden usar en este archivo
//para colores hexadecimales es 0xFF(y el numero del color)
const Color _customColor = Color.fromARGB(255, 126, 28, 147);

const List<Color> _colorThemes = [
// Arreglo de colores
  _customColor,
  Colors.blue,
  Colors.pink,
  Colors.red,
  Colors.purple,
  Colors.cyan,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors most be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        // El número es el número de arreglos que tengo, si pongo
        //7 me da error porque solo tego 6 posibles resultados de colores
        colorSchemeSeed: _colorThemes[selectedColor],
        brightness: Brightness.dark);
  }
}
