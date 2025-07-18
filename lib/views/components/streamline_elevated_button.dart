import 'package:flutter/material.dart';
import 'package:streamline/config/constants.dart';

class StreamlineElevatedButton {
  static build(BuildContext context, title,
      {required void Function()? onPressed}
  ) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: Text(title, style: TextStyle(
          color: Colors.white,
          fontSize: elevatedTextSize,
          letterSpacing: 1.1
          )),
      ),
    );
  }
}