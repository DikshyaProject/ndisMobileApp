import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/payment_invoices_model.dart';

class PaymentInvoicePage extends StatefulWidget {
  const PaymentInvoicePage({super.key});

  @override
  State<PaymentInvoicePage> createState() => _PaymentInvoicePageState();
}

class _PaymentInvoicePageState extends State<PaymentInvoicePage> {
  InvoicesData? data;
  List<InvoiceList>? invoic_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is PaymentInvoiceState) {
      data = profileState.invoicesModel?.data;
      invoic_list = data?.invoiceList;

      print("invoic_list___${invoic_list?.first.amount}");
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
              "Invoices",
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
            itemCount: invoic_list?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0.scale(), vertical: 5.0.scale()),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0.scale(), vertical: 10.0.scale()),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0.scale()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${invoic_list?[index].productName}".toUpperCase(),
                            maxLines: 1,
                            style: textStyleBoldCustomColor(
                                12.0.scale(), Colors.black),
                          ),
                          Text(
                            "\$${invoic_list?[index].amount}",
                            maxLines: 1,
                            style: textStyleBoldCustomColor(
                                12.0.scale(), Colors.black),
                          ),
                        ],
                      ),
                      Text(
                        DateFormat('dd, MMM yyyy').format(DateTime.parse(
                            "${invoic_list?[index].paymentDate}")),
                        maxLines: 1,
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.black.withOpacity(0.3)),
                      ),
                      AVerticalSpace(10.0.scale()),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.0.scale(),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0.scale())),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download,
                              color: Colors.white,
                              size: 13.0.scale(),
                            ),
                            Text(
                              "Download Invoice",
                              style: textStyleBoldCustomColor(
                                  13.0.scale(), Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      )),
    );
  }
}
