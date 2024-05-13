import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/all_applied_job_model.dart';

class AllAppliedJobsPage extends StatefulWidget {
  const AllAppliedJobsPage({super.key});

  @override
  State<AllAppliedJobsPage> createState() => _AllAppliedJobsPageState();
}

class _AllAppliedJobsPageState extends State<AllAppliedJobsPage> {
  AppliedJobData? all_data;
  List<AllAppliedJobList>? all_applied_job_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }



  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is AllAppliedJobClickState) {
      all_data = profileState.allAppliedJobModel?.data;
      all_applied_job_list = all_data?.allAppliedJobList;
      print("all_applied_job_list___${all_applied_job_list?.first.jobId}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ProfileInitial) {
          showHideProgress(false);
           
          Navigator.of(context).pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "All Applied Job",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(ProfileEventBackBtnClick(""));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),
          body: Padding(
            padding: EdgeInsets.only(top: 10.0.scale(), bottom: 10.0.scale()),
            child: ListView.builder(
                itemCount: all_applied_job_list?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.0.scale()),
                    child: Container(
                      padding: EdgeInsets.all(10.0.scale()),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.work,
                                    size: 15.0.scale(),
                                    color: Colors.green,
                                  ).topPadding(3.0.scale()),
                                  AHorizontalSpace(5.0.scale()),
                                  SizedBox(
                                    width: 290.0.scale(),
                                    child: Text(
                                      "${all_applied_job_list?[index].jobTitle}",
                                      style:
                                          textStyleBoldBlack(14, Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              AVerticalSpace(10.0.scale()),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 15.0.scale(),
                                    color: Colors.green,
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  Text(
                                    "${DateFormat('dd, MMM yyyy, HH:mm a').format(DateTime.parse("${all_applied_job_list?[index].jobAppliedCdt}"))}",
                                    style:
                                        textStyleCustomColor(12, Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Icon(CupertinoIcons.chevron_right),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
