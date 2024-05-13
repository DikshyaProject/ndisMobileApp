import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/custom_dialog.dart';
import 'package:ndisparticipant/home/home_navigator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../model/market_place/mp_property_details_model.dart';

class HomeAccomodationPropertyDetailsPage extends StatefulWidget {
   HomeAccomodationPropertyDetailsPage();

  @override
  State<HomeAccomodationPropertyDetailsPage> createState() => _HomeAccomodationPropertyDetailsPageState();
}

class _HomeAccomodationPropertyDetailsPageState extends State<HomeAccomodationPropertyDetailsPage> {
  MpPropertyDetailsData? mpPropertyDetailsData;
  List<PropertyDetailsData>? propertyDetailsData;
  List<String>? galleryImage=[];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController queryController = TextEditingController();
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
    if(homeState is HomeAccommodationPropertyDetailsState)
    {
      mpPropertyDetailsData=homeState.mpPropertyDetailsData;
      propertyDetailsData=mpPropertyDetailsData!.propertyDetailsData;
      galleryImage = propertyDetailsData!.first.galleryImage;
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
        if(state is HomeAccommodationHousingforSaleState){
          Navigator.pop(context, true);
        }
 if(state is HomeAccommodationHousingforholidayState){
          Navigator.pop(context, true);
        }
 if(state is HomeAccommodationPropertyDetailsState){
          Navigator.pop(context, true);
        }
        if (state is HomeLoginPageState) {
          Navigator.of(context).pushNamed(HomeNavigator.loginPage);
        }

        if (state is GetquotePropSuccessState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context).add(HomeAccommodationPropertyDetailsBtnClick(propertyDetailsData!.first.propertyId));
          showSnackBar(state.message, Colors.black, context);
        }

        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context).add(HomeAccommodationPropertyDetailsBtnClick(propertyDetailsData!.first.propertyId));
          showSnackBar(state.message, Colors.black, context);
        }

      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Property Details",
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
                        url: "${propertyDetailsData?.first?.coverImage}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 45.0.scale(),
                      top: 45.0.scale(),
                      child: Container(
                          height: 110.0.scale(),
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
                              Text("${propertyDetailsData?.first?.propertyName}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                  textStyleBoldBlack(14.0.scale(), Colors.black)),
                              AVerticalSpace(3.0.scale()),
                              SizedBox(
                                width: 300.0.scale(),
                                child: Text(
                                  "${propertyDetailsData?.first?.nearTrainStat}",
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
                                    "${propertyDetailsData?.first?.userMobile}",
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
                                    "${propertyDetailsData?.first?.userEmail}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                    textStyleCustomColor(11.0.scale(), Colors.black),
                                  ).expand(),
                                ],
                              ),


                            ],
                          )
                      ),
                    ),
                    Positioned(
                      left: 15.0.scale(),
                      top: 65.0.scale(),
                      child: Container(
                        height: 70.0.scale(),
                        width: 70.0.scale(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0.scale()),
                            border: Border.all(color: Colors.black)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0.scale()),
                          child: NetworkImagesWidgets(
                            url: "${propertyDetailsData?.first?.profileImage}",
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
                                  _launched = _makePhoneCall("${propertyDetailsData?.first?.userMobile}");
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
                        InkWell(
                          onTap: () {
                            if (sharedPrefs.IsLogin == false) {
                              BlocProvider.of<HomeBloc>(context).add(EventAcmPropDetailToLoginBtnClick("acm_prop_detail",
                                "${propertyDetailsData?.first?.propertyId}",));
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
                                                child: Icon(CupertinoIcons
                                                    .multiply)).align(Alignment.topRight),
                                            Text(
                                              'Get Quote',
                                              style: textStyleBoldCustomLargeColor(
                                                  16.0.scale(),
                                                  Colors.black),
                                            ).align(Alignment.center),
                                            AVerticalSpace(20.0.scale()),
                                            Container(
                                              padding: EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0
                                                      .scale()),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(
                                                        0xFFD8D8D8),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(5)),
                                              child: TextField(
                                                controller: nameController,
                                                maxLines: 1,
                                                style: textStyleCustomColor(
                                                    14.0.scale(),
                                                    kColorDialogNameTitle),
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  border: InputBorder
                                                      .none,
                                                  hintText: '',
                                                  hintStyle: textStyleCustomColor(
                                                      14.0.scale(),
                                                      kColorSearchHintText),
                                                ),
                                              ),
                                            ),
                                            AVerticalSpace(10.0.scale()),
                                            Container(
                                              padding: EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0
                                                      .scale()),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(
                                                        0xFFD8D8D8),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(5)),
                                              child: TextField(
                                                controller: emailController,
                                                maxLines: 1,
                                                style: textStyleCustomColor(
                                                    14.0.scale(),
                                                    kColorDialogNameTitle),
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  border: InputBorder
                                                      .none,
                                                  hintText: '',
                                                  hintStyle: textStyleCustomColor(
                                                      14.0.scale(),
                                                      kColorSearchHintText),
                                                ),
                                              ),
                                            ),
                                            AVerticalSpace(10.0.scale()),
                                            Container(
                                              padding: EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0
                                                      .scale()),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(
                                                        0xFFD8D8D8),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(5)),
                                              child: TextField(
                                                controller: mobileController,
                                                maxLines: 1,
                                                style: textStyleCustomColor(
                                                    14.0.scale(),
                                                    kColorDialogNameTitle),
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  border: InputBorder
                                                      .none,
                                                  hintText: '',
                                                  hintStyle: textStyleCustomColor(
                                                      14.0.scale(),
                                                      kColorSearchHintText),
                                                ),
                                              ),
                                            ),
                                            AVerticalSpace(10.0.scale()),
                                            Container(
                                              padding: EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0
                                                      .scale()),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(
                                                        0xFFD8D8D8),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(5)),
                                              child: TextField(
                                                controller: queryController,
                                                maxLines: 6,
                                                style: textStyleCustomColor(
                                                    14.0.scale(),
                                                    kColorDialogNameTitle),
                                                cursorColor: kColorDialogNameTitle,
                                                textAlignVertical: TextAlignVertical
                                                    .top,
                                                enableInteractiveSelection: false,
                                                autocorrect: false,
                                                enableSuggestions: false,
                                                decoration: InputDecoration(
                                                  border: InputBorder
                                                      .none,
                                                  hintText: "Enter your query or message",
                                                  hintStyle: textStyleCustomColor(
                                                      14.0.scale(),
                                                      kColorSearchHintText),
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
                                                  BlocProvider.of<HomeBloc>(context).add(
                                                      GetQuotePropClick(
                                                        "${propertyDetailsData?.first?.propertyId}",
                                                        queryController.text,
                                                      ));
                                                }
                                              },
                                              child: Container(
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                height: 45.0.scale(),
                                                decoration: BoxDecoration(
                                                  color: Color(
                                                      0xff00BDAA),
                                                  borderRadius: BorderRadius
                                                      .circular(10),
                                                ),
                                                child: Text(
                                                  "Submit",
                                                  style: textStyleBoldCustomLargeColor(
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
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.0.scale(), vertical: 10.0.scale()),
                  child: Card(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.0.scale(), vertical: 10.0.scale()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("PHOTO GALLERY",
                                style: textStyleBoldBlack(14.0.scale(), Colors.black)),
                            AVerticalSpace(10.0.scale()),
                            ImageGallery(galleryImage!),
                          ],
                        ),
                      )),
                ),
                AVerticalSpace(10.0.scale()),
                Card(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AVerticalSpace(10.0.scale()),
                        Text("Basic Info ${propertyDetailsData?.first?.propertyName}".toUpperCase(),
                            style: textStyleBoldBlack(
                                14.0.scale(), Colors.black)),

                        AVerticalSpace(10.0.scale()),
                        Wrap(
                          runSpacing: 5.0.scale(),
                          children: [
                            Image.asset(
                              'assets/images/parking_area.png',
                              height: 20.0.scale(),
                              width: 20.0.scale(),
                              color: Colors.green,
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "Parking",
                              style: textStyleBoldBlack(
                                  10.0.scale(), Colors.black),
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "${propertyDetailsData?.first?.nearPark}",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),

                          ],
                        ).rightPadding(10.0.scale()),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/bed.png',
                              height: 20.0.scale(),
                              width: 20.0.scale(),
                              color: Colors.green,
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "Bedroom",
                              style: textStyleBoldBlack(
                                  10.0.scale(), Colors.black),
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "${propertyDetailsData?.first?.bedroom}",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/bathtub.png',
                              height: 20.0.scale(),
                              width: 20.0.scale(),
                              color: Colors.green,
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "Bathroom",
                              style: textStyleBoldBlack(
                                  10.0.scale(), Colors.black),
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "${propertyDetailsData?.first?.bathroom}",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Wrap(
                          runSpacing: 5.0.scale(),
                          children: [
                            Image.asset(
                              'assets/images/parking_area.png',
                              height: 20.0.scale(),
                              width: 20.0.scale(),
                              color: Colors.green,
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "Standard parking",
                              style: textStyleBoldBlack(
                                  10.0.scale(), Colors.black),
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "${propertyDetailsData?.first?.standardParking}",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),


                          ],
                        ).rightPadding(10.0.scale()),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/toilet.png',
                              height: 20.0.scale(),
                              width: 20.0.scale(),
                              color: Colors.green,
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "Toilet",
                              style: textStyleBoldBlack(
                                  10.0.scale(), Colors.black),
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "${propertyDetailsData?.first?.toilet}",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Avilable :",
                              style: textStyleBoldBlack(
                                  10.0.scale(), Colors.black),
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "${DateFormat("dd, MMM yyyy").format(DateTime.parse("${propertyDetailsData?.first?.available}"))}",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                          ],
                        )
                      ],
                    )
                        .leftPadding(10.0.scale())
                        .rightPadding(10.0.scale())
                        .bottomPadding(10.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
                Card(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AVerticalSpace(10.0.scale()),
                        Text("Basic Information".toUpperCase(),
                            style: textStyleBoldBlack(
                                14.0.scale(), Colors.black)),

                        AVerticalSpace(10.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Contact Number",
                                style: textStyleBoldBlack(
                                    10.0.scale(), Colors.black),
                              ),
                            ),

                            Text(
                              ": ${propertyDetailsData?.first?.userMobile}",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Contact Email",
                                style: textStyleBoldBlack(
                                    10.0.scale(), Colors.black),
                              ),
                            ),

                            Text(
                              ": ${propertyDetailsData?.first?.userEmail}",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Property type",
                                style: textStyleBoldBlack(
                                    10.0.scale(), Colors.black),
                              ),
                            ),

                            Text(
                              ": ${propertyDetailsData?.first?.propertyType}",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Brochure",
                                style: textStyleBoldBlack(
                                    10.0.scale(), Colors.black),
                              ),
                            ),

                            Text(
                              ": ",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.scale(),vertical: 5.0.scale()),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(3.0.scale())
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.download_for_offline, color: Colors.white, size: 12.0.scale(),),
                                  AHorizontalSpace(5.0.scale()),
                                  Text("Download", style: textStyleBoldCustomColor(
                                      10.0.scale(), Colors.white)),
                                ],
                              ),
                            )
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),

                      ],
                    )
                        .leftPadding(10.0.scale())
                        .rightPadding(10.0.scale())
                        .bottomPadding(10.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About ${propertyDetailsData?.first?.propertyName}".toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            textStyleBoldBlack(14.0.scale(), Colors.black)),
                        AVerticalSpace(5.0.scale()),
                        Text(
                          "${propertyDetailsData?.first?.listingDescription}",
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleBlack(12.0.scale()),
                        ),
                      ],
                    )
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale())
                        .leftPadding(5.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("SDA INFORMATION",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            textStyleBoldBlack(14.0.scale(), Colors.black)),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 210.0.scale(),
                              child: Text(
                                "SDA Building Type",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                              ),
                            ),
                            Text(
                              ": ${propertyDetailsData?.first?.sdaBuilType}",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ).rightPadding(15.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 210.0.scale(),
                              child: Text(
                                "SDA Design Category",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                              ),
                            ),
                            Text(
                              ": ${propertyDetailsData?.first?.sdaDesignCategory}",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ).rightPadding(15.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 210.0.scale(),
                              child: Text(
                                "Number of SDA Residents",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                              ),
                            ),
                            Text(
                              ": ${propertyDetailsData?.first?.numOfSdaRes}",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ).rightPadding(15.0.scale()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 210.0.scale(),
                              child: Text(
                                "SDA Location",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                              ),
                            ),
                            Text(
                              ": ${propertyDetailsData?.first?.sdaLocation}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ).rightPadding(15.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 210.0.scale(),
                              child: Text(
                                "SDA income per participant",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                              ),
                            ),
                            Text(
                              ": ${propertyDetailsData?.first?.sdaIncPerPart}",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ).rightPadding(15.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 210.0.scale(),
                              child: Text(
                                "Potential total imcome per year",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                              ),
                            ),
                            Text(
                              ": ${propertyDetailsData?.first?.potTotalIncPerYr}",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ).rightPadding(15.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 210.0.scale(),
                              child: Text(
                                "Property size(m2)",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                              ),
                            ),
                            Text(
                              ": ${propertyDetailsData?.first?.propSizeM2}",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ).rightPadding(15.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 210.0.scale(),
                              child: Text(
                                "Land area",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                              ),
                            ),
                            Text(
                              ": ${propertyDetailsData?.first?.landAreaM2}",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ).rightPadding(15.0.scale()),
                      ],
                    )
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale())
                        .leftPadding(10.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("PROPERTY FEATURES",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            textStyleBoldBlack(14.0.scale(), Colors.black)),
                        AVerticalSpace(5.0.scale()),

                        for(int i=0; i< int.parse("${propertyDetailsData?.first?.propFeature?.length}"); i++ )
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.verified, size: 15.0.scale(),)
                                  .rightPadding(10.0.scale())
                                  .leftPadding(5.0.scale()),
                              Text(
                                "${propertyDetailsData?.first?.propFeature?[i]}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBlack(12.0.scale()),
                              ).expand(),
                            ],
                          ),

                      ],
                    )
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale())
                        .leftPadding(5.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("LOCAL AREA",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            textStyleBoldBlack(14.0.scale(), Colors.black)),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest train station at ",
                              style: textStyleCustomColor(12.0.scale(), Colors.grey),
                            ),
                            Text( "${propertyDetailsData?.first?.nearTrainStat}" ==""?"N/A":
                            "${propertyDetailsData?.first?.nearTrainStat}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(12.0.scale(), Colors.black),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest tram stop at ",
                              style: textStyleCustomColor(12.0.scale(), Colors.grey),
                            ),
                            Text("${propertyDetailsData?.first?.nearTramStop}"==""?"N/A":
                            "${propertyDetailsData?.first?.nearTrainStat}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(12.0.scale(), Colors.black),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest bus stop at ",
                              style: textStyleCustomColor(12.0.scale(), Colors.grey),
                            ),
                            Text("${propertyDetailsData?.first?.nearBusStop}"==""?"N/A":
                            "${propertyDetailsData?.first?.nearBusStop}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(12.0.scale(), Colors.black),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest ferry station at ",
                              style: textStyleCustomColor(12.0.scale(), Colors.grey),
                            ),
                            Text("${propertyDetailsData?.first?.nearFerryStat}"==""?"N/A":
                            "${propertyDetailsData?.first?.nearFerryStat}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(12.0.scale(), Colors.black),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest shopping centre at ",
                              style: textStyleCustomColor(12.0.scale(), Colors.grey),
                            ),
                            Text("${propertyDetailsData?.first?.nearShopCent}"==""?"N/A":
                            "${propertyDetailsData?.first?.nearShopCent}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(12.0.scale(), Colors.black),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest hospital at ", style: textStyleCustomColor(12.0.scale(), Colors.grey),
                            ),
                            Text("${propertyDetailsData?.first?.nearHospt}"==""?"N/A":
                            "${propertyDetailsData?.first?.nearHospt}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(12.0.scale(), Colors.black),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest park at ",
                              style: textStyleCustomColor(12.0.scale(), Colors.grey),
                            ),
                            Text("${propertyDetailsData?.first?.nearPark}"==""?"N/A":
                            "${propertyDetailsData?.first?.nearPark}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(12.0.scale(), Colors.black),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest medical practice (GP) at ",
                              style: textStyleCustomColor(12.0.scale(), Colors.grey),
                            ),
                            Text("${propertyDetailsData?.first?.nearMediPrac}"==""?"N/A":
                            "${propertyDetailsData?.first?.nearMediPrac}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(12.0.scale(), Colors.black),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                      ],
                    )
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale())
                        .leftPadding(5.0.scale()),
                  ),
                ).leftPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
              ],
            ),
          ),
        ),
      ),
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
                width: MediaQuery.of(context).size.width - 50.0.scale(),
                height: 200.0.scale(),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 200.0.scale(),
                        width: MediaQuery.of(context).size.width - 50.0.scale(),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                        ),
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