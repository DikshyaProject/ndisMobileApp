import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/custom_dialog.dart';
import 'package:ndisparticipant/home/model/blog/post_search_model.dart';

import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/blog/bloglist_details_model.dart';

BlogListDetailsData? blogListDetailsData;
List<RelatedPosts>? relatedPosts = [];

class BlogDetilsPage extends StatefulWidget {
  const BlogDetilsPage({super.key});

  @override
  State<BlogDetilsPage> createState() => _BlogDetilsPageState();
}

class _BlogDetilsPageState extends State<BlogDetilsPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNodePwd = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  String? blog_id;
  PostSearchData? data;
  List<Searchlist>? search_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeBlogDetilsPageState) {
      blogListDetailsData = homeState.blogListDetailsData;
      relatedPosts = blogListDetailsData!.relatedPosts;
      blog_id = homeState.blogId;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        print("blog_state___$state");
        if (state is HomeBlogListPageState) {
          Navigator.pop(context);
        }

        if (state is HomeLoginPageState) {
          Navigator.of(context).pushNamed(HomeNavigator.loginPage);
        }

        if (state is SendEnquiryBlogSuccessState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context)
              .add(HomeBlogDetilsPageBtnClick(blog_id));
          showSnackBar(state.message, Colors.black, context);
        }

        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context)
              .add(HomeBlogDetilsPageBtnClick(blog_id));
          showSnackBar(state.message, Colors.red, context);
        } else if (state is PostSearchBtnClickState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context)
              .add(HomeBlogDetilsPageBtnClick(blog_id));
          data = state.postSearchModel?.data;
          search_list = data?.searchlist;
          print("search_list__${search_list?.first.blogName}");
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
                child: Icon(Icons.arrow_back, color: Colors.white))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250.0.scale(),
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
                        height: 250.0.scale(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0.scale()),
                            topLeft: Radius.circular(5.0.scale()),
                            bottomRight: Radius.circular(5.0.scale()),
                            bottomLeft: Radius.circular(5.0.scale()),
                          ),
                          child: NetworkImagesWidgets(
                            url: blogListDetailsData!.post!.blogImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 60.0.scale(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0.scale(), vertical: 5.0.scale()),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                            AHorizontalSpace(5.0.scale()),
                            Text(
                              blogListDetailsData!.post!.eyeCount!.toString(),
                              maxLines: 1,
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AVerticalSpace(10.0.scale()),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 2.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AVerticalSpace(10.0.scale()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  blogListDetailsData!.post!.blogName!
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      16.0.scale(), Colors.black)),
                              Container(
                                  height: 40.0.scale(),
                                  width: 120.0.scale(),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Color(0xFFF1F1F1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.access_time_filled_sharp,
                                        color: Colors.grey,
                                        size: 17.0.scale(),
                                      ),
                                      AHorizontalSpace(4.0.scale()),
                                      Text(
                                        blogListDetailsData!.post!.blogCdt!
                                            .toString()
                                            .substring(0, 11),
                                        style: textStyleBoldCustomColor(
                                            12.0.scale(), Colors.black),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          AVerticalSpace(10.0.scale()),
                          Text(
                              blogListDetailsData!.post!.blogDescription!
                                  .toString(),
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(
                                  12.0.scale(), Colors.black)),
                          AVerticalSpace(10.0.scale()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40.0.scale(),
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.blue),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_share.png',
                                      height: 15.0.scale(),
                                      width: 15.0.scale(),
                                      color: Colors.white,
                                    ),
                                    AHorizontalSpace(5.0.scale()),
                                    Text(
                                      "Share",
                                      style: textStyleBoldCustomColor(
                                          14.0.scale(), Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print("is_login____${sharedPrefs.IsLogin}");
                                  if (sharedPrefs.IsLogin == false) {
                                    BlocProvider.of<HomeBloc>(context).add(
                                        EventBlogDetailToLoginBtnClick(
                                            "blog_detail", blog_id!));
                                  } else {
                                    print(
                                        "selected_blogId__ ${blogListDetailsData?.post?.blogId} ");

                                    print(
                                        "email_is__${sharedPrefs.userEmail} mobile_is___${sharedPrefs.userMobile} user_id__ ${sharedPrefs.userID}");
                                    nameController.text = sharedPrefs.userName;
                                    emailController.text =
                                        sharedPrefs.userEmail;
                                    mobileController.text =
                                        sharedPrefs.userMobile;

                                    ///send enquiry dialog

                                    CustomStatefulAlertDialog(
                                      context: context,
                                      bodyWidget: StatefulBuilder(builder:
                                          (context2,
                                              StateSetter dialogsetState) {
                                        return SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop();
                                                      },
                                                      child: Icon(CupertinoIcons
                                                          .multiply))
                                                  .align(Alignment.topRight),
                                              Text(
                                                'Send Enquiry',
                                                style:
                                                    textStyleBoldCustomLargeColor(
                                                        16.0.scale(),
                                                        Colors.black),
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
                                                        BorderRadius.circular(
                                                            5)),
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
                                                    hintStyle:
                                                        textStyleCustomColor(
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
                                                        BorderRadius.circular(
                                                            5)),
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
                                                    hintStyle:
                                                        textStyleCustomColor(
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
                                                        BorderRadius.circular(
                                                            5)),
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
                                                    hintStyle:
                                                        textStyleCustomColor(
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
                                                        BorderRadius.circular(
                                                            5)),
                                                child: TextField(
                                                  controller: queryController,
                                                  maxLines: 6,
                                                  style: textStyleCustomColor(
                                                      14.0.scale(),
                                                      kColorDialogNameTitle),
                                                  cursorColor:
                                                      kColorDialogNameTitle,
                                                  textAlignVertical:
                                                      TextAlignVertical.top,
                                                  enableInteractiveSelection:
                                                      false,
                                                  autocorrect: false,
                                                  enableSuggestions: false,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        "Enter your query or message",
                                                    hintStyle:
                                                        textStyleCustomColor(
                                                            14.0.scale(),
                                                            kColorSearchHintText),
                                                  ),
                                                ),
                                              ),
                                              AVerticalSpace(10.0.scale()),
                                              InkWell(
                                                onTap: () {
                                                  if (queryController
                                                      .text.isEmpty) {
                                                    showSnackBar(
                                                        "Please enter your query or message",
                                                        Colors.black,
                                                        context2);
                                                  } else {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();
                                                    showHideProgress(true);
                                                    BlocProvider.of<HomeBloc>(
                                                            context)
                                                        .add(
                                                            SendEnquiryBlogClick(
                                                      sharedPrefs.userID,
                                                      "${blogListDetailsData?.post?.blogId}",
                                                      queryController.text,
                                                    ));
                                                  }
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 45.0.scale(),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff00BDAA),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  height: 40.0.scale(),
                                  decoration: BoxDecoration(
                                    color: Color(0xff00BDAA),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "Send Enquiry",
                                    style: textStyleBoldCustomLargeColor(
                                        15.0.scale(), Colors.white),
                                  ).align(Alignment.center),
                                ),
                              ),
                            ],
                          ),
                          AVerticalSpace(10.0.scale()),
                        ]),
                  )).rightPadding(10.0.scale()).leftPadding(10.0.scale()),
              AVerticalSpace(10.0.scale()),
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/pr_1.jpeg',
                                height: 50,
                                width: 50,
                              )),
                          AHorizontalSpace(5.0.scale()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Posted by",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldCustomLargeColor(
                                    11.0.scale(), Colors.black),
                              ),
                              Text(
                                "John Smith",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleCustomColor(
                                    11.0.scale(), Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                      AVerticalSpace(5.0.scale()),
                      Text("Other Post",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(16.0.scale(), Colors.black)),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            height: 50.0.scale(),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodePwd);
                              },
                              child: TextField(
                                focusNode: _focusNodePwd,
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      _searchController.clear();
                                      search_list = null;
                                      setState(() {});
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0.scale()),
                                  ),
                                ),
                              ),
                              // TextFormField(
                              //   focusNode: _focusNodePwd,
                              //   controller: _searchController,
                              //   decoration: InputDecoration(
                              //     hintText: 'Search...',
                              //     suffixIcon: IconButton(
                              //       icon: Icon(Icons.clear),
                              //       onPressed: () {
                              //         _searchController.clear();
                              //         search_list = null;
                              //         setState(() {});
                              //       },
                              //     ),
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(
                              //           10.0.scale()),
                              //     ),
                              //   ),
                              //   onChanged: (val) {
                              //     _searchController.text = val!;
                              //
                              //     if (val.length >= 3) {
                              //       showHideProgress(true);
                              //       BlocProvider.of<HomeBloc>(context).add(EventPostSearchBtnClick(_searchController.text));
                              //     }
                              //   },
                              // ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context).add(
                                  EventPostSearchBtnClick(
                                      _searchController.text));
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.scale(),
                                    vertical: 4.0.scale()),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(8.0.scale()),
                                  color: kColorThemePurpleColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width / 7,
                                child: Container(
                                    height: 40.0.scale(),
                                    child: Icon(
                                      CupertinoIcons.search,
                                      color: Colors.white,
                                    ))),
                          ),
                        ],
                      )
                    ],
                  ),
                ).topPadding(10.0.scale()).bottomPadding(10.0.scale()),
              ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
              AVerticalSpace(10.0.scale()),
              if (search_list?.length != 0 && search_list != null)
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Searched Post",
                        style: textStyleBoldCustomColor(
                            16.0.scale(), Colors.black),
                      ),
                      AVerticalSpace(10.0.scale()),
                      Container(
                        height: 200.0.scale(),
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: search_list?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 250.0.scale(),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    new BoxShadow(
                                      color: kColorThemePurpleColor,
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.circular(5.0.scale()),
                                  color: Colors.white,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      height: 200.0.scale(),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topRight:
                                              Radius.circular(5.0.scale()),
                                          topLeft: Radius.circular(5.0.scale()),
                                          bottomRight:
                                              Radius.circular(5.0.scale()),
                                          bottomLeft:
                                              Radius.circular(5.0.scale()),
                                        ),
                                        child: NetworkImagesWidgets(
                                          url:
                                              "${search_list?[index].blogImage}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      child: Text(
                                              "${search_list?[index].blogName}"
                                                  .toUpperCase(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: textStyleBoldCustomColor(
                                                  18.0.scale(), Colors.white))
                                          .leftPadding(20.0.scale()),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
              AVerticalSpace(10.0.scale()),
              if (relatedPosts?.length != 0 && relatedPosts != null)
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Related Post",
                        style: textStyleBoldCustomColor(
                            16.0.scale(), Colors.black),
                      ),
                      AVerticalSpace(10.0.scale()),
                      Container(
                        height: 280.0.scale(),
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: relatedPosts!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 250.0.scale(),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    new BoxShadow(
                                      color: kColorThemePurpleColor,
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.circular(5.0.scale()),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      height: 200.0.scale(),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topRight:
                                              Radius.circular(5.0.scale()),
                                          topLeft: Radius.circular(5.0.scale()),
                                          bottomRight:
                                              Radius.circular(5.0.scale()),
                                          bottomLeft:
                                              Radius.circular(5.0.scale()),
                                        ),
                                        child: NetworkImagesWidgets(
                                          url: relatedPosts![index].blogImage!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                          .topPadding(10.0.scale())
                                          .leftPadding(10.0.scale())
                                          .rightPadding(10.0.scale()),
                                    ),
                                    AVerticalSpace(5.0.scale()),
                                    Text(
                                            relatedPosts![index]
                                                .blogName!
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleBoldBlack(
                                                16.0.scale(), Colors.black))
                                        .leftPadding(20.0.scale()),
                                  ],
                                ),
                              )
                                  .topPadding(10.0.scale())
                                  .leftPadding(5.0.scale())
                                  .rightPadding(5.0.scale())
                                  .bottomPadding(10.0.scale());
                            }),
                      ),
                    ],
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
            ],
          ),
        ),
      )),
    );
  }
}
