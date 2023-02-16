import 'package:dars8/pages/multi/count_provider.dart';
import 'package:dars8/pages/multi/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiPage extends StatelessWidget {
  const MultiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${context.watch<TimeProvider>().time}"),
      ),
      body: Center(
        child: Text(
          "${context.watch<CountProvider>().count}",
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CountProvider>().decrement();
            },
          ),
          const SizedBox(width: 6),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CountProvider>().increment();
            },
          ),
        ],
      ),
    );
  }
}
