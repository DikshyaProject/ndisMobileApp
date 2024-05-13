import 'package:flutter/material.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';


Future<void> CustomAlertDialog({
  required BuildContext context,
  String? title,
  required Widget bodyWidget,
  required String buttonText,
  required String cancelText,
  required VoidCallback onTap,
  required VoidCallback onCancelTap,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        title:  Text(title??''),
        content:  bodyWidget,
        actions: <Widget>[
          Padding(
            padding:  EdgeInsets.only(bottom: 20.0.scale()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width/4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kColorThemePurpleColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text(buttonText, style: TextStyle(color: Colors.white, fontSize: 14,),),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onCancelTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    child: Container(
                      height: 40.0.scale(),
                      width: MediaQuery.of(context).size.width/4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kColorGreyEditTextDisabled,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text(cancelText, style: TextStyle(color: Colors.white, fontSize: 14,),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Future<void> CustomStatefulAlertDialog({
  required BuildContext context,
  required Widget bodyWidget,

}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 15.0.scale(), vertical: 10.0.scale()),
          content: bodyWidget
        ),
      );
    },
  );
}

