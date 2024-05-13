import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/components/custom_dialog.dart';
import 'package:ndisparticipant/home/home.dart';
import 'package:ndisparticipant/root/user_repository.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

import '../../Helpers/theme/theme.dart';
import '../../Helpers/utils/utils.dart';
import '../../bottom_navigation/bloc/bloc.dart';
import '../../components/components.dart';
import '../../main_common.dart';

const double _kVerticalSpaceAfterUserNameField = 25.0;
const double _kSignInTextFont = 14.0;

// final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool valuefirst = false;
  bool showProgressIndicator = false;
  TextEditingController _textFiledUserName = TextEditingController();
  TextEditingController _textFiledPassword = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final FocusNode _focusNodeId = FocusNode();
  final FocusNode _focusNodePass = FocusNode();
  UserRepository? _userRepository;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  TooltipDirection _direction = TooltipDirection.down;
  bool check = false;
  bool showTooltip1 = false;
  bool hideOnTap1 = true;
  bool showTooltip2 = false;
  bool hideOnTap2 = true;
  bool _changeBorder = false;
  String alertMessage = "demo";
  final focus = FocusNode();
  String screen_name = "";
  String category_name = "";
  String category_id = "";
  String event_id = "";
  String blog_id = "";
  String plan_id = "";
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    _userRepository = UserRepository();
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeLoginPageState) {
      screen_name = homeState.screen;
      category_id = homeState.category_id!;
      category_name = homeState.category_name!;
      event_id = homeState.event_id!;
      blog_id = homeState.blog_id!;
      plan_id = homeState.plan_id!;
      print("screen_name____login___$screen_name");
    }
    super.initState();
  }

  @override
  void dispose() {
    _focusNodeId.dispose();
    _focusNodePass.dispose();
    super.dispose();
  }

  // Future<void> _handleUseNotificationRequest(BuildContext context) async {
  //   PermissionStatus statusBeforeRequest = await Permission.notification.status;
  //   switch (statusBeforeRequest) {
  //     case PermissionStatus.granted:
  //       print("Granted ====");
  //
  //       break;
  //     case PermissionStatus.denied:
  //       PermissionStatus statusAfterRequest =
  //           await Permission.notification.request();
  //       if (statusAfterRequest == PermissionStatus.granted) {
  //         print("Granted ====");
  //       } else {
  //         if (Platform.isAndroid) {
  //           // showTwoButtonDialogWithImage(
  //           //     context: context,
  //           //     titleText: Strings.current.txtNotificationPermission,
  //           //     descText:
  //           //     Strings.current.txtNotificationAndroidAlertDesc,
  //           //     btnTitleText: Strings.current.txtOk,
  //           //     btnOnPressed: () {},
  //           //     btnOnPressedSetting: () {
  //           //       openAppSettings()
  //           //           .then((value) => _handleUseNotificationRequest(context));
  //           //     });
  //         } else {
  //           // showTwoButtonDialogWithImage(
  //           //     context: context,
  //           //     titleText:Strings.current.txtNotificationPermission,
  //           //     descText:
  //           //     Strings.current.txtNotificationIOSAlertDesc,
  //           //     btnTitleText:  Strings.current.txtOk,
  //           //     btnOnPressed: () {},
  //           //     btnOnPressedSetting: () {
  //           //       openAppSettings()
  //           //           .then((value) => _handleUseNotificationRequest(context));
  //           //     });
  //         }
  //       }
  //
  //       // showNotificatiocPermissionDeniedDialog(context: context);
  //       break;
  //     case PermissionStatus.permanentlyDenied:
  //       PermissionStatus statusAfterRequest =
  //           await Permission.notification.request();
  //       if (statusAfterRequest == PermissionStatus.granted) {
  //         print("Granted ====");
  //       } else {
  //         if (Platform.isAndroid) {
  //           // showTwoButtonDialogWithImage(
  //           //     context: context,
  //           //     titleText:Strings.current.txtNotificationPermission,
  //           //     descText:
  //           //     Strings.current.txtNotificationAndroidAlertDesc,
  //           //     btnTitleText:  Strings.current.txtOk,
  //           //     btnOnPressed: () {},
  //           //     btnOnPressedSetting: () {
  //           //       openAppSettings()
  //           //           .then((value) => _handleUseNotificationRequest(context));
  //           //     });
  //         } else {
  //           // showTwoButtonDialogWithImage(
  //           //     context: context,
  //           //     titleText: Strings.current.txtNotificationPermission,
  //           //     descText:
  //           //     Strings.current.txtNotificationIOSAlertDesc,
  //           //     btnTitleText: Strings.current.txtOk,
  //           //     btnOnPressed: () {},
  //           //     btnOnPressedSetting: () {
  //           //       openAppSettings()
  //           //           .then((value) => _handleUseNotificationRequest(context));
  //           //     });
  //         }
  //       }
  //
  //       break;
  //     case PermissionStatus.restricted:
  //       PermissionStatus statusAfterRequest =
  //           await Permission.notification.request();
  //       if (statusAfterRequest == PermissionStatus.granted) {
  //         print("Granted ====");
  //       } else {
  //         if (Platform.isAndroid) {
  //           // showTwoButtonDialogWithImage(
  //           //     context: context,
  //           //     titleText:  Strings.current.txtNotificationPermission,
  //           //     descText: Strings.current.txtNotificationAndroidAlertDesc,
  //           //     btnTitleText:  Strings.current.txtOk,
  //           //     btnOnPressed: () {},
  //           //     btnOnPressedSetting: () {
  //           //       openAppSettings()
  //           //           .then((value) => _handleUseNotificationRequest(context));
  //           //     });
  //         } else {
  //           // showTwoButtonDialogWithImage(
  //           //     context: context,
  //           //     titleText:Strings.current.txtNotificationPermission,
  //           //     descText: Strings.current.txtNotificationIOSAlertDesc,
  //           //     btnTitleText: Strings.current.txtOk,
  //           //     btnOnPressed: () {},
  //           //     btnOnPressedSetting: () {
  //           //       openAppSettings()
  //           //           .then((value) => _handleUseNotificationRequest(context));
  //           //     });
  //         }
  //       }
  //       break;
  //
  //     default:
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        print("state_is log$state");
        if (state is HomeInitial) {
          print("cc_is__$screen_name");
          Navigator.pop(context, true);
          showHideProgress(false);
        }

        if (state is HomeEventsJobsSubcategoryPageState) {
          showHideProgress(false);
          Navigator.pop(context, true);
          print("back from login to job sub cat");
        }
        if (state is HomeJobsPageState) {
          showHideProgress(false);
          Navigator.pop(context);
          print("back from login to jobpage");
        }
        if (state is HomeServiceDetailsState) {
          showHideProgress(false);
          Navigator.pop(context, true);
          print("back from login to service provider detail");
        }
        if (state is HomeEventsDetailPageClickState) {
          showHideProgress(false);
          Navigator.pop(context, true);
          print("back from login to event detail");
        }
        if (state is HomeSupportWorkerSubCategoryPageState) {
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to support worker");
        }
        if (state is HomeSupportCoordinatorsDetailPageState) {
          print("before support coordinator");
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to support coordinator");
        }
        if (state is HomeServiceDetailsClickState) {
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to service expert");
        }
        if (state is HomeEventsJobsDetailsPageState) {
          showHideProgress(false);
          Navigator.pop(context);
          print("back from login to job detail");
        }
        if (state is HomeBlogDetilsPageState) {
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to blog detail");
        }
        if (state is HomeMpPropertyDetailsState) {
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to property detail");
        }
        if (state is HomeAccommodationPropertyDetailsState) {
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to ACM property detail");
        }
        if (state is HomePlanManagerDetailClickState) {
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to plan detail");
        }
        if (state is PsychosocialDetailBtnClickState) {
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to psycho social");
        }
        if (state is AdvocacyDetailBtnClickState) {
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to advocacy");
        }
        if (state is HomeMpProductDetailPageState) {
          showHideProgress(false);
          Navigator.of(context).pop();
          print("back from login to Product Detail");
        }

        if (state is ForgotApiSuccessState) {
          showHideProgress(false);
          emailController.clear();
          showSnackBar(state.message, Colors.black, context);
        }

        if (state is HomeerrorloadingState) {
          print("error reset");
          showHideProgress(false);
          showSnackBar(state.message, Colors.red, context);
          BlocProvider.of<HomeBloc>(context).add(HomeResetEvent(false));
        }
        if (state is HomeSignUpPage1State) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.signupPageStep1);
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    if (screen_name == "job_sub_cat") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("job_sub_cat"));
                    }
                    if (screen_name == "all_cat_job") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("all_cat_job"));
                    }
                    if (screen_name == "job_detail") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("job_detail"));
                    }
                    if (screen_name == "job_detail2") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("job_detail2"));
                    }
                    if (screen_name == "service_pro_detail") {
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeEventLoginBackBtnClick("service_pro_detail"));
                    }
                    if (screen_name == "product_detail") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("product_detail"));
                    }
                    if (screen_name == "support_worker_contact") {
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeEventLoginBackBtnClick("support_worker_contact"));
                    }
                    if (screen_name == "support_coord_get_quote") {
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeEventLoginBackBtnClick(
                              "support_coord_get_quote"));
                    }
                    if (screen_name == "service_expert_get_quote") {
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeEventLoginBackBtnClick(
                              "service_expert_get_quote"));
                    }
                    if (screen_name == "event_detail") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("event_detail"));
                    }
                    if (screen_name == "blog_detail") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("blog_detail"));
                    }
                    if (screen_name == "mp_prop_detail") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("mp_prop_detail"));
                    }
                    if (screen_name == "acm_prop_detail") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("acm_prop_detail"));
                    }
                    if (screen_name == "plan_detail") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("plan_detail"));
                    }
                    if (screen_name == "psycho_login") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("psycho_login"));
                    }
                    if (screen_name == "advocacy_login") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLoginBackBtnClick("advocacy_login"));
                    }
                    if (screen_name == "") {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventBackBtnClick(''));
                    }
                  },
                  child:
                      Icon(Icons.arrow_back, size: 30, color: Colors.white))),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0.scale()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AVerticalSpace(100.0.scale()),
                  Center(
                    child: Text(
                      "Let's Start",
                      style: textStyleCustomColor(30.0.scale(), Colors.black),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text(
                    'Email',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
                  ),
                  customTextField(
                    textController: _textFiledUserName,
                    focus: _focusNodeId,
                    keyboardType: TextInputType.emailAddress,
                    hint: 'Enter Email Address'
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Password',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(
                      textController: _textFiledPassword,
                      focus: _focusNodePass,
                      obscure: _obscureText,
                      hint: 'Enter Password'
                  ),
                  AVerticalSpace(10.0.scale()),

                  TextButton(
                          onPressed: () {
                            _userRepository!.ScreenName = ScreenNavigation.LoginToForgotScreen;

                            ///Forgot password dialog
                            CustomAlertDialog(
                                context: context,
                                bodyWidget: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0.scale()),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email Address',
                                        style: textStyleCustomColor(
                                          13.0.scale(),
                                          kColorLoginBtn,
                                        ),
                                      ),
                                      Container(
                                        height: 40.0.scale(),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.0.scale()),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xFF20334C),
                                            ),
                                            borderRadius: BorderRadius.circular(5)),
                                        child: TextField(
                                          controller: emailController,
                                          maxLines: 1,
                                          style: textStyleCustomColor(
                                              14.0.scale(), kColorDialogNameTitle),
                                          cursorColor: kColorDialogNameTitle,
                                          textAlignVertical: TextAlignVertical.top,
                                          enableInteractiveSelection: false,
                                          autocorrect: false,
                                          enableSuggestions: false,
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Enter Email",
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 8.0.scale(),
                                                  bottom: 8.0.scale(),
                                                  right: 2.0.scale(),
                                                ),
                                                child: Image.asset(
                                                  "${imgPathGeneral}ic_first_name.png",
                                                ),
                                              ),
                                              hintStyle: textStyleCustomColor(
                                                  14.0.scale(),
                                                  kColorSearchHintText)),
                                        ),
                                      )
                                          .bottomPadding(15.0.scale())
                                          .topPadding(5.0.scale()),
                                    ],
                                  ),
                                ),
                                buttonText: "Send",
                                cancelText: "Cancel",
                                onCancelTap: () {
                                  emailController.clear();
                                  Navigator.of(context, rootNavigator: true).pop();
                                },
                                onTap: () {
                                  if (emailController!.text.toString().isEmpty) {
                                    showSnackBar("Please enter your Email id.",
                                        Colors.black, context);
                                  } else if (validateEmail(
                                          emailController!.text.toString()) ==
                                      false) {
                                    showSnackBar("Please enter valid Email id.",
                                        Colors.black, context);
                                  } else {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    showHideProgress(true);
                                    BlocProvider.of<HomeBloc>(context).add(
                                        HomeEventForgotBtnClick(
                                            emailController!.text));
                                  }
                                });
                          },
                          child: Text("Forgot my password",
                              style: textStyleCustomColor(
                                14.0.scale(),
                                kColorThemePurpleColor,
                              )).align(Alignment.center)),
                  AVerticalSpace(10.0.scale()),
                  ARoundedButton(
                    btnBgColor: kColorThemePurpleColor,
                    btnTextColor: Colors.white,
                    btnOnPressed: () {
                      if (_textFiledUserName!.text.toString().isEmpty) {
                        showSnackBar("Please enter your email id.", Colors.black, context);
                      } else if (validateEmail(_textFiledUserName!.text.toString()) == false) {
                        showSnackBar("Invalid email id.", Colors.black, context);
                      } else if (_textFiledPassword!.text.toString().isEmpty) {
                        showSnackBar("Please enter your password.", Colors.black, context);
                      } else {
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context)
                            .add(HomeEventLoginBtnClick(
                          _textFiledUserName!.text,
                          _textFiledPassword!.text,
                          screen_name,
                          category_name,
                          category_id,
                          event_id,
                          blog_id,
                        ));
                      }
                    },
                    btnText: 'LOGIN',
                    btnHeight: 50.0.scale(),
                    btnFontSize: 12.0.scale(),
                    btnFontWeight: FontWeight.bold,
                    btnElevation: 0,
                    btnBorderSideColor: Colors.transparent,
                  ),
                  AVerticalSpace(15.0.scale()),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(HomeEventLogintoSignupBtnClick());
                        },
                        child: Text(
                          "Create Account",
                          style: textStyleCustomColor(
                            _kSignInTextFont,
                            kColorThemePurpleColor,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField({
    required TextEditingController textController,
    String? hint,
    required FocusNode focus,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool? isRead,
    bool? obscure,
  }) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focus);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
        height: 50.0.scale(),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: TextField(
          controller: textController,
          focusNode: focus,
          readOnly: isRead == true ? true : false,
          maxLines: 1,
          textInputAction: textInputAction?? TextInputAction.done,
          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: obscure?? false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint ?? '',
            hintStyle: textStyleCustomColor(14.0.scale(), Colors.grey),
            suffixIcon: obscure != null?
            InkWell(
                highlightColor: Colors.transparent,
                onTap: (){
                  _toggle();
                },
                child: Icon(obscure == true? CupertinoIcons.eye_fill: CupertinoIcons.eye_slash_fill)): null,
          ),
        ),
      ),
    );
  }

}
