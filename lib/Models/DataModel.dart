
import 'package:flutter/material.dart' show Color;

class DataModel {
  final String id;
  final Color color;
  final String title;
  final String image;

  DataModel({
    required this.id,
    required this.color,
    required this.title,
    required this.image,
  });
}