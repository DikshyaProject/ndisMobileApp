import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/bloc/home_bloc.dart';
import 'package:ndisparticipant/home/home_navigator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_event.dart';
import '../../../model/support-coordinator/support_corrdinator_subcat_list_model.dart';

SupCorrdinatoreSubCatData? supCorrdinatoreSubCatData;
List<SupportListingsData>? supportListingsData = [];
List<String>? subCategoryName;

class HomeSupportCoordinatorsList extends StatefulWidget {
  const HomeSupportCoordinatorsList({super.key});

  @override
  State<HomeSupportCoordinatorsList> createState() =>
      _HomeSupportCoordinatorsListState();
}

class _HomeSupportCoordinatorsListState extends State<HomeSupportCoordinatorsList> {
  String? screen;
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
    if (homeState is HomeSupportCoordinatorsListPageState) {
      supCorrdinatoreSubCatData = homeState.supCorrdinatoreSubCatData;
      supportListingsData = supCorrdinatoreSubCatData!.supportListingsData;
      subCategoryName = supportListingsData![0].subCategoryName;
      screen = homeState.screenName;
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
          if (state is HomeSupportCoordinatorsPageState) {
            Navigator.of(context).pop();
          }
          if (state is HomeSupportCoordinatorsDetailPageState) {
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.HomeSupportCoordinatorsDetail);
          }
          if (state is HomeerrorloadingState) {
            showHideProgress(false);
            Navigator.pop(context, true);
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
                    "Support Coordinator",
                    style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                  ),
                  leading: InkWell(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white))),
              body: SingleChildScrollView(
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: supportListingsData!.length,
                    itemBuilder: (BuildContext context1, int index) => Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: kColorThemePurpleColor,
                                blurRadius: 2.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5.0.scale()),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              AVerticalSpace(5.0.scale()),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  showHideProgress(true);
                                  BlocProvider.of<HomeBloc>(context).add(HomeSupportCoordinatorDetailClick
                                    ("${supportListingsData?[index].listingId}", screen));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0.scale(),
                                      vertical: 5.0.scale()),
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
                                                .withOpacity(0.3)),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                                      url: supportListingsData![index].profileImage!,
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
                                                    supportListingsData![index]
                                                        .listingName!,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textStyleCustomColor(
                                                        13.0.scale(),
                                                        Colors.black),
                                                  ),
                                                ),
                                                AVerticalSpace(7.0.scale()),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/ic_locationlist.png",
                                                      height: 12.0.scale(),
                                                    ),
                                                    AHorizontalSpace(
                                                        5.0.scale()),
                                                    SizedBox(
                                                      width: 150.0.scale(),
                                                      child: Text(
                                                        supportListingsData![
                                                                index]
                                                            .listingAddress!,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            textStyleCustomColor(
                                                                11.0.scale(),
                                                                Colors.black),
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
                                                    AHorizontalSpace(
                                                        5.0.scale()),
                                                    SizedBox(
                                                      width: 150.0.scale(),
                                                      child: Text(
                                                        supportListingsData![
                                                                index]
                                                            .mobileNumber!,
                                                        style:
                                                            textStyleCustomColor(
                                                                11.0.scale(),
                                                                Colors.black),
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
                                                    AHorizontalSpace(
                                                        5.0.scale()),
                                                    SizedBox(
                                                      width: 150.0.scale(),
                                                      child: Text(
                                                        supportListingsData![
                                                                index]
                                                            .emailId!,
                                                        style:
                                                            textStyleCustomColor(
                                                                11.0.scale(),
                                                                Colors.black),
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
                                                    AHorizontalSpace(
                                                        2.0.scale()),
                                                    Text(
                                                      supportListingsData![
                                                              index]
                                                          .eneEffRating!,
                                                      style:
                                                          textStyleCustomColor(
                                                              12.0.scale(),
                                                              Colors.black),
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
                                                        color:
                                                            Color(0xffB9B9B9),
                                                      )),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/ic_like.png",
                                                        fit: BoxFit.fill,
                                                        height: 12,
                                                      ),
                                                      AHorizontalSpace(
                                                          2.0.scale()),
                                                      Text(
                                                        supportListingsData![
                                                                index]
                                                            .eneEffRating!,
                                                        style:
                                                            textStyleCustomColor(
                                                                10.0.scale(),
                                                                Color(
                                                                    0xff828282)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                AVerticalSpace(3.0.scale()),
                                                InkWell(
                                                  onTap: (){
                                                    if (sharedPrefs.IsLogin){
                                                      if(_hasCallSupport){
                                                        setState(() {
                                                          _launched = _makePhoneCall(
                                                              "${supportListingsData?[index].mobileNumber}");
                                                        });
                                                      }else{
                                                        showSnackBar('Please login first.', Colors.black, context);
                                                      }
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Service Offered:",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  textStyleBoldCustomLargeColor(
                                                      11.0.scale(),
                                                      Colors.black),
                                            ),
                                            AHorizontalSpace(10.0.scale()),
                                            SizedBox(
                                              width: 210.0.scale(),
                                              child: Wrap(
                                                runSpacing: 5,
                                                children: [
                                                  for (int i = 0;
                                                      i <
                                                          subCategoryName!
                                                              .length;
                                                      i++)
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 8.0.scale()),
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    2.0.scale(),
                                                                horizontal: 8.0
                                                                    .scale()),
                                                        color:
                                                            Color(0xffF3F3F3),
                                                        child: Text(
                                                          subCategoryName![i]!,
                                                          style: textStyleCustomColor(
                                                              11.0.scale(),
                                                              Color(
                                                                  0xff828282)),
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
                          ),
                        )),
              )),
        ));
  }

  Widget buttons(
      String name, Color textColor, Color boxColor, bool isWhatsapp) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.scale()),
      child: Container(
        height: 45.0.scale(),
        width: MediaQuery.of(context).size.width/2.5,
        padding: EdgeInsets.symmetric(
            vertical: 10.0.scale(), horizontal: 8.0.scale()),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 1.5,
                color: kColorThemePurpleColor.withOpacity(0.3)),
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
}
