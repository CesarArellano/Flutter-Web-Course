import 'package:admin_dashboard/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () => print('Hello'),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Hello World'),
            ),
          ),
        ),
      ),
    );
  }
}