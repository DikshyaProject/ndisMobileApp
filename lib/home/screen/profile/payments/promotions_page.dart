import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/promotions_model.dart';

class PromotionsPage extends StatefulWidget {
  const PromotionsPage({super.key});

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  PromotionsData? data;
  List<PromoteList>? promote_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is PromotionsState) {
      data = profileState.promotionsModel?.data;
      promote_list = data?.promoteList;

      print("promote_list___${promote_list?.first.userId}");
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
              "Promotions",
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
            itemCount: promote_list?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0.scale(), vertical: 5.0.scale()),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0.scale()),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 180.0.scale(),
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0.scale()),
                            ),
                            child: NetworkImagesWidgets(
                              url: "${promote_list?[index].image}",
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        height: 180.0.scale(),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0.scale()),
                          ),
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0.scale(), vertical: 5.0.scale()),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Text(
                          "${promote_list?[index].promoteEnquiryStatus}",
                          maxLines: 1,
                          style: textStyleBoldCustomColor(
                              12.0.scale(), Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Duration: ${promote_list?[index].promoteTotalDays}",
                              style: textStyleBoldCustomColor(
                                  12.0.scale(), Colors.white),
                            ),
                            Text(
                              "Expired On: ${promote_list?[index].promoteEndDate}",
                              style: textStyleBoldCustomColor(
                                  12.0.scale(), Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          "${promote_list?[index].listingName}".toUpperCase(),
                          style: textStyleBoldCustomColor(18.0, Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      )),
    );
  }
}
