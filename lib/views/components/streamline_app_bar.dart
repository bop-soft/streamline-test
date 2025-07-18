import 'package:flutter/material.dart';

class StreamlineAppBar {
  static build(BuildContext context, {
    String? title,
    bool? automaticallyImplyLeading,
    List<Widget>? actions,
  }) {
    return AppBar(
      title: Text(title ?? ""),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ??false,
      elevation: 0,
      actions: actions,
    );
  }
}