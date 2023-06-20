import 'package:contatos/models/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Contatos());
}

class Contatos extends StatelessWidget {
  const Contatos({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contatos',
      home: Home(),
    );
  }
}
