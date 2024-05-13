import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/home_bloc.dart';
import 'package:ndisparticipant/home/bloc/home_event.dart';
import 'package:ndisparticipant/home/bloc/home_state.dart';
import 'package:ndisparticipant/home/home_navigator.dart';
import 'package:ndisparticipant/home/model/plan_managers/plan_manager_list_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Helpers/services/shared_preferences.dart';

class HomePlanManagersPage extends StatefulWidget {
  const HomePlanManagersPage({super.key});

  @override
  State<HomePlanManagersPage> createState() => _HomePlanManagersPageState();
}

class _HomePlanManagersPageState extends State<HomePlanManagersPage> {
  List serviceList = [];
  String screen='';


  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  PlanManagerData? planManagerData;
  List<PlanManagerList>? pmList;
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
    if (homeState is HomePlanManagersBtnClickState){
      planManagerData = homeState.planManagerData;
      pmList = planManagerData?.planManagerList;
      screen = homeState.screenName.toString();
      print("screen_name__here_$screen");
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
        print("cjclkjeklew$state");
        if (state is HomeInitial)
        {
          Navigator.of(context).pop(true);
        }if(state is HomeFindSupportPageState){
          Navigator.pop(context, true);
        }

        if (state is HomePlanManagerDetailClickState)
        {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hPlanManagersDetailPage);
        }

        if(state is HomeerrorloadingState)
        {
          showHideProgress(false);
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
                    "Plan Managers",
                    style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                  ),
                  leading: InkWell(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(screen));
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white))),

            body:
            pmList?.length == 0 || pmList == null?
            Container(
              height: 500.0.scale(),
              child: Text('No Data Found!',
                style: textStyleBoldCustomLargeColor(11.0.scale(), Colors.grey),).align(Alignment.center),
            ):
            ListView.builder(
                itemCount: pmList?.length,
                itemBuilder: (context, index){
              return  GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  showHideProgress(true);
                  BlocProvider.of<HomeBloc>(context).add(HomePlanManagerDetailClick("${pmList?[index].listingId}", screen));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.scale(), vertical: 5.0.scale()),
                  child: Container(
                    padding: EdgeInsets.all(8.0.scale()),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(blurRadius: 1.5, color: kColorThemePurpleColor.withOpacity(0.3)),],
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
                                  height: 100.0.scale(),
                                  width: 100.0.scale(),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey)
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: NetworkImagesWidgets(
                                      url: "${pmList?[index].profileImage}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: 5.0.scale(),
                                  right: 5.0.scale(),
                                  child: Image.asset('assets/images/ic_verifid.png', height: 25, fit: BoxFit.fill,),
                                )
                              ],
                            ),
                            AHorizontalSpace(5.0.scale()),

                            SizedBox(
                              width: 150.0.scale(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${pmList?[index].listingName}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(13.0.scale(), Colors.black),
                                  ),

                                  AVerticalSpace(7.0.scale()),
                                  Row(
                                    children: [
                                      Image.asset("assets/images/ic_locationlist.png", height: 12.0.scale(), ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text(
                                        "${pmList?[index].listingAddress}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleCustomColor(11.0.scale(), Colors.black),
                                      ).expand(),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    children: [
                                      Image.asset("assets/images/ic_call.png", height: 12.0.scale(), ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text(
                                        "${pmList?[index].comLandNumber}",
                                        style: textStyleCustomColor(11.0.scale(), Colors.black),
                                      ),
                                    ],
                                  ),
                                  AVerticalSpace(3.0.scale()),
                                  Row(
                                    children: [
                                      Image.asset("assets/images/ic_emailnew.png", height: 12.0.scale(), ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text(
                                        "${pmList?[index].comEmail}",
                                        style: textStyleCustomColor(11.0.scale(), Colors.black),
                                      ).expand(),
                                    ],
                                  ),
                                ],
                              ),
                            ),


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/ic_star.png', height: 15, fit: BoxFit.fill,),
                                    AHorizontalSpace(2.0.scale()),
                                    Text(
                                      "${pmList?[index].eneEffRating}",
                                      style: textStyleCustomColor(12.0.scale(), Colors.black),
                                    ),
                                  ],
                                ),

                                AVerticalSpace(3.0.scale()),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 2.0.scale(), horizontal: 8.0.scale()),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF3F3F3),
                                      borderRadius: BorderRadius.circular(10.0.scale()),
                                      border: Border.all(color: Color(0xffB9B9B9),)
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/ic_like.png", fit: BoxFit.fill, height: 12, ),
                                      AHorizontalSpace(2.0.scale()),
                                      Text(
                                        "${pmList?[index].eneEffRating}",
                                        style: textStyleCustomColor(10.0.scale(), Color(0xff828282)),
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
                                          _launched = _makePhoneCall( "${pmList?[index].comLandNumber}");
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
                            ).rightPadding(5.0.scale())
                          ],
                        ),
                        AVerticalSpace(10.0.scale()),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Service Offered:",
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldCustomLargeColor(11.0.scale(), Colors.black),
                            ),
                            AHorizontalSpace(10.0.scale()),

                            SizedBox(
                              width: 200.0.scale(),
                              child: Wrap(
                                runSpacing: 5,
                                children: [
                                  for(int i=0; i<pmList![index].subCategoryName!.length; i++)
                                    Padding(
                                      padding:  EdgeInsets.only(right: 8.0.scale()),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 2.0.scale(), horizontal: 8.0.scale()),
                                        color: Color(0xffF3F3F3),
                                        child: Text(
                                          "${pmList?[index].subCategoryName?[i].subCategoryName}",
                                          style: textStyleCustomColor(11.0.scale(), Color(0xff828282)),
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
              );
            }).topPadding(10.0.scale()).bottomPadding(10.0.scale())
          )),
    );
  }

  Widget buttons(String name, Color textColor, Color boxColor, bool isWhatsapp){
    return Padding(
      padding:  EdgeInsets.only(right: 8.0.scale()),
      child: Container(
        height: 45.0.scale(),
        width: MediaQuery.of(context).size.width/2.5,
        padding: EdgeInsets.symmetric(vertical: 10.0.scale(), horizontal: 8.0.scale()),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 1.5, color: kColorThemePurpleColor.withOpacity(0.3)),],
          color: boxColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isWhatsapp?
            Padding(
              padding:  EdgeInsets.only(right: 2.0.scale()),
              child: Image.asset('assets/images/ic_whatsapp.png', height: 16, fit: BoxFit.fill,),
            ): Text(""),
            Text(name,
              style: textStyleCustomColor(12.0.scale(), textColor),
            ),
          ],
        ),
      ),
    );
  }
}
