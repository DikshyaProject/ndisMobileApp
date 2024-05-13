import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/looking_for_job_model.dart';

class LookingForJobPage extends StatefulWidget {
  const LookingForJobPage({super.key});

  @override
  State<LookingForJobPage> createState() => _LookingForJobPageState();
}

class _LookingForJobPageState extends State<LookingForJobPage> {
  LookingJobData? looking_job_data;
  List<AllJobDetailList>? all_job_detail_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is LookingForJobClickState) {
      looking_job_data = profileState.lookingForJobModel?.data;
      all_job_detail_list = looking_job_data?.allJobDetailList;
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
                "Add Listing",
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
                itemCount: all_job_detail_list?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 10.0.scale(), bottom: 10.0.scale()),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10.0.scale(),
                        bottom: 10.0.scale(),
                      ),
                      decoration: BoxDecoration(
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90.0.scale(),
                                child: Text(
                                  "Job Profile",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ).leftPadding(10.0.scale()),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Expanded(
                                child: Text(
                                  ": ${all_job_detail_list?[index].jobProfile}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ).rightPadding(10.0.scale()),
                              ),
                            ],
                          ),
                          AVerticalSpace(3.0.scale()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90.0.scale(),
                                child: Text(
                                  "Designation",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ).leftPadding(10.0.scale()),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Expanded(
                                child: Text(
                                  ": ${all_job_detail_list?[index].designation}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ).rightPadding(10.0.scale()),
                              ),
                            ],
                          ),
                          AVerticalSpace(3.0.scale()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90.0.scale(),
                                child: Text(
                                  "Job Type",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ).leftPadding(10.0.scale()),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Expanded(
                                child: Text(
                                  ": ${all_job_detail_list?[index].jobType}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ).rightPadding(10.0.scale()),
                              ),
                            ],
                          ),
                          AVerticalSpace(3.0.scale()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90.0.scale(),
                                child: Text(
                                  "Location",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ).leftPadding(10.0.scale()),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Expanded(
                                child: Text(
                                  ": ${all_job_detail_list?[index].location}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ).rightPadding(10.0.scale()),
                              ),
                            ],
                          ),
                          AVerticalSpace(3.0.scale()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90.0.scale(),
                                child: Text(
                                  "Region",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ).leftPadding(10.0.scale()),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Expanded(
                                child: Text(
                                  ": ${all_job_detail_list?[index].region}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ).rightPadding(10.0.scale()),
                              ),
                            ],
                          ),
                          AVerticalSpace(8.0.scale()),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 10.0.scale()),
                            child: Container(
                                alignment: Alignment.center,
                                height: 40.0.scale(),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.circular(5.0.scale())),
                                child: Text(
                                  "More Details",
                                  style: textStyleBoldCustomColor(
                                      14.0.scale(), Colors.white),
                                )),
                          ),
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
