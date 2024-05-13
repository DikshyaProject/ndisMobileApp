import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/transaction_history_model.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({super.key});

  @override
  State<TransactionListPage> createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  TransactionHistoryData? data;
  List<TransactionData>? transaction_list;
  String card_no = '';

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }



  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is TransactionHistoryClickState) {
      data = profileState.transactionHistoryModel?.data;
      transaction_list = data?.transactionData;
      print("transaction_list__ ${transaction_list?.first.currency}");
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
                "Transaction History",
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
                itemCount: transaction_list?.length,
                itemBuilder: (context, index) {
                  card_no = "${transaction_list?[index].cardNo}".substring(
                      "${transaction_list?[index].cardNo}".length - 4);
                  print("card_no___$card_no");

                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.scale(), vertical: 5.0.scale()),
                    child: Container(
                      height: 100.0.scale(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 7.0.scale(),
                                color: Colors.green.withOpacity(0.8),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0.scale()),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 60.0.scale(),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0.scale(),
                                          vertical: 5.0.scale()),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            blurRadius: 2.0,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "${DateFormat("dd").format(DateTime.parse("${transaction_list?[index].createAt}"))}",
                                            style: textStyleBoldCustomColor(
                                                16, Colors.black),
                                          ),
                                          Text(
                                            "${DateFormat("MMM").format(DateTime.parse("${transaction_list?[index].createAt}"))}",
                                            style: textStyleBoldCustomColor(
                                                16, Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    AHorizontalSpace(10.0.scale()),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Paid to ",
                                              style:
                                                  textStyleBlack(12.0.scale()),
                                            ),
                                            Text(
                                              "${transaction_list?[index].userContactMobile}",
                                              style: textStyleBoldCustomColor(
                                                  14, Colors.grey),
                                            ),
                                          ],
                                        ),
                                        AVerticalSpace(10.0.scale()),
                                        SizedBox(
                                          width: 120.0.scale(),
                                          child: Wrap(
                                            children: [
                                              Text(
                                                "Debited From ",
                                                style: textStyleBlack(
                                                    10.0.scale()),
                                              ),
                                              Text(
                                                "xxxx xxxx xxxx $card_no",
                                                style: textStyleBoldCustomColor(
                                                    12, Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 70.0.scale(),
                            child: Text(
                              "${transaction_list?[index].amount} ${transaction_list?[index].currency}",
                              style: textStyleBoldCustomColor(
                                  13.0.scale(), Colors.green),
                            ).topPadding(20.0.scale()),
                          ).align(AlignmentDirectional.topEnd),
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
