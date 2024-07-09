import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color.fromARGB(255, 201, 6, 6);
  Color get secondary => const Color.fromARGB(255, 226, 121, 2);
  Color get white => const Color.fromARGB(255, 255, 255, 255);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
