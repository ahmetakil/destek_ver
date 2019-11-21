import 'package:flutter/material.dart';

double baseHeight = 640.0;

double screenSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}
