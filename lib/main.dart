import 'package:flutter/material.dart';
import 'package:vocabulary_app/screens/home.dart';

import 'db/models/db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DB.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
