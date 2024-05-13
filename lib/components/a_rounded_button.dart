
import 'package:flutter/material.dart';
import '../Helpers/theme/theme.dart';
import 'a_widget_extensions.dart';
import '../Helpers/utils/utils.dart';

class ARoundedButton extends StatelessWidget {
  final Color btnBgColor;
  final Color btnTextColor;
  final Color btnBorderSideColor;
  final String btnText;
  final double btnFontSize;
  final double btnHeight;
  final double btnWidth;
  final VoidCallback btnOnPressed;

  final double btnIconSize;
  final double btnElevation;
  final FontWeight btnFontWeight;
  final Color btnDisabledColor;
  final Color btnDisabledTextColor;

  const ARoundedButton({
    Key? key,
    this.btnBgColor = Colors.white,
    this.btnTextColor = Colors.black,
    this.btnText = "",
    this.btnFontSize = 14.0,
    this.btnHeight = 30,
    required this.btnOnPressed,
   
    this.btnWidth = double.infinity,
    this.btnBorderSideColor = Colors.transparent,
    this.btnIconSize = 24,
    this.btnElevation = 2,
    this.btnFontWeight = FontWeight.normal,
    this.btnDisabledColor = Colors.white,
    this.btnDisabledTextColor = Colors.white, 
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusRoundedBtn.scale()),
        side: btnBorderSideColor != null
            ? BorderSide(color: btnBorderSideColor, width: 1.0)
            : BorderSide.none);

    final text = Text(
      this.btnText,
      style: TextStyle(
          fontSize: btnFontSize,
          color: btnTextColor,
          fontStyle: FontStyle.normal,
          fontWeight: btnFontWeight?? FontWeight.w400,
          fontFamily: "Poppins",
          ),
    );

    return (ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return btnDisabledColor;
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
      child: text,
    )).size(btnWidth, btnHeight);
  }
}
