import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

class ServiceLocationPage extends StatefulWidget {
  const ServiceLocationPage({super.key});

  @override
  State<ServiceLocationPage> createState() => _ServiceLocationPageState();
}

class _ServiceLocationPageState extends State<ServiceLocationPage> {
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  List locationList = [
    {
      'location': "Shepparton VIC, Australia",
      'city': 'Shepparton',
      'state': 'Victoria',
      'country': 'Australia',
      'zip': '3630',
      'latitude': '-36.3821418',
      'longitude': '145.4072272',
      'region': 'NSW-Sydney - Baulkham Hills And Hawkesbury'
    },
    {
      'location': "Airlie Beach QLD, Australia",
      'city': 'Airlie Beach',
      'state': 'Queensland',
      'country': 'Australia',
      'zip': '4802',
      'latitude': '-20.2677525',
      'longitude': '148.7155626',
      'region': 'NSW-Central Coast'
    },
    {
      'location': "Surfers Paradise QLD, Australia",
      'city': 'Surfers Paradise',
      'state': 'Queensland',
      'country': 'Australia',
      'zip': '4217',
      'latitude': '-27.9985041',
      'longitude': '153.4227099',
      'region': 'NSW-Central West'
    },
    {
      'location':
          "Domestic Terminal, Bribie Way, Brisbane Airport QLD, Australia",
      'city': 'Brisbane Airport',
      'state': 'Queensland',
      'country': 'Australia',
      'zip': '4008',
      'latitude': '-27.3851757',
      'longitude': '153.1203145',
      'region': 'NSW-Sydney - North Sydney And Hornsby'
    },
  ];

  @override
  void initState() {
    // ProfileState profileState = BlocProvider.of<ProfileBloc>(context).state;
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
                "Service Locations",
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
                itemCount: locationList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.scale(), vertical: 5.0.scale()),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10.0.scale(),
                        bottom: 10.0.scale(),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: kColorThemePurpleColor,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70.0.scale(),
                                  child: Text(
                                    "Location ${(index + 1)} ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 220.0.scale(),
                                  child: Text(
                                    ": ${locationList[index]['location']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70.0.scale(),
                                  child: Text(
                                    "City ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 220.0.scale(),
                                  child: Text(
                                    ": ${locationList[index]['city']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70.0.scale(),
                                  child: Text(
                                    "State ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 220.0.scale(),
                                  child: Text(
                                    ": ${locationList[index]['state']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70.0.scale(),
                                  child: Text(
                                    "Country ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 220.0.scale(),
                                  child: Text(
                                    ": ${locationList[index]['country']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70.0.scale(),
                                  child: Text(
                                    "Postcode ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 220.0.scale(),
                                  child: Text(
                                    ": ${locationList[index]['zip']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70.0.scale(),
                                  child: Text(
                                    "Latitude ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 220.0.scale(),
                                  child: Text(
                                    ": ${locationList[index]['latitude']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70.0.scale(),
                                  child: Text(
                                    "Longitude ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 220.0.scale(),
                                  child: Text(
                                    ": ${locationList[index]['longitude']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70.0.scale(),
                                  child: Text(
                                    "Region ${(index + 1)} ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 220.0.scale(),
                                  child: Text(
                                    ": ${locationList[index]['region']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        12.0.scale(), Colors.black),
                                  ),
                                ),
                              ],
                            ),
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
