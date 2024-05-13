import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/custom_dialog.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/home_navigator.dart';

import '../../../model/h_event/eventlist_details_model.dart';

EventDetailsData? eventDetailsData;
List<EventInformtion>? eventInformtion = [];
List<RelatedEvents>? relatedEvents = [];
String? _screenType;

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  String? event_id;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeEventsDetailPageClickState) {
      eventDetailsData = homeState.eventDetailsData;
      eventInformtion = eventDetailsData!.eventInformtion;
      relatedEvents = eventDetailsData!.relatedEvents;
      event_id = homeState.eventId;
      _screenType = homeState.screenType;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        print("state_in_event_detail__$state");
        if (state is HomeInitial) {
          Navigator.pop(context, true);
        }
        if (state is HomeEventsPageBtnClickState) {
          Navigator.pop(context);
        }

        if (state is HomeLoginPageState) {
          Navigator.of(context).pushNamed(HomeNavigator.loginPage);
        }

        if (state is SendEnquiryEventSuccessState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context)
              .add(HomeEventsDetailPageClick(event_id, ''));
          showSnackBar(state.message, Colors.black, context);
        }

        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context)
              .add(HomeEventsDetailPageClick(event_id, ''));
          showSnackBar(state.message, Colors.red, context);
        }
        if (state is HomeEventsDetailPageClickState) {
          showHideProgress(false);
          eventDetailsData = state.eventDetailsData;
          eventInformtion = eventDetailsData!.eventInformtion;
          relatedEvents = eventDetailsData!.relatedEvents;
          event_id = state.eventId;
          setState(() {});
        }
      },
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
            backgroundColor: kColorThemePurpleColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Event Detail",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0.scale(),
                  fontWeight: FontWeight.w700),
            ),
            leading: InkWell(
                onTap: () {
                  if (_screenType == "Home") {
                    BlocProvider.of<HomeBloc>(context)
                        .add(HomeHomeEventDetailsBackBtnClick());
                  } else {
                    BlocProvider.of<HomeBloc>(context)
                        .add(HomeEventBackBtnClick(''));
                  }
                },
                child: Icon(Icons.arrow_back, color: Colors.white))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: NetworkImagesWidgets(
                        url: eventDetailsData!.post!.eventImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.scale(), vertical: 5.0.scale()),
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            DateFormat.d().format(DateTime.parse(
                                eventDetailsData!.post!.eventStartDate!
                                    .toString())),
                            style: textStyleCustomColor(
                                14.0.scale(), Colors.white),
                          ),
                          Text(
                            DateFormat.MMM().format(DateTime.parse(
                                eventDetailsData!.post!.eventStartDate!
                                    .toString())),
                            style: textStyleBoldCustomLargeColor(
                                14.0.scale(), Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0.scale(), vertical: 5.0.scale()),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0.scale(), vertical: 5.0.scale()),
                width: MediaQuery.of(context).size.width,
                color: kColorThemePurpleColor,
                child: Text(
                  '${eventDetailsData!.post!.eventName}'.toUpperCase(),
                  style:
                      textStyleBoldCustomLargeColor(15.0.scale(), Colors.white),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0.scale(), vertical: 5.0.scale()),
                  width: MediaQuery.of(context).size.width,
                  color: kColorThemePurpleColor.withOpacity(0.1),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 110.0.scale(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date ',
                                  style: textStyleBoldCustomLargeColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  'Time ',
                                  style: textStyleBoldCustomLargeColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  'Location ',
                                  style: textStyleBoldCustomLargeColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 200.0.scale(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ": ${DateFormat("dd, MMM yyyy").format(DateTime.parse(eventDetailsData!.post!.eventStartDate!.toString()))}",
                                  style: textStyleCustomColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  ": ${eventDetailsData!.post!.eventTime!}",
                                  style: textStyleCustomColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  ": ${eventDetailsData!.post!.eventAddress!}",
                                  style: textStyleCustomColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 110.0.scale(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contact person ',
                                    style: textStyleBoldCustomLargeColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                  AVerticalSpace(5.0.scale()),
                                  Text(
                                    'Phone ',
                                    style: textStyleBoldCustomLargeColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                  AVerticalSpace(5.0.scale()),
                                  Text(
                                    'Email ',
                                    style: textStyleBoldCustomLargeColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                  AVerticalSpace(5.0.scale()),
                                  Text(
                                    'Website ',
                                    style: textStyleBoldCustomLargeColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                  AVerticalSpace(5.0.scale()),
                                ],
                              )),
                          SizedBox(
                            width: 200.0.scale(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ": ${eventDetailsData!.post!.eventContactName!}",
                                  style: textStyleCustomColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  ": ${eventDetailsData!.post!.eventMobile!}",
                                  style: textStyleCustomColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  ": ${eventDetailsData!.post!.eventEmail!}",
                                  style: textStyleCustomColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  ": ${eventDetailsData!.post!.eventWebsite!}",
                                  style: textStyleCustomColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                height: 10,
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0.scale(), vertical: 5.0.scale()),
                width: MediaQuery.of(context).size.width,
                color: kColorThemePurpleColor,
              ),
              AVerticalSpace(20.0.scale()),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0.scale(), vertical: 5.0.scale()),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  eventDetailsData!.post!.eventDescription!,
                  style: textStyleCustomColor(13.0.scale(), Colors.black),
                ),
              ),
              AVerticalSpace(10.0.scale()),
              InkWell(
                onTap: () {
                  if (sharedPrefs.IsLogin == false) {
                    // BlocProvider.of<HomeBloc>(context).add(EventEventDetailToLoginBtnClick(_screenType == null || _screenType == ""?"event_detail": "event_home", event_id!));
                    BlocProvider.of<HomeBloc>(context).add(
                        EventEventDetailToLoginBtnClick(
                            "event_detail", event_id!));
                  } else {
                    print(
                        "selected_eventId__ ${eventDetailsData?.post?.eventId} ");

                    print(
                        "email_is__${sharedPrefs.userEmail} mobile_is___${sharedPrefs.userMobile} user_id__ ${sharedPrefs.userID}");
                    nameController.text = sharedPrefs.userName;
                    emailController.text = sharedPrefs.userEmail;
                    mobileController.text = sharedPrefs.userMobile;

                    ///send enquiry dialog

                    CustomStatefulAlertDialog(
                      context: context,
                      bodyWidget: StatefulBuilder(
                          builder: (context2, StateSetter dialogsetState) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              InkWell(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      child: Icon(CupertinoIcons.multiply))
                                  .align(Alignment.topRight),
                              Text(
                                'Send Enquiry',
                                style: textStyleBoldCustomLargeColor(
                                    16.0.scale(), Colors.black),
                              ).align(Alignment.center),
                              AVerticalSpace(20.0.scale()),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.scale()),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFD8D8D8),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextField(
                                  controller: nameController,
                                  maxLines: 1,
                                  style: textStyleCustomColor(
                                      14.0.scale(), kColorDialogNameTitle),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '',
                                    hintStyle: textStyleCustomColor(
                                        14.0.scale(), kColorSearchHintText),
                                  ),
                                ),
                              ),
                              AVerticalSpace(10.0.scale()),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.scale()),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFD8D8D8),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextField(
                                  controller: emailController,
                                  maxLines: 1,
                                  style: textStyleCustomColor(
                                      14.0.scale(), kColorDialogNameTitle),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '',
                                    hintStyle: textStyleCustomColor(
                                        14.0.scale(), kColorSearchHintText),
                                  ),
                                ),
                              ),
                              AVerticalSpace(10.0.scale()),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.scale()),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFD8D8D8),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextField(
                                  controller: mobileController,
                                  maxLines: 1,
                                  style: textStyleCustomColor(
                                      14.0.scale(), kColorDialogNameTitle),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '',
                                    hintStyle: textStyleCustomColor(
                                        14.0.scale(), kColorSearchHintText),
                                  ),
                                ),
                              ),
                              AVerticalSpace(10.0.scale()),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.scale()),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFD8D8D8),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextField(
                                  controller: queryController,
                                  maxLines: 6,
                                  style: textStyleCustomColor(
                                      14.0.scale(), kColorDialogNameTitle),
                                  cursorColor: kColorDialogNameTitle,
                                  textAlignVertical: TextAlignVertical.top,
                                  enableInteractiveSelection: false,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter your query or message",
                                    hintStyle: textStyleCustomColor(
                                        14.0.scale(), kColorSearchHintText),
                                  ),
                                ),
                              ),
                              AVerticalSpace(10.0.scale()),
                              InkWell(
                                onTap: () {
                                  if (queryController.text.isEmpty) {
                                    showSnackBar(
                                        "Please enter your query or message",
                                        Colors.black,
                                        context2);
                                  } else {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    showHideProgress(true);
                                    BlocProvider.of<HomeBloc>(context)
                                        .add(SendEnquiryEventClick(
                                      sharedPrefs.userID,
                                      "${eventDetailsData?.post?.eventId}",
                                      queryController.text,
                                    ));
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 45.0.scale(),
                                  decoration: BoxDecoration(
                                    color: Color(0xff00BDAA),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "Submit",
                                    style: textStyleBoldCustomLargeColor(
                                        15.0.scale(), Colors.white),
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45.0.scale(),
                    decoration: BoxDecoration(
                      color: Color(0xff00BDAA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Send Enquiry",
                      style: textStyleBoldCustomLargeColor(
                          15.0.scale(), Colors.white),
                    ).align(Alignment.center),
                  ),
                ),
              ),
              AVerticalSpace(20.0.scale()),
              Container(
                height: 10,
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0.scale(), vertical: 5.0.scale()),
                width: MediaQuery.of(context).size.width,
                color: kColorThemePurpleColor,
              ),
              AVerticalSpace(10.0.scale()),
              if (relatedEvents?.length != 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Related Events',
                      style: textStyleBoldCustomLargeColor(
                          16.0.scale(), Colors.black),
                    ).leftPadding(15.0.scale()),
                    AVerticalSpace(10.0.scale()),
                    SizedBox(
                      height: 215.0.scale(),
                      child: ListView.builder(
                          itemCount: relatedEvents!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                showHideProgress(true);
                                BlocProvider.of<HomeBloc>(context).add(HomeEventsDetailPageClick("${relatedEvents?[index].eventId}", ""));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0.scale(),
                                    bottom: 15.0.scale(),
                                    top: 5.0.scale()),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 1.15,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0.scale(),
                                      vertical: 10.0.scale()),
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
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100.0.scale(),
                                            height: 100.0.scale(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: NetworkImagesWidgets(
                                                url: relatedEvents![index]
                                                    .eventImage!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          AHorizontalSpace(10.0.scale()),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 170.0.scale(),
                                                child: Text(
                                                  relatedEvents![index]
                                                      .eventName!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:
                                                      textStyleBoldCustomLargeColor(
                                                          12.0.scale(),
                                                          Colors.black),
                                                ),
                                              ),
                                              AVerticalSpace(10.0.scale()),
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
                                                      relatedEvents![index]
                                                          .eventAddress!,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: textStyleCustomColor(
                                                          11.0.scale(),
                                                          Colors.black),
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
                                                    relatedEvents![index]
                                                        .eventMobile!,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textStyleCustomColor(
                                                        11.0.scale(),
                                                        Colors.black
                                                            .withOpacity(0.5)),
                                                  ),
                                                ],
                                              ),
                                              AVerticalSpace(5.0.scale()),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.calendar_month,
                                                    size: 14.0.scale(),
                                                    color: Colors.green,
                                                  ),
                                                  AHorizontalSpace(5.0.scale()),
                                                  Text(
                                                    "23-10-2023",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textStyleCustomColor(
                                                        11.0.scale(),
                                                        Colors.black
                                                            .withOpacity(0.5)),
                                                  ),
                                                ],
                                              ),
                                              AVerticalSpace(5.0.scale()),
                                            ],
                                          ),
                                        ],
                                      ),
                                      AVerticalSpace(5.0.scale()),
                                      Container(
                                        color: Colors.black.withOpacity(0.1),
                                        height: 1,
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                      AVerticalSpace(5.0.scale()),
                                      Row(
                                        children: [
                                          Container(
                                            width: 45.0.scale(),
                                            height: 45.0.scale(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: NetworkImagesWidgets(
                                                url: relatedEvents![index]
                                                    .profileImage!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          AHorizontalSpace(5.0.scale()),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Hosted by",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    textStyleBoldCustomLargeColor(
                                                        11.0.scale(),
                                                        Colors.black),
                                              ),
                                              Text(
                                                relatedEvents![index].hostedBy!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: textStyleCustomColor(
                                                    11.0.scale(), Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                )
            ],
          ),
        ),
      )),
    );
  }
}
