import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/enumerations.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../../bottom_navigation/bloc/bloc.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  TextEditingController emailController = TextEditingController();
  final FocusNode _focusEmail = FocusNode();

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  void onTabTapped(int index) {
    BlocProvider.of<BottomNavigationBloc>(context).add(
        BottomNavigationEventTabChanged(
            selectedTab: BottomNavigationTab.values[0]));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ProfileInitial) {
          showHideProgress(false);
           
          Navigator.of(context).pop();
        }
        if (state is ChangeEmailSuccessState) {
          showHideProgress(false);
           
          showSnackBar("${state.message}", Colors.black, context);
          Navigator.of(context).pop();
        }
        if (state is ProfileErrorState) {
          showHideProgress(false);
           
          Navigator.of(context).pop();
          showSnackBar("${state.message}", Colors.black, context);
        }
      },
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(ProfileEventBackBtnClick(""));
                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kColorThemePurpleColor),
                    child: Icon(Icons.arrow_back, color: Colors.white)))),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
            child: Column(
              children: [
                AVerticalSpace(180.0.scale()),
                Text(
                  'Change Email Address',
                  style: textStyleBoldCustomColor(18.0.scale(), Colors.black),
                ),
                AVerticalSpace(25.0.scale()),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(_focusEmail);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      controller: emailController,
                      focusNode: _focusEmail,
                      autofocus: true,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: textStyleCustomColor(
                          14.0.scale(), kColorDialogNameTitle),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Email Address',
                        hintStyle:
                            textStyleCustomColor(14.0.scale(), Colors.grey),
                      ),
                    ),
                  ),
                ),
                AVerticalSpace(10.0.scale()),
                InkWell(
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      showSnackBar("Please enter your email address",
                          Colors.black, context);
                    } else if (validateEmail(emailController.text) == false) {
                      showSnackBar("Please enter valid email address",
                          Colors.black, context);
                    } else {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context).add(
                          ChangeEmailBtnClick(email: emailController.text));
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45.0.scale(),
                    decoration: BoxDecoration(
                      color: kColorThemePurpleColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Submit".toUpperCase(),
                      style: textStyleBoldCustomLargeColor(
                          15.0.scale(), Colors.white),
                    ).align(Alignment.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
