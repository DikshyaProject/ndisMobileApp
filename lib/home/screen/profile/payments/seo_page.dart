import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../profile_model/seo_list_model.dart';

class SeoPage extends StatefulWidget {
  const SeoPage({super.key});

  @override
  State<SeoPage> createState() => _SeoPageState();
}

class _SeoPageState extends State<SeoPage> {
  SeoData? data;
  List<SeoListing>? seo_listing;
  List<SeoEvent>? seo_event;
  List<SeoBlog>? seo_blog;
  List<SeoProduct>? seo_product;
  List? all_seo_list;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }



  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is SeoClickState) {
      data = profileState.seoListModel?.data;
      seo_listing = data?.seoListing;
      seo_event = data?.seoEvent;
      seo_blog = data?.seoBlog;
      seo_product = data?.seoProduct;

      all_seo_list = [seo_listing, seo_event, seo_blog, seo_product]
          .expand((x) => x ?? [])
          .toList();

      print("all_seo_list___${all_seo_list?.length}");
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
              "SEO",
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
        body: all_seo_list?.length == 0
            ? Container(
                height: 500.0.scale(),
                child: Text(
                  'No Data Found!',
                  style:
                      textStyleBoldCustomLargeColor(13.0.scale(), Colors.grey),
                ).align(Alignment.center),
              )
            : ListView.builder(
                itemCount: all_seo_list?.length,
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
                                  url: "${all_seo_list?[index].profileImage}",
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
                              "${all_seo_list?[index].type}",
                              maxLines: 1,
                              style: textStyleBoldCustomColor(
                                  12.0.scale(), Colors.white),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0.scale(),
                                  vertical: 5.0.scale()),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: Text(
                                "${all_seo_list?[index].cdt}",
                                style: textStyleBoldCustomColor(
                                    12.0.scale(), Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              "${all_seo_list?[index].listingName}"
                                  .toUpperCase(),
                              style:
                                  textStyleBoldCustomColor(18.0, Colors.white),
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
