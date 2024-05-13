import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
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
import 'package:ndisparticipant/home/model/home/service_details_datalocation_model.dart';
import 'package:ndisparticipant/home/model/home/service_details_page_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';


class PlanManagersDetailsPage extends StatefulWidget {
  const PlanManagersDetailsPage({super.key});

  @override
  State<PlanManagersDetailsPage> createState() => _PlanManagersDetailsPageState();
}

class _PlanManagersDetailsPageState extends State<PlanManagersDetailsPage> {
  ServiceDetailsPageData? serviceDetailsPageData;
  ListingDetailsData? listingDetailsData;
  List<RelatedThings>? relatedThings;
  List<String>? galleryImage = [];
  List<ServiceDetailsPageDataLocation>? _serviceLocationsArray = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  String? screen;
  bool claim = true;
  bool companyinfo = false;
  bool workinghours = false;
  List<ServiceDetailsPageDataLocation>? serviceLocationsArray = [];

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }
  bool _hasCallSupport = false;
  Future<void>? _launched;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomePlanManagerDetailClickState) {
      serviceDetailsPageData = homeState.serviceDetailsPageData;
      listingDetailsData = serviceDetailsPageData!.listingDetailsData;
      relatedThings = serviceDetailsPageData!.relatedThings;
      List<dynamic> serviceLocationslist = jsonDecode(listingDetailsData!.serviceLocations!) as List;
      ViewWorkLocationData(serviceLocationslist);
      galleryImage = listingDetailsData!.galleryImage;

      screen = homeState.screen;
      canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
        setState(() {
          _hasCallSupport = result;
        });
      });
      print("listingDetailsData_____${relatedThings}");
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        print("stssdsddf_____${state}");

        if (state is HomePlanManagersBtnClickState) {
          Navigator.pop(context,true);
        }


        if(state is HomeLoginPageState){
          Navigator.of(context).pushNamed(HomeNavigator.loginPage);
        }
        if (state is GetQuotePlanSuccessState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context).add(HomePlanManagerDetailClick("${listingDetailsData?.listingId}", screen));
          showSnackBar(state.message,Colors.black , context);
        }

        if(state is HomeerrorloadingState){
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context).add(HomePlanManagerDetailClick("${listingDetailsData?.listingId}", screen));
          showSnackBar(state.message,Colors.red , context);
        }
      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Plan Manager Details",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),
            body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220.0.scale(),
                          child: NetworkImagesWidgets(
                            url: "${listingDetailsData!.coverImage}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 45.0.scale(),
                          top: 30.0.scale(),
                          child: Container(
                              height: 150.0.scale(),
                              width: 290.0.scale(),
                              padding: EdgeInsets.only(left: 55.0.scale(), right: 10.0.scale(), top: 10.0.scale()),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0.scale()),
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listingDetailsData!.listingName.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                      textStyleBoldBlack(14.0.scale(), Colors.black)),
                                  AVerticalSpace(3.0.scale()),
                                  SizedBox(
                                    width: 300.0.scale(),
                                    child: Text(
                                      listingDetailsData!.listingAddress.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBlack(11.0.scale()),
                                    ),
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_call.png',
                                        height: 10.0.scale(),
                                        width: 10.0.scale(),
                                        color: Colors.grey,
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text(
                                        "${listingDetailsData?.comLandNumber ?? ''}",
                                        style:
                                        textStyleCustomColor(11.0.scale(), Colors.black),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_emailnew.png',
                                        height: 10.0.scale(),
                                        width: 10.0.scale(),
                                        color: Colors.grey,
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text(
                                        "${listingDetailsData?.comEmail ?? ''}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                        textStyleCustomColor(11.0.scale(), Colors.black),
                                      ).expand(),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_web.png',
                                        height: 10.0.scale(),
                                        width: 10.0.scale(),
                                        color: Colors.grey,
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text(
                                        "${listingDetailsData?.comWebsite ?? ''}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                        textStyleCustomColor(11.0.scale(), Colors.black),
                                      ).expand(),
                                    ],
                                  )
                                ],
                              )
                          ),
                        ),
                        Positioned(
                          left: 15.0.scale(),
                          top: 60.0.scale(),
                          child: Container(
                            height: 80.0.scale(),
                            width: 80.0.scale(),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0.scale()),
                                border: Border.all(color: Colors.black)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0.scale()),
                              child: NetworkImagesWidgets(
                                url: "${listingDetailsData!.profileImage}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                if (sharedPrefs.IsLogin){
                                  if(_hasCallSupport){
                                    setState(() {
                                      _launched = _makePhoneCall( "${listingDetailsData?.comLandNumber}");
                                    });
                                  }
                                }else{
                                  showSnackBar('Please login first.', Colors.black, context);
                                }

                              },
                              child: Container(
                                height: 40.0.scale(),
                                width: 100.0.scale(),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_call.png',
                                      height: 12.0.scale(),
                                      width: 12.0.scale(),
                                      color: Colors.grey,
                                    ),
                                    AHorizontalSpace(5.0.scale()),
                                    Text(
                                      "Call Now",
                                      textAlign: TextAlign.center,
                                      style: textStyleCustomColor(12.0.scale(), Colors.black),
                                    ),
                                  ],
                                )
                                    .rightPadding(5.0.scale())
                                    .leftPadding(5.0.scale())
                                    .align(Alignment.center),
                              ).leftPadding(5.0.scale()),
                            ),
                            Container(
                              height: 40.0.scale(),
                              width: 60.0.scale(),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(2)),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/ic_like.png',
                                    height: 12.0.scale(),
                                    width: 12.0.scale(),
                                    color: Colors.grey,
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  Text(
                                    "Likes",
                                    textAlign: TextAlign.center,
                                    style: textStyleCustomColor(12.0.scale(), Colors.black),
                                  ),
                                ],
                              )
                                  .rightPadding(5.0.scale())
                                  .leftPadding(5.0.scale())
                                  .align(Alignment.center),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (sharedPrefs.IsLogin == false) {
                                  BlocProvider.of<HomeBloc>(context).add(EventPlanDetailToLoginBtnClick(screen == null || screen == ""? "plan_detail" : "fs_plan", "${listingDetailsData?.listingId}"));
                                } else {
                                  print(
                                      "selected_listingId__ ${listingDetailsData?.listingId} ");

                                  print(
                                      "email_is__${sharedPrefs.userEmail} mobile_is___${sharedPrefs.userMobile} user_id__ ${sharedPrefs.userID}");
                                  nameController.text = sharedPrefs.userName;
                                  emailController.text = sharedPrefs.userEmail;
                                  mobileController.text = sharedPrefs.userMobile;

                                  ///get quote dialog

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
                                                  'Get Quote',
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
                                                      Navigator.of(context, rootNavigator: true).pop();
                                                      showHideProgress(true);
                                                      BlocProvider.of<HomeBloc>(context).add(GetQuotePlanClickEvent(
                                                        sharedPrefs.userID,
                                                        "${listingDetailsData?.listingId}",
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
                              child: Container(
                                height: 40.0.scale(),
                                width: 100.0.scale(),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_speech_bubble.png',
                                      height: 12.0.scale(),
                                      width: 12.0.scale(),
                                      color: Colors.grey,
                                    ),
                                    AHorizontalSpace(5.0.scale()),
                                    Text(
                                      "Get Quote",
                                      textAlign: TextAlign.center,
                                      style:
                                      textStyleCustomColor(12.0.scale(), Colors.black),
                                    ),
                                  ],
                                )
                                    .rightPadding(5.0.scale())
                                    .leftPadding(5.0.scale())
                                    .align(Alignment.center),
                              ).rightPadding(5.0.scale()),
                            ),
                            Container(
                                padding: EdgeInsets.all(10.0.scale()),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: Image.asset(
                                  'assets/images/ic_share.png',
                                  height: 15.0.scale(),
                                  width: 15.0.scale(),
                                )
                            )
                          ],
                        )
                    ),
                    AVerticalSpace(10.0.scale()),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Basic Infomation ",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                textStyleBoldBlack(14.0.scale(), Colors.black))
                                .leftPadding(10.0.scale()),
                            AVerticalSpace(5.0.scale()),
                            Row(
                              children: [
                                Text(
                                  "ABN Number :",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Text(
                                  listingDetailsData!.abnNumber.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ),
                              ],
                            ).leftPadding(10.0.scale()),
                            AVerticalSpace(2.0.scale()),
                            Row(
                              children: [
                                Text(
                                  "Organistion Type :",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Text(
                                  listingDetailsData!.organiType.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ),
                              ],
                            ).leftPadding(10.0.scale()),
                            AVerticalSpace(2.0.scale()),
                            Row(
                              children: [
                                Text(
                                  "NDIS Register :",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Text(
                                  listingDetailsData!.ndisRegs.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ),
                              ],
                            ).leftPadding(10.0.scale()),
                            AVerticalSpace(2.0.scale()),
                            Row(
                              children: [
                                Text(
                                  "Register Number :",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Text(
                                  listingDetailsData!.regNumber.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ),
                              ],
                            ).leftPadding(10.0.scale()),
                            AVerticalSpace(2.0.scale()),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Register Stamp :",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Container(
                                  height: 50.0.scale(),
                                  width: 150.0.scale(),
                                  child: NetworkImagesWidgets(
                                    url: "${listingDetailsData!.regStamp}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ).leftPadding(10.0.scale()),
                          ],
                        ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                      ),
                    ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                    AVerticalSpace(5.0.scale()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "About ${listingDetailsData!.listingName.toString()}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                  textStyleBoldBlack(14.0.scale(), Colors.black)),
                              AVerticalSpace(5.0.scale()),
                              Text(
                                listingDetailsData!.listingDescription.toString(),
                                style: textStyleBlack(12.0.scale()),
                              ),
                            ],
                          ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                        ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                      ),
                    ),
                    AVerticalSpace(5.0.scale()),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Service Offered",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                textStyleBoldBlack(14.0.scale(), Colors.black))
                                .leftPadding(10.0.scale()),
                            AVerticalSpace(5.0.scale()),
                            for (int i = 0;
                            i < listingDetailsData!.subCategory!.length;
                            i++)
                              Text(
                                "${listingDetailsData!.subCategory?[i].subCategoryName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBlack(12.0.scale()),
                              ).leftPadding(10.0.scale()),
                          ],
                        ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                      ),
                    ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                    AVerticalSpace(5.0.scale()),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.0.scale()),
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("SERVICE AREAS -",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      14.0.scale(), Colors.black))
                                  .leftPadding(10.0.scale()),
                              AVerticalSpace(5.0.scale()),
                              for (int i = 0;
                              i < serviceLocationsArray!.length;
                              i++)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Location : ${serviceLocationsArray![i].location.toString()}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBlack(12.0.scale()),
                                    ),
                                    AVerticalSpace(2.0.scale()),
                                    Text(
                                      "City : ${serviceLocationsArray![i].locationCity.toString()}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBlack(12.0.scale()),
                                    ),
                                    Text(
                                      "State : ${serviceLocationsArray![i].locationState.toString()}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBlack(12.0.scale()),
                                    ),
                                    Text(
                                      "Country : ${serviceLocationsArray![i].locationCountry.toString()}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBlack(12.0.scale()),
                                    ),
                                    AVerticalSpace(5.0.scale())
                                  ],
                                ).leftPadding(10.0.scale())
                            ],
                          ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                        ),
                      ),
                    ),
                    AVerticalSpace(5.0.scale()),
                    Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AVerticalSpace(5.0.scale()),
                            Text("PHOTO GALLERY",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldBlack(14.0.scale(), Colors.black))
                                .leftPadding(10.0.scale()),
                            AVerticalSpace(5.0.scale()),
                            ImageGallery(galleryImage),
                          ],
                        )),
                    AVerticalSpace(10.0.scale()),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("SPECIAL OFFERS -",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(14.0.scale(), Colors.black))
                              .leftPadding(10.0.scale()),
                          AVerticalSpace(5.0.scale()),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                              border: Border.all(color: Colors.purple),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5.0.scale()),
                                      child: Container(
                                        width: 100.0.scale(),
                                        height: 100.0.scale(),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5.0.scale()),
                                            border: Border.all(color: Colors.grey)),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(5.0.scale()),
                                          child: NetworkImagesWidgets(
                                            url: "${listingDetailsData!.service1Image}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    AHorizontalSpace(5.0.scale()),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${listingDetailsData!.service1Name}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleBoldBlack(
                                                14.0.scale(), Colors.black)),
                                        AVerticalSpace(2.0.scale()),
                                        Text(
                                          "${listingDetailsData!.service1Detail}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyleBlack(12.0.scale()),
                                        ),
                                        AVerticalSpace(2.0.scale()),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(2)),
                                              border: Border.all(color: Colors.purple),
                                              color: Color(0xFFEDCDCF)),
                                          child: Text(
                                            "\$ ${listingDetailsData!.service1Price}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleBlack(12.0.scale()),
                                          )
                                              .topPadding(2.0.scale())
                                              .bottomPadding(2.0.scale())
                                              .leftPadding(5.0.scale())
                                              .rightPadding(5.0.scale()),
                                        ),
                                        AVerticalSpace(5.0.scale()),
                                        GestureDetector(
                                          onTap: () {
                                            if (sharedPrefs.IsLogin == false) {
                                              BlocProvider.of<HomeBloc>(context).add(EventPlanDetailToLoginBtnClick(screen == null || screen == ""? "plan_detail" : "fs_plan", "${listingDetailsData?.listingId}"));
                                            } else {
                                              print(
                                                  "selected_listingId__ ${listingDetailsData?.listingId} ");

                                              print(
                                                  "email_is__${sharedPrefs.userEmail} mobile_is___${sharedPrefs.userMobile} user_id__ ${sharedPrefs.userID}");
                                              nameController.text =
                                                  sharedPrefs.userName;
                                              emailController.text =
                                                  sharedPrefs.userEmail;
                                              mobileController.text =
                                                  sharedPrefs.userMobile;

                                              ///get quote dialog

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
                                                              Navigator.of(context,
                                                                  rootNavigator:
                                                                  true)
                                                                  .pop();
                                                            },
                                                            child: Icon(
                                                                CupertinoIcons
                                                                    .multiply))
                                                            .align(Alignment.topRight),
                                                        Text(
                                                          'Get Quote',
                                                          style:
                                                          textStyleBoldCustomLargeColor(
                                                              16.0.scale(),
                                                              Colors.black),
                                                        ).align(Alignment.center),
                                                        AVerticalSpace(20.0.scale()),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: 10.0.scale()),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color:
                                                                Color(0xFFD8D8D8),
                                                              ),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  5)),
                                                          child: TextField(
                                                            controller: nameController,
                                                            maxLines: 1,
                                                            style: textStyleCustomColor(
                                                                14.0.scale(),
                                                                kColorDialogNameTitle),
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
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
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: 10.0.scale()),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color:
                                                                Color(0xFFD8D8D8),
                                                              ),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  5)),
                                                          child: TextField(
                                                            controller: emailController,
                                                            maxLines: 1,
                                                            style: textStyleCustomColor(
                                                                14.0.scale(),
                                                                kColorDialogNameTitle),
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
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
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: 10.0.scale()),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color:
                                                                Color(0xFFD8D8D8),
                                                              ),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  5)),
                                                          child: TextField(
                                                            controller:
                                                            mobileController,
                                                            maxLines: 1,
                                                            style: textStyleCustomColor(
                                                                14.0.scale(),
                                                                kColorDialogNameTitle),
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
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
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: 10.0.scale()),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color:
                                                                Color(0xFFD8D8D8),
                                                              ),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  5)),
                                                          child: TextField(
                                                            controller: queryController,
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
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
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
                                                            if (queryController.text.isEmpty) {
                                                              showSnackBar(
                                                                  "Please enter your query or message",
                                                                  Colors.black,
                                                                  context2);
                                                            } else {
                                                              Navigator.of(context, rootNavigator: true).pop();
                                                              showHideProgress(true);
                                                              BlocProvider.of<HomeBloc>(context).add(GetQuotePlanClickEvent(
                                                                sharedPrefs.userID,
                                                                "${listingDetailsData?.listingId}",
                                                                queryController.text,
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
                                                              color: Color(0xff00BDAA),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
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
                                            height: 30.0.scale(),
                                            width: 200.0.scale(),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              border:
                                              Border.all(color: kColorShadowColor),
                                              color: kColorShadowColor,
                                            ),
                                            child: Text("SEND ENQUIRY ",
                                                style: textStyleBoldCustomLargeColor(
                                                  10.0.scale(),
                                                  Colors.black,
                                                )).align(Alignment.center),
                                          ),
                                        ),
                                        AVerticalSpace(10.0.scale()),
                                      ],
                                    ).topPadding(5.0.scale()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          AVerticalSpace(5.0.scale()),

                          Card(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BUSINESS DETAILS -",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBoldBlack(
                                          14.0.scale(), Colors.black))
                                      .leftPadding(10.0.scale()),
                                  AVerticalSpace(5.0.scale()),
                                  Row(
                                    children: [
                                      Text(
                                        "Approach Method : ",
                                        style: textStyleCustomColor(
                                            12.0.scale(), Colors.grey),
                                      ),
                                      Text(
                                        "${listingDetailsData?.apprMerhod?.apprMethod}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBoldBlack(
                                            12.0.scale(), Colors.black),
                                      ),
                                    ],
                                  ).leftPadding(10.0.scale()),
                                  AVerticalSpace(5.0.scale()),
                                  Row(
                                    children: [
                                      Text(
                                        "Languages : ",
                                        style: textStyleCustomColor(
                                            12.0.scale(), Colors.grey),
                                      ),
                                      for(int i=0; i<int.parse("${listingDetailsData?.language?.length}"); i++)
                                        Text(
                                          "${listingDetailsData?.language?[i]}, ",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyleBlack(12.0.scale()),
                                        ).expand(),
                                    ],
                                  ).leftPadding(10.0.scale()),
                                  AVerticalSpace(5.0.scale()),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Service Specilisation : ",
                                        style: textStyleCustomColor(
                                            12.0.scale(), Colors.grey),
                                      ),
                                      Text(
                                        "${listingDetailsData?.servSpecilisation?.sName}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBoldBlack(
                                            12.0.scale(), Colors.black),
                                      ).expand(),
                                    ],
                                  ).leftPadding(10.0.scale()),
                                  AVerticalSpace(5.0.scale()),
                                  Row(
                                    children: [
                                      Text(
                                        "Pet Friendly : ",
                                        style: textStyleCustomColor(
                                            12.0.scale(), Colors.grey),
                                      ),
                                      Text(
                                        "${listingDetailsData?.petFrie?.petFriName}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBoldBlack(
                                            12.0.scale(), Colors.black),
                                      ),
                                    ],
                                  ).leftPadding(10.0.scale()),
                                  AVerticalSpace(5.0.scale()),
                                  Row(
                                    children: [
                                      Text(
                                        "Service Delivery Method : ",
                                        style: textStyleCustomColor(
                                            12.0.scale(), Colors.grey),
                                      ),
                                      Text(
                                        "${listingDetailsData?.serDeliMethod?.sdname}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBoldBlack(
                                            12.0.scale(), Colors.black),
                                      ),
                                    ],
                                  ).leftPadding(10.0.scale()),
                                ],
                              ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                            ),
                          ),
                          AVerticalSpace(5.0.scale()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    claim = true;
                                    companyinfo = false;
                                    workinghours = false;
                                  });
                                },
                                child: Container(
                                  height: 45.0.scale(),
                                  width: 100.0.scale(),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    border:
                                    Border.all(color: kColorThemeLightGreenColor),
                                    color: claim == true
                                        ? kColorThemeLightGreenColor
                                        : Colors.white,
                                  ),
                                  child: Text("CLAIM LISTING ",
                                      style: textStyleBoldCustomLargeColor(
                                        10.0.scale(),
                                        claim == true ? Colors.white : Colors.black,
                                      )).align(Alignment.center),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    claim = false;
                                    companyinfo = true;
                                    workinghours = false;
                                  });
                                },
                                child: Container(
                                  height: 45.0.scale(),
                                  width: 100.0.scale(),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border:
                                    Border.all(color: kColorThemeLightGreenColor),
                                    color: companyinfo == true
                                        ? kColorThemeLightGreenColor
                                        : Colors.white,
                                  ),
                                  child: Text("COMPANY INFO ",
                                      style: textStyleBoldCustomLargeColor(
                                        10.0.scale(),
                                        companyinfo == true
                                            ? Colors.white
                                            : Colors.black,
                                      )).align(Alignment.center),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    claim = false;
                                    companyinfo = false;
                                    workinghours = true;
                                  });
                                },
                                child: Container(
                                  height: 45.0.scale(),
                                  width: 100.0.scale(),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    border:
                                    Border.all(color: kColorThemeLightGreenColor),
                                    color: workinghours == true
                                        ? kColorThemeLightGreenColor
                                        : Colors.white,
                                  ),
                                  child: Text("WORKING HOURS ",
                                      style: textStyleBoldCustomLargeColor(
                                        10.0.scale(),
                                        workinghours == true
                                            ? Colors.white
                                            : Colors.black,
                                      )).align(Alignment.center),
                                ),
                              ),
                            ],
                          ),
                          AVerticalSpace(5.0.scale()),
                          if (claim == true) ClaimList(screen, listingDetailsData?.listingId),
                          if (companyinfo == true) CompanyInfo(listingDetailsData),
                          if (workinghours == true)WorkingHoursList(listingDetailsData),
                        ],
                      ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                    ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                  ],
                )),

          )),
    );
  }


  ViewWorkLocationData(List serviceLocationslist) {
    serviceLocationsArray = [];
    serviceLocationslist.forEach((element) {
      Map<String, dynamic> result = element;

      ServiceDetailsPageDataLocation listingDetailsData =
      ServiceDetailsPageDataLocation(
          location: result["location"],
          locationCity: result["location_city"],
          locationState: result["location_state"],
          locationCountry: result["location_country"],
          locationZipCode: result["location_zip_code"],
          locationLatitude: result["location_latitude"],
          locationLongitude: result["location_longitude"]);
      serviceLocationsArray?.add(listingDetailsData);
      print(result["location"]);
    });
  }

}

