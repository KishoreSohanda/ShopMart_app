import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('MyShopApp')),
            body: const Center(
              child: Text('New App'),
            ),
          );
        }
      },
    );
  }
}
