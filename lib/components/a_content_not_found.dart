import '../Helpers/theme/theme.dart';
import '../Helpers/utils/utils.dart';
import 'package:flutter/material.dart';

import 'components.dart';

const double _kVerticalSpaceAfterChildrenSavedFontSize = 10.0;
const double _kCommonSizeDataNotFoundIcon = 100.0;
const double _kTextChildrenSavedFontSize = 20.0;
const double _kTextChildrenSavedContentFontSize = 14.0;
const double _kVerticalSpaceChildrenSavedFontSize = 14.0;

class AContentNotFoundWidget extends StatelessWidget {
  final String? imagePath;
  final bool Isvisible;
  final String? title;
  final String? message;
  const AContentNotFoundWidget(
      {@required this.imagePath,
      this.Isvisible = false,
      this.title = "",
      this.message = ""});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Visibility(
        visible: Isvisible,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage(
                          '${imgPathGeneral}ic_profile_bg_vaccin_history_circle.png'),
                      width: _kCommonSizeDataNotFoundIcon.scale(),
                      height: _kCommonSizeDataNotFoundIcon.scale(),
                    ).align(Alignment.center),
                    Image(
                      image: AssetImage('${imgPathGeneral}' + imagePath!),
                      width: _kCommonSizeDataNotFoundIcon.scale(),
                      height: _kCommonSizeDataNotFoundIcon.scale(),
                    ).align(Alignment.center),
                  ],
                ),
                AVerticalSpace(_kVerticalSpaceChildrenSavedFontSize.scale()),
                Text(
                  title!,
                  style: textStyleBoldCustomColor(
                      _kTextChildrenSavedFontSize.scale(),
                      KColorProfileMainScreenOptions),
                  textAlign: TextAlign.center,
                ).align(Alignment.center),
                AVerticalSpace(
                    _kVerticalSpaceAfterChildrenSavedFontSize.scale()),
                Text(
                  message!,
                  style: textStyleCustomColor(
                      _kTextChildrenSavedContentFontSize.scale(),
                      kColorTextContentChildSaved),
                  textAlign: TextAlign.center,
                ).align(Alignment.center)
              ],
            ).bottomPadding(30.0.scale())
          ],
        ));
  }
}
