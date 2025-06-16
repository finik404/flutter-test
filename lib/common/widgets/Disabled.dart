import 'package:flutter/material.dart';

class UIDisabled extends StatelessWidget {
  const UIDisabled(this.disabled, {
    super.key,
    required this.child,
    this.hasOpacity = true,
  });

  final Widget child;
  final bool disabled;
  final bool hasOpacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: !hasOpacity
          ? 1.0
          : disabled
              ? 0.5
              : 1.0,
      child: IgnorePointer(
        ignoring: disabled,
        child: child,
      ),
    );
  }
}
