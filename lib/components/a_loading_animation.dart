import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';

import 'components.dart';

class ALoadingAnimation extends StatelessWidget {
  final bool useLighterBlackOverlay;

  const ALoadingAnimation({this.useLighterBlackOverlay = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: useLighterBlackOverlay ? Colors.black12 : Colors.black45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AVerticalSpace(20.0.scale()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingBouncingLine.circle(
                  borderColor: kColorThemePurpleColor,
                  borderSize: 3.0,
                  size: 80.0,
                  backgroundColor: kColorThemePurpleColor,
                  duration: Duration(milliseconds: 1000),
                ),
                LoadingBouncingLine.circle(
                  borderColor: kColorThemePurpleColor,
                  borderSize: 3.0,
                  size: 80.0,
                  backgroundColor: kColorThemePurpleColor,
                  duration: Duration(milliseconds: 1000),
                )
              ],
            )
          ],
        ));
  }
// @override
// Widget build(BuildContext context) {
//   return CircularProgressIndicator(
//     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//   )
//       .align(Alignment.center)
//       .size(double.infinity, double.infinity)
//       .widgetBgColor(
//           useLighterBlackOverlay ? Colors.black12 : Colors.black45);
// }
}
