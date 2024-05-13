import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/my_generic_lead_model.dart';

class MyGenericLeadsPage extends StatefulWidget {
  const MyGenericLeadsPage({super.key});

  @override
  State<MyGenericLeadsPage> createState() => _MyGenericLeadsPageState();
}

class _MyGenericLeadsPageState extends State<MyGenericLeadsPage> {
  GenericLeadData? data;
  List<DbEnquiryData>? list;


  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider
        .of<HomeBloc>(context)
        .state;
    if (profileState is MyGenericLeadState) {
      data = profileState.genericLeadsModel?.data;
      list = data?.dbEnquiryData;
      print("generic_list____${list?.first.emailId}");
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
                "My Generic Leads",
                style: TextStyle(color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(
                        ProfileEventBackBtnClick(""));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),
          body: Padding(
            padding: EdgeInsets.only(top: 10.0.scale(), bottom: 10.0.scale()),
            child: ListView.builder(
                itemCount: list?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 10.0.scale(), bottom: 10.0.scale()),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10.0.scale(), bottom: 10.0.scale(),),
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0.scale()),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(
                                        15.0.scale())
                                ),
                                child: Text("Lead Id- ${list?[index].srId}",
                                  style: textStyleBoldCustomColor(
                                      10, Colors.white),)),
                          ),
                          AVerticalSpace(8.0.scale()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 130.0.scale(),

                                child: Text(
                                  "Main Category",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ).leftPadding(10.0.scale()),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Expanded(
                                child: Text(
                                  ": ${list?[index].mainCategory}",
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
                                width: 130.0.scale(),

                                child: Text(
                                  "Sub Category",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ).leftPadding(10.0.scale()),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Expanded(
                                child: Text(
                                  ": ${list?[index].subCategory}",
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
                                width: 130.0.scale(),

                                child: Text(
                                  "Message",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ).leftPadding(10.0.scale()),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Expanded(
                                child: Text(
                                  ": ${list?[index].enquiryMessage}",
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
                                width: 130.0.scale(),

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
                                  ": ${list?[index].userAddress}",
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
                                width: 130.0.scale(),

                                child: Text(
                                  "How many users can send access",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ).leftPadding(10.0.scale()),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Expanded(
                                child: Text(
                                  ": ${list?[index].userSendAccess}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBlack(12.0.scale()),
                                ).rightPadding(10.0.scale()),
                              ),
                            ],
                          ),
                          AVerticalSpace(3.0.scale()),

                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       width: 130.0.scale(),
                          //
                          //       child: Text(
                          //         "Status",
                          //         maxLines: 2,
                          //         overflow: TextOverflow.ellipsis,
                          //         style: textStyleBoldBlack(12.0.scale(), Colors.black),
                          //       ).leftPadding(10.0.scale()),
                          //     ),
                          //     AHorizontalSpace(5.0.scale()),
                          //     Expanded(
                          //       child: Text(
                          //         ": ${list?[index].leadStatus}",
                          //         maxLines: 2,
                          //         overflow: TextOverflow.ellipsis,
                          //         style: textStyleBlack(12.0.scale()),
                          //       ).rightPadding(10.0.scale()),
                          //     ),
                          //   ],
                          // ),
                          // AVerticalSpace(8.0.scale()),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                          //
                          //   child: Container(
                          //       alignment: Alignment.center,
                          //       height: 50.0.scale(),
                          //       decoration: BoxDecoration(
                          //           color: Color(0xff00BDAA),
                          //           borderRadius: BorderRadius.circular(5.0.scale())
                          //       ),
                          //       child: Text("Cancel", style: textStyleBoldCustomColor(15.0.scale(), Colors.white ),)),
                          // ),
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
