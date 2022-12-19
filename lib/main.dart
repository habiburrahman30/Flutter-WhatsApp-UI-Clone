import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(App());
}
