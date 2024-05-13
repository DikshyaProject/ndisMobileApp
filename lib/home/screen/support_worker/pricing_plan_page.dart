import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';

// import 'package:toggle_switch/toggle_switch.dart';

import '../../../Helpers/theme/theme.dart';
import '../../home.dart';

class PricingPlanPage extends StatefulWidget {
  @override
  State<PricingPlanPage> createState() => _PricingPlanPageState();
}

class _PricingPlanPageState extends State<PricingPlanPage> {
  List<Plan>? planList = [];
  double price = 1;

  // String PlanTypeMonthly = "Monthly";
  // String PlanTypeYearly = "Yearly";
  String planType = "Monthly";
  PricingPlanDataModel? pricingDataPlanModel;
  Map<String, dynamic>? requestParams;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomePricingPlanState) {
      planList = homeState.pricingDataPlanModel!.data!.plan!;
      pricingDataPlanModel = homeState.pricingDataPlanModel;
      requestParams = homeState.requestParams;
    }
    super.initState();
  }

  int indexcheck = 0;

  changePlan(int index) {
    if (index == 0) {
      indexcheck = index;
      planType = "Monthly";
    } else {
      indexcheck = index;
      planType = "Yearly";
    }
    // build(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomePricingPlanListingPageState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.pricingListingPage);
        }

        if (state is HomeSupportRegisterPageState) {
          Navigator.of(context).pop();
        }
      },
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              elevation: 0,
              leading: InkWell(
                  onTap: () {
                    //keyBoardHideFocusChange(context);
                    BlocProvider.of<HomeBloc>(context)
                        .add(HomeEventPricingPlanBackbtnClick());
                    print("back event");
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black, size: 30.0.scale(),))),
          body: Column(
            children: [
              Image(
                width: 180.0.scale(),
                height: 120.0.scale(),
                color: kColorThemePurpleColor,
                image: AssetImage('assets/images/ic_pricing_plan_header_icon.png'),
              ).align(Alignment.center),
              AVerticalSpace(20.0.scale()),
              Text(
                "Choose your Pricing Plan",
                style: textStyleBoldCustomColor(20.0.scale(), Colors.black),
              ),
              AVerticalSpace(25.0.scale()),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 55.0.scale(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 8),
                  color: Colors.grey, // border color
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (planType == "Monthly")
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // planType = "Monthly";
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 55.0.scale(),
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color:  kColorThemePurpleColor, width: 8),
                            color: kColorThemePurpleColor, // border color
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            "Monthly",
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.white),
                          ).align(Alignment.center),
                        ).align(Alignment.center),
                      )
                    else
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              planType = "Monthly";
                            });
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            "Monthly",
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.white),
                          )).align(Alignment.center).leftPadding(50.0.scale()),
                    if (planType == "Yearly")
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 55.0.scale(),
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: kColorThemePurpleColor, width: 8),
                              color: kColorThemePurpleColor, // border color
                              shape: BoxShape.rectangle,
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Yearly",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.white),
                            )).align(Alignment.center),
                      )
                    else
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              planType = "Yearly";
                            });
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            "Yearly",
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.white),
                          )).align(Alignment.center).rightPadding(50.0.scale())
                  ],
                ),
              ),
              AVerticalSpace(25.0.scale()),
              _GridProductListWidget(planList, price, planType,
                  pricingDataPlanModel, requestParams, showHideProgress)
            ],
          ).scroll(),
        ),
      ),
    );
  }
}

class _GridProductListWidget extends StatefulWidget {
  List<Plan>? planList;
  double price;
  String planType;
  PricingPlanDataModel? pricingDataPlanModel;
  Map<String, dynamic>? requestParams;
  Function showHideProgress1;

  _GridProductListWidget(this.planList, this.price, this.planType,
      this.pricingDataPlanModel, this.requestParams, this.showHideProgress1);

  @override
  _GridProductListWidgetState createState() => _GridProductListWidgetState();
}

class _GridProductListWidgetState extends State<_GridProductListWidget> {
  int j = 0;
  List<String> _categoryList = [];

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GoogleGrid(
      columnCount: 1,
      gap: 16.0.scale(),
      padding: const EdgeInsets.all(16.0),
      children: [
        for (int i = 0; i < widget.planList!.length; i++)
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 25,
            height: 205.0.scale(),
            child: Stack(alignment: Alignment.center, children: [
              Container(
                  height: 165.0.scale(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Container(
                      height: 30.0.scale(),
                      decoration: BoxDecoration(
                          color: kColorThemePurpleColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              10,
                            ),
                            topLeft: Radius.circular(
                              10,
                            ),
                          )),
                      child: Text(
                        widget.planList![i].planName!,
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.white),
                      ).align(Alignment.center),
                    ),
                    AVerticalSpace(5.0.scale()),
                    Text(
                      widget.planType == "Monthly"
                          ? (double.parse(
                                      widget.planList![i].planTypeMonPrice!) *
                                  widget.price)
                              .toString()
                          : (((double.parse(widget
                                              .planList![i].planTypeMonPrice!) *
                                          12.0) /
                                      double.parse(widget
                                          .planList![i].discountYearly!)) *
                                  100)
                              .toString(),
                      style: textStyleBoldCustomColor(
                          15.0.scale(), kColorThemePurpleColor),
                    ).align(Alignment.center),
                    Text(
                      widget.planType,
                      style: textStyleBoldCustomColor(
                          15.0.scale(), kColorThemePurpleColor),
                    ).align(Alignment.center),
                    Text(
                      "For support worker/Support coordinator",
                      style: textStyleCustomColor(
                          10.0.scale(), kColorThemePurpleColor),
                      textAlign: TextAlign.center,
                    ).align(Alignment.center),
                  ])),
              if (widget.planList![i].planName == "Support Worker")
                Positioned(
                  top: 172.0.scale(),
                  child: GestureDetector(
                    onTap: () {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeEventPlanPricingListBtnClick(
                              widget.planList![i].features!,
                              widget.pricingDataPlanModel,
                              widget.planList![i],
                              widget.requestParams));
                    },
                    child: Container(
                      width: 100.0.scale(),
                      alignment: Alignment.center,
                      height: 25.0.scale(),
                      decoration: BoxDecoration(
                        color: kColorThemePurpleColor,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: kColorThemePurpleColor, width: 2),
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
                      ).align(Alignment.center),
                    ).leftPadding(5.0.scale()).rightPadding(5.0.scale()),
                  ),
                ),
            ]),
          ),
      ],
    );
  }
}
