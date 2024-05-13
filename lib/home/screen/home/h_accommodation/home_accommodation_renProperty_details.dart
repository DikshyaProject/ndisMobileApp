import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';

import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../Helpers/utils/ui_utils.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../dialogbox/get_quto_dialogbox.dart';

class RentPropertyDetailsPage extends StatefulWidget {
  RentPropertyDetailsPage();

  @override
  State<RentPropertyDetailsPage> createState() =>
      _RentPropertyDetailsPageState();
}

class _RentPropertyDetailsPageState extends State<RentPropertyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if(state is HomeAccommodationPropertyDetailsState){
          Navigator.pop(context, true);
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Property Details",
                style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),

          body: SingleChildScrollView(
            child: Column(
              children: [
                AVerticalSpace(10.0.scale()),
                ImageGallery(),
                AVerticalSpace(10.0.scale()),
                Card(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Property Name",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        14.0.scale(), Colors.black)),
                              ],
                            ),
                            Image.asset(
                              'assets/images/ic_share.png',
                              height: 20.0.scale(),
                              width: 20.0.scale(),
                            ).rightPadding(10.0.scale()),
                          ],
                        ),
                        AVerticalSpace(3.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Property Address",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(10.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/parking_area.png',
                                  height: 20.0.scale(),
                                  width: 20.0.scale(),
                                  color: Colors.green,
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "Parking",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "4",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/bed.png',
                                  height: 20.0.scale(),
                                  width: 20.0.scale(),
                                  color: Colors.green,
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "Bedroom",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "4",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/bathtub.png',
                                  height: 20.0.scale(),
                                  width: 20.0.scale(),
                                  color: Colors.green,
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "Bathroom",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "4",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                              ],
                            )
                          ],
                        ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                        AVerticalSpace(10.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/parking_area.png',
                                  height: 20.0.scale(),
                                  width: 20.0.scale(),
                                  color: Colors.green,
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "Standard parking",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "4",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/toilet.png',
                                  height: 20.0.scale(),
                                  width: 20.0.scale(),
                                  color: Colors.green,
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "Toilet",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "4",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/bathtub.png',
                                  height: 20.0.scale(),
                                  width: 20.0.scale(),
                                  color: Colors.green,
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "Bathroom",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                                AHorizontalSpace(4.0.scale()),
                                Text(
                                  "4",
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                        AVerticalSpace(10.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Avilable :",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                            AHorizontalSpace(4.0.scale()),
                            Text(
                              "12/12/2023",
                              style: textStyleCustomColor(
                                  10.0.scale(), Colors.black),
                            ),
                          ],
                        )
                      ],
                    )
                        .leftPadding(10.0.scale())
                        .rightPadding(10.0.scale())
                        .bottomPadding(10.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
                Card(
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40.0.scale(),
                      width: 100.0.scale(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_call.png',
                            height: 12.0.scale(),
                            width: 12.0.scale(),
                            color: Colors.grey,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "Call Now",
                            textAlign: TextAlign.center,
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.black),
                          ),
                        ],
                      )
                          .rightPadding(5.0.scale())
                          .leftPadding(5.0.scale())
                          .align(Alignment.center),
                    ).leftPadding(5.0.scale()),
                    Container(
                      height: 40.0.scale(),
                      width: 60.0.scale(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_like.png',
                            height: 12.0.scale(),
                            width: 12.0.scale(),
                            color: Colors.grey,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "Like",
                            textAlign: TextAlign.center,
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.black),
                          ),
                        ],
                      )
                          .rightPadding(5.0.scale())
                          .leftPadding(5.0.scale())
                          .align(Alignment.center),
                    ),
                    GestureDetector(
                      onTap: ()
                      {
                        getQuotedilogbox(context: context);
                      },
                      child: Container(
                        height: 40.0.scale(),
                        width: 100.0.scale(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/ic_speech_bubble.png',
                              height: 12.0.scale(),
                              width: 12.0.scale(),
                              color: Colors.grey,
                            ),
                            AHorizontalSpace(5.0.scale()),
                            Text(
                              "Get Quote",
                              textAlign: TextAlign.center,
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                          ],
                        )
                            .rightPadding(5.0.scale())
                            .leftPadding(5.0.scale())
                            .align(Alignment.center),
                      ).rightPadding(5.0.scale()),
                    ),
                  ],
                )
                            .topPadding(10.0.scale())
                            .bottomPadding(10.0.scale())
                            .leftPadding(5.0.scale())
                            .rightPadding(5.0.scale()))
                    .leftPadding(10.0.scale())
                    .rightPadding(10.0.scale()),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About  Testing",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                textStyleBoldBlack(14.0.scale(), Colors.black)),
                        AVerticalSpace(5.0.scale()),
                        Text(
                          "sdsdshdhs xsmbcxjhsbcs csncbjsacm sdcnjmsdbchjdsbchjdsfdsfdsfdsfdsfdsfer wt54yrgddsvd vdfvdfgfdg",
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleBlack(12.0.scale()),
                        ),
                      ],
                    )
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale())
                        .leftPadding(5.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("SDA INFORMATION",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                textStyleBoldBlack(14.0.scale(), Colors.black)),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SDA Building Type:",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                            Text(
                              "Apartment",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SDA Design Category:",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                            Text(
                              "High Physical Support",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Number of SDA Residents:",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                            Text(
                              "2",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Minimum SDA Funding amount per year:",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                            Text(
                              "450",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(4.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SDA Location:",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                            Text(
                              "australlia",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SDA Provider name:",
                              style: textStyleBlack(12.0.scale()),
                            ),
                            Text(
                              "Testing",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                      ],
                    )
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale())
                        .leftPadding(5.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("PROPERTY FEATURES",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                textStyleBoldBlack(14.0.scale(), Colors.black)),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/ic_share.png',
                              height: 15.0.scale(),
                              width: 15.0.scale(),
                            )
                                .rightPadding(10.0.scale())
                                .leftPadding(5.0.scale()),
                            Text(
                              "Accessible features (e.g. less than 3 steps, non slip flooring, bathroom with grab rails)",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/ic_share.png',
                              height: 15.0.scale(),
                              width: 15.0.scale(),
                            )
                                .rightPadding(10.0.scale())
                                .leftPadding(5.0.scale()),
                            Text(
                              "Doorway Widths > 950mm",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/ic_share.png',
                              height: 15.0.scale(),
                              width: 15.0.scale(),
                            )
                                .rightPadding(10.0.scale())
                                .leftPadding(5.0.scale()),
                            Text(
                              "Cooling",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/ic_share.png',
                              height: 15.0.scale(),
                              width: 15.0.scale(),
                            )
                                .rightPadding(10.0.scale())
                                .leftPadding(5.0.scale()),
                            Text(
                              "Study",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/ic_share.png',
                              height: 15.0.scale(),
                              width: 15.0.scale(),
                            )
                                .rightPadding(10.0.scale())
                                .leftPadding(5.0.scale()),
                            Text(
                              "Intercom",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/ic_share.png',
                              height: 15.0.scale(),
                              width: 15.0.scale(),
                            )
                                .rightPadding(10.0.scale())
                                .leftPadding(5.0.scale()),
                            Text(
                              "Furnished",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/ic_share.png',
                              height: 15.0.scale(),
                              width: 15.0.scale(),
                            )
                                .rightPadding(10.0.scale())
                                .leftPadding(5.0.scale()),
                            Text(
                              "High",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                      ],
                    )
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale())
                        .leftPadding(5.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("LOCAL AREA",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                textStyleBoldBlack(14.0.scale(), Colors.black)),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest train station at",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest tram stop at",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest bus stop at",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest ferry station at",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest shopping centre at",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest hospital at",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest park at",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "The nearest medical practice (GP) at",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                      ],
                    )
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale())
                        .leftPadding(5.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
                AVerticalSpace(5.0.scale()),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("SUPPORT",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                textStyleBoldBlack(14.0.scale(), Colors.black)),
                        AVerticalSpace(5.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Provider:",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                            Text(
                              "Devid",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Support provided at this property:",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                            Text(
                              "Onsite shared support",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tenants can bring their own core supports:",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                            Text(
                              "no",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tenants must have funding for Active Overnight Support:",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                            Text(
                              "yes",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(4.0.scale()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tenants will have a say over the provider of Onsite Overnight Assistance supports:",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: textStyleBlack(12.0.scale()),
                            ).expand(),
                            Text(
                              "yes",
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBlack(12.0.scale()),
                            ),
                          ],
                        ),
                        AVerticalSpace(6.0.scale()),
                      ],
                    )
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale())
                        .leftPadding(5.0.scale()),
                  ),
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageGallery extends StatefulWidget {
  //List<String>? galleryImage1;
  ImageGallery();
  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  late int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            currentIndex = index;

            return Card(
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 200.0.scale(),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 200.0.scale(),
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              offset: Offset(
                                  1.0, 1.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 200.0.scale(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0.scale()),
                              topLeft: Radius.circular(5.0.scale()),
                              bottomRight: Radius.circular(5.0.scale()),
                              bottomLeft: Radius.circular(5.0.scale()),
                            ),
                            child: NetworkImagesWidgets(
                              url: "https://cdn.shopify.com/s/files/1/1830/5085/products/VE0007_BCAA_Capsule_90ct_2048x2048.png?",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10.0.scale(),
                        left: MediaQuery.of(context).size.width / 2.5,
                        child: Row(children: [
                          for (int i = 0; i < 5; i++)
                            Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: i == currentIndex
                                            ? Colors.purple
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(5)))
                                .leftPadding(1.0.scale())
                        ]))
                  ],
                ),
              ),
            ).leftPadding(5.0.scale()).rightPadding(5.0.scale());
          }),
    );
  }
}
