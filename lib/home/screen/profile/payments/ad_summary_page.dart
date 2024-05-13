import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/ad_summary_model.dart';

class AdSummaryPage extends StatefulWidget {
  const AdSummaryPage({super.key});

  @override
  State<AdSummaryPage> createState() => _AdSummaryPageState();
}

class _AdSummaryPageState extends State<AdSummaryPage> {
  AdData? data;
  List<PaidAdsList>? ad_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is AdSummaryState) {
      data = profileState.adSummaryModel?.data;
      ad_list = data?.paidAdsList;

      print("ad_list___${ad_list?.first.startDate}");
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
              "Ad Summary",
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
        body: ListView.builder(
            itemCount: ad_list?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0.scale(), vertical: 10.0.scale()),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0.scale(), vertical: 15.0.scale()),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0.scale()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${ad_list?[index].adPosition}",
                        maxLines: 1,
                        style: textStyleBoldCustomColor(
                            16.0.scale(), Colors.black),
                      ),
                      AVerticalSpace(10.0.scale()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Duration: ${ad_list?[index].duration} Days",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                          Text(
                            "Status: ${ad_list?[index].status}",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                        ],
                      ),
                      AVerticalSpace(2.0.scale()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Views: ${ad_list?[index].views}",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                          Text(
                            "Clicks: ${ad_list?[index].clicks}",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                        ],
                      ),
                      AVerticalSpace(10.0.scale()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0.scale(),
                                  vertical: 3.0.scale()),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.8),
                                borderRadius:
                                    BorderRadius.circular(5.0.scale()),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Text(
                                "Start Date: ${ad_list?[index].startDate}",
                                style:
                                    textStyleBoldCustomColor(12, Colors.white),
                              )),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0.scale(),
                                  vertical: 3.0.scale()),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.8),
                                borderRadius:
                                    BorderRadius.circular(5.0.scale()),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Text(
                                "Expired On: ${ad_list?[index].endDate}",
                                style:
                                    textStyleBoldCustomColor(12, Colors.white),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      )),
    );
  }
}
