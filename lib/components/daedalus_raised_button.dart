import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/components.dart';

import '../Helpers/theme/theme.dart';

const double defaultBtnWidth = 180.5;
const double defaultBtnHeight = 70.0;

class RolmRaisedButton extends StatelessWidget {
  final double btnSizeRatio;
  final String btnTitle;
  final Color btnTitleFontColor;
  final double btnTitleFontSize;
  final Function()? onPressed;
  final String imagePath;

  const RolmRaisedButton({
    Key? key,
    required this.btnSizeRatio,
    required this.btnTitle,
    required this.imagePath,
    this.btnTitleFontColor = Colors.white,
    required this.btnTitleFontSize,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(children: [
        Card(
          color: kColorThemePurpleColor,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                color: kColorThemePurpleColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      btnTitle,
                      style:
                          textStyleBoldCustomColor(14.0.scale(), Colors.white),
                    ).align(Alignment.center),
                    AHorizontalSpace(10.0.scale()),
                    Image(
                      image: AssetImage(imagePath),
                      height: 15.0.scale(),
                      width: 20.0.scale(),
                    ),
                  ],
                ),
              )),
        )
      ])
          .size(
            (defaultBtnWidth * btnSizeRatio).scale(),
            (defaultBtnHeight * btnSizeRatio.scale()),
          )
          .align(Alignment.center),
    );
  }
}
