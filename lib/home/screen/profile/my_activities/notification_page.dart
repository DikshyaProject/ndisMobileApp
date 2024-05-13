import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/notification_list_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationsData? noti_data;
  List<Notifictionata>? noti_list;
  String pageName='';

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is NotificationClickState) {
      pageName = profileState.screen;
      // noti_data = profileState.notificationsModel?.data;
      // noti_list = noti_data?.notifictionata;
      // print("noti_list__ ${noti_list?.first.listingId}");
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
        if (state is HomeInitial) {
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
                "All Notifications",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(ProfileEventBackBtnClick(pageName));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white))),
          body: Center(child: Text("No Data Found"))

          // Padding(
          //   padding: EdgeInsets.only(top: 10.0.scale(), bottom: 10.0.scale()),
          //   child: ListView.builder(
          //       itemCount: noti_list?.length,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               AVerticalSpace(10.0.scale()),
          //               Text(
          //                 '${noti_list?[index].enquiryMessage}',
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: textStyleBoldBlack(11.0.scale(), Colors.black),
          //               ),
          //               AVerticalSpace(5.0.scale()),
          //               Text(
          //                 '${noti_list?[index].enquiryCdt}',
          //                 style: textStyleCustomColor(
          //                     11.0.scale(), Colors.black.withOpacity(0.5)),
          //               ).align(Alignment.centerRight),
          //               AVerticalSpace(5.0.scale()),
          //               ASeparatorLine(
          //                 height: 1,
          //                 color: Colors.black.withOpacity(0.3),
          //               ),
          //             ],
          //           ),
          //         );
          //       }),
          // ),
        ),
      ),
    );
  }
}
