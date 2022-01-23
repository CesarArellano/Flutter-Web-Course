import 'package:flutter/material.dart';
import 'package:web_bases/ui/shared/custom_flat_button.dart';


class ErrorPage extends StatelessWidget {

  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('404', style: TextStyle(fontSize: 60)),
            const SizedBox(height: 10),
            const FittedBox(
              child: Padding(
                padding: EdgeInsets.symmetric( horizontal: 10.0 ),
                child: Text('No se encontró la página', style: TextStyle(fontSize: 40)),
              ),
            ),
            CustomFlatButton(
              text: 'Regresar',
              onPressed: () => Navigator.pushNamed(context, '/stateful')
            ),
          ],
        ),
      ),
    );
  }
}