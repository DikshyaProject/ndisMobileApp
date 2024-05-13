import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/model/market_place/MpCategoryModel.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../home_navigator.dart';

class HomeMarketPlace extends StatefulWidget {
  const HomeMarketPlace({super.key});

  @override
  State<HomeMarketPlace> createState() => _HomeMarketPlaceState();
}

class _HomeMarketPlaceState extends State<HomeMarketPlace> {
  mpCatData? mp_Cat_Data;
  List<MarketPlaceCatData>? market_Place_Cat_Data;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeMarketPlaceBtnClickState) {
      mp_Cat_Data = homeState.mp_Cat_Data;
      market_Place_Cat_Data = mp_Cat_Data?.marketPlaceCatData;
      print(
          "market_Place_Cat_Data_list_length====${market_Place_Cat_Data?.length}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeInitial)
        {
          Navigator.of(context).pop(true);
        }
        if (state is HomeMarketPlaceProductsPageState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hMarketPlaceProductPage);
        }
        if (state is HomeMarketPlaceProductForVehicalSaleState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hMarketPlaceVehicalSale);
        }
        if (state is HomeMarketPlacePropertySaleState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.homeMarketPlacePropertySaleList);
        }
      },
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                  backgroundColor: kColorThemePurpleColor,
                  centerTitle: true,
                  elevation: 0,
                  title: Text(
                    "Market Place",
                    style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                  ),
                  leading: InkWell(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white))),

        body: ListView.builder(
    itemCount: market_Place_Cat_Data?.length,
    itemBuilder: (context, index) {
      return


        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (market_Place_Cat_Data![index].categoryName == "Consumable for Sale") {
              showHideProgress(true);
              BlocProvider.of<HomeBloc>(context).add(HomeMarketPlaceProductsClick());
            }
             if (market_Place_Cat_Data![index].categoryName == "Modified Vehicle for Sale") {
               showHideProgress(true);
               BlocProvider.of<HomeBloc>(context).add(HomeMarketPlaceProductForVehicalSaleClick());
            }
             if (market_Place_Cat_Data![index].categoryName == "NDIS Property for Sale") {
              showHideProgress(true);
              BlocProvider.of<HomeBloc>(context).add(HomeMarketPlacePropertySaleClick("sale"));
            }

          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: NetworkImagesWidgets(
                    url: "${market_Place_Cat_Data![index].categoryImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0.scale(), vertical: 10.0.scale()),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: Text(
                  "${market_Place_Cat_Data![index].categoryName}",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textStyleBoldCustomColor(
                    15.0.scale(),
                    Colors.white,
                  ),
                ),
              ),
              
            ],
          ).bottomPadding(20.0.scale()).leftPadding(10.0.scale()).rightPadding(10.0.scale()).topPadding(10.0.scale()),
        );
    }
        )

        ),
      ));

  }
}
