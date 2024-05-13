import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Helpers/services/shared_preferences.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/market_place/market_place_vehial_list_model.dart';
MarketPlaceAllVehivalData? marketPlaceAllVehivalData;
List<VehicleList>? vehicleList=[];
List<UserList>? userList=[];

class MarketPlaceVehicalSale extends StatefulWidget {
  const MarketPlaceVehicalSale({super.key});

  @override
  State<MarketPlaceVehicalSale> createState() => _MarketPlaceVehicalSaleState();
}

class _MarketPlaceVehicalSaleState extends State<MarketPlaceVehicalSale> {
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }
  bool _hasCallSupport = false;
  Future<void>? _launched;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if(homeState is HomeMarketPlaceProductForVehicalSaleState){
      marketPlaceAllVehivalData=homeState.marketPlaceAllVehivalData;
      vehicleList=marketPlaceAllVehivalData!.vehicleList;
      userList =marketPlaceAllVehivalData!.userList;
    }
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override

    Widget build(BuildContext context) {
      return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          print("state in mp__$state");
          if (state is HomeMpVehicalDetailPageState)
          {
            showHideProgress(false);
            Navigator.of(context).pushNamed(HomeNavigator.hvehicalDetailsPage);
          } if (state is HomeerrorloadingState)
          {
            showHideProgress(false);
            Navigator.pop(context);
            showSnackBar(state.message,Colors.black , context);
          }
          if (state is HomeMarketPlaceBtnClickState) {
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
                      "All Products",
                      style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                    ),
                    leading: InkWell(
                        onTap: () {
                          BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white))),
                body: ListView.builder(
                    itemCount: vehicleList!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(HomeMpVehicalDetailPageBtnClick("${vehicleList?[index].productId}"));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0.scale(), vertical: 10.0.scale()),
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

                              child:   Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100.0.scale(),
                                        width: 100.0.scale(),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0.scale()),
                                            border: Border.all(color: Colors.grey)
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          child: NetworkImagesWidgets(
                                            url: vehicleList![index].productImage!,
                                            fit: BoxFit.cover,
                                          ),

                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            vehicleList![index].productSlug!,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_locationlist.png',
                                                height: 15.0.scale(),
                                                width: 15.0.scale(),
                                                color: Colors.green,
                                              ),
                                              AHorizontalSpace(4.0.scale()),
                                              Text("Sukhliya, Indore MP",
                                                // vehicleList![index].listingAddress!,
                                                maxLines:
                                                3,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: textStyleCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ).expand(),

                                            ],
                                          ),
                                          AVerticalSpace(2.0.scale()),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,

                                            children: [
                                              Image.asset(
                                                'assets/images/ic_call.png',
                                                height: 15.0.scale(),
                                                width: 15.0.scale(),
                                                color: Colors.green,
                                              ),
                                              AHorizontalSpace(4.0.scale()),
                                              Text( "${userList?[index].mobileNumber}",
                                                style: textStyleCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),


                                            ],
                                          ),
                                          AVerticalSpace(2.0.scale()),
                                          SizedBox(
                                            child: Row(
                                              // runAlignment: WrapAlignment.start,
                                              // alignment: WrapAlignment.start,
                                              children: [
                                                Image.asset(
                                                  'assets/images/ic_emailnew.png',
                                                  height: 15.0.scale(),
                                                  width: 15.0.scale(),
                                                  color: Colors.green,
                                                ),
                                                AHorizontalSpace(4.0.scale()),
                                                SizedBox(
                                                  width: 120.0.scale(),
                                                  child: Text(
                                                    "${userList?[index].emailId}",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: textStyleCustomColor(
                                                        12.0.scale(), Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ).leftPadding(5.0.scale()).rightPadding(5.0.scale()).expand(),
                                      Column(
                                        children: [
                                          Text(
                                            "\$ "+vehicleList![index].productPrice!,
                                            textAlign: TextAlign.center,
                                            style: textStyleBoldCustomColor(12.0.scale(), Colors.black),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          AVerticalSpace(5.0.scale()),
                                          InkWell(
                                            onTap: (){
                                              if (sharedPrefs.IsLogin){
                                                if(_hasCallSupport){
                                                  setState(() {
                                                    _launched = _makePhoneCall("${userList?[index].mobileNumber}");
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
                                    ],).leftPadding(5.0.scale()).rightPadding(5.0.scale()).topPadding(
                                      5.0.scale()),
                                  AVerticalSpace(5.0.scale()),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.speed,
                                          size: 15.0.scale(),
                                          color: Colors.grey,
                                        ),
                                          AHorizontalSpace(4.0.scale()),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${vehicleList?[index].odometer}",
                                                style: textStyleBoldCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),
                                              Text("Odometer",
                                                style: textStyleCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.hourglass_bottom,
                                          size: 15.0.scale(),
                                          color: Colors.grey,
                                        ),
                                          AHorizontalSpace(4.0.scale()),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${vehicleList?[index].transmission}",
                                                style: textStyleBoldCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),
                                              Text("Transmission",
                                                style: textStyleCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.wheelchair_pickup,
                                          size: 15.0.scale(),
                                          color: Colors.grey,
                                        ),
                                          AHorizontalSpace(4.0.scale()),

                                          SizedBox(
                                            width: 100.0.scale(),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("${vehicleList?[index].wheelchairPosition}",
                                                  style: textStyleBoldCustomColor(
                                                      12.0.scale(), Colors.black),
                                                ),
                                                Text("Wheelchair Position",
                                                  style: textStyleCustomColor(
                                                      12.0.scale(), Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],),
                                    ],),
                                  Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ramp_left,
                                          size: 15.0.scale(),
                                          color: Colors.grey,
                                        ),
                                          AHorizontalSpace(4.0.scale()),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${vehicleList?[index].rampType}",
                                                style: textStyleBoldCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),
                                              Text("Ramp Type",
                                                style: textStyleCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],),
                                      AHorizontalSpace(5.0.scale()),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.scatter_plot,
                                          size: 15.0.scale(),
                                          color: Colors.grey,
                                        ),
                                          AHorizontalSpace(4.0.scale()),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${vehicleList?[index].hatchback}",
                                                style: textStyleBoldCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),
                                              Text("Hatchback",
                                                style: textStyleCustomColor(
                                                    12.0.scale(), Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],),
                                    ],),

                                  AVerticalSpace(20.0.scale()),
                                  Row(
                                    children: [
                                      Text(
                                        "Type of Property :",
                                        textAlign: TextAlign.center,
                                        style: textStyleBoldCustomColor(
                                            12.0.scale(), Colors.black),
                                      ).leftPadding(5.0.scale()),
                                      AHorizontalSpace(5.0.scale()),
                                      Text("thsjkhjkhkj",
                                        // vehicleList![index].propertyType!,
                                        textAlign: TextAlign.center,
                                        style: textStyleCustomColor(10.0.scale(), Colors.grey),
                                      ).rightPadding(5.0.scale()).leftPadding(5.0.scale()).align(
                                          Alignment.center),


                                    ],
                                  ),

                                  AVerticalSpace(5.0.scale()),

                                ],
                              ))
                          // Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(15),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.black.withOpacity(0.3),
                          //           blurRadius: 2.0,
                          //         ),
                          //       ],
                          //     ),
                          //     child: Column(
                          //       children: [
                          //         Stack(
                          //           children: [
                          //             Container(
                          //               height: 200.0.scale(),
                          //               width: MediaQuery.of(context).size.width,
                          //               child: ClipRRect(
                          //                 borderRadius: BorderRadius.only(
                          //                   topLeft: Radius.circular(15),
                          //                   topRight: Radius.circular(15),
                          //                 ),
                          //                 child: NetworkImagesWidgets(
                          //                   url: vehicleList![index].productImage!,
                          //                   fit: BoxFit.cover,
                          //                 ),
                          //
                          //               ),
                          //             ),
                          //             Positioned(
                          //               left: 15,
                          //               top: 20,
                          //               child: Container(
                          //                   padding: EdgeInsets.all(5.0.scale()),
                          //                   decoration: BoxDecoration(
                          //                       color: Colors.red,
                          //                       borderRadius:
                          //                       BorderRadius.circular(10)),
                          //                   child: Text(
                          //                     '- '+ vehicleList![index].productPriceOffer!+' %'+' off',
                          //                     style: textStyleBoldCustomLargeColor(
                          //                         14.0.scale(), Colors.white),
                          //                   )),
                          //             ),
                          //             Positioned(
                          //               right: 15,
                          //               top: 20,
                          //               child: Container(
                          //                   padding: EdgeInsets.all(10.0.scale()),
                          //                   decoration: BoxDecoration(
                          //                       color: Colors.black.withOpacity(0.3),
                          //                       borderRadius:
                          //                       BorderRadius.circular(100)),
                          //                   child: Image.asset(
                          //                     'assets/images/cart.png',
                          //                     height: 25.0.scale(),
                          //                     width: 25.0.scale(),
                          //                   )),
                          //             ),
                          //           ],
                          //         ),
                          //         AVerticalSpace(10.0.scale()),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Text(
                          //               vehicleList![index].productName!,
                          //               maxLines: 2,
                          //               overflow: TextOverflow.ellipsis,
                          //               style: textStyleBoldCustomLargeColor(
                          //                   16.0.scale(), Colors.black),
                          //             ).expand(),
                          //             Text(
                          //               "\$"+vehicleList![index].productPrice!,
                          //               style: textStyleBoldCustomLargeColor(
                          //                   16.0.scale(), Colors.red),
                          //             ),
                          //           ],
                          //         )
                          //             .leftPadding(15.0.scale())
                          //             .rightPadding(15.0.scale()),
                          //         AVerticalSpace(5.0.scale()),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Row(
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Image.asset(
                          //                   'assets/images/ic_star.png',
                          //                   height: 15,
                          //                   fit: BoxFit.fill,
                          //                 ),
                          //                 AHorizontalSpace(2.0.scale()),
                          //                 Text(
                          //                   "4.2",
                          //                   style: textStyleCustomColor(
                          //                       12.0.scale(), Colors.black),
                          //                 ),
                          //               ],
                          //             ),
                          //
                          //
                          //             Text('VIEW DETAIL',  style: textStyleBoldCustomLargeColor(15.0.scale(), kColorThemePurpleColor),)
                          //           ],
                          //         ) .leftPadding(15.0.scale())
                          //             .rightPadding(15.0.scale()),
                          //         AVerticalSpace(20.0.scale()),
                          //       ],
                          //     )),
                        ),
                      );
                    }))),
      );
    }

}
