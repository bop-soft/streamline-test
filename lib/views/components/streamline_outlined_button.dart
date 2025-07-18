import 'package:flutter/material.dart';
import 'package:streamline/config/constants.dart';

class StreamlineOutlinedButton {
  static build(BuildContext context, title) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          splashFactory: NoSplash.splashFactory,
          side: WidgetStateProperty.all<BorderSide>(BorderSide(color: Colors.green)),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        child: Text(title, style: TextStyle(
          color: Colors.green,
          fontSize: elevatedTextSize,
          letterSpacing: 1.1
          )),
      ),
    );
  }
}