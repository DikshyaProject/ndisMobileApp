import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/custom_dialog.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/get_setting_model.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  GetSettingData? data;
  Deatils? details;
  List account_status_list = [
    "Active",
    "In-Active",
    "Close Account",
  ];
  String selected_account = "Active";
  List review_list = [
    "Active",
    "In-Active",
  ];
  String selected_review = "Active";
  List share_list = [
    "Active",
    "In-Active",
  ];
  String selected_share = "Active";
  List profile_setting_list = [
    "Active",
    "In-Active",
  ];
  String selected_profile = "Active";

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is SettingClickState) {
      data = profileState.getSettingModel?.data;
      details = data?.deatils;
      print("setting_data_____${details?.accountStatus}");
      selected_account = "${details?.accountStatus}";
      selected_review = "${details?.listingReview}";
      selected_share = "${details?.listingShare}";
      selected_profile = "${details?.profileShow}";
    }
    super.initState();
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
        if (state is ChangeSettingState) {
          showHideProgress(false);
          showSnackBar(state.message!, Colors.black, context);
          Navigator.of(context).pop();

          if (selected_account == "Close Account") {
            onTabTapped(0);
            sharedPrefs.IsLogin = false;
            sharedPrefs.userName = "";
            sharedPrefs.serviceLocation = "";
            sharedPrefs.userType = "";
            sharedPrefs.userImage = "";

            Phoenix.rebirth(context);
          }
        }
        if (state is ProfileErrorState) {
          showHideProgress(false);
          showSnackBar(state.message!, Colors.black, context);
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Profile Setting",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(ProfileEventBackBtnClick(""));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),
          body: Padding(
            padding: EdgeInsets.all(15.0.scale()),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account status",
                      style:
                          textStyleBoldCustomColor(14.0.scale(), Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0.scale(), vertical: 5.0.scale()),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: kColorThemePurpleColor,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Container(
                        color: Colors.white,
                        height: 40.0.scale(),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: account_status_list
                                ?.map<DropdownMenuItem<String>>((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: textStyleCustomColor(
                                    14.0.scale(),
                                    kColorLoginBtn,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selected_account = newValue!;
                                print("selected_account____$selected_account");
                              });
                            },
                            hint: Text(selected_account,
                                style: textStyleCustomColor(
                                    14.0.scale(), Colors.black)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AVerticalSpace(15.0.scale()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Listing reviews",
                      style:
                          textStyleBoldCustomColor(14.0.scale(), Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0.scale(), vertical: 5.0.scale()),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: kColorThemePurpleColor,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Container(
                        color: Colors.white,
                        height: 40.0.scale(),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: review_list
                                ?.map<DropdownMenuItem<String>>((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: textStyleCustomColor(
                                    14.0.scale(),
                                    kColorLoginBtn,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selected_review = newValue!;
                                print("selected_review____$selected_review");
                              });
                            },
                            hint: Text(selected_review,
                                style: textStyleCustomColor(
                                    14.0.scale(), Colors.black)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AVerticalSpace(15.0.scale()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Listing share",
                      style:
                          textStyleBoldCustomColor(14.0.scale(), Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0.scale(), vertical: 5.0.scale()),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: kColorThemePurpleColor,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Container(
                        color: Colors.white,
                        height: 40.0.scale(),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: share_list
                                ?.map<DropdownMenuItem<String>>((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: textStyleCustomColor(
                                    14.0.scale(),
                                    kColorLoginBtn,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selected_share = newValue!;
                                print("selected_share____$selected_share");
                              });
                            },
                            hint: Text(selected_share,
                                style: textStyleCustomColor(
                                    14.0.scale(), Colors.black)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AVerticalSpace(15.0.scale()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "Show my profile on listing page",
                      style:
                          textStyleBoldCustomColor(14.0.scale(), Colors.black),
                    )),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0.scale(), vertical: 5.0.scale()),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: kColorThemePurpleColor,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Container(
                        color: Colors.white,
                        height: 40.0.scale(),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: profile_setting_list
                                ?.map<DropdownMenuItem<String>>((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: textStyleCustomColor(
                                    14.0.scale(),
                                    kColorLoginBtn,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selected_profile = newValue!;
                                print("selected_profile____$selected_profile");
                              });
                            },
                            hint: Text(selected_profile,
                                style: textStyleCustomColor(
                                    14.0.scale(), Colors.black)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              if (selected_account == "Close Account") {
                CustomStatefulAlertDialog(
                  context: context,
                  bodyWidget: StatefulBuilder(
                      builder: (context2, StateSetter dialogsetState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "If you choose Close account, your account will going to be close permanently!",
                          style: textStyleBoldCustomColor(
                              13.0.scale(), Colors.black),
                        ).align(Alignment.center),
                        AVerticalSpace(15.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showHideProgress(true);
                                BlocProvider.of<HomeBloc>(context).add(
                                    ChangeSettingEvent(
                                        selected_account,
                                        selected_review,
                                        selected_share,
                                        selected_profile));
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kColorThemePurpleColor,
                                  ),
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 40.0.scale(),
                                  child: Text(
                                    "I am sure",
                                    style: textStyleBoldCustomColor(
                                        14.0.scale(), Colors.white),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                  ),
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 40.0.scale(),
                                  child: Text(
                                    "Cancel",
                                    style: textStyleBoldCustomColor(
                                        14.0.scale(), Colors.black),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                );
              } else {
                showHideProgress(true);
                BlocProvider.of<HomeBloc>(context).add(ChangeSettingEvent(
                    selected_account,
                    selected_review,
                    selected_share,
                    selected_profile));
              }
            },
            child: Padding(
              padding: EdgeInsets.all(15.0.scale()),
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50.0.scale(),
                  child: Text(
                    "Save Changes",
                    style: textStyleBoldCustomColor(14.0.scale(), Colors.white),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
