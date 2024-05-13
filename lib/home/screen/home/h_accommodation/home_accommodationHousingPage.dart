import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';

import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/home/home_accommodation_list_model.dart';

class HomeAccommodationHousingPage extends StatefulWidget {
  const HomeAccommodationHousingPage({super.key});

  @override
  State<HomeAccommodationHousingPage> createState() =>
      _HomeAccommodationHousingPageState();
}

class _HomeAccommodationHousingPageState
    extends State<HomeAccommodationHousingPage> {
  AccommodationListData? accommodationListData;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeAccommodationHousingState) {
      accommodationListData = homeState.accommodationListData;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        ///old flow
        // if (state is HomeAccommodationHousingforSaleState) {
        //   showHideProgress(false);
        //   Navigator.of(context).pushNamed(HomeNavigator.hAccommodationSalealListPage);
        // }
        // if (state is HomeAccommodationHousingforholidayState) {
        //   showHideProgress(false);
        //   Navigator.of(context).pushNamed(HomeNavigator.hAccommodationHolidaysListPage);
        // }

        if (state is HomeAccommodationHousingforRentState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.homeAccommodationRentalListPage);
        }
        if (state is HomeInitial) {
          Navigator.pop(context, true);
        }
        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          // Navigator.pop(context, true);
          BlocProvider.of<HomeBloc>(context).add(AccommodationHousingRefresh());

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
                "Accommodation Housing",
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
              itemCount: accommodationListData!.marketPlaceCatData!.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    ///old flow
                    // onTap: () {
                    //   if (accommodationListData!
                    //       .marketPlaceCatData![index]
                    //       .categoryName ==
                    //       "Accessible Rental Property") {
                    //     showHideProgress(true);
                    //     BlocProvider.of<HomeBloc>(context).add(HomeAccommodationHousingforRentBtnClick("rental"));
                    //   }
                    //   if (accommodationListData!
                    //       .marketPlaceCatData![index]
                    //       .categoryName ==
                    //       "NDIS Property For Sale") {
                    //     showHideProgress(true);
                    //     BlocProvider.of<HomeBloc>(context).add(
                    //         HomeAccommodationHousingforSaleBtnClick(
                    //             "sale"));
                    //   }
                    //   if (accommodationListData!
                    //       .marketPlaceCatData![index]
                    //       .categoryName ==
                    //       "Accessible Holiday Destination") {
                    //     showHideProgress(true);
                    //     BlocProvider.of<HomeBloc>(context).add(
                    //         HomeAccommodationHousingforholidayBtnClick(
                    //             "holiday"));
                    //   }
                    // },
                    onTap: () {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeAccommodationHousingforRentBtnClick("rental",
                              '${accommodationListData?.marketPlaceCatData?[index].categoryId}'));
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
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 200.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0.scale()),
                                topLeft: Radius.circular(5.0.scale()),
                                bottomRight: Radius.circular(5.0.scale()),
                                bottomLeft: Radius.circular(5.0.scale()),
                              ),
                              child: NetworkImagesWidgets(
                                url: accommodationListData!
                                    .marketPlaceCatData![index].categoryImage!,
                                // color: const Color.fromRGBO(
                                //     200, 200, 200, 10),
                                // colorBlendMode: BlendMode.modulate,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                                  accommodationListData!
                                      .marketPlaceCatData![index].categoryName
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: textStyleBoldCustomColor(
                                      16.0.scale(), Colors.white))
                              .bottomPadding(10.0.scale()),
                        ],
                      ),
                    )
                        .leftPadding(10.0.scale())
                        .rightPadding(10.0.scale())
                        .topPadding(10.0.scale())
                        .bottomPadding(10.0.scale()),
                  )),
        ),
      ),
    );
  }
}
