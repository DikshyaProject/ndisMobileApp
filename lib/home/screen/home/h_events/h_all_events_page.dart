import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_non_scroll_grid_view.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/home_navigator.dart';

import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../model/h_event/eventlist_model.dart';

EventListData? eventlistData;
List<Topevents>? _topevents;
List<Eventlist>? eventlist;

class HomeAllEvents extends StatefulWidget {
  const HomeAllEvents({super.key});

  @override
  State<HomeAllEvents> createState() => _HomeAllEventsState();
}

class _HomeAllEventsState extends State<HomeAllEvents> {
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeEventsPageBtnClickState) {
      eventlistData = homeState.eventListData;
      _topevents = eventlistData!.topevents;
      eventlist = eventlistData!.eventlist;
      print(" eventlist!.length");
      print(eventlist!.length);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeInitial) {
          Navigator.pop(context, true);
        }
        if (state is HomeEventsDetailPageClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.HomeEventDetailPage);
        }
      },
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
            backgroundColor: kColorThemePurpleColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Events",
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 350.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.98,
                  aspectRatio: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 1200),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
                items: _topevents!.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(
                              HomeEventsDetailPageClick(
                                  "${i.eventId}", "event_detail"));
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 350.0.scale(),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.1),
                                  )),
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200.0.scale(),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: NetworkImagesWidgets(
                                      url: i.eventImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0.scale(),
                                      vertical: 5.0.scale()),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5))),
                                  child: Text(
                                    "Top Events",
                                    maxLines: 1,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.white),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0.scale(),
                                        vertical: 5.0.scale()),
                                    decoration: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5))),
                                    child: Text(
                                      i.eventDate.toString(),
                                      style: textStyleBoldCustomLargeColor(
                                          12.0.scale(), Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                                bottom: 10.0.scale(),
                                left: 10.0.scale(),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0.scale(),
                                      vertical: 5.0.scale()),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        i.eventName.toString(),
                                        maxLines: 1,
                                        style: textStyleBoldCustomColor(
                                            16.0.scale(), Colors.black),
                                      ),
                                      AVerticalSpace(3.0.scale()),
                                      HtmlWidget(
                                        i.eventDescription.toString(),
                                      ),
                                      AVerticalSpace(3.0.scale()),
                                      Row(
                                        children: [
                                          Container(
                                            height: 50.0.scale(),
                                            width: 50.0.scale(),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0.scale()),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      100.0.scale()),
                                              child: NetworkImagesWidgets(
                                                url: i.profileImage!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          AHorizontalSpace(15.0.scale()),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Hosted By",
                                                style: textStyleBoldCustomColor(
                                                    12.0.scale(), Colors.brown),
                                              ),
                                              Text(
                                                "${i.firstName}",
                                                style: textStyleCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ).topPadding(5.0.scale()).bottomPadding(5.0.scale()),
              GoogleGrid(
                columnCount: 2,
                gap: 10.0.scale(),
                padding: const EdgeInsets.all(5.0),
                children: [
                  for (int j = 0; j < eventlist!.length; j++)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context).add(
                            HomeEventsDetailPageClick(
                                "${eventlist?[j].eventId}", "event_detail"));
                      },
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 135.0.scale(),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: kColorThemePurpleColor),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: NetworkImagesWidgets(
                                    url: eventlist![j].eventImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0.scale(),
                                      vertical: 5.0.scale()),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5))),
                                  child: Text(
                                    eventlist![j].eventDate.toString(),
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.white),
                                  ).align(Alignment.topLeft),
                                ),
                              )
                            ],
                          ),
                          Container(
                            // height: 135.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0.scale(), vertical: 5.0.scale()),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: kColorThemePurpleColor,
                                    blurRadius: 2.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  eventlist![j].eventName!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldCustomLargeColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/ic_locationlist.png",
                                      height: 12.0.scale(),
                                    ),
                                    AHorizontalSpace(5.0.scale()),
                                    SizedBox(
                                      width: 130.0.scale(),
                                      child: Text(
                                        eventlist![j].eventAddress!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleCustomColor(
                                            11.0.scale(), Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                AVerticalSpace(5.0.scale()),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/ic_call.png",
                                      height: 12.0.scale(),
                                    ),
                                    AHorizontalSpace(5.0.scale()),
                                    Text(
                                      eventlist![j].eventMobile!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleCustomColor(11.0.scale(),
                                          Colors.black.withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                                AVerticalSpace(5.0.scale()),
                                Row(
                                  children: [
                                    Container(
                                      height: 35.0.scale(),
                                      width: 35.0.scale(),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              5.0.scale()),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0.scale()),
                                        child: NetworkImagesWidgets(
                                          url: eventlist![j].profileImage!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    AHorizontalSpace(10.0.scale()),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hosted By",
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyleBoldCustomColor(
                                              12.0.scale(), Colors.brown),
                                        ),
                                        Text(
                                          "${eventlist![j].hostedBy}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyleCustomColor(
                                              12.0.scale(), Colors.black),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                AVerticalSpace(5.0.scale()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