class ClaimList extends StatefulWidget {
  String? screen;
  String? listing_id;
  ClaimList(this.screen, this.listing_id);

  @override
  State<ClaimList> createState() => _ClaimListState();
}

class _ClaimListState extends State<ClaimList> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  File? _idProofImage;
  String base64IdProofImage = "";
  String selectedPath = "Select Identification Proof";

  void _showPicker(context, dialogsetState) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Stack(
            children: [
              SafeArea(
                child: Container(
                  child: Wrap(
                    children: [
                      ListTile(
                          leading: new Icon(Icons.photo_library),
                          title: new Text('Photo Library'),
                          onTap: () {
                            _imgFromGallery(dialogsetState);
                            Navigator.of(context).pop();
                          }),
                      ListTile(
                        leading: new Icon(Icons.photo_camera),
                        title: new Text('Camera'),
                        onTap: () {
                          _imgFromCamera(dialogsetState);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
  _imgFromGallery(dialogsetState) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      dialogsetState(() {
        _idProofImage = File(pickedFile.path);

        final bytes = File(pickedFile.path).readAsBytesSync();
        base64IdProofImage =  base64Encode(bytes);
        print(base64IdProofImage.toString());
        selectedPath = pickedFile.path;

        print(pickedFile.path);
      });
    }
  }
  _imgFromCamera(dialogsetState) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      dialogsetState(() {
        _idProofImage = File(pickedFile.path);

        final bytes = File(pickedFile.path).readAsBytesSync();
        base64IdProofImage =  base64Encode(bytes);
        print(base64IdProofImage.toString());
        selectedPath = pickedFile.path;
        print(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0.scale(),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color(0xFF20334C),
          ),
          child: Text("CLAIM LISTING",
              textAlign: TextAlign.center,
              style: textStyleCustomColor(16.0.scale(), Colors.white))
              .align(Alignment.center),
        ),
        AVerticalSpace(10.0.scale()),
        Row(
          children: [
            AHorizontalSpace(10.0.scale()),
            Icon(CupertinoIcons.checkmark_seal_fill, size: 15.0.scale(), color: Color(0xFF20334C),),
            Text("100%", style: textStyleCustomColor(12.0.scale(),  Color(0xFF20334C)),),
            AHorizontalSpace(10.0.scale()),
            Text("Claim this business", style: textStyleBoldBlack(15.0.scale(), Colors.black),),
          ],
        ),
        AVerticalSpace(10.0.scale()),
        InkWell(
          onTap: (){
            if (sharedPrefs.IsLogin == true){
              nameController.text = sharedPrefs.userName;
              emailController.text = sharedPrefs.userEmail;
              mobileController.text = sharedPrefs.userMobile;

              CustomStatefulAlertDialog(
                context: context,
                bodyWidget: StatefulBuilder(
                    builder: (context2, StateSetter dialogsetState) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true).pop();
                                  base64IdProofImage = "";
                                  selectedPath = "Select Identification Proof";
                                },
                                child: Icon(CupertinoIcons.multiply))
                                .align(Alignment.topRight),
                            Text(
                              'Claim This Business',
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
                            InkWell(
                              onTap: (){
                                _showPicker(context2, dialogsetState);
                              },
                              child: Container(
                                height: 50.0.scale(),
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFD8D8D8),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(selectedPath,  style: textStyleBoldCustomLargeColor(
                                    14.0.scale(), Colors.grey),).leftPadding(10.0.scale()),
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
                                  showSnackBar("Please enter your query or message", Colors.black, context2);
                                } else {
                                  Navigator.of(context, rootNavigator: true).pop();
                                  // showHideProgress(true);
                                  // BlocProvider.of<HomeBloc>(context).add(GetQuoteScoordBtnClick(
                                  //   sharedPrefs.userID,
                                  //   "${listingDetailsData?.listingId}",
                                  //   queryController.text,
                                  // ));
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
            }else{
              BlocProvider.of<HomeBloc>(context).add(EventPlanDetailToLoginBtnClick(widget.screen == null || widget.screen == ""? "plan_detail" : "fs_plan", widget.listing_id??''));
            }

          },
          child: Container(
            height: 40.0.scale(),
            width: MediaQuery.of(context).size.width/1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              border:
              Border.all(color: Colors.red),
              color: Colors.red,
            ),
            child: Text("Suggest an edit",
                style: textStyleBoldCustomLargeColor(
                  14.0.scale(),
                  Colors.white,
                )).align(Alignment.center),
          ),
        ),
      ],
    );
  }
}

class ImageGallery extends StatefulWidget {
  List<String>? galleryImage1;

  ImageGallery(this.galleryImage1);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  late int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.galleryImage1!.length,
          itemBuilder: (BuildContext context, int index) {
            currentIndex = index;

            return Card(
              child: Container(
                width: MediaQuery.of(context).size.width - 30.0.scale(),
                height: 200.0.scale(),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 200.0.scale(),
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              offset: Offset(
                                  1.0, 1.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 200.0.scale(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0.scale()),
                              topLeft: Radius.circular(5.0.scale()),
                              bottomRight: Radius.circular(5.0.scale()),
                              bottomLeft: Radius.circular(5.0.scale()),
                            ),
                            child: NetworkImagesWidgets(
                              url: widget.galleryImage1![index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10.0.scale(),
                        left: MediaQuery.of(context).size.width / 2.5,
                        child: Row(children: [
                          for (int i = 0; i < widget.galleryImage1!.length; i++)
                            Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    color: i == currentIndex
                                        ? Colors.purple
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(5)))
                                .leftPadding(1.0.scale())
                        ]))
                  ],
                ),
              ),
            ).leftPadding(5.0.scale()).rightPadding(5.0.scale());
          }),
    );
  }
}

