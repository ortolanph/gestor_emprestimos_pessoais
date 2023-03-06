import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../service/context_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empréstimos Pessoais"),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(
              context,
              '/config',
            );
          }, icon: const FaIcon(FontAwesomeIcons.gear)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
