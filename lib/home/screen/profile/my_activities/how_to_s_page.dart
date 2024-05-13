import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

class HowTosPage extends StatefulWidget {
  const HowTosPage({super.key});

  @override
  State<HowTosPage> createState() => _HowTosPageState();
}

class _HowTosPageState extends State<HowTosPage> {
  List how_to_list = [
    {
      'title': 'How to create new listing?',
      'answer':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      'isTrue': false
    },
    {
      'title': 'How to change free listing to premium listing?',
      'answer':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      'isTrue': false
    },
    {
      'title': 'How can i change my user type?',
      'answer':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      'isTrue': false
    },
    {
      'title': 'How to make Payment?',
      'answer':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      'isTrue': false
    },
    {
      'title': 'How to create Ads?',
      'answer':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      'isTrue': false
    },
    {
      'title': 'What is user type?',
      'answer':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      'isTrue': false
    },
    {
      'title': 'How to contact support team?',
      'answer':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      'isTrue': false
    },
    {
      'title': 'How to create new listing?',
      'answer':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      'isTrue': false
    },
  ];

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
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
                  "How to's",
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
                padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
                child: ListView.builder(
                    itemCount: how_to_list.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AVerticalSpace(
                              index == 0 ? 20.0.scale() : 10.0.scale()),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              how_to_list[index]['isTrue'] =
                                  !how_to_list[index]['isTrue'];
                              setState(() {});
                              print("index_is_________$index");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${how_to_list[index]['title']}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldBlack(
                                        14.0.scale(), Colors.black),
                                  ),
                                ),
                                Icon(how_to_list[index]['isTrue']
                                    ? CupertinoIcons.chevron_up
                                    : CupertinoIcons.chevron_down)
                              ],
                            ),
                          ),
                          AVerticalSpace(5.0.scale()),
                          if (how_to_list[index]['isTrue'])
                            Text(
                              '${how_to_list[index]['answer']}',
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black),
                            ),
                          AVerticalSpace(5.0.scale()),
                          ASeparatorLine(
                            height: 1,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          AVerticalSpace(5.0.scale()),
                        ],
                      );
                    }))),
      ),
    );
  }
}
