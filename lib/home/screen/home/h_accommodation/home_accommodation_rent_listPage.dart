import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Helpers/services/shared_preferences.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../Helpers/utils/ui_utils.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/market_place/ndis_propety_sale.dart';

class AccommodationRentalListPage extends StatefulWidget {
  AccommodationRentalListPage();

  @override
  State<AccommodationRentalListPage> createState() =>
      _AccommodationRentalListPAgeState();
}

class _AccommodationRentalListPAgeState
    extends State<AccommodationRentalListPage> {
  NDISPropertySaleData? ndisPropertySaleData;
  List<AllPropertyListings>? allPropertyListings = [];
  bool _hasCallSupport = false;
  Future<void>? _launched;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeAccommodationHousingforRentState) {
      ndisPropertySaleData = homeState.ndisPropertySaleData;
      allPropertyListings = ndisPropertySaleData!.allPropertyListings;
    }
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeAccommodationPropertyDetailsState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.hHomeAccomodationPropertyDetailsPage);
        }
        if (state is HomeAccommodationHousingState) {
          Navigator.pop(context, true);
        }
        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context)
              .add(HomeAccommodationHousingforRentBtnClick("rental", ''));
          showSnackBar(state.message, Colors.black, context);
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Property for Rent",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(HomeEventBackBtnClick(''));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),
          body: ListView.builder(
              itemCount: allPropertyListings!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showHideProgress(true);
                    BlocProvider.of<HomeBloc>(context).add(
                        HomeAccommodationPropertyDetailsBtnClick(
                            allPropertyListings![index].listingId));
                  },
                  child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: kColorThemePurpleColor,
                                blurRadius: 2.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5.0.scale()),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100.0.scale(),
                                    width: 100.0.scale(),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(color: Colors.grey)),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      child: NetworkImagesWidgets(
                                        url: allPropertyListings![index]
                                            .profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  AHorizontalSpace(5.0.scale()),
                                  SizedBox(
                                    width: 170.0.scale(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          allPropertyListings![index]
                                              .listingName!,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: textStyleBoldCustomColor(
                                              12.0.scale(), Colors.black),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/images/ic_locationlist.png',
                                              height: 15.0.scale(),
                                              width: 15.0.scale(),
                                              color: Colors.green,
                                            ),
                                            AHorizontalSpace(4.0.scale()),
                                            Text(
                                              allPropertyListings![index]
                                                  .listingAddress!,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: textStyleCustomColor(
                                                  12.0.scale(), Colors.black),
                                            ).expand(),
                                          ],
                                        ),
                                        AVerticalSpace(2.0.scale()),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/images/ic_call.png',
                                              height: 15.0.scale(),
                                              width: 15.0.scale(),
                                              color: Colors.green,
                                            ),
                                            AHorizontalSpace(4.0.scale()),
                                            Text(
                                              allPropertyListings![index]
                                                  .mobileNumber!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: textStyleCustomColor(
                                                  12.0.scale(), Colors.black),
                                            ),
                                          ],
                                        ),
                                        AVerticalSpace(2.0.scale()),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/images/ic_emailnew.png',
                                              height: 15.0.scale(),
                                              width: 15.0.scale(),
                                              color: Colors.green,
                                            ),
                                            AHorizontalSpace(4.0.scale()),
                                            Text(
                                              allPropertyListings![index]
                                                  .emailId!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: textStyleCustomColor(
                                                  12.0.scale(), Colors.black),
                                            ).expand(),
                                          ],
                                        )
                                      ],
                                    )
                                        .leftPadding(5.0.scale())
                                        .rightPadding(5.0.scale()),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "\$ " +
                                            allPropertyListings![index]
                                                .rent_co_per_week!,
                                        textAlign: TextAlign.center,
                                        style: textStyleBoldCustomColor(
                                            12.0.scale(), Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      AVerticalSpace(5.0.scale()),
                                      InkWell(
                                        onTap: (){
                                          if (sharedPrefs.IsLogin){
                                            if(_hasCallSupport){
                                              setState(() {
                                                _launched = _makePhoneCall("${allPropertyListings?[index].mobileNumber}");
                                              });
                                            }
                                          }else{
                                            showSnackBar('Please login first.', Colors.black, context);
                                          }

                                        },
                                        child: Container(
                                          height: 22.0.scale(),
                                          width: 50.0.scale(),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color: Colors.green),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.call,
                                                size: 13.0.scale(),
                                                color: Colors.green,
                                              ),
                                              AHorizontalSpace(2.0.scale()),
                                              Text(
                                                "Call",
                                                textAlign: TextAlign.center,
                                                style: textStyleBoldCustomColor(
                                                    10.0.scale(), Colors.green),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                                  .leftPadding(5.0.scale())
                                  .rightPadding(5.0.scale())
                                  .topPadding(5.0.scale()),
                              AVerticalSpace(10.0.scale()),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Row(
                              //       children: [ Image.asset(
                              //         'assets/images/ic_call.png',
                              //         height: 20.0.scale(),
                              //         width: 20.0.scale(),
                              //         color: Colors.black,
                              //       ),
                              //         AHorizontalSpace(4.0.scale()),
                              //
                              //         Text("Bedroom",
                              //           style: textStyleCustomColor(
                              //               12.0.scale(), Colors.black),
                              //         ),
                              //
                              //         AHorizontalSpace(4.0.scale()),
                              //         Text("4",
                              //           style: textStyleCustomColor(
                              //               12.0.scale(), Colors.black),
                              //         ),
                              //
                              //
                              //       ],),
                              //     Row(
                              //       children: [ Image.asset(
                              //         'assets/images/ic_call.png',
                              //         height: 20.0.scale(),
                              //         width: 20.0.scale(),
                              //         color: Colors.black,
                              //       ),
                              //         AHorizontalSpace(4.0.scale()),
                              //
                              //         Text("Bedroom",
                              //           style: textStyleCustomColor(
                              //               12.0.scale(), Colors.black),
                              //         ),
                              //
                              //         AHorizontalSpace(4.0.scale()),
                              //         Text("4",
                              //           style: textStyleCustomColor(
                              //               12.0.scale(), Colors.black),
                              //         ),
                              //
                              //
                              //       ],),
                              //     Row(
                              //       children: [ Image.asset(
                              //         'assets/images/ic_call.png',
                              //         height: 20.0.scale(),
                              //         width: 20.0.scale(),
                              //         color: Colors.black,
                              //       ),
                              //         AHorizontalSpace(4.0.scale()),
                              //
                              //         Text("Bedroom",
                              //           style: textStyleCustomColor(
                              //               12.0.scale(), Colors.black),
                              //         ),
                              //
                              //         AHorizontalSpace(4.0.scale()),
                              //         Text("4",
                              //           style: textStyleCustomColor(
                              //               12.0.scale(), Colors.black),
                              //         ),
                              //
                              //
                              //       ],)
                              //   ],).leftPadding(10.0.scale()).rightPadding(10.0.scale()),

                              AVerticalSpace(10.0.scale()),
                              Row(
                                children: [
                                  Text(
                                    "Type of Property :",
                                    textAlign: TextAlign.center,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ).leftPadding(5.0.scale()),
                                  AHorizontalSpace(5.0.scale()),
                                  Text(
                                    "${allPropertyListings?[index].typeOfPropertyDetail?.first.typeOfPropertyType}",
                                    style: textStyleBoldCustomColor(
                                        10.0.scale(), Colors.grey),
                                  )
                                      .rightPadding(5.0.scale())
                                      .leftPadding(5.0.scale())
                                      .align(Alignment.center),
                                ],
                              ),
                              AVerticalSpace(5.0.scale()),

                            ],
                          ))
                      .leftPadding(10.0.scale())
                      .rightPadding(10.0.scale())
                      .topPadding(10.0.scale()),
                );
              }),
        ),
      ),
    );
  }
}
