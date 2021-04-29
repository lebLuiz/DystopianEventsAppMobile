import 'dart:math';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(
    colors: [
      Color(0xFF000000),
      Color.fromRGBO(13, 0, 22, 0.94),
    ], stops: [
      0.0,
      0.0
    ], transform: GradientRotation(2.13959913 * pi)
  );
}