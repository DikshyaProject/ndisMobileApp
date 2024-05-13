import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Helpers/services/shared_preferences.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/home/subcategory_listDetails_model.dart';

class HomeSubCatgoryListDetailsPage extends StatefulWidget {
  const HomeSubCatgoryListDetailsPage({super.key});

  @override
  State<HomeSubCatgoryListDetailsPage> createState() =>
      _HomeSubCatgoryListDetailsPageState();
}

class _HomeSubCatgoryListDetailsPageState extends State<HomeSubCatgoryListDetailsPage> {
  List<AllListingsData>? allListingsData = [];
  SubCatDetailsData? subCatDetailsData;
  String title='';

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeSubCatgoryListDetailsState) {
      subCatDetailsData = homeState.subCatDetailsData;
      title = homeState.cat_name??'';
      allListingsData = subCatDetailsData!.allListingsData;
    }
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
    super.initState();
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
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeAllCategoryPageState) {
          Navigator.pop(context);
        }

        if (state is HomeServiceDetailsState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.homeServiceDetailsPage);
        }
        if (state is FilterClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.FilterScreen);
        }

        if(state is LikeUnlikeSuccessState){
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context).add(SerProviderResetEvent());
        }

        if(state is HomeerrorloadingState){
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
                "$title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.0.scale(), vertical: 20.0.scale()),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: allListingsData!.length,
                itemBuilder: (BuildContext context, int index) => Container(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 15.0.scale(),
                        width: allListingsData?[index].listingApprove == "1"? 55.0.scale():70.0.scale(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: allListingsData?[index].listingApprove == "1"?
                          Colors.green : Colors.red,
                        ),
                        child: Row(
                          children: [
                            Icon(allListingsData?[index].listingApprove == "1"?
                            Icons.check_circle : CupertinoIcons.multiply_circle_fill,
                                size: 10, color: Colors.white),
                            AHorizontalSpace(2.0.scale()),
                            Text(
                              allListingsData?[index].listingApprove == "1"?
                              "Verified": "Not Verified",
                              textAlign: TextAlign.center,
                              style: textStyleCustomColor(
                                  8.0.scale(), Colors.white),
                            ),
                          ],
                        ).leftPadding(5.0.scale()).rightPadding(5.0.scale()),
                      ).topPadding(5.0.scale()).rightPadding(5.0.scale()).align(Alignment.centerRight),
                      GestureDetector(
                        onTap: () {
                          showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(
                              HomeEventServiceDetailsBtnClick(
                                  "${allListingsData?[index].listingId}",
                                  ""));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AHorizontalSpace(5.0.scale()),
                            Stack(
                              children: [
                                Container(
                                  width: 100.0.scale(),
                                  height: 100.0.scale(),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5.0.scale()),
                                      border: Border.all(color: Colors.grey)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5.0.scale()),
                                      topLeft: Radius.circular(5.0.scale()),
                                      bottomRight: Radius.circular(5.0.scale()),
                                      bottomLeft: Radius.circular(5.0.scale()),
                                    ),
                                    child: NetworkImagesWidgets(
                                      url: allListingsData![index].profileImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5.0.scale(),
                                  right: 5.0.scale(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Text(
                                      "${allListingsData?[index].listingToday}",
                                      style: textStyleBoldCustomColor(9.0.scale(), Colors.white),
                                    ).horPadding(5.0.scale()).verPadding(3.0.scale()),
                                  ),
                                )
                              ],
                            ),
                            AHorizontalSpace(10.0.scale()),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  allListingsData![index].listingName
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleCustomColor(
                                      14.0.scale(), Colors.black),
                                ),
                                AHorizontalSpace(2.0.scale()),
                                Text(
                                  "Were the best",
                                  textAlign: TextAlign.center,
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.grey),
                                ),
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
                                      allListingsData![index].listingAddress
                                          .toString(),
                                      maxLines: 3,
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
                                    Text(
                                      allListingsData![index].mobileNumber
                                          .toString(),
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
                                      allListingsData![index].emailId
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleCustomColor(
                                          12.0.scale(), Colors.black),
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

                                InkWell(
                                    onTap: (){
                                     if(sharedPrefs.IsLogin == true){
                                       setState(() {
                                         showHideProgress(true);
                                         BlocProvider.of<HomeBloc>(context).add(
                                             EventLikeUnlike(allListingsData![index].listingId, allListingsData![index].listingUserId));
                                         if(allListingsData![index].statusOfWl == 0){
                                           allListingsData![index].statusOfWl = 1;
                                         }else {
                                           allListingsData![index].statusOfWl = 0;
                                         }
                                       });
                                     }else{
                                       showSnackBar('Please login first', Colors.black, context);
                                     }
                                    },
                                    child: Icon(CupertinoIcons.heart_circle_fill, size: 30, color: allListingsData![index].statusOfWl == 1?
                                    Colors.red: Colors.grey,)),

                                AVerticalSpace(5.0.scale()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_star.png',
                                      height: 12.0.scale(),
                                      width: 12.0.scale(),
                                      color: Colors.orange,
                                    ),
                                    AHorizontalSpace(2.0.scale()),
                                    Text(
                                      allListingsData![index].noOfStarRating
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: textStyleBoldCustomColor(
                                          10.0.scale(), Colors.black),
                                    ),
                                  ],
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  "${allListingsData?[index].noOfReviews}",
                                  textAlign: TextAlign.center,
                                  style: textStyleBoldCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(5.0.scale()),
                                InkWell(
                                  onTap: (){
                                    if (sharedPrefs.IsLogin){
                                      if(_hasCallSupport){
                                        setState(() {
                                          _launched = _makePhoneCall("${allListingsData?[index].mobileNumber}");
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
                        ).topPadding(10.0.scale()),
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
                              runSpacing: 5,
                              children: [
                                for (int i = 0; i < int.parse("${allListingsData?[index].subCategoryName?.length}"); i++)
                                  Container(
                                    padding: EdgeInsets.all(8.0.scale()),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      allListingsData![index]
                                          .subCategoryName![i]
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: textStyleCustomColor(
                                          8.0.scale(), Colors.black),
                                    ),
                                  ).rightPadding(5.0.scale()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      AVerticalSpace(10.0.scale()),
                    ],
                  ),
                ).horPadding(5.0.scale()).verPadding(10.0.scale())),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: kColorThemePurpleColor,
          child: Icon(Icons.filter_alt, size: 30,),
            onPressed: () {
              showHideProgress(true);
              BlocProvider.of<HomeBloc>(context).add(FilterClickEvent());
            },
          ),
        ),
      ),
    );
    ;
  }

}

