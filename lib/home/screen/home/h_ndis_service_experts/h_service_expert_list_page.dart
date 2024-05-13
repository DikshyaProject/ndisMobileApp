import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Helpers/services/shared_preferences.dart';
import '../../../../Helpers/theme/theme.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../model/ndis_expert/ndis_expert_services_list.dart';

class HomeServiceExpertListPage extends StatefulWidget {
  @override
  State<HomeServiceExpertListPage> createState() =>
      _HomeServiceExpertListPageState();
}

class _HomeServiceExpertListPageState extends State<HomeServiceExpertListPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  bool showDate = false;
  ServiceExpertListingData? serviceExpertListingData;
  List<ServiceExpertListing>? serviceExpertListing;
  String? cat_id = '';
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
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeServiceExpertDetilsPageState) {
      serviceExpertListingData = homeState.serviceExpertListingData;
      serviceExpertListing = serviceExpertListingData!.serviceExpertListing!;
      cat_id = homeState.catId;
    }

    dateController.text = "Preferred Date";
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
        print("state_list____$state");
        if (state is HomeNdisServiceExpertMainListingPageState) {
          Navigator.pop(context);
        }
        if (state is HomeServiceDetailsClickState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.hServiceExpertDetailsPage);
        }
        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          showSnackBar(state.message, Colors.black, context);
          BlocProvider.of<HomeBloc>(context).add(HomeServiceExpertDetilsPageClick("$cat_id"));
        }
      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Services",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),

        body: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: serviceExpertListing!.length,
            itemBuilder: (BuildContext context1, int index) => Column(
              children: [
                AVerticalSpace(5.0.scale()),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showHideProgress(true);
                    BlocProvider.of<HomeBloc>(context).add(
                        HomeEventServiceDetailsClick(
                            "${serviceExpertListing?[index].listingId}"));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.scale(), vertical: 5.0.scale()),
                    child: Container(
                      padding: EdgeInsets.all(8.0.scale()),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1.5,
                              color: kColorThemePurpleColor
                              ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 90.0.scale(),
                                    height: 100.0.scale(),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0.scale()),
                                        border: Border.all(color: Colors.grey)
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(5),
                                      child: NetworkImagesWidgets(
                                        url:  serviceExpertListing![index].profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 5.0.scale(),
                                    right: 5.0.scale(),
                                    child: Image.asset(
                                      'assets/images/ic_verifid.png',
                                      height: 25,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                ],
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150.0.scale(),
                                    child: Text(
                                      serviceExpertListing![index]
                                          .listingName!,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleCustomColor(
                                          13.0.scale(), Colors.black),
                                    ),
                                  ),
                                  AVerticalSpace(7.0.scale()),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/ic_locationlist.png",
                                        height: 12.0.scale(),
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      SizedBox(
                                        width: 150.0.scale(),
                                        child: Text(
                                          serviceExpertListing![index]
                                              .listingAddress!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyleCustomColor(
                                              11.0.scale(), Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/ic_call.png",
                                        height: 12.0.scale(),
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      SizedBox(
                                        width: 150.0.scale(),
                                        child: Text(
                                          serviceExpertListing![index]
                                              .comPhone1!,
                                          style: textStyleCustomColor(
                                              11.0.scale(), Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/ic_emailnew.png",
                                        height: 12.0.scale(),
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      SizedBox(
                                        width: 150.0.scale(),
                                        child: Text(
                                          serviceExpertListing![index]
                                              .comEmail!,
                                          style: textStyleCustomColor(
                                              11.0.scale(), Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_star.png',
                                        height: 15,
                                        fit: BoxFit.fill,
                                      ),
                                      AHorizontalSpace(2.0.scale()),
                                      Text(
                                        serviceExpertListing![index]
                                            .regGroup!,
                                        style: textStyleCustomColor(
                                            12.0.scale(), Colors.black),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.0.scale(),
                                        horizontal: 8.0.scale()),
                                    decoration: BoxDecoration(
                                        color: Color(0xffF3F3F3),
                                        borderRadius:
                                            BorderRadius.circular(
                                                10.0.scale()),
                                        border: Border.all(
                                          color: Color(0xffB9B9B9),
                                        )),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/ic_like.png",
                                          fit: BoxFit.fill,
                                          height: 12,
                                        ),
                                        AHorizontalSpace(2.0.scale()),
                                        Text(
                                          serviceExpertListing![index]
                                              .regGroup!,
                                          style: textStyleCustomColor(
                                              10.0.scale(),
                                              Color(0xff828282)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AVerticalSpace(5.0.scale()),
                                  InkWell(
                                    onTap: (){
                                      if (sharedPrefs.IsLogin){
                                        if(_hasCallSupport){
                                          setState(() {
                                            _launched = _makePhoneCall(
                                                "${serviceExpertListing?[index].comLandNumber}");
                                          });
                                        }
                                      }else{
                                        showSnackBar('Please login first.', Colors.black, context);
                                      }

                                    },
                                    child: Container(
                                      height: 22.0.scale(),
                                      width: 50.0.scale(),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                        border: Border.all(color: Colors.green),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.call,
                                            size: 13.0.scale(),
                                            color: Colors.green,
                                          ),
                                          AHorizontalSpace(2.0.scale()),
                                          Text(
                                            "Call",
                                            textAlign: TextAlign.center,
                                            style: textStyleBoldCustomColor(
                                                10.0.scale(), Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AVerticalSpace(10.0.scale()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Service Offered:",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomLargeColor(
                                    11.0.scale(), Colors.black),
                              ),
                              AHorizontalSpace(10.0.scale()),
                              SizedBox(
                                width: 200.0.scale(),
                                child: Wrap(
                                  runSpacing: 5,
                                  children: [
                                    for (int i = 0;
                                        i < serviceExpertListing!.length;
                                        i++)
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.0.scale()),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0.scale(),
                                              horizontal: 8.0.scale()),
                                          color: Color(0xffF3F3F3),
                                          child: Text(
                                            serviceExpertListing![i]
                                                .service1Detail!,
                                            style: textStyleCustomColor(
                                                11.0.scale(),
                                                Color(0xff828282)),
                                          ),
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
                  ),
                ),
                AVerticalSpace(5.0.scale()),
              ],
            )),
      )),
    );
  }
}

Widget buttons(String name, Color textColor, Color boxColor, bool isWhatsapp) {
  return Padding(
    padding: EdgeInsets.only(right: 8.0.scale()),
    child: Container(
      width: 140.0.scale(),
      height: 45.0.scale(),
      padding:
          EdgeInsets.symmetric(vertical: 10.0.scale(), horizontal: 8.0.scale()),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 1.5, color: kColorThemePurpleColor.withOpacity(0.3)),
        ],
        color: boxColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isWhatsapp
              ? Padding(
                  padding: EdgeInsets.only(right: 2.0.scale()),
                  child: Image.asset(
                    'assets/images/ic_whatsapp.png',
                    height: 16,
                    fit: BoxFit.fill,
                  ),
                )
              : Text(""),
          Text(
            name,
            style: textStyleCustomColor(12.0.scale(), textColor),
          ),
        ],
      ),
    ),
  );
}
