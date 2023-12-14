import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gamestore/main.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.gif(
        useImmersiveMode: true,
        gifPath: 'assets/game_store.gif',
        gifWidth: 500,
        gifHeight: 500,
        nextScreen: const AppShell(), // Sesuaikan dengan definisi kelas yang benar
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
