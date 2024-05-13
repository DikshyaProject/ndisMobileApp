import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/all_reviews_model.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  AllReviewsData? all_reviews_data;
  List<SentReviewsList>? sentReviewsList;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is ReviewPageClickState) {
      all_reviews_data = profileState.allReviewsModel?.data;
      sentReviewsList = all_reviews_data?.sentReviewsList;
      print("sentReviewsList_____${sentReviewsList?.first.reviewId}");
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
                "All Reviews",
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
                itemCount: sentReviewsList?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: 8.0.scale(),
                        left: 15.0.scale(),
                        right: 15.0.scale()),
                    child: Container(
                      padding: EdgeInsets.all(10.0.scale()),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 75.0.scale(),
                                child: Text(
                                  "List Name",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Text(
                                ": ${sentReviewsList?[index].listingName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBlack(12.0.scale()),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 75.0.scale(),
                                child: Text(
                                  "User Name",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Text(
                                ": ${sentReviewsList?[index].reviewName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBlack(12.0.scale()),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 75.0.scale(),
                                child: Text(
                                  "Email",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Text(
                                ": ${sentReviewsList?[index].reviewEmail}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBlack(12.0.scale()),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 75.0.scale(),
                                child: Text(
                                  "Mobile",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Text(
                                ": ${sentReviewsList?[index].reviewMobile}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBlack(12.0.scale()),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 75.0.scale(),
                                child: Text(
                                  "Message",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Text(
                                ": ${sentReviewsList?[index].reviewMessage}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleBlack(12.0.scale()),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 75.0.scale(),
                                child: Text(
                                  "Ratings",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBoldBlack(
                                      12.0.scale(), Colors.black),
                                ),
                              ),
                              AHorizontalSpace(5.0.scale()),
                              Row(
                                children: [
                                  for (int i = 0;
                                      i <
                                          int.parse(
                                              "${sentReviewsList?[index].priceRating}");
                                      i++)
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    )
                                ],
                              )
                            ],
                          ),
                        ],
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
