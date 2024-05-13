import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_horizontal_space.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../model/support_worker/support_worker_details.dart';

SupportWorkerDetailsData? supportWorkerDetailsData;
List<AllLocation>? allLocation;
List<AvailabilityTime>? availabilityTime;

SwUserDetails? swUserDetails;
class SupportWorkerServiceDetailsPage extends StatefulWidget {
  const SupportWorkerServiceDetailsPage({Key? key}) : super(key: key);

  @override
  _SupportWorkerServiceDetailsPageState createState() =>
      _SupportWorkerServiceDetailsPageState();
}

class _SupportWorkerServiceDetailsPageState extends State<SupportWorkerServiceDetailsPage> {
  String? screen;

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeSupportWorkerServiceDetailsPageState)
    {
      supportWorkerDetailsData=homeState.supportWorkerDetailsData;
      swUserDetails=supportWorkerDetailsData!.swUserDetails;
      allLocation=swUserDetails!.allLocation;
      availabilityTime=swUserDetails!.availabilityTime;
    screen = homeState.screenName;
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          if (state is HomeSupportWorkerSubCategoryPageState)
          {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                  backgroundColor: kColorThemePurpleColor,
                  centerTitle: true,
                  elevation: 0,
                  title: Text(
                    "Support Worker",
                    style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                  ),
                  leading: InkWell(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white))),
          body: SingleChildScrollView(
              child: Column(children: [
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  AVerticalSpace(10.0.scale()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AVerticalSpace(10.0.scale()),
                      Container(
                        width: 100.0.scale(),
                        height: 100.0.scale(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0.scale()),
                          border: Border.all(color: Colors.grey)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0.scale()),
                          child: NetworkImagesWidgets(
                            url:  swUserDetails!.profileImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      AHorizontalSpace(10.0.scale()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            swUserDetails!.firstName!+ " "+  swUserDetails!.lastName!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textStyleBoldCustomColor(
                                16.0.scale(), Color(0xFF5A86C9)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RippleAnimation(
                                repeat: true,
                                color: Colors.green,
                                minRadius: 8,
                                ripplesCount: 1,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              AHorizontalSpace(8.0.scale()),
                              Text(
                                "${swUserDetails!.userStatus}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: textStyleCustomColor(
                                    12.0.scale(), Colors.black),
                              )
                            ],
                          ),
                          AVerticalSpace(5.0.scale()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/ic_locationlist.png',
                                height: 15.0.scale(),
                                width: 15.0.scale(),
                                color: Colors.green,
                              ),
                              AHorizontalSpace(8.0.scale()),
                              Text(
                                swUserDetails!.userAddress!,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: textStyleCustomColor(
                                    12.0.scale(), Colors.black),
                              ).expand(),
                            ],
                          ),
                          AVerticalSpace(5.0.scale()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                               Icons.thumb_up,
                                size: 15.0.scale(),
                                color: Colors.green,
                              ),
                              AHorizontalSpace(8.0.scale()),
                              Text(
                                swUserDetails!.userFollowers!+" LIKES",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: textStyleCustomColor(
                                    12.0.scale(), Colors.black),
                              )
                            ],
                          ),
                          AVerticalSpace(5.0.scale()),
                        ],
                      ).expand(),
                    ],
                  ),
                  AVerticalSpace(20.0.scale()),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      // border: Border.all(color: Colors.red),
                      color: kColorThemeLightGreenColor,
                    ),
                    child: Text(
                      "Write Review",
                      style:
                          textStyleBoldCustomColor(14.0.scale(), Colors.white),
                    )
                        .rightPadding(5.0.scale())
                        .leftPadding(5.0.scale())
                        .align(Alignment.center),
                  ),
                  AVerticalSpace(10.0.scale()),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      // border: Border.all(color: Colors.red),
                      color: Color(0xFF222222),
                    ),
                    child: Text(
                      "Book",
                      style:
                          textStyleBoldCustomColor(14.0.scale(), Colors.white),
                    )
                        .rightPadding(5.0.scale())
                        .leftPadding(5.0.scale())
                        .align(Alignment.center),
                  ),
                  AVerticalSpace(20.0.scale()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Save",
                        style: textStyleBoldCustomColor(
                            14.0.scale(), Colors.black),
                      ),
                      Text(
                        "Hide",
                        style: textStyleBoldCustomColor(
                            14.0.scale(), Colors.black),
                      ),
                    ],
                  ),
                  AVerticalSpace(10.0.scale())
                ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  AVerticalSpace(10.0.scale()),
                  Text("About",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                  AVerticalSpace(10.0.scale()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Based in",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),
                      Text(swUserDetails!.userCity!+" "+swUserDetails!.userCountry!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(8.0.scale()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Happy to travel",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),
                      Text("${swUserDetails!.happyToTravel!}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(8.0.scale()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Languages used",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),
                      Text(swUserDetails!.language!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text(
                    swUserDetails!.aboutMe!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: textStyleCustomColor(14.0.scale(), Colors.black),
                  ),
                  AVerticalSpace(10.0.scale()),

                ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AVerticalSpace(10.0.scale()),
                Text("Safety",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                AVerticalSpace(10.0.scale()),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10.0.scale(),
                      color: Colors.green,
                    ),
                    AHorizontalSpace(5.0.scale()),
                    Text("COVID-19 vaccine three doses vaccine three doses",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleBoldBlack(12.0.scale(), Colors.black)).expand(),
                  ],
                ),
                AVerticalSpace(8.0.scale()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10.0.scale(),
                      color: Colors.green,
                    ),
                    AHorizontalSpace(5.0.scale()),
                    Text("Ipsum has been the industry's standard dummy been the industry's standard dummy",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleBoldBlack(12.0.scale(), Colors.black)).expand(),
                  ],
                ),
                AVerticalSpace(10.0.scale()),
              ],
            ).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    AVerticalSpace(10.0.scale()),
                    Text("Availability",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                    AVerticalSpace(5.0.scale()),
                    Text("Last updated 12 days ago",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),
                    AVerticalSpace(10.0.scale()),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 15.0.scale(),
                          color: Colors.green,
                        ),
                        AHorizontalSpace(5.0.scale()),
                        Text("Looking for work",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                textStyleBoldBlack(12.0.scale(), Colors.black)),
                      ],
                    ),
                    AVerticalSpace(10.0.scale()),
                    Text("Typical avilability",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleBoldBlack(14.0.scale(), Colors.black)),
                    AVerticalSpace(10.0.scale()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40.0.scale(),
                          width: 100.0.scale(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Text(
                            "Morning",
                            style: textStyleBoldCustomColor(
                                14.0.scale(), kColorThemeLightGreenColor),
                          )
                              .rightPadding(5.0.scale())
                              .leftPadding(5.0.scale())
                              .align(Alignment.center),
                        ),
                        Container(
                          height: 40.0.scale(),
                          width: 100.0.scale(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Text(
                            "Afternoons",
                            style: textStyleBoldCustomColor(
                                14.0.scale(), kColorThemeLightGreenColor),
                          )
                              .rightPadding(5.0.scale())
                              .leftPadding(5.0.scale())
                              .align(Alignment.center),
                        ),
                        Container(
                          height: 40.0.scale(),
                          width: 100.0.scale(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Text(
                            "Evening",
                            style: textStyleBoldCustomColor(
                                14.0.scale(), kColorThemeLightGreenColor),
                          )
                              .rightPadding(5.0.scale())
                              .leftPadding(5.0.scale())
                              .align(Alignment.center),
                        ),
                      ],
                    ),
                    AVerticalSpace(10.0.scale()),

                   for(int i=0; i<int.parse("${swUserDetails?.availabilityTime?.length}"); i++)
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("${swUserDetails?.availabilityTime?[i].day}",
                           maxLines: 2,
                           overflow: TextOverflow.ellipsis,
                           style: textStyleBoldBlack(14.0.scale(), Colors.black)),
                       for(int j=0; j<int.parse("${swUserDetails?.availabilityTime?[i].data?.length}"); j++)
                         Row(
                         children: [
                           Icon(
                             Icons.timelapse,
                             size: 15.0.scale(),
                             color: Colors.green,
                           ),
                           AHorizontalSpace(5.0.scale()),
                           Text("${swUserDetails?.availabilityTime?[i].data?[j].from} to "
                               "${swUserDetails?.availabilityTime?[i].data?[j].to} ",
                               style:
                               textStyleBoldBlack(12.0.scale(), Colors.black)),
                         ],
                       ),
                       AVerticalSpace(8.0.scale()),

                     ],
                   ),

                    AVerticalSpace(8.0.scale()),
                  ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())),
            ).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),

            Card(
                    child: Container(
                        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AVerticalSpace(10.0.scale()),
                Text("Support offered",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                AVerticalSpace(5.0.scale()),
                RichText(
                    text: TextSpan(
                        text: "Learn more about",
                        style: textStyleBoldCustomColor(12.0.scale(), Colors.grey),
                        children: <TextSpan>[
                      TextSpan(
                          text: " Specialised support",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            })
                    ])),
                AVerticalSpace(10.0.scale()),
                for(int i=0; i<int.parse("${swUserDetails?.categoryData?.length}"); i++)
                  Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10.0.scale(),
                      color: Colors.green,
                    ),
                    AHorizontalSpace(5.0.scale()),
                    Text("${swUserDetails?.categoryData?[i].offerTitle}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleBlack(12.0.scale())),
                  ],
                ),
                AVerticalSpace(8.0.scale()),

              ],
            ).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  AVerticalSpace(10.0.scale()),
                  Text("Support preferences",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                  AVerticalSpace(10.0.scale()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Age",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),
                      Text("${swUserDetails?.age}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(8.0.scale()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gender",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),
                      Text("${swUserDetails?.gender}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(8.0.scale()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ok with pets?",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),
                      Text("${swUserDetails?.petFriendly}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  AVerticalSpace(10.0.scale()),
                  Text("Verified documents",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                  AVerticalSpace(8.0.scale()),
                  Text(
                      "${swUserDetails!.firstName!+ " "+  swUserDetails!.lastName!} has been screened in line with state regulations and checked for the below documents:",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(12.0.scale(), Colors.black)),
                  AVerticalSpace(10.0.scale()),
                  Column(
                    children: [
                      for(int i= 0; i<swUserDetails!.certificateData!.length; i++)
                      Row(
                        children: [
                        Icon(Icons.book_outlined, color: Colors.green,),
                          AHorizontalSpace(10.0.scale()),
                          Text("${swUserDetails!.certificateData![i].certificateName}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(13.0.scale(), Colors.black)),

                        ],
                      ).bottomPadding(5.0.scale()),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  AVerticalSpace(10.0.scale()),
                  Text("Community feedback",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                  AVerticalSpace(8.0.scale()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AVerticalSpace(10.0.scale()),
                      Container(
                        width: 50.0.scale(),
                        height: 50.0.scale(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0.scale()),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0.scale()),
                          child: NetworkImagesWidgets(
                            url:  swUserDetails!.profileImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      AHorizontalSpace(10.0.scale()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("2 Recommendations",
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(
                                  12.0.scale(), Colors.black)),
                          AHorizontalSpace(5.0.scale()),
                          Text("52 bookings since jul 2020",
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldBlack(
                                  12.0.scale(), Colors.black)),
                        ],
                      ),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text("Top compliments",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                  AVerticalSpace(10.0.scale()),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_locationlist.png',
                        height: 15.0.scale(),
                        width: 15.0.scale(),
                        color: Colors.green,
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Text("Good Communicator (2)",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(5.0.scale()),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_locationlist.png',
                        height: 15.0.scale(),
                        width: 15.0.scale(),
                        color: Colors.green,
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Text("Follows instructions (2)",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(5.0.scale()),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_locationlist.png',
                        height: 15.0.scale(),
                        width: 15.0.scale(),
                        color: Colors.green,
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Text("Punchtual",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(5.0.scale()),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_locationlist.png',
                        height: 15.0.scale(),
                        width: 15.0.scale(),
                        color: Colors.green,
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Text("Accouate Profile (1)",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text("Endorsements",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                  AVerticalSpace(10.0.scale()),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_locationlist.png',
                        height: 15.0.scale(),
                        width: 15.0.scale(),
                        color: Colors.green,
                      ),
                      AHorizontalSpace(5.0.scale()),
                      Text("Anonymus",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text("02 jun 2023",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(12.0.scale(), Colors.black)),
                  AVerticalSpace(5.0.scale()),
                  Text(
                      "Did a grate and orem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took",
                      maxLines: 20,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(12.0.scale(), Colors.black)),
                  AVerticalSpace(10.0.scale()),
                ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  AVerticalSpace(10.0.scale()),
                  Text("Work history",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                  AVerticalSpace(8.0.scale()),
                  Text("Self declared",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(12.0.scale(), Colors.black)),
                  AVerticalSpace(8.0.scale()),
                  Column(
                    children: [
                      for(int i=0; i<swUserDetails!.position!.length; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AVerticalSpace(10.0.scale()),
                          Icon(Icons.work, size: 15.0.scale(),),
                          AHorizontalSpace(10.0.scale()),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${swUserDetails!.position![i].companyName}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      14.0.scale(), Colors.black)),
                              AVerticalSpace(8.0.scale()),
                              Text("${swUserDetails!.position![i].position}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black)),
                              AVerticalSpace(5.0.scale()),
                              Text("${swUserDetails!.position![i].workFrom} to ${swUserDetails!.position![i].workTo} "
                                  "(${swUserDetails!.position![i].expYearMonth})",
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black)),
                            ],
                          ).expand(),
                        ],
                      ),
                    ],
                  ),

                  AVerticalSpace(10.0.scale()),
                ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),

            Card(
                    child: Container(
                        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AVerticalSpace(10.0.scale()),
                Text("Qualifications",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                AVerticalSpace(10.0.scale()),
                for(int i=0; i<swUserDetails!.qualificationData!.length;i++)
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10.0.scale(),
                      color: Colors.green,
                    ),
                    AHorizontalSpace(5.0.scale()),

                    Text(swUserDetails!.qualificationData![i].qualificationsName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleBoldBlack(12.0.scale(), Colors.black)).expand(),
                  ],
                ),
                AVerticalSpace(10.0.scale()),
              ],
            ).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
                Card(
                    child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AVerticalSpace(10.0.scale()),
                            Text("Certificate",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                            AVerticalSpace(10.0.scale()),
                            for(int i=0; i<swUserDetails!.certificateData!.length;i++)
                            Row(
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  size: 15.0.scale(),
                                  color: Colors.green,
                                ),
                                AHorizontalSpace(5.0.scale()),

                                Text(swUserDetails!.certificateData![i].certificateName!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(12.0.scale(), Colors.black)).expand(),
                              ],
                            ),
                            AVerticalSpace(10.0.scale()),
                          ],
                        ).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                    .leftPadding(10.0.scale())
                    .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
                Card(
                    child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AVerticalSpace(10.0.scale()),
                            Text("Skill",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                            AVerticalSpace(10.0.scale()),
                            for(int i=0; i<swUserDetails!.skillData!.length;i++)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  size: 15.0.scale(),
                                  color: Colors.green,
                                ),
                                AHorizontalSpace(5.0.scale()),

                                Text(swUserDetails!.skillData![i].skillName!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(12.0.scale(), Colors.black)).expand(),
                              ],
                            ),
                            AVerticalSpace(10.0.scale()),
                          ],
                        ).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                    .leftPadding(10.0.scale())
                    .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  AVerticalSpace(10.0.scale()),
                  Text("Work Experience",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                              AVerticalSpace(10.0.scale()),

                              for(int i=0; i<swUserDetails!.position!.length;i++)
                               
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AVerticalSpace(10.0.scale()),
                      Icon(Icons.work, size: 20.0.scale(),),
                      AHorizontalSpace(10.0.scale()),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Position : ",
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black)),
                              Text("${ swUserDetails!.position![i].position!}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),

                            ],
                          ),
                          AVerticalSpace(3.0.scale()),
                          Row(
                            children: [
                              Text("Company : ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black)),
                              Text("${ swUserDetails!.position![i].companyName!}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),


                            ],
                          ),
                          AVerticalSpace(5.0.scale()),
                          Row(
                            children: [
                              Text("Duration : ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black)),
                              Text("${ swUserDetails!.position![i].workFrom!} to ${swUserDetails!.position![i].workTo!} ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),


                            ],
                          ),
                          AVerticalSpace(5.0.scale()),
                          Row(
                            children: [
                              Text("Period : ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black)),
                              Text("${swUserDetails!.position![i].expYearMonth!}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldCustomColor(12.0.scale(), Colors.grey)),

                            ],
                          ),
                          //  AVerticalSpace(10.0.scale()),
                        ],
                      ).bottomPadding(10.0.scale()),
                     
                    ],
                  ),


                ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  AVerticalSpace(10.0.scale()),
                  Text("Service time",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                  AVerticalSpace(10.0.scale()),
                              for(int i=0; i<int.parse("${swUserDetails?.availabilityTime?.length}"); i++)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${swUserDetails?.availabilityTime?[i].day}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: textStyleBoldBlack(14.0.scale(), Colors.black)),
                                    for(int j=0; j<int.parse("${swUserDetails?.availabilityTime?[i].data?.length}"); j++)
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timelapse,
                                            size: 15.0.scale(),
                                            color: Colors.green,
                                          ),
                                          AHorizontalSpace(5.0.scale()),
                                          Text("${swUserDetails?.availabilityTime?[i].data?[j].from} to "
                                              "${swUserDetails?.availabilityTime?[i].data?[j].to} ",
                                              style:
                                              textStyleBoldBlack(12.0.scale(), Colors.black)),
                                        ],
                                      ),
                                    AVerticalSpace(8.0.scale()),

                                  ],
                                ),
                  AVerticalSpace(10.0.scale()),
                ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            Card(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  AVerticalSpace(10.0.scale()),
                  Text("Locations",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBoldBlack(16.0.scale(), Colors.black)),
                  AVerticalSpace(10.0.scale()),

                 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AVerticalSpace(10.0.scale()),

                      for(int i=0;i<allLocation!.length; i++)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Location :",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black)),
                                AHorizontalSpace(4.0.scale()),
                                Text(allLocation![i].location!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black)),
                              ],
                            ),
                            AVerticalSpace(3.0.scale()),
                            Row(
                              children: [
                                Text("City :",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black)),
                                AHorizontalSpace(4.0.scale()),
                                Text(allLocation![i].locationCity!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black)),
                              ],
                            ),
                            AVerticalSpace(5.0.scale()),
                            Row(
                              children: [
                                Text("State :",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black)),
                                AHorizontalSpace(4.0.scale()),
                                Text(allLocation![i].locationState!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black)),
                              ],
                            ),
                            AVerticalSpace(5.0.scale()),
                            Row(
                              children: [
                                Text("Zip Code :",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black)),
                                AHorizontalSpace(4.0.scale()),
                                Text(allLocation![i].locationZipCode!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        12.0.scale(), Colors.black)),
                              ],
                            ),
                            //  AVerticalSpace(10.0.scale()),
                          ],
                        ).bottomPadding(10.0.scale()),

                    ],
                  ),
                  AVerticalSpace(10.0.scale()),
                ]).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
                .leftPadding(10.0.scale())
                .rightPadding(10.0.scale()),
            AVerticalSpace(10.0.scale()),
            // Card(
            //         child: Container(
            //             width: double.infinity,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 AVerticalSpace(10.0.scale()),
            //                 Text("Additional information",
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                     style: textStyleBoldBlack(
            //                         16.0.scale(), Colors.black)),
            //
            //                 AVerticalSpace(10.0.scale()),
            //               ],
            //             ).leftPadding(5.0.scale()).rightPadding(5.0.scale())))
            //     .leftPadding(10.0.scale())
            //     .rightPadding(10.0.scale()),
            // AVerticalSpace(10.0.scale()),
          ]).bottomPadding(20.0.scale())),
        )));
  }
}
