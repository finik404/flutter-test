import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/helpers/device.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    super.key,
    this.children,
    this.child,
    this.bg,
    this.padding = TStyles.pdBg,
    this.isScrollable = false,
    this.hasSafeArea = true,
    this.hasTop = false,
    this.hasBottom = true,
    this.hasAppBar = false,
    this.leading,
    this.actions,
    this.appHeight = 0,
    this.leadingWidth = 0,
  });

  final List<Widget>? children;
  final Widget? child;
  final Color? bg;
  final EdgeInsets? padding;
  final bool isScrollable;
  final bool hasSafeArea;
  final bool hasTop, hasBottom;
  final bool hasAppBar;
  final Widget? leading, actions;
  final double appHeight, leadingWidth;

  @override
  Widget build(BuildContext context) {
    Widget content = Container();

    if (child != null) {
      content = child!;
    } else if (children != null) {
      content = Column(children: children!);
    }

    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }

    if (isScrollable) {
      content = SingleChildScrollView(child: content);
    }

    return hasSafeArea
        ? Scaffold(
            // AppBar
            appBar: hasAppBar
                ? AppBar(
                    toolbarHeight: appHeight,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    leading: leading,
                    leadingWidth: leadingWidth,
                    actions: [actions ?? Container()],
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarBrightness: TDevice.isIOS() ? Brightness.light : Brightness.dark,
                      statusBarIconBrightness: TDevice.isIOS() ? Brightness.light : Brightness.dark,
                    ),
                  )
                : null,
            backgroundColor: bg,

            // Body
            body: SafeArea(
              top: hasTop,
              bottom: hasBottom,
              child: content,
            ),
          )
        : content;
  }
}