class CompanyInfo extends StatelessWidget {
  ListingDetailsData? listingDetailsData1;

  CompanyInfo(this.listingDetailsData1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0.scale(),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color(0xFF20334C),
          ),
          child: Text("COMPANY INFO",
              textAlign: TextAlign.center,
              style: textStyleCustomColor(16.0.scale(), Colors.white))
              .align(Alignment.center),
        ),
        AVerticalSpace(10.0.scale()),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Contact Number",
              style: textStyleBlack(12.0.scale()),
            ).leftPadding(5.0.scale()),
            Text(
              listingDetailsData1!.comLandNumber.toString(),
              style: textStyleBlack(12.0.scale()),
            )
                .leftPadding(5.0.scale())
                .rightPadding(5.0.scale())
                .topPadding(5.0.scale())
                .bottomPadding(5.0.scale())
                .rightPadding(5.0.scale())
          ],
        ),
        AVerticalSpace(10.0.scale()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Contact Number1",
              style: textStyleBlack(12.0.scale()),
            ).leftPadding(5.0.scale()),
            Text(
              listingDetailsData1!.comPhone1.toString(),
              style: textStyleBlack(12.0.scale()),
            )
                .leftPadding(5.0.scale())
                .rightPadding(5.0.scale())
                .topPadding(5.0.scale())
                .bottomPadding(5.0.scale())
                .rightPadding(5.0.scale()),
          ],
        ),
        AVerticalSpace(10.0.scale()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Contact Number2",
              style: textStyleBlack(12.0.scale()),
            ).leftPadding(5.0.scale()),
            Text(
              listingDetailsData1!.comPhone2.toString(),
              style: textStyleBlack(12.0.scale()),
            )
                .leftPadding(5.0.scale())
                .rightPadding(5.0.scale())
                .topPadding(5.0.scale())
                .bottomPadding(5.0.scale())
                .rightPadding(5.0.scale())
          ],
        ),
        AVerticalSpace(10.0.scale()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Email",
              style: textStyleBlack(12.0.scale()),
            ).leftPadding(5.0.scale()),
            Text(
              listingDetailsData1!.comEmail.toString(),
              style: textStyleBlack(12.0.scale()),
            )
                .leftPadding(5.0.scale())
                .rightPadding(5.0.scale())
                .topPadding(5.0.scale())
                .bottomPadding(5.0.scale())
                .rightPadding(5.0.scale())
          ],
        )
      ],
    );
  }
}

