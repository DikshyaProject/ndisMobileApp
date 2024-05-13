import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';

import '../../../Helpers/expand_row.dart';
import '../../../Helpers/theme/theme.dart';
import '../../../components/components.dart';
import '../../home.dart';

class PricingListingPage extends StatefulWidget {
  @override
  State<PricingListingPage> createState() => _PricingListingPageState();
}

class _PricingListingPageState extends State<PricingListingPage> {
  bool expand = false;
  int? tapped;
  List<Features> featuresList = [];
  Plan? plan;
  Map<String, dynamic>? requestParams;
  PricingPlanDataModel? pricingDataPlanModel;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }
  @override
  void initState() {
    log("sup________$requestParams");
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomePricingPlanListingPageState) {
      pricingDataPlanModel = homeState.pricingDataPlanModel;
      featuresList = homeState.features;
      plan = homeState.plan;
      requestParams = homeState.requestParams;

      //print()
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          if (state is HomePricingPlanState) {
            Navigator.of(context).pop();
          }
          if (state is HomeBillingPageState) {
            showHideProgress(false);
            Navigator.of(context).pushNamed(HomeNavigator.billingDetailPage);
          }
          if (state is HomeInitial) {
            showHideProgress(false);
            Navigator.of(context).pushNamed(HomeNavigator.homePage);
          }
        },
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              elevation: 0,
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(
                        HomeEventPlanPricingListBackBtnClick(
                            pricingDataPlanModel));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black, size: 30.0.scale(),))),
          body: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 5,
                        color: kColorThemePurpleColor.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: Column(children: [
                    AVerticalSpace(10.0.scale()),
                    Text(
                      plan!.planName!,
                      style: textStyleBoldCustomColor(
                          14.0.scale(), kColorThemePurpleColor),
                    ).align(Alignment.center),
                    AVerticalSpace(5.0.scale()),
                    Text(
                      plan!.planTypeMonPrice!,
                      style: textStyleBoldCustomColor(
                          15.0.scale(), kColorThemePurpleColor),
                    ).align(Alignment.center),
                    Text(
                      "Monthly",
                      style: textStyleBoldCustomColor(
                          15.0.scale(), kColorThemePurpleColor),
                    ).align(Alignment.center),
                    Text(
                      "For support worker/Support coordinator",
                      style: textStyleCustomColor(10.0.scale(), kColorThemePurpleColor),
                      textAlign: TextAlign.center,
                    ).align(Alignment.center),
                    AVerticalSpace(20.0.scale()),
                    InkWell(
                      onTap: () {
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context).add(
                            HomeEventSupportWorkerApiDataClick(requestParams));
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        decoration: BoxDecoration(
                          color: kColorThemePurpleColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: kColorThemePurpleColor, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: kColorThemePurpleColor,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Text(
                          "Get start",
                          style: textStyleBoldCustomColor(
                              10.0.scale(), Colors.white),
                        ),
                      ),
                    ),
                    AVerticalSpace(10.0.scale()),
                  ])),
              AVerticalSpace(10.0.scale()),
              ListView.builder(
                itemCount: featuresList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpandCardOutside(
                    title: featuresList[index].featureName!,
                    child: ListItem(featuresList[index]),
                    box_color: kColorThemePurpleColor.withOpacity(0.8),
                  );

                },
              ).expand(),
            ],
          ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
        ));
  }

  Widget ListItem(Features featuresList) {
    return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(color: Colors.grey),
            child: Column(
                children: featuresList.featuresData?.map((e) {
                      final index = featuresList.featuresData?.indexOf(e);
                      return Row(
                        children: [
                          Text(
                            featuresList.featuresData![index!].name! + " - ",
                            maxLines: 3,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ).expand(),
                          Text(
                            featuresList.featuresData![index].value!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ).topPadding(5.0.scale()).bottomPadding(5.0.scale());
                    }).toList() ??
                    []))
        .leftPadding(5.0.scale())
        .rightPadding(10.0.scale());
  }
}
