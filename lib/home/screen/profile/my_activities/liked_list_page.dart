import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/liked_list_model.dart';

class LikedListPage extends StatefulWidget {
  const LikedListPage({super.key});

  @override
  State<LikedListPage> createState() => _LikedListPageState();
}

class _LikedListPageState extends State<LikedListPage> {
  List<LikedListData>? liked_data;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is LikedListingClickState) {
      liked_data = profileState.likedListModel?.data;
      print("Liked_list___${liked_data?.first.listingId}");
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
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Liked Listing",
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
            padding: EdgeInsets.only(top: 10.0.scale(), bottom: 10.0.scale()),
            child: ListView.builder(
                itemCount: liked_data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: 8.0.scale(),
                        left: 15.0.scale(),
                        right: 15.0.scale()),
                    child: Container(
                      padding: EdgeInsets.all(10.0.scale()),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 100.0.scale(),
                                height: 110.0.scale(),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: NetworkImagesWidgets(
                                      url: '${liked_data?[index].galleryImage}',
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 12.0.scale(),
                                      ).topPadding(3.0.scale()),
                                      AHorizontalSpace(5.0.scale()),
                                      SizedBox(
                                        width: 160.0.scale(),
                                        child: Text(
                                          "${liked_data?[index].listingName}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyleBoldCustomColor(
                                              11.0.scale(), Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                        size: 15.0.scale(),
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text(
                                        "${liked_data?[index].starRate}",
                                        style: textStyleBoldCustomColor(
                                            11.0.scale(), Colors.black),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        CupertinoIcons.phone,
                                        color: Colors.green,
                                        size: 15.0.scale(),
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      SizedBox(
                                        width: 160.0.scale(),
                                        child: Text(
                                          "${liked_data?[index].comLandNumber}, ${liked_data?[index].comPhone1}, ${liked_data?[index].comPhone2}",
                                          style: textStyleBoldCustomColor(
                                              11.0.scale(), Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        CupertinoIcons.mail_solid,
                                        color: Colors.green,
                                        size: 15.0.scale(),
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      SizedBox(
                                        width: 160.0.scale(),
                                        child: Text(
                                          "${liked_data?[index].comEmail}",
                                          style: textStyleBoldCustomColor(
                                              11.0.scale(), Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.green,
                                        size: 12.0.scale(),
                                      ).topPadding(2.0.scale()),
                                      AHorizontalSpace(5.0.scale()),
                                      Text(
                                        "${liked_data?[index].listingAddress}",
                                        style: textStyleBoldCustomColor(
                                            11.0.scale(), Colors.black),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                ],
                              ),
                              Spacer(),
                              Icon(CupertinoIcons.chevron_right),
                            ],
                          ),
                          AVerticalSpace(10.0.scale()),
                          ASeparatorLine(
                            height: 1,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          AVerticalSpace(5.0.scale()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Service Available at : ",
                                style: textStyleBoldCustomColor(
                                    11.0.scale(), Colors.black),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              SizedBox(
                                width: 160.0.scale(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i <
                                            int.parse(
                                                "${liked_data?[index].serviceLocations?.length}");
                                        i++)
                                      SizedBox(
                                        width: 180.0.scale(),
                                        child: Text(
                                          "${i + 1}. ${liked_data?[index].serviceLocations?[i].location}",
                                          style: textStyleCustomColor(
                                              10.0.scale(), Colors.black),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          AVerticalSpace(5.0.scale()),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
