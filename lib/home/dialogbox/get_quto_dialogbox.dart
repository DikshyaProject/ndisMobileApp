import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';

import '../../Helpers/theme/ft_theme_styles.dart';
import '../../components/a_vertical_space.dart';

const double _kVerticalSpaceTopHeartLogo = 90.0;
const double _kVerticalSpaceAfterUserNameField = 25.0;
const double _kCommonPadding = 14.0;
const double _kCommonHintTextFieldFontSize = 14.0;
const double _kWelcomeTextFont = 15.0;
const double _kSignInTextFont = 14.0;
final FocusNode _focusNodeemailIdController = FocusNode();
final FocusNode _focusNodepassWordController = FocusNode();

getQuotedilogbox({
  required BuildContext context,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return _getOneButtonDialog(
        context: context,
      );
    },
  );
}

Dialog _getOneButtonDialog({
  required BuildContext context,
}) {
  return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.scale())),
      elevation: 8,
      insetAnimationDuration: Duration(milliseconds: 30),
      insetPadding: EdgeInsets.all(10.0.scale()),
      child: Container(
        height: 450.0.scale(),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xFF20334C),
              centerTitle: false,
              elevation: 0,
              title: Text(
                "Get Quote",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ).align(Alignment.topCenter).rightPadding(15.0.scale()),
              leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    //keyBoardHideFocusChange(context);
                    // BlocProvider.of<HomeBloc>(context)
                    //     .add(HomeEventBackBtnClick());
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white)
                      .leftPadding(5.0.scale()))),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AVerticalSpace(10.0.scale()),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 10),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "User name",
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter your Name"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 10),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Email",
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter Email"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 10),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Mobile Number",
                        prefixIcon: Icon(Icons.mobile_friendly_sharp),
                        hintText: "Enter Mobile Number"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 10),
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Your Query or message",
                        hintText: "Enter message"),
                  ),
                ),
                AVerticalSpace(10.0.scale()),
                Container(
                  height: 80.0.scale(),
                  width: 200.0.scale(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey),
                    color: Colors.blue,
                  ),
                  child: Text(
                          "Please sing in First then\n your can make Enquiry, \nas per your plan",
                          textAlign: TextAlign.center,
                          style:
                              textStyleCustomColor(12.0.scale(), Colors.white))
                      .align(Alignment.center),
                ),
                AVerticalSpace(50.0.scale())
              ],
            ),
          ),
        ),
      ));
}
