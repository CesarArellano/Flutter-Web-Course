import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:web_bases/providers/counter_provider.dart';
import 'package:web_bases/ui/shared/custom_app_menu.dart';
import 'package:web_bases/ui/shared/custom_flat_button.dart';


class CounterProviderView extends StatefulWidget {

  const CounterProviderView({Key? key}) : super(key: key);

  @override
  State<CounterProviderView> createState() => _CounterProviderViewState();
}

class _CounterProviderViewState extends State<CounterProviderView> {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => CounterProvider(),
      child: const _CounterProviderPageBody(),
    );
  }
}

class _CounterProviderPageBody extends StatelessWidget {
  const _CounterProviderPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAppMenu(),
          const Spacer(),
          const Text(
            'Counter Provider',
            style: TextStyle( fontSize: 20 ),
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10.0 ),
              child: Text(
                'Contador: ${ counterProvider.counter }',
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
                onPressed: counterProvider.increment
              ),
              CustomFlatButton(
                text: 'Decrementar',
                onPressed: counterProvider.decrement
              ),
            ],
          ),
          const Spacer(),
        ],
      )
    );
  }
}