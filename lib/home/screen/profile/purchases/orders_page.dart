import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/home_navigator.dart';

import '../../../profile_model/my_orders_model.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  MyOrderData? my_order_data;
  List<OrderList>? order_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }



  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is MyOrdersClickState) {
      my_order_data = profileState.myOrdersModel?.data;
      order_list = my_order_data?.orderList;
      print("order_list___${order_list?.first.orderId}");
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
        if (state is OrderDetailClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.OrderDetailPage);
        }
        if (state is ProfileErrorState) {
          showHideProgress(false);
          showSnackBar(state.message!, Colors.red, context);
          BlocProvider.of<HomeBloc>(context).add(ProfileResetEvent());
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Orders",
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
                itemCount: order_list?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context).add(
                          OrderDetailClickEvent(
                              "${order_list?[index].orderId}", "my_order"));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10.0.scale(), bottom: 10.0.scale()),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 10.0.scale(),
                          bottom: 10.0.scale(),
                        ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0.scale()),
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          borderRadius: BorderRadius.circular(
                                              15.0.scale())),
                                      child: Text(
                                        "ORDER ID - ${order_list?[index].orderId}",
                                        style: textStyleBoldCustomColor(
                                            10, Colors.white),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0.scale()),
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          borderRadius: BorderRadius.circular(
                                              15.0.scale())),
                                      child: Text(
                                        "Transaction Id- ${order_list?[index].transactionId}",
                                        style: textStyleBoldCustomColor(
                                            10, Colors.white),
                                      )),
                                ),
                              ],
                            ),
                            AVerticalSpace(8.0.scale()),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 130.0.scale(),
                                  child: Text(
                                    "Name",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black),
                                  ).leftPadding(10.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Expanded(
                                  child: Text(
                                    ": ${order_list?[index].name}",
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
                                    "Amount",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black),
                                  ).leftPadding(10.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Expanded(
                                  child: Text(
                                    ": ${order_list?[index].amount}",
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
                                    "Payment",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black),
                                  ).leftPadding(10.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Expanded(
                                  child: Text(
                                    ": ${order_list?[index].paymentStatus}",
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
                                    "Date",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black),
                                  ).leftPadding(10.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Expanded(
                                  child: Text(
                                    ": ${DateFormat('dd, MMM yyyy, HH:mm a').format(DateTime.parse("${order_list?[index].date}"))}",
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
                                    "Status",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black),
                                  ).leftPadding(10.0.scale()),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Expanded(
                                  child: Text(
                                    ": ${order_list?[index].status}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack(12.0.scale()),
                                  ).rightPadding(10.0.scale()),
                                ),
                              ],
                            ),
                          ],
                        ),
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
