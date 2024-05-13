
import 'package:flutter/material.dart';

import '../Helpers/theme/theme.dart';
import '../Helpers/utils/utils.dart';
import '../components/components.dart';

const double _kTopLogoAreaHeight = 70.0;
const double _kHeaderTextFontSize = 21.0;

class AHeaderWidget extends StatelessWidget {
  final bool backBtnVisibility;
  final String? strBackbuttonName;
  final bool? rightEditButtonVisibility;
  final String? headerText;
  final String? strBtnRightImageName;
  final VoidCallback? btnEditOnPressed;
  final VoidCallback? btnBackOnPressed;
  final Color? headerColor;

  const AHeaderWidget({
    required this.backBtnVisibility,
    this.strBackbuttonName = 'ic_login_btn_arrow.png',
    required this.strBtnRightImageName,
    @required this.headerText = "",
    this.rightEditButtonVisibility = false,
    required this.btnEditOnPressed,
    required this.btnBackOnPressed,
    @required this.headerColor = KColorAppThemeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorAppBgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Visibility(
                  replacement: SizedBox.fromSize(
                    size: Size(40.0.scale(), 0),
                  ),
                  visible: backBtnVisibility,
                  child: TextButton(
                    onPressed: btnBackOnPressed,
                    child: Image(
                      image: AssetImage('${imgPathGeneral}$strBackbuttonName'),
                      height: 50,
                    ),
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                  )).align(Alignment.centerLeft),
              Text(
                headerText!,
                style: textStyleBoldCustomColor(
                    _kHeaderTextFontSize.scale(), Colors.white),
                maxLines: null,
                textAlign: TextAlign.center,
              ).expand(),
              Visibility(
                replacement: SizedBox.fromSize(
                  size: Size(40.0.scale(), 0),
                ),
                visible: rightEditButtonVisibility!,
                child: TextButton(
                    onPressed: btnEditOnPressed,
                    child: Image(
                      image:
                          AssetImage('${imgPathGeneral}$strBtnRightImageName'),
                    )),
              ).align(Alignment.centerRight),
            ],
          ),
        ],
      )
          .align(Alignment.center)
          .size(double.maxFinite, _kTopLogoAreaHeight.scale())
          .widgetBgColor(headerColor!),
    );
  }
}
