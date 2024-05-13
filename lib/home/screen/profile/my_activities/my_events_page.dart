import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/my_events_model.dart';

class MyEventsPage extends StatefulWidget {
  const MyEventsPage({super.key});

  @override
  State<MyEventsPage> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  MyEventData? my_event_data;
  List<MyEventsList>? my_events_list;
  String? event_location;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is MyEventsClickState) {
      my_event_data = profileState.myEventsModel?.data;
      my_events_list = my_event_data?.myEventsList;
      print("my_events_list___${my_events_list?.first.eventId}");
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
                "My Events",
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
                itemCount: my_events_list?.length,
                itemBuilder: (context, index) {
                  event_location =
                      "${my_events_list?[index].eventLocation?[0].location}, "
                      "${my_events_list?[index].eventLocation?[0].locationState}, ${my_events_list?[index].eventLocation?[0].locationZipCode}";

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
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0.scale(),
                                  vertical: 5.0.scale()),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${DateFormat('dd').format(DateTime.parse("${my_events_list?[index].eventStartDate}"))}",
                                    style: textStyleBoldCustomColor(
                                        18.0.scale(), Colors.white),
                                  ),
                                  Text(
                                    "${DateFormat('MMM').format(DateTime.parse("${my_events_list?[index].eventStartDate}"))}",
                                    style: textStyleCustomColor(
                                        13.0.scale(), Colors.white),
                                  ),
                                ],
                              )),
                          AHorizontalSpace(10.0.scale()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80.0.scale(),
                                    child: Text(
                                      "Event Name",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBoldBlack(
                                          12.0.scale(), Colors.black),
                                    ),
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  Text(
                                    ": ${my_events_list?[index].eventName}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                ],
                              ),
                              AVerticalSpace(3.0.scale()),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80.0.scale(),
                                    child: Text(
                                      "Event Time",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBoldBlack(
                                          12.0.scale(), Colors.black),
                                    ),
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  Text(
                                    ": ${my_events_list?[index].eventTime}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                ],
                              ),
                              AVerticalSpace(3.0.scale()),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80.0.scale(),
                                    child: Text(
                                      "Address",
                                      style: textStyleBoldBlack(
                                          12.0.scale(), Colors.black),
                                    ),
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  Container(
                                    width: 140.0.scale(),
                                    child: Text(
                                      ": ${event_location}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBlack(12.0.scale()),
                                    ),
                                  ),
                                ],
                              ),
                              AVerticalSpace(5.0.scale()),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80.0.scale(),
                                    child: Text(
                                      "Number",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBoldBlack(
                                          12.0.scale(), Colors.black),
                                    ),
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  Text(
                                    ": ${my_events_list?[index].eventMobile}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                ],
                              ),
                              AVerticalSpace(3.0.scale()),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80.0.scale(),
                                    child: Text(
                                      "Price",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBoldBlack(
                                          12.0.scale(), Colors.black),
                                    ),
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  Text(
                                    ": ${my_events_list?[index].eventTicketPrice}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(CupertinoIcons.chevron_right),
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
