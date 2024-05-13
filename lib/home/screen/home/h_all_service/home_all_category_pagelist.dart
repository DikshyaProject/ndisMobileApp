import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../home_navigator.dart';
import '../../../model/home/all_category_model.dart';

class HomeAllCategoryListPage extends StatefulWidget {
  const HomeAllCategoryListPage({super.key});

  @override
  State<HomeAllCategoryListPage> createState() => _HomeAllCategoryListPageState();
}

class _HomeAllCategoryListPageState extends State<HomeAllCategoryListPage> {
  CategoryModelData? categoryModelData;
  List<AllCategoryData>? allCategoryData = [];

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeAllCategoryPageState) {
      categoryModelData = homeState.categoryModelData;
      allCategoryData = categoryModelData!.allCategoryData;
      allCategoryData = categoryModelData!.allCategoryData;

      print(allCategoryData!.length);
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeInitial) {
          Navigator.pop(context, true);
        }
        if (state is HomeSubCatgoryListDetailsState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.homeSubCatgoryListDetailsPage);
        }
        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          showSnackBar(state.message, Colors.black, context);
          BlocProvider.of<HomeBloc>(context).add(HomeAllCategoryPageBtnClick());
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "All Services",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => BlocProvider.of<HomeBloc>(context)
                    .add(HomeEventBackBtnClick('')),
              )),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 10.0.scale(), vertical: 15.0.scale()),
            child: CategoryList(allCategoryData),
          ),
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  List<AllCategoryData>? allCategoryData;

  CategoryList(this.allCategoryData);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  Widget build(BuildContext context2) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.allCategoryData!.length,
        itemBuilder: (BuildContext context1, int index) => Container(
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
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200.0.scale(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0.scale()),
                        topLeft: Radius.circular(5.0.scale()),
                      ),
                      child: NetworkImagesWidgets(
                        url: widget.allCategoryData![index].categoryImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AVerticalSpace(5.0.scale()),
                  Text(
                    "${widget.allCategoryData?[index].categoryName}",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: textStyleBoldBlack(16.0.scale(), Colors.black),
                  ).align(Alignment.center),

                  if (widget.allCategoryData![index].subcategories!.length > 0)
                    Column(
                      children: [
                        AVerticalSpace(15.0.scale()),
                        GestureDetector(
                          onTap: () {
                            if (widget.allCategoryData![index].subcategories![0].subCategoryListCount != "00") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context).add(
                                  HomeEventSubCatgoryListDetailsBtnClick(
                                      widget.allCategoryData![index].categoryId,
                                      widget.allCategoryData![index].subcategories![0].subCategoryId, widget.allCategoryData![index].categoryName));
                            } else {
                              showSnackBar(
                                  "Data Not Available", Colors.black, context);
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                widget.allCategoryData?[index].subcategories?[0].subCategoryName ?? "",
                                textAlign: TextAlign.center,
                                style: textStyleCustomColor(
                                    12.0.scale(), Colors.black),
                              ).align(Alignment.topCenter),
                              Text(
                                "(${widget.allCategoryData?[index].subcategories?[0].subCategoryListCount})",
                                textAlign: TextAlign.center,
                                style: textStyleCustomColor(
                                    12.0.scale(), Colors.black),
                              ),
                            ],
                          ).leftPadding(15.0.scale()),
                        ),
                        AVerticalSpace(10.0.scale()),
                        SubCategory(
                            widget.allCategoryData![index],
                            widget.allCategoryData![index].subcategories!,
                            context,
                            showHideProgress,
                            widget.allCategoryData![index].isSelect),
                        Container(
                            height: 0.5.scale(),
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xFF878787)),
                        AVerticalSpace(10.0.scale()),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (widget.allCategoryData![index].isSelect == true) {
                                widget.allCategoryData![index].isSelect = false;
                              } else {
                                widget.allCategoryData![index].isSelect = true;
                              }
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30.0.scale(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.allCategoryData![index].isSelect == false
                                      ? "ViewMore"
                                      : "ViewLess",
                                  textAlign: TextAlign.center,
                                  style: textStyleCustomColor(
                                      12.0.scale(), Colors.black),
                                ),
                                Image.asset(
                                  widget.allCategoryData![index].isSelect == false
                                      ? 'assets/images/ic_down_arrow.png'
                                      : "assets/images/ic_down_arrow.png",
                                  height: 20.0.scale(),
                                  width: 20.0.scale(),
                                  color: Colors.black,
                                ),
                              ],
                            ).align(Alignment.topCenter),
                          ),
                        ),
                      ],
                    ),
                  AVerticalSpace(10.0.scale()),


                ],
              ),
            )
                .leftPadding(5.0.scale())
                .rightPadding(5.0.scale())
                .bottomPadding(10.0.scale())
                .topPadding(5.0.scale()));
  }
}

Widget SubCategory(AllCategoryData AllCategoryData1, List<Subcategories> list,
    BuildContext context, Function showHideProgress1, bool? isSelect) {
  return Visibility(
    visible: isSelect!,
    child: Column(
      children: [
        for (int i = 1; i < list.length; i++)
          GestureDetector(
            onTap: () {
              if (list[i].subCategoryListCount != "00") {
                showHideProgress1(true);
                BlocProvider.of<HomeBloc>(context).add(
                    HomeEventSubCatgoryListDetailsBtnClick(
                        AllCategoryData1.categoryId,
                        AllCategoryData1.subcategories![i].subCategoryId,AllCategoryData1.categoryName ));
              } else {
                showSnackBar("Data Not Available", Colors.black, context);
              }
            },
            child: Container(
              height: 25.0.scale(),
              child: Row(
                children: [
                  Text(
                    list[i].subCategoryName!,
                    textAlign: TextAlign.center,
                    style: textStyleCustomColor(12.0.scale(), Colors.black),
                  ).align(Alignment.topCenter),
                  Text(
                    "(${list[i].subCategoryListCount!})",
                    textAlign: TextAlign.center,
                    style: textStyleCustomColor(12.0.scale(), Colors.black),
                  ),
                ],
              ).leftPadding(5.0.scale()),
            )
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale())
                .bottomPadding(5.0.scale()),
          ),
      ],
    ),
  );
}
