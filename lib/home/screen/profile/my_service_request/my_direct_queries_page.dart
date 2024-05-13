import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/my_direct_queries_model.dart';

class MyDirectQueriesPage extends StatefulWidget {
  const MyDirectQueriesPage({super.key});

  @override
  State<MyDirectQueriesPage> createState() => _MyDirectQueriesPageState();
}

class _MyDirectQueriesPageState extends State<MyDirectQueriesPage> {
  DirectQeriesData? direct_queries_data;
  List<DataList>? data_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }



  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is MyDirectQueriesBtnClickState) {
      direct_queries_data = profileState.directQueriesModel?.data;
      data_list = direct_queries_data?.dataList;
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
                "My Direct Queries",
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
                itemCount: data_list?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0.scale()),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              width: 145.0.scale(),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Lead Type- ",
                                        style: textStyleBoldCustomColor(
                                            11, Colors.white),
                                      ),
                                      Text(
                                        "${data_list?[index].leadType}",
                                        style: textStyleCustomColor(
                                            10, Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Mobile- ",
                                        style: textStyleBoldCustomColor(
                                            11, Colors.white),
                                      ),
                                      Text(
                                        "${data_list?[index].enquiryMobile}",
                                        style: textStyleCustomColor(
                                            10, Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          AVerticalSpace(10.0.scale()),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 15.0.scale()),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Query:  ",
                                  style: textStyleBoldCustomColor(
                                      13, Colors.black),
                                ),
                                Expanded(
                                    child: Text(
                                  "${data_list?[index].enquiryMessage}",
                                  style: textStyleBlack(12),
                                ).topPadding(2.0.scale())),
                              ],
                            ),
                          ),
                          AVerticalSpace(10.0.scale()),
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
