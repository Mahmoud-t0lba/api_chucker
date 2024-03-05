import 'package:flutter/material.dart';

import 'app.dart';
import 'chucker_flutter.dart';

void main() {
  ChuckerFlutter.showOnRelease = true;
  ChuckerFlutter.showNotification = false;
  runApp(const App());
}
