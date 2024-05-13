import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/home_bloc.dart';
import 'package:ndisparticipant/home/bloc/home_event.dart';
import 'package:ndisparticipant/home/bloc/home_state.dart';
import 'package:ndisparticipant/home/home_navigator.dart';
import 'package:ndisparticipant/home/model/find_support/psychosocial_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';

class PsychoRecoveryPage extends StatefulWidget {
  const PsychoRecoveryPage({super.key});

  @override
  State<PsychoRecoveryPage> createState() => _PsychoRecoveryPageState();
}

class _PsychoRecoveryPageState extends State<PsychoRecoveryPage> {
  PsychoSocialData? data;
  List<DataList>? psycho_list;
  void showHideProgress(bool show)
  {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
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
    if (homeState is HomePsychosocialBtnClickState)
    {
      data = homeState.psychoSocialModel?.data;
      psycho_list = data?.dataList;
      print('psycho_list___${psycho_list?.first.listingId}');
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
        if(state is HomeFindSupportPageState){
          Navigator.pop(context, true);
        }else if(state is PsychosocialDetailBtnClickState){
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hPsychoRecoveryDetailPage);
        }else if (state is HomeerrorloadingState) {
          showHideProgress(false);
          showSnackBar(state.message!, Colors.black, context);
          BlocProvider.of<HomeBloc>(context).add(HomePsychosocialBtnClick());
        }
  },
  child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Psychosocial Recovery Coach",
                style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),

      body: ListView.builder(
          itemCount: psycho_list?.length,
          itemBuilder: (BuildContext context, int index) =>
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 5.0.scale()),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                    height: 15.0.scale(),
                    width: 70.0.scale(),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(20)),
                  color: Colors.red,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.cancel,
                        size: 10,
                        color:Colors.white
                    ),
                    AHorizontalSpace(2.0.scale()),
                    Text(
                      "Not Verified",
                      textAlign: TextAlign.center,
                      style: textStyleCustomColor(
                          8.0.scale(), Colors.white),
                    ),
                  ],
                ),
              ).topPadding(8.0.scale()).rightPadding(5.0.scale()).align(Alignment.centerRight),
                    GestureDetector(
                      onTap: ()
                      {
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context).add(PsychosocialDetailBtnClick("${psycho_list?[index].listingId}",));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 100.0.scale(),
                                height: 100.0.scale(),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0.scale()),
                                  border: Border.all(color: Colors.grey)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0.scale()),
                                  child: NetworkImagesWidgets(
                                    url:  "${psycho_list?[index].profileImage}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5.0.scale(),
                                right: 5.0.scale(),
                                child: Image.asset(
                                  "assets/images/ic_verifid.png",
                                  width: 30.0.scale(),
                                  height: 30.0.scale(),
                                  fit: BoxFit.fill,
                                ),
                              )
                            ],
                          ),
                          AHorizontalSpace(8.0.scale()),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                "${psycho_list?[index].listingName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleCustomColor(14.0.scale(), Colors.black),
                              ),
                              AVerticalSpace(5.0.scale()),
                              Text(
                                "${psycho_list?[index].businessTagline}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleCustomColor(10.0.scale(), Colors.grey),
                              ),
                              AVerticalSpace(5.0.scale()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/ic_locationlist.png',
                                    height: 15.0.scale(),
                                    width: 15.0.scale(),
                                    color: Colors.green,
                                  ),
                                  AHorizontalSpace(4.0.scale()),
                                  Text(
                                    "${psycho_list?[index].listingAddress}",
                                    maxLines:1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ).expand(),
                                ],
                              ),
                              AVerticalSpace(2.0.scale()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/ic_call.png',
                                    height: 15.0.scale(),
                                    width: 15.0.scale(),
                                    color: Colors.green,
                                  ),
                                  AHorizontalSpace(4.0.scale()),
                                  Text(  "${psycho_list?[index].comLandNumber}",
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ],
                              ),
                              AVerticalSpace(2.0.scale()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/ic_emailnew.png',
                                    height: 15.0.scale(),
                                    width: 15.0.scale(),
                                    color: Colors.green,
                                  ),
                                  AHorizontalSpace(4.0.scale()),
                                  Text(
                                    "${psycho_list?[index].comEmail}",
                                    maxLines:
                                    2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(12.0.scale(), Colors.black),
                                  ).expand(),
                                ],
                              )
                            ],
                          ).expand(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/ic_register_stamp.png',
                                height: 35.0.scale(),
                                width: 35.0.scale(),
                              ).rightPadding(2.0.scale()).topPadding(2.0.scale()),
                              AVerticalSpace(5.0.scale()),

                              Container(
                                height: 22.0.scale(),
                                width: 45.0.scale(),
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
                                    AHorizontalSpace(2.0.scale()),
                                    Text(
                                      "like",
                                      textAlign: TextAlign.center,
                                      style: textStyleCustomColor(
                                          10.0.scale(), Colors.grey),
                                    ),
                                  ],
                                ).leftPadding(5.0.scale()),
                              ),
                              AVerticalSpace(5.0.scale()),
                              InkWell(
                                onTap: (){
                                  if (sharedPrefs.IsLogin){
                                    if(_hasCallSupport){
                                      setState(() {
                                        _launched = _makePhoneCall("${psycho_list?[index].comLandNumber}");
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
                      ).topPadding(10.0.scale()).leftPadding(5.0.scale()),
                    ),
                    AVerticalSpace(10.0.scale()),
                    Text(
                      "${psycho_list?[index].listingDescription}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleCustomColor(12.0.scale(), Colors.black),
                    ),
                    AVerticalSpace(10.0.scale()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Service Offered :",
                          textAlign: TextAlign.center,
                          style: textStyleBoldCustomColor(
                              12.0.scale(), Colors.black),
                        ).leftPadding(5.0.scale()),
                        AHorizontalSpace(5.0.scale()),
                        SizedBox(
                          width: 200.0.scale(),
                          child: Wrap(
                            runSpacing: 5.0.scale(),
                            children: [
                              for(int l=0; l<psycho_list![index].subCategoryName!.length; l++)
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0.scale()),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5.0.scale(), vertical: 2.0.scale()),
                                      color: Color(0xffF3F3F3),
                                      child: Text("${psycho_list?[index].subCategoryName?[l]}",
                                    style: textStyleCustomColor(11.0.scale(), Color(0xff828282)),
                                  )
                              ),
                                ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    AVerticalSpace(10.0.scale()),

                  ],
                ),
              )
                  .leftPadding(10.0.scale())
                  .rightPadding(10.0.scale())
                  .topPadding(15.0.scale())
                  ),
    )),
);
  }
}
