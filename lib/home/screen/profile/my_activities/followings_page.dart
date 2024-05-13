import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_non_scroll_grid_view.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/home.dart';

import '../../../profile_model/followings_model.dart';

class FollowingsPage extends StatefulWidget {
  const FollowingsPage({super.key});

  @override
  State<FollowingsPage> createState() => _FollowingsPageState();
}

class _FollowingsPageState extends State<FollowingsPage> {
  FollowingData? following_data;
  List<FollowingList>? following_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is FollowingsClickState) {
      following_data = profileState.followingsModel?.data;
      following_list = following_data?.followingList;
      print("following_list___${following_list?.first.emailId}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ProfileInitial) {
          showHideProgress(false);
          Navigator.of(context).pop();
        } else if (state is AllUserClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.AllUserPage);
        } else if (state is ProfileErrorState) {
          showHideProgress(false);
          showSnackBar(state.message!, Colors.red, context);
        } else if (state is FollowUnfollowState) {
          showHideProgress(false);
          showSnackBar(state.message!, Colors.black, context);
          BlocProvider.of<HomeBloc>(context).add(FollowingsClickEvent());
        } else if (state is FollowingsClickState) {
          showHideProgress(false);
          following_data = state.followingsModel?.data;
          following_list = following_data?.followingList;
        }
      },
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
            backgroundColor: kColorThemePurpleColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Followings",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.0.scale(), vertical: 8.0.scale()),
            child: Column(
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(AllUserClickEvent());
                    },
                    child: Text(
                      "VIEW ALL USER",
                      style: textStyleBoldCustomLargeColor(
                          12.0.scale(), Colors.black),
                    ).align(Alignment.centerRight)),
                AVerticalSpace(10.0.scale()),
                GoogleGrid(
                  columnCount: 2,
                  gap: 10.0.scale(),
                  padding: const EdgeInsets.all(0),
                  children: [
                    for (int j = 0;
                        j < int.parse("${following_list?.length}");
                        j++)
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120.0.scale(),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                              child: NetworkImagesWidgets(
                                url: "${following_list?[j].profileImage}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0.scale(), vertical: 5.0.scale()),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${following_list?[j].firstName} ${following_list?[j].lastName}",
                                  maxLines: 1,
                                  style: textStyleBoldCustomLargeColor(
                                      12.0.scale(), Colors.black),
                                ),
                                Text(
                                  "${following_list?[j].userState}, ${following_list?[j].userCountry}",
                                  maxLines: 1,
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(10.0.scale()),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${following_list?[j].allListCount}",
                                          style: textStyleBoldCustomLargeColor(
                                              15.0.scale(), Colors.black),
                                        ),
                                        Text(
                                          "Listings",
                                          style: textStyleCustomColor(
                                              12.0.scale(), Colors.black),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${following_list?[j].allEventCount}",
                                          style: textStyleBoldCustomLargeColor(
                                              15.0.scale(), Colors.black),
                                        ),
                                        Text(
                                          "Events",
                                          style: textStyleCustomColor(
                                              12.0.scale(), Colors.black),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${following_list?[j].allBlogCount}",
                                          style: textStyleBoldCustomLargeColor(
                                              15.0.scale(), Colors.black),
                                        ),
                                        Text(
                                          "Blogs",
                                          style: textStyleCustomColor(
                                              12.0.scale(), Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                AVerticalSpace(10.0.scale()),
                                InkWell(
                                  onTap: () {
                                    showHideProgress(true);
                                    BlocProvider.of<HomeBloc>(context).add(
                                        FollowUnfollowEvent(
                                            "${following_list?[j].userId}"));
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 35.0.scale(),
                                      decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.7),
                                          borderRadius: BorderRadius.circular(
                                              5.0.scale())),
                                      child: Text(
                                        "UnFollow",
                                        style: textStyleBoldCustomColor(
                                            15.0.scale(), Colors.white),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
