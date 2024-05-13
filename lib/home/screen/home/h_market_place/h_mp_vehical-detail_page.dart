import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';

import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_separator_line.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/market_place/mp_vehical_details_model.dart';

class vehicalDetailsPage extends StatefulWidget {
  const vehicalDetailsPage({super.key});

  @override
  State<vehicalDetailsPage> createState() => _vehicalDetailsPageState();
}

class _vehicalDetailsPageState extends State<vehicalDetailsPage> {
  VehicalDetailsData? vehicalDetailsData;
  VehicleDetail? vehicleDetail;
  List<String>? galleryImage=[];
  int count = 1;
  increment() {
    if(count<=10){
      count++;
    }
  }
  decrement() {
    if(count>1){
      count--;
    }
  }
  int _current = 0;
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if(homeState is HomeMpVehicalDetailPageState){
      vehicalDetailsData=homeState.vehicalDetailsData;
      vehicleDetail=vehicalDetailsData!.vehicleDetail;
      galleryImage=vehicleDetail!.galleryImage;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if(state is HomeMarketPlaceProductForVehicalSaleState){
          Navigator.of(context).pop();
        }
        if(state is HomeMyCartPageClickState){
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hMarketPlaceMycartPage);
          showSnackBar(state.message,Colors.black , context);
        }
        if(state is HomeerrorloadingState){
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context).add(HomeMpVehicalDetailPageBtnClick("${vehicalDetailsData?.vehicleDetail?.productId}"));
          showSnackBar(state.message,Colors.black , context);
        }
      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Vehical Details",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),

            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:15.0.scale(),),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AVerticalSpace(10.0.scale()),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 300.0.scale(),
                              viewportFraction: 1,
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }
                          ),
                          items: galleryImage!.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal:3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black, width:1),

                                  ),child:  ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0.scale()),
                                    topLeft: Radius.circular(5.0.scale()),
                                    bottomRight: Radius.circular(5.0.scale()),
                                    bottomLeft: Radius.circular(5.0.scale()),
                                  ),
                                  child: NetworkImagesWidgets(
                                    url:  i,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                );
                              },
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(bottom: 10.0.scale()),
                          child: DotsIndicator(
                            dotsCount: galleryImage!.length,
                            position: _current,
                            decorator: DotsDecorator(
                              color: Colors.black.withOpacity(0.3),
                              activeColor: kColorThemePurpleColor,
                            ),
                          ),
                        )
                      ],
                    ),

                    AVerticalSpace(10.0.scale()),
                    Text(vehicleDetail!.productName!,  style: textStyleBoldCustomLargeColor(17.0.scale(), Colors.black),),
                    AVerticalSpace(10.0.scale()),
                    Row(
                      children: [
                        Text('\$'+vehicleDetail!.productPrice!,  style: textStyleBoldCustomLargeColor(20.0.scale(), Colors.black),),
                        AHorizontalSpace(10.0.scale()),
                        Text( vehicleDetail!.productPriceOffer!+'% off',  style: textStyleBoldCustomLargeColor(20.0.scale(), Color(0xff048D11)),),
                      ],
                    ),
                    AVerticalSpace(10.0.scale()),
                    // Text('Highlights -',  style: textStyleCustomColor(15.0.scale(), Color(0xff363636)),),
                    // AVerticalSpace(10.0.scale()),
                    // Row(
                    //   children: [
                    //     Container(
                    //         padding: EdgeInsets.all(5.0.scale()),
                    //         decoration: BoxDecoration(
                    //             border: Border.all(color: Colors.black.withOpacity(0.3))
                    //         ),
                    //         child: Image.asset('assets/images/play.png', height: 25.0.scale(),)),
                    //     AHorizontalSpace(10.0.scale()),
                    //     Text( vehicleDetail!.productHighlights!+' years warranty From Billing Date',  style: textStyleCustomColor(13.0.scale(), Color(0xff363636)),),
                    //   ],
                    // ),
                    // AVerticalSpace(20.0.scale()),
                    ASeparatorLine(
                      height: 1.0.scale(),
                      color: Colors.grey.withOpacity(0.3),
                    ),

                    AVerticalSpace(10.0.scale()),
                    Text('Descriptions -',  style: textStyleCustomColor(15.0.scale(), Color(0xff363636)),),
                    AVerticalSpace(10.0.scale()),
                    Text(vehicleDetail!.productDescription!,
                      style: textStyleCustomColor(13.0.scale(), Color(0xff363636)),),
                    AVerticalSpace(10.0.scale()),


                    ASeparatorLine(
                      height: 1.0.scale(),
                      color: Colors.grey.withOpacity(0.3),
                    ),

                    AVerticalSpace(30.0.scale()),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.scale(), vertical: 10.0.scale()),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text('Created by',  style: textStyleCustomColor(20.0.scale(), Color(0xff363636)),).align(Alignment.center),
                          AVerticalSpace(10.0.scale()),
                          Container(
                              width:  70.0.scale(),
                              height: 70.0.scale(),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.grey, width: 2.0.scale())
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: NetworkImagesWidgets(
                                  url:  vehicleDetail!.userDetail!.profileImage!,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          AVerticalSpace(10.0.scale()),
                          Text(vehicleDetail!.userDetail!.userName!,  style: textStyleCustomColor(18.0.scale(), Color(0xff363636)),).align(Alignment.center),
                          Text("Join On ${vehicleDetail?.joinOn}",  style: textStyleCustomColor(15.0.scale(), Color(0xff8A8A8A)),).align(Alignment.center),
                          AVerticalSpace(10.0.scale()),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            padding: EdgeInsets.symmetric(vertical: 10.0.scale()),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff00BDAA)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.share, color: Colors.white, ),
                                AHorizontalSpace(10.0.scale()),
                                Text('Share Now',  style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.white,),),
                              ],
                            ),
                          ),
                          AVerticalSpace(10.0.scale()),

                        ],
                      ),
                    ),
                    AVerticalSpace(30.0.scale()),

                  ],
                ),
              ),
            ),
            // bottomNavigationBar: Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //
            //     AVerticalSpace(10.0.scale()),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         InkWell(
            //           onTap: (){
            //             setState(() {
            //               decrement();
            //             });
            //           },
            //           child: Container(
            //             padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
            //             decoration: BoxDecoration(
            //                 color: Color(0xffE6E6E6),
            //                 borderRadius: BorderRadius.circular(5)
            //             ),
            //             child: Center(child: Text("-", style: textStyleBoldCustomColor(30.0.scale(),Color(0xff797979),),)),
            //           ),
            //         ),
            //         AHorizontalSpace(20.0.scale()),
            //         Text("$count", style: textStyleBoldCustomColor(20.0.scale(), Colors.black,),),
            //         AHorizontalSpace(20.0.scale()),
            //         InkWell(
            //           onTap: (){
            //             setState(() {
            //               increment();
            //             });
            //           },
            //           child: Container(
            //             padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
            //             decoration: BoxDecoration(
            //                 color: Color(0xff1DB404),
            //                 borderRadius: BorderRadius.circular(5)
            //             ),
            //             child: Center(child: Text("+", style: textStyleBoldCustomColor(30.0.scale(), Colors.white,),)),
            //           ),
            //         ),
            //
            //       ],
            //     ),
            //     AVerticalSpace(20.0.scale()),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         GestureDetector(
            //           behavior: HitTestBehavior.opaque,
            //           onTap: (){
            //             if(sharedPrefs.IsLogin){
            //               showHideProgress(true);
            //               BlocProvider.of<HomeBloc>(context).add(HomeEventMyCartPageClick(false, "${vehicleDetail?.productId}",
            //                   "$count", "vehicle_detail"));
            //             }else{
            //               showSnackBar("Please Login first",Colors.black , context);
            //             }
            //
            //           },
            //           child: Container(
            //             padding: EdgeInsets.symmetric(horizontal: 10.0.scale(), vertical: 10.0.scale()),
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(5),
            //                 border: Border.all(color: Color(0xff1DB404))
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Image.asset( 'assets/images/cart.png', color: Color(0xff1DB404), height: 20.0.scale(),),
            //                 AHorizontalSpace(10.0.scale()),
            //                 Text('Add to Cart',  style: textStyleBoldCustomLargeColor(16.0.scale(), Color(0xff1DB404),),),
            //               ],),
            //           ),
            //         ),
            //
            //         GestureDetector(
            //           behavior: HitTestBehavior.opaque,
            //           onTap: (){
            //             if(sharedPrefs.IsLogin){
            //               showHideProgress(true);
            //               BlocProvider.of<HomeBloc>(context).add(HomeEventMyCartPageClick(true, "${vehicleDetail?.productId}", "$count", "vehicle_detail"));
            //             }else{
            //               showSnackBar("Please Login first",Colors.black , context);
            //             }
            //           },
            //           child: Container(
            //             padding: EdgeInsets.symmetric(horizontal: 28.0.scale(), vertical: 10.0.scale()),
            //             decoration: BoxDecoration(
            //                 color: Color(0xff1DB404),
            //                 borderRadius: BorderRadius.circular(5)
            //             ),
            //             child: Center(child: Text("Buy Now", style: textStyleBoldCustomColor(18.0.scale(), Colors.white,),)),
            //           ),
            //         ),
            //
            //       ],
            //     ),
            //     AVerticalSpace(30.0.scale()),
            //
            //   ],
            // ),
          )),
    );
  }
}
