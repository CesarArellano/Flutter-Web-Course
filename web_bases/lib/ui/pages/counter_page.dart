import 'package:flutter/material.dart';


class CounterPage extends StatefulWidget {

  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contador: $counter',
            style: const TextStyle( fontSize: 80, fontWeight: FontWeight.bold ),
          ),

          TextButton(
            child: const Text('Incrementar'),
            onPressed: () {
              setState(() => counter++ );
            },
          )
        ],
      )
    );
  }
}