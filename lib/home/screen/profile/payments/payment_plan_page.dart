import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
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

import '../../../profile_model/payments_model.dart';

class PaymentPlanPage extends StatefulWidget {
  const PaymentPlanPage({super.key});

  @override
  State<PaymentPlanPage> createState() => _PaymentPlanPageState();
}

class _PaymentPlanPageState extends State<PaymentPlanPage> {
  PaymentData? payment_data;
  List<PaymentStatusList>? payment_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is PaymentsClickState) {
      payment_data = profileState.paymentsModel?.data;
      payment_list = payment_data?.paymentStatusList;
      print("payment_list___${payment_list?.first.name}");
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
              "Payment & Plan",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.0.scale(), vertical: 8.0.scale()),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0.scale(), vertical: 8.0.scale()),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0.scale()),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 95.0.scale(),
                        width: 90.0.scale(),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.scale()),
                            border: Border.all(color: Colors.grey)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0.scale()),
                            child: NetworkImagesWidgets(
                              url: sharedPrefs.userImage,
                            )),
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name ",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                          Text(
                            "Start Date ",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                          Text(
                            "Expiry Date ",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                          Text(
                            "Duration ",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                          Text(
                            "Remaining Days ",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                        ],
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ": ${payment_list?[0].name}".toUpperCase(),
                            style: textStyleCustomColor(12, Colors.black),
                          ),
                          Text(
                            ": ${payment_list?[0].startDate}",
                            style: textStyleCustomColor(12, Colors.black),
                          ),
                          Text(
                            ": ${payment_list?[0].expiryDate}",
                            style: textStyleCustomColor(12, Colors.black),
                          ),
                          Text(
                            ": ${payment_list?[0].duration}",
                            style: textStyleCustomColor(12, Colors.black),
                          ),
                          Text(
                            ": ${payment_list?[0].remainingDays}",
                            style: textStyleCustomColor(12, Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text(
                    "${payment_list?[0].userPlan} Plan",
                    style: textStyleBoldCustomColor(20, Colors.green),
                  ),
                  AVerticalSpace(10.0.scale()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0.scale(), vertical: 3.0.scale()),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(30.0.scale()),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Text(
                            "Checkout Amount: ${payment_list?[0].checkoutAmount}",
                            textAlign: TextAlign.center,
                            style: textStyleBoldCustomColor(12, Colors.white),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width/2.3,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0.scale(), vertical: 3.0.scale()),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(30.0.scale()),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Text(
                            "Payment Status: ${payment_list?[0].paymentStatus}",
                            textAlign: TextAlign.center,
                            style: textStyleBoldCustomColor(12, Colors.white),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
