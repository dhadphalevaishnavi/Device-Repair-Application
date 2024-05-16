import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../screens/LoginScreen.dart';

class AlertBoxWidget extends StatelessWidget {
  const AlertBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Login to request repair service'),
      elevation: 25,
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text('Login')),
      ],
    );
  }

  static ToastFuture toast(String msg, Color color) {
    return showToast(
      msg,
      position: ToastPosition.bottom,
      textPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      backgroundColor: color,
      duration: const Duration(seconds: 5),
    );
  }
}
