import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:ndisparticipant/home/bloc/home_bloc.dart';
import 'package:ndisparticipant/home/bloc/home_event.dart';
import 'package:ndisparticipant/home/bloc/home_state.dart';
import 'package:ndisparticipant/home/home_navigator.dart';
import 'package:ndisparticipant/home/model/ndis_expert/service_expert_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceExpertDetails extends StatefulWidget {
  const ServiceExpertDetails({super.key});

  @override
  State<ServiceExpertDetails> createState() => _ServiceExpertDetailsState();
}

class _ServiceExpertDetailsState extends State<ServiceExpertDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  ExpertDetailData? expert_data;
  ListDetail? list_detail;
  bool claim = true;
  bool workinghours = false;
  bool _hasCallSupport = false;
  Future<void>? _launched;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeServiceDetailsClickState) {
      expert_data = homeState.expertDetailModel?.data;
      list_detail = expert_data?.listDetail;
      print("list_detail____${list_detail?.listingId}");
    }
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
  listener: (context, state) {
    print("state_detail____$state");
    if(state is HomeServiceExpertDetilsPageState){
      Navigator.pop(context);
    }
    if (state is HomeServiceDetailsClickState) {
      Navigator.of(context).pop();
    }
    if(state is HomeLoginPageState){
      Navigator.of(context).pushNamed(HomeNavigator.loginPage);
    }
    if (state is GetQuoteSerExpertSuccessState) {
      showHideProgress(false);
      BlocProvider.of<HomeBloc>(context).add(HomeEventServiceDetailsClick("${list_detail?.listingId}"));
      showSnackBar(state.message,Colors.black , context);
    }
    if(state is HomeerrorloadingState){
      showHideProgress(false);
      showSnackBar(state.message,Colors.red , context);
      BlocProvider.of<HomeBloc>(context).add(HomeEventServiceDetailsClick("${list_detail?.listingId}"));
    }
  },
  child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Service Expert Detail",
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
                          url: "${list_detail!.coverImage}",
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
                                Text(list_detail!.listingName.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                    textStyleBoldBlack(14.0.scale(), Colors.black)),
                                AVerticalSpace(3.0.scale()),
                                SizedBox(
                                  width: 300.0.scale(),
                                  child: Text(
                                    list_detail!.listingAddress.toString(),
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
                                      "${list_detail?.comLandNumber ?? ''}",
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
                                      "${list_detail?.comEmail ?? ''}",
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
                                      "${list_detail?.comWebsite ?? ''}",
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
                              url: "${list_detail!.profileImage}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
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
                                    _launched = _makePhoneCall(
                                        "${list_detail?.comLandNumber}");
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
                                BlocProvider.of<HomeBloc>(context).add(EventServExpertToLoginBtnClick("service_expert_get_quote"));
                              } else {

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
                                                    showSnackBar("Please enter your query or message", Colors.black, context2);
                                                  } else {
                                                    Navigator.of(context, rootNavigator: true).pop();
                                                    showHideProgress(true);
                                                    BlocProvider.of<HomeBloc>(context).add(GetQuoteServExpertBtnClick(
                                                      "${list_detail?.listingId}",
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
                                list_detail!.abnNumber.toString(),
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
                                list_detail!.organiType.toString(),
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
                                list_detail!.ndisRegs.toString(),
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
                                list_detail!.regNumber.toString(),
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
                                  url: "${list_detail!.regStamp}",
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
                                "About ${list_detail!.listingName.toString()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                textStyleBoldBlack(14.0.scale(), Colors.black)),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              list_detail!.listingDescription.toString(),
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
                          if("${list_detail?.service1Name}" != '')
                            Text(
                              "${list_detail?.service1Name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).leftPadding(10.0.scale()),

                          if("${list_detail?.service2Name}" != '')
                            AVerticalSpace(5.0.scale()),
                          if("${list_detail?.service2Name}" != '')
                            Text(
                              "${list_detail?.service2Name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).leftPadding(10.0.scale()),
                          if("${list_detail?.service3Name}" != '')
                            AVerticalSpace(5.0.scale()),
                          if("${list_detail?.service3Name}" != '')
                            Text(
                              "${list_detail?.service3Name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).leftPadding(10.0.scale()),
                          if("${list_detail?.service4Name}" != '')
                            AVerticalSpace(5.0.scale()),
                          if("${list_detail?.service4Name}" != '')
                            Text(
                              "${list_detail?.service4Name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).leftPadding(10.0.scale()),
                          if("${list_detail?.service5Name}" != '')
                            AVerticalSpace(5.0.scale()),
                          if("${list_detail?.service5Name}" != '')
                            Text(
                              "${list_detail?.service5Name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).leftPadding(10.0.scale()),
                          if("${list_detail?.service6Name}" != '')
                            AVerticalSpace(5.0.scale()),
                          if("${list_detail?.service6Name}" != '')
                            Text(
                              "${list_detail?.service6Name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).leftPadding(10.0.scale()),
                        ],
                      ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                    ),
                  ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                  Card(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.0.scale()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("SERVICE AREAS",
                              style: textStyleBoldBlack(14.0.scale(), Colors.black)),
                          AVerticalSpace(5.0.scale()),
                          for (int i = 0; i < int.parse("${list_detail?.serviceLocations?.length}"); i++)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 80.0.scale(),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Location ",
                                        style: textStyleBoldBlack(11.0.scale(), Colors.black),
                                      ),
                                      Text(
                                        "City ",
                                        style: textStyleBoldBlack(11.0.scale(), Colors.black),
                                      ),
                                      Text(
                                        "State ",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBoldBlack(11.0.scale(), Colors.black),
                                      ),
                                      Text(
                                        "Country ",
                                        style: textStyleBoldBlack(11.0.scale(), Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 230.0.scale(),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ": ${list_detail?.serviceLocations?[i].location}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBlack(12.0.scale()),
                                      ),
                                      AVerticalSpace(2.0.scale()),
                                      Text(
                                        ": ${list_detail?.serviceLocations?[i].locationCity}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBlack(12.0.scale()),
                                      ),
                                      AVerticalSpace(2.0.scale()),
                                      Text(
                                        ": ${list_detail?.serviceLocations?[i].locationState}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBlack(12.0.scale()),
                                      ),
                                      AVerticalSpace(2.0.scale()),
                                      Text(
                                        ": ${list_detail?.serviceLocations?[i].locationCountry}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBlack(12.0.scale()),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ).bottomPadding(10.0.scale())
                        ],
                      ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                    ),
                  ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                  AVerticalSpace(5.0.scale()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    child: Card(
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
                            ImageGallery(list_detail?.galleryImage),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("SPECIAL OFFERS -",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            textStyleBoldBlack(14.0.scale(), Colors.black))
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
                                    padding:  EdgeInsets.all(5.0.scale()),
                                    child: Container(
                                      width: 100.0.scale(),
                                      height: 100.0.scale(),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0.scale()),
                                          border: Border.all(color: Colors.grey)
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5.0.scale()),
                                        child: NetworkImagesWidgets(
                                          url:  '${list_detail?.profileImage}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  AHorizontalSpace(10.0.scale()),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${list_detail?.service1Name}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyleBoldBlack(
                                              14.0.scale(), Colors.black)),
                                      AVerticalSpace(2.0.scale()),
                                      Text(
                                        "${list_detail?.service1Detail}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBlack(12.0.scale()),
                                      ),
                                      AVerticalSpace(2.0.scale()),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2)),
                                            border:
                                            Border.all(color: Colors.purple),
                                            color: Color(0xFFEDCDCF)),
                                        child: Text(
                                          "\$ ${list_detail?.service1Price}",
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
                                            BlocProvider.of<HomeBloc>(context).add(EventServExpertToLoginBtnClick("service_expert_get_quote"));
                                          } else {

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
                                                                showSnackBar("Please enter your query or message", Colors.black, context2);
                                                              } else {
                                                                Navigator.of(context, rootNavigator: true).pop();
                                                                showHideProgress(true);
                                                                BlocProvider.of<HomeBloc>(context).add(GetQuoteServExpertBtnClick(
                                                                  "${list_detail?.listingId}",
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
                                          height: 30.0.scale(),
                                          width: 180.0.scale(),
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
                                  ).topPadding(10.0.scale()),
                                ],
                              ),
                            ],
                          ),
                        ),



                      ],
                    ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                  ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Approach Method ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                  Text(
                                    "Languages ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                  Text(
                                    "Service Specilisation ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                  Text(
                                    "Pet Friendly ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                  Text(
                                    "Service Delivery Method ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                ],
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(': ${list_detail?.apprMerhod}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                  Text(
                                    ': ${list_detail?.language}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                  Text(
                                    ': ${list_detail?.servSpecilisation}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                  Text(
                                    ': ${list_detail?.petFrie}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                  Text(
                                    ': ${list_detail?.serDeliMethod}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ),
                                ],
                              )
                            ],
                          ).leftPadding(10.0.scale()),
                        ],
                      ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
                    ),
                  ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                  AVerticalSpace(5.0.scale()),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 15.0.scale()),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           GestureDetector(
                             onTap: () {
                               setState(() {
                                 claim = true;
                                 workinghours = false;
                               });
                             },
                             child: Container(
                               height: 45.0.scale(),
                               width: MediaQuery.of(context).size.width/2.2,
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
                                     12.0.scale(),
                                     claim == true ? Colors.white : Colors.black,
                                   )).align(Alignment.center),
                             ),
                           ),
                           GestureDetector(
                             onTap: () {
                               setState(() {
                                 claim = false;
                                 workinghours = true;
                               });
                             },
                             child: Container(
                               height: 45.0.scale(),
                               width: MediaQuery.of(context).size.width/2.2,
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
                                     12.0.scale(),
                                     workinghours == true
                                         ? Colors.white
                                         : Colors.black,
                                   )).align(Alignment.center),
                             ),
                           ),
                         ],
                       ),
                       AVerticalSpace(5.0.scale()),
                       if (claim == true) ClaimList(),
                       if (workinghours == true)WorkingHoursList(list_detail),
                     ],
                   ),
                 ),
                  AVerticalSpace(15.0.scale()),
                ],
              )),

    )),
);
  }


}

class ClaimList extends StatefulWidget {
  ClaimList();

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
              BlocProvider.of<HomeBloc>(context).add(EventServExpertToLoginBtnClick("service_expert_get_quote"));
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
                width: MediaQuery.of(context).size.width - 38.0.scale(),
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
                              url:  widget.galleryImage1![index],
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

class WorkingHoursList extends StatelessWidget {
  ListDetail? listingDetailsData1;

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
