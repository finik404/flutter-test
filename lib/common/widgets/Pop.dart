import 'package:flutter/material.dart';

class UIPop extends StatelessWidget {
  const UIPop({
    super.key,
    required this.child,
    this.callback,
  });

  final Widget child;
  final Function()? callback;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (callback != null) callback!();
      },
      child: child,
    );
  }
}
