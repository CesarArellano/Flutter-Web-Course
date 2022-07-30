
import 'package:flutter/material.dart';

class NotificationService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBarError( String message ) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 20)),
    );
    messengerKey.currentState?.removeCurrentSnackBar();
    messengerKey.currentState?.showSnackBar(snackBar);
  }

}