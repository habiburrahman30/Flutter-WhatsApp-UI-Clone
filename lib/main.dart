import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

import 'src/screens/camera_screen/camera_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(App());
}
