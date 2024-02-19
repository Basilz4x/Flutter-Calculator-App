import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppColors {
  static final Color mainColor = Colors.blueGrey[900]!;
  static final Color secondaryColor = Colors.blueGrey[800]!;
  static const Color textColor = Colors.white;
  static final Color operatorColor = Colors.red[200]!;
  static final Color removeColor = Colors.green[300]!;
}

final colorProvider = Provider((ref) => AppColors());
