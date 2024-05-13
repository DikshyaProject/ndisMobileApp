import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/custom_dialog.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_separator_line.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/support_worker/support_worker_user_list_model.dart';

SupportWorkerUserData? supportWorkerUserData;
List<SupportWorkerUserList>? supportWorkerUserList = [];

class SupportWorkerSubCategoryPage extends StatefulWidget {
  const SupportWorkerSubCategoryPage({Key? key}) : super(key: key);

  @override
  _SupportWorkerSubCategoryPageState createState() =>
      _SupportWorkerSubCategoryPageState();
}

class _SupportWorkerSubCategoryPageState
    extends State<SupportWorkerSubCategoryPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  bool showDate = false;
  DateTime? picked;
  DateTime selectedDate = DateTime.now();
  String? screen;
  String supp_cat_id = '';

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    dateController.text = "Preferred Date";
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeSupportWorkerSubCategoryPageState) {
      supportWorkerUserData = homeState.supportWorkerUserData;
      supportWorkerUserList = supportWorkerUserData!.supportWorkerUserList;
      screen = homeState.screenName!;
      supp_cat_id = homeState.supp_cat_id!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("screen============================$screen");
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          if (state is HomeSupportWorkerPageState) {
            print("state_is_2___$state");
            Navigator.pop(context);
          }
          if (state is HomeSupportWorkerServiceDetailsPageState) {
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.homeSupportWorkerServiceDetailsPage);
          }
          if (state is HomeLoginPageState) {
            Navigator.of(context).pushNamed(HomeNavigator.loginPage);
          }

          if (state is ContactSwSuccessState) {
            showHideProgress(false);
            BlocProvider.of<HomeBloc>(context).add(
                HomeEventSupportWorkerSubCatgoryListDetailsBtnClick(
                    supp_cat_id, screen));
            showSnackBar(state.message, Colors.black, context);
          }

          if (state is HomeerrorloadingState) {
            showHideProgress(false);
            BlocProvider.of<HomeBloc>(context).add(
                HomeEventSupportWorkerSubCatgoryListDetailsBtnClick(
                    supp_cat_id, screen));
            showSnackBar(state.message, Colors.red, context);
          }
        },
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Support Worker",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(HomeEventBackBtnClick(''));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),
          body: ListView.builder(
              itemCount: supportWorkerUserList?.length,
              itemBuilder: (context3, int index) {
                return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: kColorThemePurpleColor,
                              blurRadius: 2.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5.0.scale()),
                          color: Colors.white,
                        ),
                        child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              AVerticalSpace(10.0.scale()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AVerticalSpace(10.0.scale()),
                                  Container(
                                    width: 100.0.scale(),
                                    height: 100.0.scale(),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0.scale()),
                                        border: Border.all(color: Colors.grey)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5.0.scale()),
                                        topLeft: Radius.circular(5.0.scale()),
                                        bottomRight:
                                            Radius.circular(5.0.scale()),
                                        bottomLeft:
                                            Radius.circular(5.0.scale()),
                                      ),
                                      child: NetworkImagesWidgets(
                                        url: supportWorkerUserList![index]
                                            .profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  AHorizontalSpace(10.0.scale()),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            supportWorkerUserList![index]
                                                .userName!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleBoldCustomColor(
                                                16.0.scale(),
                                                Color(0xFF5A86C9)),
                                          ),
                                          Image.asset(
                                            "assets/images/ic_verifid.png",
                                            width: 30.0.scale(),
                                            height: 30.0.scale(),
                                            fit: BoxFit.fill,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/ic_locationlist.png',
                                            height: 15.0.scale(),
                                            width: 15.0.scale(),
                                            color: Colors.green,
                                          ),
                                          AHorizontalSpace(8.0.scale()),
                                          Text(
                                            "${supportWorkerUserList?[index].happyToTravel} away",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: textStyleCustomColor(
                                                12.0.scale(), Colors.black),
                                          )
                                        ],
                                      ),
                                      AVerticalSpace(5.0.scale()),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/ic_locationlist.png',
                                            height: 15.0.scale(),
                                            width: 15.0.scale(),
                                            color: Colors.green,
                                          ),
                                          AHorizontalSpace(8.0.scale()),
                                          Text(
                                            "Check profile for Availability",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: textStyleCustomColor(
                                                12.0.scale(), Colors.black),
                                          )
                                        ],
                                      ),
                                      AVerticalSpace(5.0.scale()),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RippleAnimation(
                                            repeat: true,
                                            color: Colors.green,
                                            minRadius: 8,
                                            ripplesCount: 1,
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Container(
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            ),
                                          ),
                                          AHorizontalSpace(8.0.scale()),
                                          Text(
                                            "Last active ${supportWorkerUserList?[index].lastActive} ",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: textStyleCustomColor(
                                                12.0.scale(), Colors.black),
                                          )
                                        ],
                                      ),
                                      AVerticalSpace(5.0.scale()),
                                      SizedBox(
                                        width: 200.0.scale(),
                                        child: Text(
                                          "${supportWorkerUserList?[index].aboutMe}",
                                          style: textStyleCustomColor(
                                              14.0.scale(), Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              AVerticalSpace(10.0.scale()),
                              Row(
                                children: [
                                  Container(
                                    height: 18.0.scale(),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      "${supportWorkerUserList?[index].serviceDone} Services Done",
                                      textAlign: TextAlign.center,
                                      style: textStyleCustomColor(
                                          10.0.scale(), Color(0xFFF57F17)),
                                    )
                                        .rightPadding(5.0.scale())
                                        .leftPadding(5.0.scale()),
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  Container(
                                    height: 18.0.scale(),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      "yearsExp. ${supportWorkerUserList?[index].yearsExp} ",
                                      textAlign: TextAlign.center,
                                      style: textStyleCustomColor(
                                          10.0.scale(), Color(0xFFF57F17)),
                                    )
                                        .rightPadding(5.0.scale())
                                        .leftPadding(5.0.scale()),
                                  )
                                ],
                              ),
                              AVerticalSpace(20.0.scale()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (sharedPrefs.IsLogin == false) {
                                        BlocProvider.of<HomeBloc>(context).add(
                                            EventSupportWorkerToLoginBtnClick(
                                                screen?? "support_worker_contact"));
                                      } else {
                                        nameController.text =
                                            sharedPrefs.userName;
                                        emailController.text =
                                            sharedPrefs.userEmail;
                                        mobileController.text =
                                            sharedPrefs.userMobile;

                                        ///contact me dialog
                                        CustomStatefulAlertDialog(
                                          context: context,
                                          bodyWidget: StatefulBuilder(builder:
                                              (context2,
                                                  StateSetter dialogsetState) {
                                            return SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true)
                                                                .pop();
                                                            showDate = false;
                                                            dateController
                                                                    .text =
                                                                "Preferred Date";
                                                            dialogsetState(
                                                                () {});
                                                          },
                                                          child: Icon(
                                                              CupertinoIcons
                                                                  .multiply))
                                                      .align(
                                                          Alignment.topRight),
                                                  Text(
                                                    'Hey',
                                                    style:
                                                        textStyleBoldCustomLargeColor(
                                                            16.0.scale(),
                                                            Colors.black),
                                                  ).align(Alignment.center),
                                                  Text(
                                                    nameController.text,
                                                    style: textStyleCustomColor(
                                                        13.0.scale(),
                                                        Colors.black),
                                                  ).align(Alignment.center),
                                                  AVerticalSpace(20.0.scale()),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                10.0.scale()),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD8D8D8),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: TextField(
                                                      controller:
                                                          nameController,
                                                      maxLines: 1,
                                                      style: textStyleCustomColor(
                                                          14.0.scale(),
                                                          kColorDialogNameTitle),
                                                      readOnly: true,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: '',
                                                        hintStyle:
                                                            textStyleCustomColor(
                                                                14.0.scale(),
                                                                kColorSearchHintText),
                                                      ),
                                                    ),
                                                  ),
                                                  AVerticalSpace(10.0.scale()),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                10.0.scale()),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD8D8D8),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: TextField(
                                                      controller:
                                                          emailController,
                                                      maxLines: 1,
                                                      style: textStyleCustomColor(
                                                          14.0.scale(),
                                                          kColorDialogNameTitle),
                                                      readOnly: true,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: '',
                                                        hintStyle:
                                                            textStyleCustomColor(
                                                                14.0.scale(),
                                                                kColorSearchHintText),
                                                      ),
                                                    ),
                                                  ),
                                                  AVerticalSpace(10.0.scale()),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                10.0.scale()),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD8D8D8),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: TextField(
                                                      controller:
                                                          mobileController,
                                                      maxLines: 1,
                                                      style: textStyleCustomColor(
                                                          14.0.scale(),
                                                          kColorDialogNameTitle),
                                                      readOnly: true,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: '',
                                                        hintStyle:
                                                            textStyleCustomColor(
                                                                14.0.scale(),
                                                                kColorSearchHintText),
                                                      ),
                                                    ),
                                                  ),
                                                  AVerticalSpace(10.0.scale()),
                                                  // Container(
                                                  //   padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                                                  //   decoration: BoxDecoration(
                                                  //       border: Border.all(color: Color(0xFFD8D8D8),),
                                                  //       color: Color(0xFFD8D8D8),
                                                  //       borderRadius: BorderRadius.circular(5)
                                                  //   ),
                                                  //   child: TextField(
                                                  //     controller: serviceController,
                                                  //     maxLines: 1,
                                                  //     style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                                                  //     readOnly: true,
                                                  //     decoration: InputDecoration(
                                                  //       border: InputBorder.none,
                                                  //       hintText: '',
                                                  //       hintStyle: textStyleCustomColor(14.0.scale(), kColorSearchHintText),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  // AVerticalSpace(10.0.scale()),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                10.0.scale(),
                                                            vertical:
                                                                4.0.scale()),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD8D8D8),
                                                        ),
                                                        color:
                                                            Color(0xFFD8D8D8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: TextField(
                                                      controller:
                                                          dateController,
                                                      maxLines: 1,
                                                      style: textStyleCustomColor(
                                                          14.0.scale(),
                                                          kColorDialogNameTitle),
                                                      readOnly: true,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: '',
                                                        hintStyle:
                                                            textStyleCustomColor(
                                                                14.0.scale(),
                                                                kColorSearchHintText),
                                                      ),
                                                      onTap: () async {
                                                        picked =
                                                            await showDatePicker(
                                                          context: context2,
                                                          initialDate:
                                                              selectedDate,
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime(2025),
                                                        );
                                                        if (picked != null &&
                                                            picked !=
                                                                selectedDate)
                                                          dialogsetState(() {
                                                            selectedDate =
                                                                picked!;
                                                            dateController
                                                                .text = DateFormat(
                                                                    'dd-MMMM-yyyy')
                                                                .format(DateTime.parse(
                                                                    selectedDate
                                                                        .toString()));
                                                          });
                                                        print(
                                                            "selectedDate___${dateController.text}");
                                                      },
                                                    ),
                                                  ),

                                                  // if(showDate == true)
                                                  //   Container(
                                                  //     decoration: BoxDecoration(
                                                  //         border: Border.all(color: Color(0xFFD8D8D8),),
                                                  //         color: Colors.white,
                                                  //         borderRadius: BorderRadius.circular(5)
                                                  //     ),
                                                  //     height: 200.0.scale(),
                                                  //     child: Stack(
                                                  //       children: [
                                                  //
                                                  //         CupertinoDatePicker(
                                                  //           mode: CupertinoDatePickerMode.date,
                                                  //           initialDateTime: DateTime(1969, 1, 1),
                                                  //           onDateTimeChanged: (DateTime newDateTime) {
                                                  //             print("selected_date_____${newDateTime}");
                                                  //             dateController.text= DateFormat('dd-MMMM-yyyy').format(DateTime.parse(newDateTime.toString()));
                                                  //             dialogsetState(() {});
                                                  //           },
                                                  //         ),
                                                  //
                                                  //         Positioned(
                                                  //           right: 5.0.scale(),
                                                  //           top: 5.0.scale(),
                                                  //           child: InkWell(
                                                  //               onTap: (){
                                                  //                 showDate = false;
                                                  //                 dialogsetState(() {});
                                                  //               },
                                                  //               child: Icon(CupertinoIcons.multiply)),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  //   ).topPadding(10.0.scale()),
                                                  AVerticalSpace(10.0.scale()),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                10.0.scale()),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD8D8D8),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: TextField(
                                                      controller:
                                                          locationController,
                                                      maxLines: 4,
                                                      style: textStyleCustomColor(
                                                          14.0.scale(),
                                                          kColorDialogNameTitle),
                                                      cursorColor:
                                                          kColorDialogNameTitle,
                                                      textAlignVertical:
                                                          TextAlignVertical.top,
                                                      enableInteractiveSelection:
                                                          false,
                                                      autocorrect: false,
                                                      enableSuggestions: false,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            "Enter your location",
                                                        hintStyle:
                                                            textStyleCustomColor(
                                                                14.0.scale(),
                                                                kColorSearchHintText),
                                                      ),
                                                    ),
                                                  ),
                                                  AVerticalSpace(10.0.scale()),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                10.0.scale()),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD8D8D8),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: TextField(
                                                      controller:
                                                          queryController,
                                                      maxLines: 6,
                                                      style: textStyleCustomColor(
                                                          14.0.scale(),
                                                          kColorDialogNameTitle),
                                                      cursorColor:
                                                          kColorDialogNameTitle,
                                                      textAlignVertical:
                                                          TextAlignVertical.top,
                                                      enableInteractiveSelection:
                                                          false,
                                                      autocorrect: false,
                                                      enableSuggestions: false,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            "Enter your query or message",
                                                        hintStyle:
                                                            textStyleCustomColor(
                                                                14.0.scale(),
                                                                kColorSearchHintText),
                                                      ),
                                                    ),
                                                  ),
                                                  AVerticalSpace(10.0.scale()),
                                                  InkWell(
                                                    onTap: () {
                                                      if (dateController
                                                              .text.isEmpty ||
                                                          dateController.text ==
                                                              "Preferred Date") {
                                                        showSnackBar(
                                                            "Please select Preferred Date",
                                                            Colors.black,
                                                            context);
                                                      } else if (queryController
                                                          .text.isEmpty) {
                                                        showSnackBar(
                                                            "Please enter your query or message",
                                                            Colors.black,
                                                            context);
                                                      } else if (locationController
                                                          .text.isEmpty) {
                                                        showSnackBar(
                                                            "Please enter your location",
                                                            Colors.black,
                                                            context);
                                                      } else {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop();
                                                        showHideProgress(true);
                                                        BlocProvider.of<
                                                                    HomeBloc>(
                                                                context)
                                                            .add(
                                                                ContactSWBtnClick(
                                                          sharedPrefs.userID,
                                                          "${supportWorkerUserList![index].userId}",
                                                          dateController.text,
                                                          queryController.text,
                                                          locationController
                                                              .text,
                                                        ));
                                                      }
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 45.0.scale(),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff00BDAA),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Text(
                                                        "Submit",
                                                        style:
                                                            textStyleBoldCustomLargeColor(
                                                                15.0.scale(),
                                                                Colors.white),
                                                      ).align(Alignment.center),
                                                    ),
                                                  ),

                                                  AVerticalSpace(10.0.scale()),
                                                ],
                                              ),
                                            );
                                          }),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 50.0.scale(),
                                      width: 130.0.scale(),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Color(0xFFF08919),
                                      ),
                                      child: Text(
                                        "Contact me",
                                        style: textStyleCustomColor(
                                            12.0.scale(), Colors.white),
                                      )
                                          .rightPadding(5.0.scale())
                                          .leftPadding(5.0.scale())
                                          .align(Alignment.center),
                                    ),
                                  ),
                                  AHorizontalSpace(10.0.scale()),
                                  InkWell(
                                    onTap: () {
                                      showHideProgress(true);
                                      BlocProvider.of<HomeBloc>(context).add(
                                          HomeEventSupportWorkeMoreDetailsBtnClick(
                                              supportWorkerUserList![index]
                                                  .userId!,
                                              screen));
                                    },
                                    child: Container(
                                      height: 50.0.scale(),
                                      width: 130.0.scale(),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        // border: Border.all(color: Colors.red),
                                        color: Color(0xFF241C55),
                                      ),
                                      child: Text(
                                        "More details",
                                        style: textStyleCustomColor(
                                            12.0.scale(), Colors.white),
                                      )
                                          .rightPadding(5.0.scale())
                                          .leftPadding(5.0.scale())
                                          .align(Alignment.center),
                                    ),
                                  ),
                                ],
                              ),
                              AVerticalSpace(8.0.scale()),
                              ASeparatorLine(
                                height: 1.0.scale(),
                                color:
                                    KColorAppointmentDropinHistoryListSeprator,
                              ),
                              AVerticalSpace(10.0.scale()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30.0.scale(),
                                    width: 130.0.scale(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/ic_locationlist.png',
                                          height: 15.0.scale(),
                                          width: 15.0.scale(),
                                          color: Colors.green,
                                        ),
                                        AHorizontalSpace(3.0.scale()),
                                        Text(
                                          "Save",
                                          style: textStyleBoldCustomColor(
                                              14.0.scale(), Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 30.0.scale(),
                                    width: 130.0.scale(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/ic_locationlist.png',
                                          height: 15.0.scale(),
                                          width: 15.0.scale(),
                                          color: Colors.green,
                                        ),
                                        AHorizontalSpace(3.0.scale()),
                                        Text(
                                          "Hide",
                                          style: textStyleBoldCustomColor(
                                              14.0.scale(), Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AVerticalSpace(10.0.scale())
                            ])
                            .leftPadding(5.0.scale())
                            .rightPadding(5.0.scale()))
                    .topPadding(10.0.scale())
                    .leftPadding(8.0.scale())
                    .rightPadding(8.0.scale())
                    .bottomPadding(10.0.scale());
              }).rightPadding(5.0.scale()).bottomPadding(10.0.scale()),
        )));
  }
}
