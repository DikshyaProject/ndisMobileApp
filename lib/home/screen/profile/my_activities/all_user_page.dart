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
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/all_user_model.dart';

class AllUserPage extends StatefulWidget {
  const AllUserPage({super.key});

  @override
  State<AllUserPage> createState() => _AllUserPageState();
}

class _AllUserPageState extends State<AllUserPage> {
  AllUserData? all_user_data;
  List<AllUsers>? all_users;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is AllUserClickState) {
      all_user_data = profileState.allUserModel?.data;
      all_users = all_user_data?.allUsers;
      print("all_users_list___${all_users?.first.emailId}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is FollowingsClickState) {
          showHideProgress(false);
          Navigator.of(context).pop();
        } else if (state is ProfileErrorState) {
          showHideProgress(false);
          showSnackBar(state.message!, Colors.red, context);
        } else if (state is FollowUnfollowState) {
          showHideProgress(false);
          showSnackBar(state.message!, Colors.black, context);
          // BlocProvider.of<HomeBloc>(context).add(AllUserClickEvent());
        }
        // else if (state is AllUserClickState) {
        //   showHideProgress(false);
        //   all_user_data = state.allUserModel?.data;
        //   all_users = all_user_data?.allUsers;
        // }
      },
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
            backgroundColor: kColorThemePurpleColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "All Users",
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
                GoogleGrid(
                  columnCount: 2,
                  gap: 10.0.scale(),
                  padding: const EdgeInsets.all(0),
                  children: [
                    for (int j = 0; j < int.parse("${all_users?.length}"); j++)
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
                                url: "${all_users?[j].profileImage}",
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
                                  "${all_users?[j].firstName} ${all_users?[j].lastName}",
                                  maxLines: 1,
                                  style: textStyleBoldCustomLargeColor(
                                      12.0.scale(), Colors.black),
                                ),
                                // Text(
                                //   "${all_users?[j].userState}, ${all_users?[j].userCountry}",
                                //   maxLines: 1,
                                //   style: textStyleCustomColor(
                                //       10.0.scale(), Colors.black),
                                // ),
                                // AVerticalSpace(10.0.scale()),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Column(
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.center,
                                //       children: [
                                //         Text(
                                //           "${all_users?[j].allListCount}",
                                //           style: textStyleBoldCustomLargeColor(
                                //               15.0.scale(), Colors.black),
                                //         ),
                                //         Text(
                                //           "Listings",
                                //           style: textStyleCustomColor(
                                //               12.0.scale(), Colors.black),
                                //         ),
                                //       ],
                                //     ),
                                //     Column(
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.center,
                                //       children: [
                                //         Text(
                                //           "${all_users?[j].allEventCount}",
                                //           style: textStyleBoldCustomLargeColor(
                                //               15.0.scale(), Colors.black),
                                //         ),
                                //         Text(
                                //           "Events",
                                //           style: textStyleCustomColor(
                                //               12.0.scale(), Colors.black),
                                //         ),
                                //       ],
                                //     ),
                                //     Column(
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.center,
                                //       children: [
                                //         Text(
                                //           "${all_users?[j].allBlogCount}",
                                //           style: textStyleBoldCustomLargeColor(
                                //               15.0.scale(), Colors.black),
                                //         ),
                                //         Text(
                                //           "Blogs",
                                //           style: textStyleCustomColor(
                                //               12.0.scale(), Colors.black),
                                //         ),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                                AVerticalSpace(10.0.scale()),
                                InkWell(
                                  onTap: () {
                                    showHideProgress(true);
                                    BlocProvider.of<HomeBloc>(context).add(
                                        FollowUnfollowEvent(
                                            "${all_users?[j].userId}"));
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 35.0.scale(),
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius: BorderRadius.circular(
                                              5.0.scale())),
                                      child: Text(
                                        "Follow",
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
