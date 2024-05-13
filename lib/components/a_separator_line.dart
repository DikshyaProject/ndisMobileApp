import 'package:flutter/cupertino.dart';

class ASeparatorLine extends StatelessWidget {
  final double? height;
  final Color? color;

  const ASeparatorLine({this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
    );
  }
}
