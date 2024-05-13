import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

class ServicesOfferedPage extends StatefulWidget {
  const ServicesOfferedPage({super.key});

  @override
  State<ServicesOfferedPage> createState() => _ServicesOfferedPageState();
}

class _ServicesOfferedPageState extends State<ServicesOfferedPage> {
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  List offerList = [
    {
      'title': "Support Coordinator",
      'list': [
        'Psycho- Social Recovery Coach',
        'Specilised Support Coordination',
        'Support Coordination',
        'Advocacy and Peer Support'
      ]
    }
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
                "Services Offered",
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
                itemCount: offerList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(15.0.scale()),
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
                            Text(
                              "${offerList[index]['title']}:",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                            AVerticalSpace(5.0.scale()),
                            for (int k = 0;
                                k < offerList[index]['list'].length;
                                k++)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                    size: 10.0.scale(),
                                  ).topPadding(4.0.scale()),
                                  AHorizontalSpace(5.0.scale()),
                                  SizedBox(
                                    width: 270.0.scale(),
                                    child: Text(
                                      "${offerList[index]['list'][k]}",
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
