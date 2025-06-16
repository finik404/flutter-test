import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

export 'package:tproject/util/constants/images.dart';

class UISvg extends StatelessWidget {
  const UISvg(
    this.image, {
    super.key,
    this.color,
    this.width,
    this.height,
    this.isNetwork = false,
  });

  final String image;
  final Color? color;
  final double? width;
  final double? height;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return isNetwork
        ? SvgPicture.network(
            image,
            colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
            width: width,
            height: width ?? height,
          )
        : SvgPicture.asset(
            image,
            colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
            width: width,
            height: width ?? height,
          );
  }
}
