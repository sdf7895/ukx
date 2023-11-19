import 'package:flutter/material.dart';

class TotalBorders {
  static const BorderSide primaryBorder = BorderSide(
    color: Colors.grey,
    width: 2.0,
    style: BorderStyle.solid,
  );

  static const BorderRadius primaryRadius = BorderRadius.all(
    Radius.circular(15.0),
  );

  static const BoxDecoration borderCircle = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.grey,
  );
}
