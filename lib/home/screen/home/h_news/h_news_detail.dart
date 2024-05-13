import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/bloc/home_bloc.dart';
import 'package:ndisparticipant/home/bloc/home_event.dart';

import '../../../model/news/news_details_model.dart';
NewsDetailsData? newsDetailsData;
  List<NewsidDetails>? newsidDetails=[];
  List<RelatedPost>? relatedPost=[];
  List<LatestNews>?latestNews=[];
String? _screenType;
class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

@override
  void initState() {
  HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
  if (homeState is HomeNewsDetilsPageClickState)
  {
    newsDetailsData=homeState.newsDetailsData;
    newsidDetails=newsDetailsData!.newsidDetails;
     relatedPost=newsDetailsData!.relatedPost;
     latestNews=newsDetailsData!.latestNews;
    _screenType=homeState.screenType;
    print(_screenType);
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeNewsPageClickState) {
          Navigator.pop(context);
        }
        if (state is HomeInitial) {
          Navigator.pop(context, true);
        }
        if (state is HomeNewsDetilsPageClickState) {
          showHideProgress(false);
          newsDetailsData=state.newsDetailsData;
          newsidDetails=newsDetailsData!.newsidDetails;
          relatedPost=newsDetailsData!.relatedPost;
          latestNews=newsDetailsData!.latestNews;
          setState(() {});
        }
      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "News Details",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      if(_screenType=="Home") {
                        BlocProvider.of<HomeBloc>(context).add(
                            HomeNewsDetailsBackBtnClick());
                      }else {
                        BlocProvider.of<HomeBloc>(context).add(
                            HomeEventBackBtnClick(''));
                      }
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250.0.scale(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: NetworkImagesWidgets(
                            url:  newsidDetails![0].newsImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Container(
                        height: 50.0.scale(),
                        width: 50.0.scale(),
                        padding: EdgeInsets.all(5.0.scale()),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(child: Icon(Icons.share, color: Colors.white,))).topPadding(10.0.scale()).rightPadding(10.0.scale())
                    ],
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.0.scale()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AVerticalSpace(10.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.scale(),
                                  horizontal: 8.0.scale()),
                              color: Colors.grey.withOpacity(0.3),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time_outlined,
                                    color: Colors.grey,
                                    size: 14.0.scale(),
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  Text("${DateFormat("dd, MMM yyyy").format(DateTime.parse(newsidDetails![0].date))}",
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.grey),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        AVerticalSpace(20.0.scale()),
                        Text(newsidDetails![0].newsTitle,
                        style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),),
                        AVerticalSpace(5.0.scale()),
                        Text(newsidDetails![0].newsDescription,
                        style: textStyleCustomColor(13.0.scale(), Colors.black),),
                        AVerticalSpace(10.0.scale()),



                      ],
                    ),
                  ),

                  related_post(),
                  latest_post(),
                  AVerticalSpace(20.0.scale()),

                ],
              ),
            ),
          )),
    );
  }

  Widget latest_post() {
    return Column(
      children: [
        AVerticalSpace(10.0.scale()),
        Text(
          'LATEST POSTS',
          style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
        ).align(Alignment.center),
        AVerticalSpace(5.0.scale()),
        SizedBox(
          height: 280.0.scale(),
          child: ListView.builder(
              itemCount: latestNews!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ()
                  {
                    showHideProgress(true);
                    BlocProvider.of<HomeBloc>(context).add(HomeNewsDetilsPageClick(latestNews![index].newsId,""));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0.scale(), top: 10.0.scale()),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200.0.scale(),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  child:ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: NetworkImagesWidgets(
                                      url: latestNews![index].newsImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),


                                ),
                              ),

                              Positioned(
                                top: 5.0.scale(),
                                left: 5.0.scale(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0.scale(),
                                          vertical: 5.0.scale()),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                      ),
                                      child: Text(
                                        "type",
                                        style: textStyleBoldCustomColor(
                                            12.0.scale(), Colors.white),
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              Positioned(
                                top: 5.0.scale(),
                                right: 5.0.scale(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0.scale(),
                                          vertical: 5.0.scale()),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                      ),
                                      child:   Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: Colors.white,
                                            size: 13.0.scale(),
                                          ),
                                          AHorizontalSpace(5.0.scale()),
                                          Text(
                                            latestNews![index].eyeCount.toString(),
                                            style: textStyleCustomColor(
                                                11.0.scale(), Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Container(
                                color: Colors.black.withOpacity(0.6),
                                height: 20.0.scale(),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      color: Colors.white,
                                      size: 13.0.scale(),
                                    ),
                                    AHorizontalSpace(5.0.scale()),
                                    Text(
                                      "${DateFormat("dd, MMM yyyy").format(DateTime.parse(latestNews![index].date))}",
                                      style: textStyleCustomColor(
                                          11.0.scale(), Colors.white),
                                    ),
                                  ],
                                ).leftPadding(5.0.scale()).rightPadding(5.0.scale()),
                              ),)
                            ],
                          ),


                          AVerticalSpace(10.0.scale()),
                          Text(latestNews![index].newsTitle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: textStyleBoldCustomColor(
                                14.0.scale(), Colors.black),
                          ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                          AVerticalSpace(10.0.scale()),
                        ],
                      ),
                    ),
                  ),
                );
              }).rightPadding(5.0.scale()),
        ),
      ],
    );
  }

  Widget related_post(){
    return Column(
      children: [
        AVerticalSpace(10.0.scale()),
        Text(
          'RELATED POSTS',
          style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
        ).align(Alignment.center),
        AVerticalSpace(5.0.scale()),
        SizedBox(
          height: 200.0.scale(),
          child: ListView.builder(
              itemCount: relatedPost!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    showHideProgress(true);
                    BlocProvider.of<HomeBloc>(context).add(HomeNewsDetilsPageClick(relatedPost![index].newsId,""));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0.scale(), top: 10.0.scale()),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 200.0.scale(),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  child: NetworkImagesWidgets(
                                    url:  relatedPost![index].newsImage,
                                    fit: BoxFit.cover,
                                  ),



                                ),
                              ),
                              Container(
                                width:
                                MediaQuery.of(context).size.width / 2.5,
                                height: 200.0.scale(),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                    color: Colors.black.withOpacity(0.3)
                                ),
                              ),
                              Positioned(
                                top: 5.0.scale(),
                                left: 5.0.scale(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0.scale(),
                                          vertical: 5.0.scale()),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                      ),
                                      child:   Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: Colors.white,
                                            size: 13.0.scale(),
                                          ),
                                          AHorizontalSpace(5.0.scale()),
                                          Text(
                                            relatedPost![index].eyeCount.toString(),
                                            style: textStyleCustomColor(
                                                11.0.scale(), Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              )

                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0.scale(), top: 10.0.scale(),  bottom: 10.0.scale()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 140.0.scale(),
                                  child: Text(
                                    relatedPost![index].newsTitle,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        14.0.scale(), Colors.black),
                                  ),
                                ),
                                AVerticalSpace(10.0.scale()),
                                Container(
                                  color: Colors.black.withOpacity(0.6),
                                  height: 20.0.scale(),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.white,
                                        size: 13.0.scale(),
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text(
                                        "${DateFormat("dd, MMM yyyy").format(DateTime.parse(relatedPost![index].date))}",
                                        style: textStyleCustomColor(
                                            11.0.scale(), Colors.white),
                                      ),
                                    ],
                                  ).leftPadding(5.0.scale()).rightPadding(5.0.scale()),
                                ),
                                AVerticalSpace(5.0.scale()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).rightPadding(10.0.scale()),
        ),
      ],
    );
  }
}
