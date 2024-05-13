import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_non_scroll_grid_view.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/custom_dialog.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/model/jobs/h_all_job_category_model.dart';
import 'package:ndisparticipant/home/model/jobs/job_search_model.dart';
import 'package:ndisparticipant/home/model/jobs/jobs_dropdown_model.dart';
import 'package:ndisparticipant/home/model/jobs/location_dropdown_model.dart';
import 'package:ndisparticipant/root/user_repository.dart';

import '../../../home_navigator.dart';

class HomeJobsScreen extends StatefulWidget {
  const HomeJobsScreen({super.key});

  @override
  State<HomeJobsScreen> createState() => _HomeJobsScreenState();
}

class _HomeJobsScreenState extends State<HomeJobsScreen> {
  String selectedDepartment = "Trade and Services ";
  String selectedJobProfessionId = "100";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  AllJobData? allJobData;
  jobsDropData? jobs_Drop_Data;
  LocDropData? loc_Drop_Data;
  List<Jobcategories>? popularCategoriesList;
  List<Premiumjobs>? premiumJobsList;
  List<Trendingjobs>? trendingJobsList;
  List<catList>? job_cat_list;
  List<locationData>? location_list;
  String latData = "";
  String lngData = "";
  String? addressData;
  JobSearchData? job_search_data;
  List<SearchResult>? search_result;
  bool isShow = false;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeJobsPageState) {
      allJobData = homeState.allJobData;
      jobs_Drop_Data = homeState.jobs_Drop_Data;
      popularCategoriesList = allJobData?.jobcategories;
      trendingJobsList = allJobData?.trendingjobs;
      premiumJobsList = allJobData?.premiumjobs;
      job_cat_list = jobs_Drop_Data?.list;
      location_list = loc_Drop_Data?.data;

      log("popularCategories_list====${job_cat_list} ________________${location_list}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    latData = UserRepository.job_lattitude;
    lngData = UserRepository.job_longitude;
    addressData = UserRepository.job_address;
    print("In_job_page_lat1__$latData _long__$lngData _place__$addressData");

    ///old----before 27 dec
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        print("state_is_1__$state");
        if (state is HomeInitial) {
          showHideProgress(false);
          Navigator.pop(context, true);
        } else if (state is HomeEventsJobsSubcategoryPageState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.homeJobssubCategoryPage);
        } else if (state is HomeEventsJobsDetailsPageState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.homeJobsDetailsPage);
        } else if (state is HomeLoginPageState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.loginPage);
        } else if (state is ApplyJobEventSuccessState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context).add(HomeJobsPageBtnClick());
          showSnackBar(state.message, Colors.black, context);
        } else if (state is ApplyJoberrorState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context).add(HomeJobsPageBtnClick());
          showSnackBar(state.message, Colors.black, context);
        } else if (state is HomeerrorloadingState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context).add(HomeJobsPageBtnClick());
          showSnackBar(state.message, Colors.black, context);
        } else if (state is JobSearchLocationState) {
          Navigator.of(context).pushNamed(HomeNavigator.hLocationSearch);
        } else if (state is HomeJobsSearchState) {
          BlocProvider.of<HomeBloc>(context).add(HomeJobsResetEvent());
          job_search_data = state.jobSearchDataModel?.data;
          search_result = job_search_data?.searchResult;
          print("search_result____${search_result?.first.applicant}");
          isShow = true;
          setState(() {});
          showHideProgress(false);
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
              "Jobs",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0.scale(),
                  fontWeight: FontWeight.w700),
            ),
            leading: InkWell(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeEventBackBtnClick(''));
                },
                child: Icon(Icons.arrow_back, size: 30, color: Colors.white))),
        body: search_result?.length != 0 && isShow == true
            ? searched_jobs()
            : Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 60.0.scale()),
                        child: Container(
                          color: kColorThemePurpleColor.withOpacity(0.4),
                          child: Column(
                            children: [
                              AVerticalSpace(10.0.scale()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Find Your Next Job Now',
                                    style: textStyleBoldCustomLargeColor(
                                        16.0.scale(), Colors.white),
                                  ),
                                ],
                              ),
                              AVerticalSpace(10.0.scale()),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0.scale()),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0.scale(),
                                          vertical: 5.0.scale()),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: kColorThemePurpleColor,
                                            blurRadius: 2.0,
                                          ),
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width /
                                          1.8,
                                      child: Container(
                                        color: Colors.white,
                                        height: 40.0.scale(),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<catList>(
                                            isExpanded: true,
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            items: job_cat_list?.map<
                                                    DropdownMenuItem<catList>>(
                                                (catList items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(
                                                  "${items.categoryName}",
                                                  style: textStyleCustomColor(
                                                    14.0.scale(),
                                                    kColorLoginBtn,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (catList? newValue) {
                                              setState(() {
                                                selectedDepartment =
                                                    newValue!.categoryName!;
                                                selectedJobProfessionId =
                                                    newValue!.categoryId!;
                                                print(
                                                    "selectedDepartment__${selectedDepartment} ___ $selectedJobProfessionId");
                                              });
                                            },
                                            hint: Text(selectedDepartment,
                                                style: textStyleCustomColor(
                                                    14.0.scale(),
                                                    Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        BlocProvider.of<HomeBloc>(context).add(HomeSearchLocationCityBtnClick('Jobs'));
                                        print("tapped");
                                      },
                                      child: Container(
                                        height: 50.0.scale(),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: kColorThemePurpleColor,
                                              blurRadius: 2.0,
                                            ),
                                          ],
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        child: Center(
                                          child: Text(
                                            addressData ?? "Search Place",
                                            style: textStyleCustomColor(
                                                14.0.scale(),
                                                kColorDialogNameTitle),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        showHideProgress(true);
                                        BlocProvider.of<HomeBloc>(context).add(
                                            HomeJobsSearchEvent(
                                                "${selectedJobProfessionId}",
                                                "$latData",
                                                "$lngData"));
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0.scale(),
                                              vertical: 5.0.scale()),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: kColorThemePurpleColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.white,
                                                blurRadius: 2.0,
                                              ),
                                            ],
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          child: Container(
                                              height: 40.0.scale(),
                                              child: Icon(
                                                CupertinoIcons.search,
                                                color: Colors.white,
                                              ))),
                                    ),
                                  ],
                                ),
                              ),
                              AVerticalSpace(50.0.scale()),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 10,
                        right: 10,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15.0.scale()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.scale(),
                                    vertical: 10.0.scale()),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kColorThemePurpleColor,
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '${allJobData?.jobPosted}',
                                      style: textStyleBoldCustomLargeColor(
                                          22.0.scale(), Colors.black),
                                    ),
                                    Text(
                                      'JOB POSTED',
                                      style: textStyleCustomColor(
                                          12.0.scale(), Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.scale(),
                                    vertical: 10.0.scale()),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kColorThemePurpleColor,
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '${allJobData?.companies}',
                                      style: textStyleBoldCustomLargeColor(
                                          22.0.scale(), Colors.black),
                                    ),
                                    Text(
                                      'COMPANIES',
                                      style: textStyleCustomColor(
                                          12.0.scale(), Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.scale(),
                                    vertical: 10.0.scale()),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kColorThemePurpleColor,
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '${allJobData?.employees}',
                                      style: textStyleBoldCustomLargeColor(
                                          22.0.scale(), Colors.black),
                                    ),
                                    Text(
                                      'EMPLOYEES',
                                      style: textStyleCustomColor(
                                          12.0.scale(), Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                  (popularCategoriesList?.length == 0 ||
                              popularCategoriesList == null) &&
                          (trendingJobsList?.length == 0 ||
                              trendingJobsList == null) &&
                          (premiumJobsList?.length == 0 ||
                              premiumJobsList == null)
                      ? Container(
                          height: 250.0.scale(),
                          child: Text(
                            'No Data Found!',
                            style: textStyleBoldCustomLargeColor(
                                11.0.scale(), Colors.grey),
                          ).align(Alignment.center),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0.scale()),
                              child: Column(
                                children: [
                                  if (popularCategoriesList?.length != 0 ||
                                      popularCategoriesList != null)
                                    popular_category(context),
                                  if (trendingJobsList?.length != 0 ||
                                      trendingJobsList != null)
                                    trending_jobs(),
                                  if (premiumJobsList?.length != 0 ||
                                      premiumJobsList != null)
                                    premium_jobs(),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
      )),
    );
  }

  Widget popular_category(contextnew) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Categories',
          style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
        ).align(Alignment.center),
        Text(
          'Find jobs from various domain',
          style: textStyleCustomColor(12.0.scale(), Colors.black),
        ).align(Alignment.center),
        AVerticalSpace(10.0.scale()),
        GoogleGrid(
          columnCount: 2,
          gap: 15.0.scale(),
          padding: const EdgeInsets.all(5.0),
          children: [
            for (int i = 0; i < popularCategoriesList!.length; i++)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showHideProgress(true);
                  BlocProvider.of<HomeBloc>(contextnew).add(
                      HomeEventsJobsSubcategoryPageClick(
                          "${popularCategoriesList?[i].categoryId}",
                          "${popularCategoriesList?[i].categoryName}"));
                },
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "assets/images/jobs.jpg",
                          fit: BoxFit.fill,
                          height: 120.0.scale(),
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5)),
                      height: 120.0.scale(),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.scale(), vertical: 5.0.scale()),
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5))),
                      child: Column(
                        children: [
                          Text(
                            "JOBS",
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.white),
                          ),
                          Text(
                            "${popularCategoriesList?[i].jobCount}",
                            style: textStyleBoldCustomLargeColor(
                                15.0.scale(), Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 5,
                        left: 5,
                        child: SizedBox(
                          width: 150.0.scale(),
                          child: Text(
                            "${popularCategoriesList?[i].categoryName}",
                            maxLines: 3,
                            style: textStyleBoldCustomLargeColor(
                                15.0.scale(), Colors.white),
                          ),
                        )),
                  ],
                ),
              )
          ],
        ),
      ],
    );
  }

  Widget trending_jobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AVerticalSpace(20.0.scale()),
        Text(
          'Trending Jobs',
          style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
        ).align(Alignment.center),
        Text(
          'lacinia viverra lectus. Fusce imperdiet ullamcorper metus eu fringilla.',
          textAlign: TextAlign.center,
          style: textStyleCustomColor(12.0.scale(), Colors.black),
        ).align(Alignment.center),
        AVerticalSpace(10.0.scale()),
        ListView.builder(
            itemCount: trendingJobsList!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 10.0.scale(), bottom: 15.0.scale(), top: 5.0.scale()),
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
                                    url:
                                        "${trendingJobsList![index].companyLogo}",
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
                                  "${trendingJobsList![index].jobCdt}",
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
                                  "${trendingJobsList![index].jobTitle}",
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
                                      "${trendingJobsList![index].minimumSalary}",
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
                                      "${trendingJobsList![index].noOfApplicants} Applicants",
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
                              jobId: "${trendingJobsList![index].jobId}"),
                          moreDetailBtn(
                              index: index,
                              jobId: "${trendingJobsList![index].jobId}")
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget searched_jobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AVerticalSpace(20.0.scale()),
        Text(
          'Searched Jobs',
          style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
        ).align(Alignment.center),
        AVerticalSpace(10.0.scale()),
        Expanded(
          child: ListView.builder(
              itemCount: search_result?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showHideProgress(true);
                    BlocProvider.of<HomeBloc>(context).add(
                        HomeEventsJobsDetailsPageClick(
                            "${trendingJobsList![index].jobId}", 'job_detail'));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0.scale(),
                    ),
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
                                    width: 100.0.scale(),
                                    height: 100.0.scale(),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.5))),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: NetworkImagesWidgets(
                                        url:
                                            "${search_result?[index].companyLogo}",
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
                                      "${search_result?[index].jobCdt}",
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
                                      "${search_result?[index].jobSlug}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBoldCustomLargeColor(
                                          14.0.scale(), Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AVerticalSpace(20.0.scale()),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget premium_jobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AVerticalSpace(10.0.scale()),
        Text(
          'Premium Jobs',
          style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
        ).align(Alignment.center),
        Text(
          'lacinia viverra lectus. Fusce imperdiet ullamcorper metus eu fringilla.',
          textAlign: TextAlign.center,
          style: textStyleCustomColor(12.0.scale(), Colors.black),
        ).align(Alignment.center),
        AVerticalSpace(10.0.scale()),
        SizedBox(
          height: 170.0.scale(),
          child: ListView.builder(
              itemCount: premiumJobsList!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 10.0.scale(),
                      bottom: 15.0.scale(),
                      top: 5.0.scale(),
                      right: 5.0.scale()),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.26,
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.0.scale(), vertical: 10.0.scale()),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: kColorThemePurpleColor,
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color:
                                              Colors.black.withOpacity(0.3))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: NetworkImagesWidgets(
                                      url:
                                          "${premiumJobsList![index].companyLogo}",
                                      fit: BoxFit.fill,
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
                                    "${premiumJobsList![index].jobCdt}",
                                    style: textStyleCustomColor(
                                        10.0.scale(), Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            AHorizontalSpace(5.0.scale()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120.0.scale(),
                                  child: Text(
                                    "${premiumJobsList![index].jobName}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomLargeColor(
                                        13.0.scale(), Colors.black),
                                  ),
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
                                        "${premiumJobsList![index].getCountJobAppliedJob} Applicants",
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
                                      CupertinoIcons.circle_filled,
                                      size: 8.0.scale(),
                                      color: Color(0xff45BD14),
                                    ),
                                    AHorizontalSpace(8.0.scale()),
                                    SizedBox(
                                      width: 130.0.scale(),
                                      child: Text(
                                        "${premiumJobsList![index].jobOpening} Openings",
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
                        applyNowBtn(
                            index: index,
                            width: MediaQuery.of(context).size.width,
                            jobId: "${premiumJobsList![index].jobPopularId}"),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget moreDetailBtn({
    required int index,
    double? width,
    required String jobId,
  }) {
    return InkWell(
      onTap: () {
        showHideProgress(true);
        BlocProvider.of<HomeBloc>(context).add(HomeEventsJobsDetailsPageClick(
            "${trendingJobsList![index].jobId}", 'job_detail'));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
        child: Container(
          height: 40.0.scale(),
          width: width ?? MediaQuery.of(context).size.width / 2.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: kColorThemePurpleColor,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            'More Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget applyNowBtn({
    required int index,
    double? width,
    required String jobId,
  }) {
    return InkWell(
      onTap: () {
        if (sharedPrefs.IsLogin == false) {
          BlocProvider.of<HomeBloc>(context)
              .add(EventAllJobtoLoginBtnClick("all_cat_job"));
        } else {
          print("selected_job_id__ ${trendingJobsList![index].jobId} ");

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
                        BlocProvider.of<HomeBloc>(context)
                            .add(ApplyJobEventClick(sharedPrefs.userID, jobId));
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
        width: width ?? MediaQuery.of(context).size.width / 2.5,
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
