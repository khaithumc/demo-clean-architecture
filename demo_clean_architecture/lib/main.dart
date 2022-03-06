import 'package:demo_clean_architecture/presentation/pages/my_app.dart';
import 'package:flutter/material.dart';

import 'di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

