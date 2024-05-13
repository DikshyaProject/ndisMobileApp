import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    // ProfileState profileState = BlocProvider.of<HomeBloc>(context).state;
    // if (profileState is MyServiceBookingBtnClickState) {
    //
    // }
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
                "Add Listing",
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
          body: Padding(
            padding: EdgeInsets.only(top: 10.0.scale(), bottom: 10.0.scale()),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 10.0.scale(), bottom: 10.0.scale()),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10.0.scale(),
                        bottom: 10.0.scale(),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120.0.scale(),
                                  width: 120.0.scale(),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: NetworkImagesWidgets(
                                      url:
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3EUZRzB8R2g0ApmPed-7YgGXyIULPwHfSA&usqp=CAU",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 12.0.scale(),
                                        ).topPadding(5.0.scale()),
                                        AHorizontalSpace(5.0.scale()),
                                        SizedBox(
                                          width: 180.0.scale(),
                                          child: Text(
                                            "Unregistered_8_12_23_02 hf hgg hmgjf",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AVerticalSpace(3.0.scale()),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Colors.green,
                                          size: 12.0.scale(),
                                        ).topPadding(2.0.scale()),
                                        AHorizontalSpace(5.0.scale()),
                                        SizedBox(
                                          width: 180.0.scale(),
                                          child: Text(
                                            "28, Dec 2023",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AVerticalSpace(3.0.scale()),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.green,
                                          size: 15.0.scale(),
                                        ),
                                        AHorizontalSpace(5.0.scale()),
                                        SizedBox(
                                          width: 180.0.scale(),
                                          child: Text(
                                            "3",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AVerticalSpace(3.0.scale()),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.green,
                                          size: 15.0.scale(),
                                        ),
                                        AHorizontalSpace(5.0.scale()),
                                        SizedBox(
                                          width: 180.0.scale(),
                                          child: Text(
                                            "10",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AVerticalSpace(3.0.scale()),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.access_time_filled,
                                          color: Colors.green,
                                          size: 15.0.scale(),
                                        ),
                                        AHorizontalSpace(5.0.scale()),
                                        SizedBox(
                                          width: 180.0.scale(),
                                          child: Text(
                                            "Active",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyleBoldCustomColor(
                                                12.0.scale(), Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            AVerticalSpace(10.0.scale()),
                            Container(
                                alignment: Alignment.center,
                                height: 40.0.scale(),
                                decoration: BoxDecoration(
                                    color: Color(0xff00BDAA),
                                    borderRadius:
                                        BorderRadius.circular(5.0.scale())),
                                child: Text(
                                  "View Detail",
                                  style: textStyleBoldCustomColor(
                                      15.0.scale(), Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