class WorkingHoursList extends StatelessWidget {
  ListingDetailsData? listingDetailsData1;

  WorkingHoursList(this.listingDetailsData1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0.scale(),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color(0xFF20334C),
          ),
          child: Text("WORKING HOURS",
              textAlign: TextAlign.center,
              style: textStyleCustomColor(16.0.scale(), Colors.white))
              .align(Alignment.center),
        ),
        AVerticalSpace(10.0.scale()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "WORKING DAYS",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(10.0.scale()),
                Text(
                  "Sunday",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  "Monday",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  "Tuesday",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  "Wednesday",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  "Thursday",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  "Friday",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  "Saturday",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
              ],
            ).leftPadding(5.0.scale()),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OPEN TIME",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(10.0.scale()),
                Text(
                  listingDetailsData1!.sunOpenTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.monOpenTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.tueOpenTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.wedOpenTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.thuOpenTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.friOpenTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.satOpenTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
              ],
            ),
            Column(
              children: [
                Text(
                  "CLOSE TIME",
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(10.0.scale()),
                Text(
                  listingDetailsData1!.sunCloseTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.monCloseTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.tueCloseTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.wedCloseTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.thuCloseTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.friCloseTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
                AVerticalSpace(2.0.scale()),
                Text(
                  listingDetailsData1!.satCloseTime.toString(),
                  style: textStyleBlack(12.0.scale()),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
