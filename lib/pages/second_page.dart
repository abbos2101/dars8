import 'package:dars8/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SecondPage")),
      body: Text(
        "${context.watch<ThemeProvider>().mode}",
        style: const TextStyle(fontSize: 32),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ThemeProvider>().change();
        },
      ),
    );
  }
}
