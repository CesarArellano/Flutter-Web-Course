import 'package:flutter/material.dart';

import 'package:web_bases/ui/shared/custom_flat_button.dart';


class CounterView extends StatefulWidget {

  const CounterView({
    Key? key,
    required this.base
  }) : super(key: key);

  final String base;

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 10;

  @override
  void initState() {
    super.initState();
    counter = int.tryParse(widget.base) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Counter Stateful',
            style: TextStyle( fontSize: 20 ),
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10.0 ),
              child: Text(
                'Contador: $counter',
                style: const TextStyle( fontSize: 80, fontWeight: FontWeight.bold ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFlatButton(
                text: 'Incrementar',
                color: Colors.blueAccent,
                onPressed: () => setState(() => counter++ ),
              ),
              CustomFlatButton(
                text: 'Decrementar',
                onPressed: () => setState(() => counter-- ),
              ),
            ],
          ),
        ],
      )
    );
  }
}