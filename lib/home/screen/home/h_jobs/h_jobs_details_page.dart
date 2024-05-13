import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/custom_dialog.dart';
import 'package:ndisparticipant/home/home_navigator.dart';
import 'package:ndisparticipant/home/model/jobs/job_details_model.dart';

import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../Helpers/utils/network_image_widget.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_separator_line.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';

class HomeJobsetailsPage extends StatefulWidget {
  const HomeJobsetailsPage({Key? key}) : super(key: key);

  @override
  _HomeJobsetailsPageState createState() => _HomeJobsetailsPageState();
}

class _HomeJobsetailsPageState extends State<HomeJobsetailsPage> {
  jobDetailsData? job_details_data;
  GetallDetails? all_details_data;
  List<RelatedJobs>? relatedJobs;
  String? screenName;
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    // _scrollController = ScrollController()..addListener(_scrollListener);

    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeEventsJobsDetailsPageState) {
      job_details_data = homeState.detailData;
      screenName = homeState.screen;
      all_details_data = job_details_data?.getallDetails;
      relatedJobs = job_details_data?.relatedJobs;
      print("all_details_data_mail_====${all_details_data?.time}");
    }
    super.initState();
  }

  applyJob(){
      if (sharedPrefs.IsLogin == false) {
        BlocProvider.of<HomeBloc>(context).add(
            EventJobDetailtoLoginBtnClick(
                "${screenName}"));
      } else {
        print(
            "selected_job_id__ ${all_details_data?.jobId} ");

        print(
            "email_is__${sharedPrefs.userEmail} mobile_is___${sharedPrefs.userMobile} user_id__ ${sharedPrefs.userID}");
        nameController.text = sharedPrefs.userName;
        emailController.text = sharedPrefs.userEmail;
        mobileController.text = sharedPrefs.userMobile;

        ///apply job dialog

        CustomStatefulAlertDialog(
          context: context,
          bodyWidget: StatefulBuilder(builder:
              (context2, StateSetter dialogsetState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context,
                            rootNavigator: true)
                            .pop();
                      },
                      child: Icon(
                          CupertinoIcons.multiply))
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
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0.scale()),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFD8D8D8),
                        ),
                        borderRadius:
                        BorderRadius.circular(5)),
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
                        hintStyle: textStyleCustomColor(
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
                          color: Color(0xFFD8D8D8),
                        ),
                        borderRadius:
                        BorderRadius.circular(5)),
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
                        hintStyle: textStyleCustomColor(
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
                          color: Color(0xFFD8D8D8),
                        ),
                        borderRadius:
                        BorderRadius.circular(5)),
                    child: TextField(
                      controller: mobileController,
                      maxLines: 1,
                      style: textStyleCustomColor(
                          14.0.scale(),
                          kColorDialogNameTitle),
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: textStyleCustomColor(
                            14.0.scale(),
                            kColorSearchHintText),
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),
                  InkWell(
                    onTap: () {
                      Navigator.of(context,
                          rootNavigator: true)
                          .pop();
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(ApplyJobEventClick(
                          sharedPrefs.userID,
                          "${all_details_data?.jobId}"));
                    },
                    child: Container(
                      width: MediaQuery.of(context)
                          .size
                          .width,
                      height: 45.0.scale(),
                      decoration: BoxDecoration(
                        color: Color(0xff00BDAA),
                        borderRadius:
                        BorderRadius.circular(10),
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
    }



  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          print("state_is_2__$state");
          if (state is HomeEventsJobsSubcategoryPageState) {
            Navigator.pop(context);
          } else if (state is HomeJobsPageState) {
            Navigator.pop(context);
          } else if (state is HomeLoginPageState) {
            Navigator.of(context).pushNamed(HomeNavigator.loginPage);
            // .then((value) => value != null ? refreshPage() : null);
          } else if (state is ApplyJobEventSuccessState) {
            showHideProgress(false);
            BlocProvider.of<HomeBloc>(context).add(
                HomeEventsJobsDetailsPageClick(
                    "${all_details_data?.jobId}", "${screenName}"));
            showSnackBar(state.message, Colors.black, context);
          } else if (state is ApplyJoberrorState) {
            showHideProgress(false);
            BlocProvider.of<HomeBloc>(context).add(
                HomeEventsJobsDetailsPageClick(
                    "${all_details_data?.jobId}", "${screenName}"));
            showSnackBar(state.message, Colors.black, context);
          }else if (state is HomeEventsJobsDetailsPageState) {
            job_details_data = state.detailData;
            all_details_data = job_details_data?.getallDetails;
            relatedJobs = job_details_data?.relatedJobs;
            showHideProgress(false);
            setState(() {});
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
                "Job Details",
                style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(HomeEventBackBtnClick(screenName));
                  },
                  child:
                      Icon(Icons.arrow_back, size: 30, color: Colors.white))),
          // body: NestedScrollView(
          //   controller: _scrollController,
          //   headerSliverBuilder: (context, innerBoxIsScrolled) {
          //     return [
          //       SliverAppBar(
          //         elevation: 0,
          //         backgroundColor: Colors.black.withOpacity(0.3),
          //         pinned: true,
          //         centerTitle: true,
          //         expandedHeight: 275.0.scale(),
          //         leading: IconButton(
          //           icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
          //           onPressed: () {
          //             print("detail back");
          //             //Navigator.pop(context);
          //             BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick('job_detail'));
          //           },
          //         ),
          //         flexibleSpace: FlexibleSpaceBar(
          //           collapseMode: CollapseMode.parallax,
          //           title: _isShrink
          //               ?  Text(
          //             "Job Detail",
          //           )
          //               : null,
          //           background: SafeArea(
          //             child:  Stack(
          //               children: [
          //                 Image.asset(
          //                   'assets/images/jobs.jpg',
          //                   fit: BoxFit.cover,
          //                   height: 275.0.scale(),
          //                   width: MediaQuery.of(context).size.width,
          //                 ),
          //                 Container(
          //                   color:Colors.black.withOpacity(0.3),
          //                 ),
          //
          //                 Positioned(
          //                   bottom: 10.0.scale(),
          //                   right: 10.0.scale(),
          //                   child: Container(
          //                       padding: EdgeInsets.all(10.0.scale()),
          //                       decoration: BoxDecoration(
          //                         color: Colors.black.withOpacity(0.3),
          //                           borderRadius: BorderRadius.circular(100)
          //                       ),
          //                       child: Icon(Icons.share, color: Colors.white, size: 30,)),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         actions: _isShrink
          //             ? [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 8, right: 12),
          //             child: Container(
          //                 padding: EdgeInsets.all(10.0.scale()),
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(100)
          //                 ),
          //                 child: Icon(Icons.share, color: Colors.white, size: 30,)),
          //           ),
          //         ]
          //             : null,
          //       ),
          //     ];
          //   },
          //   body: CustomScrollView(
          //     slivers: [
          //       SliverList(
          //         delegate: SliverChildListDelegate(
          //           [
          //             Container(
          //               padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   AVerticalSpace(30.0.scale()),
          //                   _isShrink? SizedBox():
          //                   Container(
          //                     height: 100.0.scale(), width: 100.0.scale(),
          //                     decoration:BoxDecoration(
          //                       borderRadius: BorderRadius.all(Radius.circular(10)),
          //                       color: Colors.white,
          //                       boxShadow: [
          //                         BoxShadow(
          //                           color: Colors.black.withOpacity(0.3),
          //                           blurRadius: 2.0,
          //                         ),
          //                       ],
          //                     ),
          //                     child: ClipRRect(
          //                       borderRadius: BorderRadius.all(Radius.circular(10)),
          //                       child: NetworkImagesWidgets(
          //                         url:  "${all_details_data?.companyLogo}",
          //                         fit: BoxFit.cover,
          //                     ),
          //                   ),
          //                   ),
          //                   AVerticalSpace(20.0.scale()),
          //                   Text("${all_details_data?.jobCompanyName}",  style: textStyleBoldCustomLargeColor(18.0.scale(), Colors.black),),
          //                   Text("${all_details_data?.jobLocation}",  style: textStyleCustomColor(12.0.scale(), Colors.black),),
          //                   Text("${all_details_data?.jobRole}",  style: textStyleCustomColor(14.0.scale(), Colors.black),),
          //                   AVerticalSpace(10.0.scale()),
          //
          //                   Row(
          //                     children: [
          //                       SizedBox(
          //                         width: 200.0.scale(),
          //                         child: Column(
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           children: [
          //                             Row(
          //                               children: [
          //                                 Image.asset(
          //                                   'assets/images/globe_ic.png',
          //                                   height: 15.0.scale(),
          //                                   width: 15.0.scale(),
          //                                 ),
          //                                 AHorizontalSpace(5.0.scale()),
          //                                 Text("${all_details_data?.contactWebsite}",
          //                                   maxLines: 2,
          //                                   overflow: TextOverflow.ellipsis,
          //                                   style: TextStyle(color: Color(0xff00BDAA), fontSize: 14),),
          //                               ],
          //                             ),
          //                             AVerticalSpace(10.0.scale()),
          //                             Row(
          //                               children: [
          //                                 Image.asset(
          //                                   'assets/images/message_ic.png',
          //                                   height: 15.0.scale(),
          //                                   width: 15.0.scale(),
          //                                 ),
          //                                 AHorizontalSpace(5.0.scale()),
          //                                 Text("${all_details_data?.contactEmailId}",
          //                                   maxLines: 2,
          //                                   overflow: TextOverflow.ellipsis,
          //                                   style: TextStyle(color: Color(0xff00BDAA), fontSize: 14),),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Row(
          //                             children: [
          //                               Image.asset(
          //                                 'assets/images/person_ic.png',
          //                                 height: 15.0.scale(),
          //                                 width: 15.0.scale(),
          //                               ),
          //                               AHorizontalSpace(5.0.scale()),
          //                               Text("${all_details_data?.contactPerson}",
          //                                 maxLines: 2,
          //                                 overflow: TextOverflow.ellipsis,
          //                                 style: TextStyle(color: Color(0xff00BDAA), fontSize: 14),),
          //                             ],
          //                           ),
          //                           AVerticalSpace(10.0.scale()),
          //                           Row(
          //                             children: [
          //                               Image.asset(
          //                                 'assets/images/call_ic.png',
          //                                 height: 15.0.scale(),
          //                                 width: 15.0.scale(),
          //                               ),
          //                               AHorizontalSpace(5.0.scale()),
          //                               Text("${all_details_data?.contactNumber}",
          //                                 maxLines: 2,
          //                                 overflow: TextOverflow.ellipsis,
          //                                 style: TextStyle(color: Color(0xff00BDAA), fontSize: 14),),
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //
          //                   AVerticalSpace(15.0.scale()),
          //                   ASeparatorLine(
          //                     height: 0.5.scale(),
          //                     color: KColorAppointmentDropinHistoryListSeprator.withOpacity(0.3),
          //                   ),
          //                   AVerticalSpace(10.0.scale()),
          //                   Text('About company',  style: textStyleBoldCustomLargeColor(13.0.scale(), Colors.black),),
          //                   AVerticalSpace(10.0.scale()),
          //                   Text("${all_details_data?.jobDescription}",
          //                     style: textStyleCustomColor(12.0.scale(), Colors.black),),
          //                   AVerticalSpace(25.0.scale()),
          //                   Container(
          //                     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //                     width: MediaQuery.of(context).size.width,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(10),
          //                       color: Colors.white,
          //                       boxShadow: [
          //                         BoxShadow(
          //                           color: Colors.black.withOpacity(0.5),
          //                           blurRadius: 2.0,
          //                         ),
          //                       ],
          //                     ),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Text('JOB SUMMARY',  style: textStyleBoldCustomLargeColor(19.0.scale(), Color(0xff00BDAA)),).align(Alignment.center),
          //                         AVerticalSpace(10.0.scale()),
          //                         Row(
          //                           mainAxisAlignment: MainAxisAlignment.start,
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           children: [
          //                             SizedBox(
          //                               width: 140.0.scale(),
          //                               child: Column(
          //                                 crossAxisAlignment: CrossAxisAlignment.start,
          //                                 children: [
          //                                   Text(
          //                                     "Vacancy : ${all_details_data?.noOfOpenings}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                   AVerticalSpace(5.0.scale()),
          //                                   Text(
          //                                     "Experience : ${all_details_data?.yearsOfExperience}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                   AVerticalSpace(5.0.scale()),
          //                                   Text(
          //                                     "Salary : ${all_details_data?.jobSalary}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                   AVerticalSpace(5.0.scale()),
          //                                   Text(
          //                                     "Gender: ${all_details_data?.gender}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                   AVerticalSpace(5.0.scale()),
          //                                   Text(
          //                                     "Date : ${all_details_data?.date}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                   AVerticalSpace(5.0.scale()),
          //                                   Text(
          //                                     "Time : ${all_details_data?.time}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             Expanded(
          //                               child: Column(
          //                                 crossAxisAlignment: CrossAxisAlignment.start,
          //                                 children: [
          //                                   Text(
          //                                     "Job Type:  ${all_details_data?.jobType}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                   AVerticalSpace(5.0.scale()),
          //                                   Text(
          //                                     "Job Location : ${all_details_data?.jobLocation}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                   AVerticalSpace(5.0.scale()),
          //                                   Text(
          //                                     "Role : ${all_details_data?.jobRole}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                   AVerticalSpace(5.0.scale()),
          //                                   Text(
          //                                     "Education : ${all_details_data?.educationalQualification}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //
          //                                   AVerticalSpace(5.0.scale()),
          //                                   Text(
          //                                     "Published on : ${all_details_data?.jobCdt?[0]}",
          //                                     maxLines: 1,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: textStyleBlack(13.0.scale()),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         AVerticalSpace(15.0.scale()),
          //                         Text('SKILL SET:',  style: textStyleBoldCustomLargeColor(14.0.scale(), Colors.black),),
          //                         AVerticalSpace(10.0.scale()),
          //                         Wrap(
          //                           spacing: 10.0.scale(),
          //                           runSpacing: 10.0.scale(),
          //                           children: [
          //                             for(int i=0 ; i<all_details_data!.skilsSet!.length ; i++)
          //                               Padding(
          //                                 padding:  EdgeInsets.only(right: 8.0.scale()),
          //                                 child: Container(
          //                                   padding: EdgeInsets.symmetric(vertical: 2.0.scale(), horizontal: 8.0.scale()),
          //                                   color: Color(0xffF3F3F3),
          //                                   child: Text(
          //                                     "${all_details_data?.skilsSet?[i]}",
          //                                     style: textStyleCustomColor(12.0.scale(), Color(0xff828282)),
          //                                   ),
          //                                 ),
          //                               ),
          //                           ],
          //                         ),
          //                         AVerticalSpace(15.0.scale()),
          //                         InkWell(
          //                           onTap: () {
          //                             if (sharedPrefs.IsLogin == false) {
          //                               // BlocProvider.of<HomeBloc>(context).add(HomeEventHometoLoginBtnClick(true));
          //                               BlocProvider.of<HomeBloc>(context).add(EventJobDetailtoLoginBtnClick("job_detail"));
          //                             } else {
          //                               print("selected_job_id__ ${all_details_data?.jobId} ");
          //
          //                               print("email_is__${sharedPrefs.userEmail} mobile_is___${sharedPrefs.userMobile} user_id__ ${sharedPrefs.userID}");
          //                               nameController.text = sharedPrefs.userName;
          //                               emailController.text = sharedPrefs.userEmail;
          //                               mobileController.text = sharedPrefs.userMobile;
          //
          //                               ///apply job dialog
          //
          //                               CustomStatefulAlertDialog(
          //                                 context: context,
          //                                 bodyWidget: StatefulBuilder(
          //                                     builder: (context2, StateSetter dialogsetState) {
          //                                       return SingleChildScrollView(
          //                                         child: Column(
          //                                           children: [
          //                                             InkWell(
          //                                                 onTap: () {
          //                                                   Navigator.of(context,
          //                                                       rootNavigator: true)
          //                                                       .pop();
          //                                                 },
          //                                                 child: Icon(CupertinoIcons.multiply))
          //                                                 .align(Alignment.topRight),
          //                                             Image.asset("assets/images/job_bag.png", height: 30.0.scale(),),
          //                                             AVerticalSpace(10.0.scale()),
          //                                             Text(
          //                                               'Apply this job',
          //                                               style: textStyleBoldCustomLargeColor(
          //                                                   16.0.scale(), Colors.black),
          //                                             ).align(Alignment.center),
          //                                             AVerticalSpace(20.0.scale()),
          //                                             Container(
          //                                               padding: EdgeInsets.symmetric(
          //                                                   horizontal: 10.0.scale()),
          //                                               decoration: BoxDecoration(
          //                                                   border: Border.all(
          //                                                     color: Color(0xFFD8D8D8),
          //                                                   ),
          //                                                   borderRadius: BorderRadius.circular(5)),
          //                                               child: TextField(
          //                                                 controller: nameController,
          //                                                 maxLines: 1,
          //                                                 style: textStyleCustomColor(
          //                                                     14.0.scale(), kColorDialogNameTitle),
          //                                                 readOnly: true,
          //                                                 decoration: InputDecoration(
          //                                                   border: InputBorder.none,
          //                                                   hintText: '',
          //                                                   hintStyle: textStyleCustomColor(
          //                                                       14.0.scale(), kColorSearchHintText),
          //                                                 ),
          //                                               ),
          //                                             ),
          //                                             AVerticalSpace(10.0.scale()),
          //                                             Container(
          //                                               padding: EdgeInsets.symmetric(
          //                                                   horizontal: 10.0.scale()),
          //                                               decoration: BoxDecoration(
          //                                                   border: Border.all(
          //                                                     color: Color(0xFFD8D8D8),
          //                                                   ),
          //                                                   borderRadius: BorderRadius.circular(5)),
          //                                               child: TextField(
          //                                                 controller: emailController,
          //                                                 maxLines: 1,
          //                                                 style: textStyleCustomColor(
          //                                                     14.0.scale(), kColorDialogNameTitle),
          //                                                 readOnly: true,
          //                                                 decoration: InputDecoration(
          //                                                   border: InputBorder.none,
          //                                                   hintText: '',
          //                                                   hintStyle: textStyleCustomColor(
          //                                                       14.0.scale(), kColorSearchHintText),
          //                                                 ),
          //                                               ),
          //                                             ),
          //                                             AVerticalSpace(10.0.scale()),
          //                                             Container(
          //                                               padding: EdgeInsets.symmetric(
          //                                                   horizontal: 10.0.scale()),
          //                                               decoration: BoxDecoration(
          //                                                   border: Border.all(
          //                                                     color: Color(0xFFD8D8D8),
          //                                                   ),
          //                                                   borderRadius: BorderRadius.circular(5)),
          //                                               child: TextField(
          //                                                 controller: mobileController,
          //                                                 maxLines: 1,
          //                                                 style: textStyleCustomColor(
          //                                                     14.0.scale(), kColorDialogNameTitle),
          //                                                 readOnly: true,
          //                                                 decoration: InputDecoration(
          //                                                   border: InputBorder.none,
          //                                                   hintText: '',
          //                                                   hintStyle: textStyleCustomColor(
          //                                                       14.0.scale(), kColorSearchHintText),
          //                                                 ),
          //                                               ),
          //                                             ),
          //                                             AVerticalSpace(10.0.scale()),
          //                                             InkWell(
          //                                               onTap: () {
          //                                                 Navigator.of(context, rootNavigator: true).pop();
          //                                                 showHideProgress(true);
          //                                                 BlocProvider.of<HomeBloc>(context).add(ApplyJobEventClick(
          //                                                     sharedPrefs.userID,
          //                                                     "${all_details_data?.jobId}"
          //                                                 ));
          //                                               },
          //                                               child: Container(
          //                                                 width: MediaQuery.of(context).size.width,
          //                                                 height: 45.0.scale(),
          //                                                 decoration: BoxDecoration(
          //                                                   color: Color(0xff00BDAA),
          //                                                   borderRadius: BorderRadius.circular(10),
          //                                                 ),
          //                                                 child: Text(
          //                                                   "Submit",
          //                                                   style: textStyleBoldCustomLargeColor(
          //                                                       15.0.scale(), Colors.white),
          //                                                 ).align(Alignment.center),
          //                                               ),
          //                                             ),
          //                                             AVerticalSpace(10.0.scale()),
          //                                           ],
          //                                         ),
          //                                       );
          //                                     }),
          //                               );
          //                             }
          //                           },
          //                           child:  Container(
          //                             height: 45.0.scale(),
          //                             width: MediaQuery.of(context).size.width,
          //                             alignment: Alignment.center,
          //                             decoration: BoxDecoration(
          //                                 color: Color(0xff45BD14),
          //                                 borderRadius: BorderRadius.circular(5)
          //                             ),
          //                             child: Text('Apply this job now', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
          //                           ).align(Alignment.center),
          //                         ),
          //
          //                         AVerticalSpace(10.0.scale()),
          //
          //                       ],
          //                     ),
          //                   ),
          //                   AVerticalSpace(10.0.scale()),
          //
          //                 ],
          //
          //               ),
          //
          //             )
          //           ]
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          ///----------old design-------
          body: Stack(children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/images/jobs.jpg',
                fit: BoxFit.fill,
                height: 200.0.scale(),
              ),
            ),
            Positioned(
              right: 15,
              top: 15,
              child: Container(
                  padding: EdgeInsets.all(10.0.scale()),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 180, 0, 0),
              padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AVerticalSpace(50.0.scale()),
                  Text(
                    "${all_details_data?.jobCompanyName}",
                    style: textStyleBoldCustomLargeColor(
                        18.0.scale(), Colors.black),
                  ),
                  if(all_details_data?.jobLocation?.length != 0)
                  Row(
                    children: [
                      for(int i=0; i<int.parse("${all_details_data?.jobLocation?.length}"); i++)
                      Text(
                        "${all_details_data?.jobLocation?[i]}, ",
                        style: textStyleCustomColor(12.0.scale(), Colors.black),
                      ),
                    ],
                  ),

                  AVerticalSpace(10.0.scale()),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/globe_ic.png',
                        height: 15.0.scale(),
                        width: 15.0.scale(),
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Text(
                        "${all_details_data?.contactWebsite}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff00BDAA), fontSize: 14),
                      ),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/message_ic.png',
                        height: 15.0.scale(),
                        width: 15.0.scale(),
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Text(
                        "${all_details_data?.contactEmailId}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff00BDAA), fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/call_ic.png',
                        height: 15.0.scale(),
                        width: 15.0.scale(),
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Text(
                        "${all_details_data?.contactNumber}",
                        style: TextStyle(
                            color: Color(0xff00BDAA), fontSize: 14),
                      ),
                    ],
                  ),
                  AVerticalSpace(15.0.scale()),
                  ASeparatorLine(
                    height: 0.5.scale(),
                    color:
                        KColorAppointmentDropinHistoryListSeprator.withOpacity(
                            0.3),
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text(
                    'About company'.toUpperCase(),
                    style: textStyleBoldCustomLargeColor(
                        13.0.scale(), Colors.black),
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text(
                    "${all_details_data?.jobDescription}",
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    style: textStyleCustomColor(12.0.scale(), Colors.black),
                  ),
                  AVerticalSpace(10.0.scale()),
                  Row(
                    children: [
                      Text(
                        'SKILL SET:',
                        style: textStyleBoldCustomLargeColor(
                            13.0.scale(), Colors.black),
                      ),
                      AHorizontalSpace(10.0.scale()),
                      Text(
                        "${all_details_data?.skillSet}"==''?"N/A":"${all_details_data?.skillSet}",
                        maxLines: 12,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleCustomColor(12.0.scale(), Colors.black),
                      ),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                  if(all_details_data?.workingRights?.length != 0)
                  Wrap(
                    runSpacing: 5.0.scale(),
                    spacing: 5.0.scale(),
                    children: [
                      Text(
                        'WORKING RIGHTS:',
                        style: textStyleBoldCustomLargeColor(
                            13.0.scale(), Colors.black),
                      ),
                      AHorizontalSpace(10.0.scale()),
                      for(int i=0; i<int.parse("${all_details_data?.workingRights?.length}"); i++)
                        Row(
                          children: [
                            Icon(Icons.circle, color: Color(0xff00BDAA), size: 10.0.scale(),),
                            AHorizontalSpace(5.0.scale()),
                            Text(
                              "${all_details_data?.workingRights?[i]}",
                              style: textStyleCustomColor(12.0.scale(), Colors.black),
                            ),
                          ],
                        ),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                  if(all_details_data?.accFeature?.length != 0)
                    Wrap(
                      runSpacing: 5.0.scale(),
                      spacing: 5.0.scale(),
                      children: [
                        Text(
                          'ACCESSIBILITY FEATURES:',
                          style: textStyleBoldCustomLargeColor(
                              13.0.scale(), Colors.black),
                        ),
                        AHorizontalSpace(10.0.scale()),
                        for(int i=0; i<int.parse("${all_details_data?.accFeature?.length}"); i++)
                          Row(
                            children: [
                              Icon(Icons.circle, color: Color(0xff00BDAA), size: 10.0.scale(),),
                              AHorizontalSpace(5.0.scale()),
                              Text(
                                "${all_details_data?.accFeature?[i]}",
                                style: textStyleCustomColor(12.0.scale(), Colors.black),
                              ),
                            ],
                          ),
                      ],
                    ),
                  AVerticalSpace(25.0.scale()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    width: MediaQuery.of(context).size.width,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'JOB SUMMARY',
                          style: textStyleBoldCustomLargeColor(
                              19.0.scale(), Color(0xff00BDAA)),
                        ).align(Alignment.center),
                        AVerticalSpace(10.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Hours",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              ": ${all_details_data?.jobHours}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Job Type",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              ": ${all_details_data?.jobType}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Condition",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              ": ${all_details_data?.jobConditions}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Pay",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              ": ${all_details_data?.jobPay}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Wrap(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Job Location",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              all_details_data?.jobLocation?.length!=0?
                              "":": N/A",
                              style: textStyleBlack(13.0.scale()),
                            ),
                            for(int i=0; i<int.parse("${all_details_data?.jobLocation?.length}"); i++)
                            Text(
                              ": ${all_details_data?.jobLocation?[i]}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Salary",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              ": ${all_details_data?.salary}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Wrap(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Education",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              all_details_data?.educationalQualification?.length!=0?
                              "":": N/A",
                              style: textStyleBlack(13.0.scale()),
                            ),
                            for(int i=0; i<int.parse("${all_details_data?.educationalQualification?.length}"); i++)
                              Text(
                                ": ${all_details_data?.educationalQualification?[i]}",
                                style: textStyleBlack(13.0.scale()),
                              ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Date",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              ": ${all_details_data?.jobInterviewDate}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Time",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              ": ${all_details_data?.jobInterviewTime}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Published on",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              ": ${all_details_data?.jobCdt}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0.scale(),
                              child: Text(
                                "Closing date",
                                style: textStyleBoldBlack(13.0.scale(), Colors.black),
                              ),
                            ),
                            Text(
                              ": ${all_details_data?.closingDate}",
                              style: textStyleBlack(13.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(15.0.scale()),
                        InkWell(
                          onTap: () {
                            applyJob();
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xff45BD14),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Apply this job now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ).align(Alignment.center),
                        ),
                        AVerticalSpace(10.0.scale()),
                      ],
                    ),
                  ),
                  AVerticalSpace(25.0.scale()),

                  Text(
                    'Related job openings',
                    style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
                  ).align(Alignment.center),
                  AVerticalSpace(10.0.scale()),
                  SizedBox(
                    height: 170.0.scale(),
                    child: ListView.builder(
                        itemCount: relatedJobs?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 5.0.scale(),right: 10.0.scale(), bottom: 15.0.scale(), top: 5.0.scale()),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.25,
                              padding: EdgeInsets.only(
                                  left: 5.0.scale(), right: 5.0.scale(),
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
                                                url:
                                                "${relatedJobs![index].companyLogo}",
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
                                            child: Text(
                                              "${relatedJobs![index].jobCdt}",
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
                                            width: 140.0.scale(),
                                            child: Text(
                                              "${relatedJobs![index].jobTitle}",
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
                                                  "${relatedJobs![index].minimumSalary}",
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
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
                                                  "${relatedJobs![index].countJobApplied} Applicants",
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
                                      InkWell(
                                      onTap: () {
                            applyJob();
                            },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width/2.7,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xff45BD14),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'Apply  job ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ).align(Alignment.center),
                            ),
                                      InkWell(
                                        onTap: () {
                                          showHideProgress(true);
                                          BlocProvider.of<HomeBloc>(context).add(HomeEventsJobsDetailsPageClick("${relatedJobs![index].jobId}", ''));
                                        },
                                        child: Container(
                                          height: 40,
                                          width: MediaQuery.of(context).size.width/2.7,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: kColorThemePurpleColor,
                                              borderRadius: BorderRadius.circular(5)),
                                          child: Text(
                                            'More Details',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ).align(Alignment.center),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150,
              left: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  width: 70.0.scale(),
                  height: 70.0.scale(),
                  child: NetworkImagesWidgets(
                    url: "${all_details_data?.companyLogo}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ]).scroll(),
        )));
  }
}
