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
import '../../../model/market_place/ndis_propety_sale.dart';
NDISPropertySaleData? ndisPropertySaleData;
List<AllPropertyListings>? allPropertyListings=[];
class MarketPlacePropertySaleList extends StatefulWidget {
  const MarketPlacePropertySaleList({super.key});

  @override
  State<MarketPlacePropertySaleList> createState() => _MarketPlacePropertySaleListState();
}

class _MarketPlacePropertySaleListState extends State<MarketPlacePropertySaleList> {
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
    if(homeState is HomeMarketPlacePropertySaleState){
      ndisPropertySaleData=homeState.ndisPropertySaleData;
      allPropertyListings=ndisPropertySaleData!.allPropertyListings;
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
        if(state is HomeMpPropertyDetailsState){
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hMpPropertyDetailsPage);
        }
        if (state is HomeMarketPlaceBtnClickState) {
          Navigator.of(context).pop(true);
        }
        if(state is HomeerrorloadingState){
          showHideProgress(false);
          Navigator.pop(context);
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
                "Property for Rent",
                style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),
            body: ListView.builder(
                itemCount: allPropertyListings!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return
                    GestureDetector(
                      onTap: ()
                      {
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context)
                            .add(HomeMpPropertyDetailsBtnClick("${allPropertyListings?[index].listingId}"));
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
                                        url: allPropertyListings![index].profileImage!,
                                        fit: BoxFit.cover,
                                      ),

                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        allPropertyListings![index].listingName!,
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
                                          Text(
                                            allPropertyListings![index].listingAddress!,
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
                                          Text(allPropertyListings![index].mobileNumber!,
                                            maxLines:
                                            1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: textStyleCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),


                                        ],
                                      ),
                                      AVerticalSpace(2.0.scale()),
                                      Row(
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
                                              allPropertyListings![index].emailId!,
                                              maxLines:
                                              2,
                                              overflow: TextOverflow.ellipsis,
                                              style: textStyleCustomColor(
                                                  12.0.scale(), Colors.black),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ).leftPadding(5.0.scale()).rightPadding(5.0.scale()).expand(),
                                  SizedBox(
                                    width: 80.0.scale(),
                                    child: Column(
                                      children: [
                                        Text(
                                          "\$"+allPropertyListings![index].proPrice!,
                                          textAlign: TextAlign.center,
                                          style: textStyleBoldCustomColor(12.0.scale(), Colors.black),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "Rent: ${allPropertyListings?[index].rentalYield} (${allPropertyListings?[index].potTotalIncPerYr})",
                                          style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                        AVerticalSpace(5.0.scale()),
                                        InkWell(
                                          onTap: (){
                                            if (sharedPrefs.IsLogin){
                                              if(_hasCallSupport){
                                                setState(() {
                                                  _launched = _makePhoneCall(
                                                      "${allPropertyListings?[index].mobileNumber}");
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
                                  ),
                                ],).leftPadding(5.0.scale()).rightPadding(5.0.scale()).topPadding(
                                  5.0.scale()),
                              AVerticalSpace(5.0.scale()),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  if(allPropertyListings?[index].propertyTypeDetail?.length != 0)
                                    Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.house_outlined,
                                        size: 15.0.scale(),
                                        color: Colors.grey,
                                      ),
                                      AHorizontalSpace(4.0.scale()),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${allPropertyListings?[index].propertyTypeDetail?.first.pType}",
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                          Text("${allPropertyListings?[index].propertyTypeDetail?.first.pTypeName}",
                                            style: textStyleCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],),

                                  if(allPropertyListings?[index].numOfBedr?.length != 0)
                                    Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.bed,
                                        size: 15.0.scale(),
                                        color: Colors.grey,
                                      ),
                                      AHorizontalSpace(4.0.scale()),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${allPropertyListings?[index].numOfBedr?.first.numOfBedrType}",
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                          Text("${allPropertyListings?[index].numOfBedr?.first.numOfBedrName}",
                                            style: textStyleCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],),

                                  if(allPropertyListings?[index].numOfBathr?.length != 0)
                                    Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.bathtub_outlined,
                                        size: 15.0.scale(),
                                        color: Colors.grey,
                                      ),
                                      AHorizontalSpace(4.0.scale()),

                                      SizedBox(
                                        width: 100.0.scale(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${allPropertyListings?[index].numOfBathr?.first.numOfBathrType}",
                                              style: textStyleBoldCustomColor(
                                                  12.0.scale(), Colors.black),
                                            ),
                                            Text("${allPropertyListings?[index].numOfBathr?.first.numOfBathrName}",
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
                                  AHorizontalSpace(5.0.scale()),
                                  if(allPropertyListings?[index].bedroomCarerDetail?.length != 0)
                                    Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.bed,
                                        size: 15.0.scale(),
                                        color: Colors.grey,
                                      ),
                                      AHorizontalSpace(4.0.scale()),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${allPropertyListings?[index].bedroomCarerDetail?.first.bCarerType}",
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                          Text("${allPropertyListings?[index].bedroomCarerDetail?.first.bCarerName}",
                                            style: textStyleCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],),
                                  AHorizontalSpace(5.0.scale()),

                                  if(allPropertyListings?[index].propSizeM2?.length != 0)
                                    Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     Container(
                                       height: 15.0.scale(),
                                       child: NetworkImagesWidgets(
                                         url: "${allPropertyListings?[index].propSizeM2?.first.propSizeImage}",
                                         fit: BoxFit.cover,
                                       ),
                                     ),
                                      AHorizontalSpace(4.0.scale()),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${allPropertyListings?[index].propSizeM2?.first.propSizeType}",
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                          Text("${allPropertyListings?[index].propSizeM2?.first.propSizeName}",
                                            style: textStyleCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],),
                                ],),

                              AVerticalSpace(15.0.scale()),

                              if(allPropertyListings?[index].typeOfPropertyDetail?.length != 0)
                              Row(
                                children: [
                                  Text(
                                    "Type of Property :",
                                    textAlign: TextAlign.center,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ).leftPadding(5.0.scale()),
                                  AHorizontalSpace(5.0.scale()),

                                  for(int i=0; i<int.parse("${allPropertyListings?[index].typeOfPropertyDetail?.length}"); i++)
                                  Text(
                                    "${allPropertyListings?[index].typeOfPropertyDetail?[i].typeOfPropertyType}, ",
                                    textAlign: TextAlign.center,
                                    style: textStyleCustomColor(10.0.scale(), Colors.black),
                                  ).rightPadding(5.0.scale()).leftPadding(5.0.scale()).align(
                                      Alignment.center),


                                ],
                              ),
                              AVerticalSpace(5.0.scale()),

                            ],
                          )).leftPadding(10.0.scale()).rightPadding(10.0.scale()).topPadding(10.0.scale()),
                    );

                }
            ),
        ),
      ),
    );
  }
}
