import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/order_detail_model.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  OrderDetail? orderDetail;
  String address = "";
  String screen = "";



  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is OrderDetailClickState) {
      orderDetail = profileState.orderDetailModel?.data?.orderDetail;
      address =
          "${orderDetail?.userAddress}, ${orderDetail?.userCity}, ${orderDetail?.userState}, ${orderDetail?.userCountry}, ${orderDetail?.userZipCode}";
      screen = profileState.screenName;
      print("orderDetail___${orderDetail?.userAddress} screen $screen");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (screen == "my_order") if (state is MyOrdersClickState) {
          showHideProgress(false);
           
          Navigator.of(context).pop();
        }

        if (screen == "order_history") if (state is OrderHistoryClickState) {
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
              "Order Detail",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0.scale(),
                  fontWeight: FontWeight.w700),
            ),
            leading: InkWell(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(ProfileEventBackBtnClick(screen));
                },
                child: Icon(Icons.arrow_back, color: Colors.white))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 220.0.scale(),
                child: ListView.builder(
                  itemCount: orderDetail?.productList?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: 220.0.scale(),
                          width: MediaQuery.of(context).size.width,
                          child: NetworkImagesWidgets(
                            url:
                                "${orderDetail?.productList?[index].galleryImage}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0.scale(), vertical: 5.0.scale()),
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Text(
                                  "${orderDetail?.productList?[index].offer} %",
                                  style: textStyleCustomColor(
                                      14.0.scale(), Colors.white),
                                ),
                                Text(
                                  "Discount",
                                  style: textStyleBoldCustomLargeColor(
                                      14.0.scale(), Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0.scale(),
                                vertical: 5.0.scale()),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${orderDetail?.productList?[index].productName}",
                                      style: textStyleBoldCustomLargeColor(
                                          15.0.scale(), Colors.white),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${orderDetail?.productList?[index].price} AUD",
                                          style: textStyleCustomColor(
                                              12.0.scale(), Colors.white),
                                        ),
                                        Text(
                                          "Quantity : ${orderDetail?.productList?[index].quantity}",
                                          style: textStyleCustomColor(
                                              12.0.scale(), Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                AVerticalSpace(10.0.scale()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 0;
                                        i <
                                            int.parse(
                                                "${orderDetail?.productList?.length}");
                                        i++)
                                      Container(
                                        height: 8.0.scale(),
                                        width: 8.0.scale(),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: index == i
                                                ? Colors.white
                                                : Colors.white
                                                    .withOpacity(0.5)),
                                      ).leftPadding(3.0.scale()),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ).rightPadding(5.0.scale());
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0.scale(), vertical: 5.0.scale()),
                width: MediaQuery.of(context).size.width,
                color: kColorThemePurpleColor,
                child: Text(
                  'Order Detail',
                  style:
                      textStyleBoldCustomLargeColor(12.0.scale(), Colors.white),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0.scale(), vertical: 5.0.scale()),
                  width: MediaQuery.of(context).size.width,
                  color: kColorThemePurpleColor.withOpacity(0.1),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120.0.scale(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer Name',
                              style: textStyleBoldCustomLargeColor(
                                  13.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              'Order ID',
                              style: textStyleBoldCustomLargeColor(
                                  13.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              'Contact Number',
                              style: textStyleBoldCustomLargeColor(
                                  13.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              'Email',
                              style: textStyleBoldCustomLargeColor(
                                  13.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              'Address',
                              style: textStyleBoldCustomLargeColor(
                                  13.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200.0.scale(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": ${orderDetail?.userContactName}",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              ": ${orderDetail?.orderId}",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              ": ${orderDetail?.userContactMobile}",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              ": ${orderDetail?.userContactEmail}",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              ": $address",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0.scale(), vertical: 5.0.scale()),
                width: MediaQuery.of(context).size.width,
                color: kColorThemePurpleColor,
                child: Text(
                  'Payment Detail',
                  style:
                      textStyleBoldCustomLargeColor(12.0.scale(), Colors.white),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0.scale(), vertical: 5.0.scale()),
                  width: MediaQuery.of(context).size.width,
                  color: kColorThemePurpleColor.withOpacity(0.1),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120.0.scale(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaction Id',
                              style: textStyleBoldCustomLargeColor(
                                  13.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              'Status',
                              style: textStyleBoldCustomLargeColor(
                                  13.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              'Total Amount',
                              style: textStyleBoldCustomLargeColor(
                                  13.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200.0.scale(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": ${orderDetail?.transactionId}",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              ": ${orderDetail?.status}",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            Text(
                              ": ${orderDetail?.amount} ${orderDetail?.currency}",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 10,
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0.scale(), vertical: 5.0.scale()),
                width: MediaQuery.of(context).size.width,
                color: kColorThemePurpleColor,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
