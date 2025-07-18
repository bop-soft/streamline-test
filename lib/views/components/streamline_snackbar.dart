import 'package:flutter/material.dart';

class StreamlineSnackbar {
  static build(BuildContext context, String message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    );
  }
}