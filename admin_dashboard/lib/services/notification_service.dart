
import 'package:flutter/material.dart';

class NotificationService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar( String message, { Color backgroundColor = Colors.green } ) {
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 20)),
    );
    messengerKey.currentState?.removeCurrentSnackBar();
    messengerKey.currentState?.showSnackBar(snackBar);
  }
}