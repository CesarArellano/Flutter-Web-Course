import 'package:flutter/material.dart';
import 'package:web_bases/ui/pages/counter_page.dart';

void main() => runApp( const MyApp() );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routes App',
      initialRoute: '/stateful',
      routes: {
        '/stateful': ( _ ) => const CounterPage(),
      },
    );
  }
}