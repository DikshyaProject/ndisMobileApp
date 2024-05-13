import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/home_event.dart';
import 'package:ndisparticipant/home/bloc/home_state.dart';
import 'package:ndisparticipant/home/home.dart';

import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../bloc/home_bloc.dart';
import '../../../model/market_place/all_product_list_model.dart';
MarketPlaceAllProductListData? marketPlaceAllProductListData;
List<ProductList>? productList=[];
List<UserList>? userList=[];
class MarketPlaceProducts extends StatefulWidget {
  const MarketPlaceProducts({super.key});

  @override
  State<MarketPlaceProducts> createState() => _MarketPlaceProductsState();
}

class _MarketPlaceProductsState extends State<MarketPlaceProducts> {
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if(homeState is HomeMarketPlaceProductsPageState){
      marketPlaceAllProductListData=homeState.marketPlaceAllProductListData;
      productList=marketPlaceAllProductListData!.productList;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeMarketPlaceBtnClickState) {
          Navigator.of(context).pop(true);
        }
        if (state is HomeMpProductDetailPageState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hMarketPlaceProductDetailPage);
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
                    "All Products",
                    style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                  ),
                  leading: InkWell(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white))),
              body: ListView.builder(
                  itemCount: productList!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context).add(HomeMpProductDetailPageEvent("${productList?[index].productId}"));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0.scale(), vertical: 10.0.scale()),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 200.0.scale(),
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          child:NetworkImagesWidgets(
                                            url: productList![index].productImage!,
                                            fit: BoxFit.cover,
                                          ),

                                      ),
                                    ),
                                    Positioned(
                                      left: 15,
                                      top: 20,
                                      child: Container(
                                          padding: EdgeInsets.all(5.0.scale()),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            '- '+ productList![index].productPriceOffer!+' %'+' off',
                                            style: textStyleBoldCustomLargeColor(
                                                14.0.scale(), Colors.white),
                                          )),
                                    ),
                                    Positioned(
                                      right: 15,
                                      top: 20,
                                      child: Container(
                                          padding: EdgeInsets.all(10.0.scale()),
                                          decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Image.asset(
                                            'assets/images/cart.png',
                                            height: 25.0.scale(),
                                            width: 25.0.scale(),
                                          )),
                                    ),
                                  ],
                                ),
                                AVerticalSpace(10.0.scale()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      productList![index].productName!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleBoldCustomLargeColor(
                                          16.0.scale(), Colors.black),
                                    ).expand(),
                                    Text(
                                      "\$"+productList![index].productPrice!,
                                      style: textStyleBoldCustomLargeColor(
                                          16.0.scale(), Colors.brown),
                                    ),
                                  ],
                                )
                                    .leftPadding(15.0.scale())
                                    .rightPadding(15.0.scale()),
                                AVerticalSpace(10.0.scale()),

                              ],
                            )),
                      ),
                    );
                  }))),
    );
  }
}
