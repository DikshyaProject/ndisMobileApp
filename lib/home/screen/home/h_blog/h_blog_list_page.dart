import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';

import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_non_scroll_grid_view.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/blog/blog_list_model.dart';

class BlogListPage extends StatefulWidget {
   BlogListPage();

  @override
  State<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  BlogListData? blogListData;
  List<Topbloglist>? topbloglist=[];
  List<Blogpost>? blogpost=[];

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

@override
  void initState() {
  HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
  if(homeState is HomeBlogListPageState)
  {
    blogListData=homeState.blogListData;
    topbloglist=blogListData!.topbloglist;
    blogpost=blogListData!.blogpost;



  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {

        if (state is HomeInitial)
        {
          Navigator.pop(context, true);
        }
        if (state is HomeBlogDetilsPageState)
        {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.homeBlogDetilsPage);
        }
      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Blogs",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),

        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 320.0.scale(),
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.98,
                  aspectRatio: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 1200),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
                items: topbloglist!.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(HomeBlogDetilsPageBtnClick("${i.blogId}"));
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 320.0.scale(),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.1),
                                  )),
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200.0.scale(),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5.0.scale()),
                                      topLeft: Radius.circular(5.0.scale()),
                                      bottomRight: Radius.circular(5.0.scale()),
                                      bottomLeft: Radius.circular(5.0.scale()),
                                    ),
                                    child: NetworkImagesWidgets(
                                      url:  i.blogImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0.scale(),
                                      vertical: 5.0.scale()),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5))),
                                  child: Text(
                                    "Top Posts",
                                    maxLines: 1,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                                top: 205.0.scale(),
                                left: 10.0.scale(),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0.scale(),
                                      vertical: 5.0.scale()),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                     i.blogName!,
                                        maxLines: 1,
                                        style: textStyleBoldCustomColor(
                                            16.0.scale(), Colors.black),
                                      ),
                                      AVerticalSpace(5.0.scale()),
                                      Text(
                                        i.blogDescription!,
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleCustomColor(
                                            12.0.scale(), Colors.black),
                                      ),
                                      AVerticalSpace(10.0.scale()),
                                      Row(
                                        children: [
                                          Container(
                                            width: 30.0.scale(),
                                            height: 30.0.scale(),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: NetworkImagesWidgets(
                                                  url:   i.profileImage!,
                                                  fit: BoxFit.cover,
                                                ),
                                            ),
                                          ),
                                          AHorizontalSpace(5.0.scale()),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Posted by",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    textStyleBoldCustomLargeColor(
                                                        11.0.scale(),
                                                        Colors.black),
                                              ),
                                              Text(
                                               i.postedBy!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: textStyleCustomColor(
                                                    11.0.scale(), Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ).topPadding(5.0.scale()).bottomPadding(15.0.scale()),
              GoogleGrid(
                columnCount: 2,
                gap: 10.0.scale(),
                padding: const EdgeInsets.all(5.0),
                children: [
                  for (int i = 0; i <blogpost!.length; i++)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context).add(HomeBlogDetilsPageBtnClick("${blogpost?[i].blogId}"));
                      },
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 120.0.scale(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  child: NetworkImagesWidgets(
                                    url:  blogpost![i].blogImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0.scale(),
                                      vertical: 5.0.scale()),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5))),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/ic_view.png",
                                        height: 15.0.scale(),
                                        width: 15.0.scale(),
                                        color: Colors.white,
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      AHorizontalSpace(4.0.scale()),
                                      Text(
                                        blogpost![i].eyeCount!.toString(),
                                        style: textStyleBoldCustomLargeColor(
                                            12.0.scale(), Colors.white),
                                      ),
                                    ],
                                  ).align(Alignment.topLeft),
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0.scale(), vertical: 5.0.scale()),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: kColorThemePurpleColor,
                                    blurRadius: 2.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  blogpost![i].blogName!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldCustomLargeColor(
                                      12.0.scale(), Colors.black),
                                ),
                                AVerticalSpace(10.0.scale()),
                                Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(
                                          'assets/images/pr_1.jpeg',
                                          height: 30,
                                          width: 30,
                                        )),
                                    AHorizontalSpace(5.0.scale()),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Posted by",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyleBoldCustomLargeColor(
                                              11.0.scale(), Colors.black),
                                        ),
                                        Text(
                                          blogpost![i].postedBy!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyleCustomColor(
                                              11.0.scale(), Colors.black),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/ic_clock.png",
                                              height: 15.0.scale(),
                                              width: 15.0.scale(),
                                              color: Colors.blueGrey,
                                            ),
                                            AHorizontalSpace(4.0.scale()),
                                            Text(
                                              blogpost![i].blogCdt!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: textStyleCustomColor(
                                                  10.0.scale(), Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                AVerticalSpace(10.0.scale()),
                              ],
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
      )),
    );

  }
}
