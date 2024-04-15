import 'package:camera_app/presentation/screens/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';

final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 102, 6, 247),
    background: const Color.fromARGB(255, 56, 49, 66));

final theme = ThemeData().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: colorScheme.background,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
        titleSmall: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold)));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(
    ProviderScope(
      child: MyApp(
        cameras: cameras,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery ',
      theme: theme,
      home: PhotosScreen(
        cameras: cameras,
      ),
    );
  }
}
