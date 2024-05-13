import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/custom_dialog.dart';
import 'package:ndisparticipant/home/home.dart';
import 'package:ndisparticipant/home/model/jobs/job_list_by_cat_model.dart';

import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../components/a_horizontal_space.dart';

class HomeJobsSubCatrgoryPage extends StatefulWidget {
  const HomeJobsSubCatrgoryPage({Key? key}) : super(key: key);

  @override
  _HomeJobsSubCatrgoryPageState createState() =>
      _HomeJobsSubCatrgoryPageState();
}

class _HomeJobsSubCatrgoryPageState extends State<HomeJobsSubCatrgoryPage> {
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  JobByCatData? jobByCatData;
  List<Jobdetails>? jobsByCatList;
  String? category_name;
  String? category_id;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeEventsJobsSubcategoryPageState) {
      jobByCatData = homeState.jobsByCatData;
      jobsByCatList = jobByCatData?.jobdetails;
      category_name = homeState.category_name;
      category_id = homeState.category_id;
      print("jobdetailsList_length____====${jobsByCatList?.length}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          print("state_is___$state");
          if (state is HomeJobsPageState) {
            Navigator.pop(context);
          } else if (state is HomeEventsJobsDetailsPageState) {
            showHideProgress(false);
            Navigator.of(context).pushNamed(HomeNavigator.homeJobsDetailsPage);
          } else if (state is HomeLoginPageState) {
            Navigator.of(context).pushNamed(HomeNavigator.loginPage);
          } else if (state is ApplyJobEventSuccessState) {
            showHideProgress(false);
            BlocProvider.of<HomeBloc>(context).add(
                HomeEventsJobsSubcategoryPageClick(
                    "$category_id", "$category_name"));
            showSnackBar(state.message, Colors.black, context);
          } else if (state is ApplyJoberrorState) {
            showHideProgress(false);
            BlocProvider.of<HomeBloc>(context).add(
                HomeEventsJobsSubcategoryPageClick(
                    "$category_id", "$category_name"));
            showSnackBar(state.message, Colors.black, context);
          }
        },
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "$category_name",
                style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(HomeEventBackBtnClick(''));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),
          body: jobsByCatList?.length == 0 || jobsByCatList == null
              ? Container(
                  height: 500.0.scale(),
                  child: Text(
                    'No Data Found!',
                    style: textStyleBoldCustomLargeColor(
                        13.0.scale(), Colors.grey),
                  ).align(Alignment.center),
                )
              : ListView.builder(
                  itemCount: jobsByCatList?.length,
                  itemBuilder: (context1, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 15.0.scale(),
                          right: 15.0.scale(),
                          bottom: 5.0.scale(),
                          top: 5.0.scale()),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        padding: EdgeInsets.only(
                            left: 15.0.scale(),
                            top: 10.0.scale(),
                            bottom: 10.0.scale()),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      width: 120.0.scale(),
                                      height: 80.0.scale(),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.black.withOpacity(0.5))),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: NetworkImagesWidgets(
                                          url: "${jobsByCatList?[index].companyLogo}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0.scale(),
                                          vertical: 5.0.scale()),
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5))),
                                      child: Text( "${jobsByCatList?[index].jobCdt}",
                                        style: textStyleCustomColor(
                                            10.0.scale(), Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                AHorizontalSpace(10.0.scale()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 170.0.scale(),
                                      child: Text(
                                        "${jobsByCatList?[index].jobTitle}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBoldCustomLargeColor(
                                            14.0.scale(), Colors.black),
                                      ),
                                    ),
                                    AVerticalSpace(5.0.scale()),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.monetization_on_rounded,
                                          size: 12.0.scale(),
                                          color: Color(0xff45BD14),
                                        ),
                                        AHorizontalSpace(5.0.scale()),
                                        SizedBox(
                                          width: 130.0.scale(),
                                          child: Text(
                                            "${jobsByCatList![index].jobSalary}",
                                            style: textStyleCustomColor(
                                                11.0.scale(), Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AVerticalSpace(5.0.scale()),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 12.0.scale(),
                                          color: Color(0xff45BD14),
                                        ),
                                        AHorizontalSpace(5.0.scale()),
                                        SizedBox(
                                          width: 130.0.scale(),
                                          child: Text(
                                            "${jobsByCatList![index].applicant} Applicants",
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleCustomColor(
                                                11.0.scale(), Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),



                                  ],
                                ),
                              ],
                            ),
                            AVerticalSpace(5.0.scale()),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                applyNowBtn(
                                  index: index,
                                ),

                                GestureDetector(
                                  onTap: () {
                                    showHideProgress(true);
                                    BlocProvider.of<HomeBloc>(context).add(
                                        HomeEventsJobsDetailsPageClick(
                                            "${jobsByCatList![index].jobId}",
                                            "job_detail2"));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0.scale()),
                                    child: Container(
                                      height: 40.0.scale(),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: kColorThemePurpleColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        'More Details',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
        )));
  }

  Widget applyNowBtn({
    required int index,
  }) {
    return InkWell(
      onTap: () {
        if (sharedPrefs.IsLogin == false) {
          BlocProvider.of<HomeBloc>(context).add(EventJobSubCattoLoginBtnClick(
              "job_sub_cat", category_name, category_id));
        } else {
          print("selected_job_id__ ${jobsByCatList?[index].jobId} ");

          print(
              "email_is__${sharedPrefs.userEmail} mobile_is___${sharedPrefs.userMobile} user_id__ ${sharedPrefs.userID}");
          nameController.text = sharedPrefs.userName;
          emailController.text = sharedPrefs.userEmail;
          mobileController.text = sharedPrefs.userMobile;

          ///apply job dialog

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
                            },
                            child: Icon(CupertinoIcons.multiply))
                        .align(Alignment.topRight),
                    Image.asset(
                      "assets/images/job_bag.png",
                      height: 30.0.scale(),
                    ),
                    AVerticalSpace(10.0.scale()),
                    Text(
                      'Apply this job',
                      style: textStyleBoldCustomLargeColor(
                          16.0.scale(), Colors.black),
                    ).align(Alignment.center),
                    AVerticalSpace(20.0.scale()),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
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
                      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
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
                      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
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
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context).add(
                            ApplyJobEventClick(sharedPrefs.userID,
                                "${jobsByCatList![index].jobId}"));
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
        width: MediaQuery.of(context).size.width / 2.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xff45BD14), borderRadius: BorderRadius.circular(5)),
        child: Text(
          'Apply Now',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
