
import 'package:flutter/material.dart';
import '../Helpers/theme/theme.dart';
import 'a_widget_extensions.dart';
import '../Helpers/utils/utils.dart';

class ARoundedButtonImage extends StatelessWidget {
  final Color btnBgColor;
  final Color btnTextColor;
  final Color btnBorderSideColor;
  final String btnText;
  final double btnFontSize;
  final double btnHeight;
  final double btnWidth;
  final VoidCallback btnOnPressed;
  final ImageIcon btnIconData;
  final Color btnIconColor;
  final double btnIconSize;
  final double btnElevation;
  final FontWeight btnFontWeight;
  final Color btnDisabledColor;
  final Color btnDisabledTextColor;
  final String btnIconImagePath;

  const ARoundedButtonImage({
    Key? key,
    required this.btnBgColor,
    required this.btnTextColor,
    required this.btnText,
    required this.btnFontSize,
    required this.btnHeight,
    required this.btnOnPressed,
    this.btnWidth = double.infinity,
    required this.btnBorderSideColor,
    required this.btnIconData,
    required this.btnIconImagePath,
    required this.btnIconColor,
    this.btnIconSize = 24,
    this.btnElevation = 2,
    this.btnFontWeight = FontWeight.normal,
    this.btnDisabledColor = Colors.transparent,
    this.btnDisabledTextColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0.scale()),
        side: btnBorderSideColor != null
            ? BorderSide(color: btnBorderSideColor, width: 1.0)
            : BorderSide.none);

    final text = Text(
      this.btnText,
      style: textStyleCustomColor(btnFontSize, btnTextColor),
    );

    final column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                this.btnText,
                style: textStyleCustomColor(btnFontSize, Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image(
                image: AssetImage(btnIconImagePath),
                // White Color. You can ommit it too if you use textColor property on RaisedButton.
                width: 10.0.scale(),
                height: 10.0.scale(), // 18 pt, same as text.
              ),
            )
          ],
        ),
      ],
    );

    return (btnIconData != null
            ? ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return btnDisabledColor;
                    return btnBgColor;
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {}
                    return btnDisabledTextColor;
                  }),
                  shape: MaterialStateProperty.all(shape),
                  elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) return 0;
                    return btnElevation;
                  }),
                ),
                onPressed: btnOnPressed,
                child: column,
              )
            : ElevatedButton(
                onPressed: btnOnPressed,
                child: text,
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return btnDisabledColor;
                    return btnBgColor;
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {}
                    return btnDisabledTextColor;
                  }),
                  shape: MaterialStateProperty.all(shape),
                  elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {}
                    return btnElevation;
                  }),
                ),
              ))
        .size(btnWidth, btnHeight);
  }
}
