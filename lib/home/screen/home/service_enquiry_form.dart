import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/bloc/home_bloc.dart';
import 'package:ndisparticipant/home/bloc/home_event.dart';
import 'package:ndisparticipant/home/home.dart';
import 'package:ndisparticipant/root/user_repository.dart';

class ServiceEnquiryScreen extends StatefulWidget {
  const ServiceEnquiryScreen({super.key});

  @override
  State<ServiceEnquiryScreen> createState() => _ServiceEnquiryScreenState();
}

class _ServiceEnquiryScreenState extends State<ServiceEnquiryScreen> {
  TextEditingController _textFiledUserName = TextEditingController();
  TextEditingController _textFiledEmailId = TextEditingController();
  TextEditingController _textFiledMobileNumber = TextEditingController();
  TextEditingController _textFiledMessage = TextEditingController();
  final focusUserName = FocusNode();
  final focusEmailId = FocusNode();
  final focusMobileNumber = FocusNode();
  final focusMessage = FocusNode();
  List<String> infoList = [
    'Check the box to share my mobile number',
    'Check the box to share my email address',
    'Check the box to share the box'
  ];
  int? selectedIndex;
  String? selectLocation ;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  getAddress(){
    selectLocation = UserRepository.enquiry_location;
    print("Location_is___$selectLocation");
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is ServiceEnquiryState) {
      _textFiledUserName.text = sharedPrefs.userName;
      _textFiledEmailId.text = sharedPrefs.userEmail;
      _textFiledMobileNumber.text = sharedPrefs.userMobile;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeInitial) {
          Navigator.pop(context);
        }
        if (state is ServiceEnquiryAddressbtnClickState) {
           Navigator.of(context).pushNamed(HomeNavigator.hLocationSearch).then((value) => value != null? getAddress() :null);
        }

      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Service Enquiry",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AVerticalSpace(10.0.scale()),
                  Center(
                    child: Text(
                      "What service do you need?",
                      style: textStyleCustomColor(13.0.scale(), Colors.black),
                    ),
                  ),
                  Center(
                    child: Text(
                      "ndisONE will help you",
                      style: textStyleBoldCustomColor(15.0.scale(), Colors.black),
                    ),
                  ),
                  AVerticalSpace(20.0.scale()),

                  Text('Name', style: textStyleBoldCustomColor(12.0.scale(), Colors.black,),),
                  customTextField(
                      textController: _textFiledUserName,
                      focus: focusUserName,
                    isRead: true,
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text('Email', style: textStyleBoldCustomColor(12.0.scale(), Colors.black,),),
                  customTextField(
                      textController: _textFiledEmailId,
                      focus: focusEmailId,
                      isRead: true,
                  ),
                  AVerticalSpace(10.0.scale()),
                  Text('Mobile number', style: textStyleBoldCustomColor(12.0.scale(), Colors.black,),),
                  customTextField(
                      textController: _textFiledMobileNumber,
                      focus: focusMobileNumber,
                      isRead: true,
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text('What information do you want to show the service provider?', style: textStyleBoldCustomColor(12.0.scale(), Colors.black,),),
                  for(int i=0; i<infoList.length; i++)
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(selectedIndex == i ? Icons.check_box :Icons.check_box_outline_blank,
                        color: selectedIndex == i ? Colors.green :Colors.grey,
                        ),
                        AHorizontalSpace(5.0.scale()),
                        Text(infoList[i], style: textStyleCustomColor(12.0.scale(), Colors.black,),),
                      ],
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text('How many service proivders should contact you?', style: textStyleBoldCustomColor(12.0.scale(), Colors.black,),),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    height: 50.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Select No Of Service Provider', style: textStyleCustomColor(14.0.scale(), Colors.grey),),
                    // child: DropdownButtonHideUnderline(
                    //   child: DropdownButton<ParticipantUserType>(
                    //     isExpanded: true,
                    //     items: items
                    //         .map<DropdownMenuItem<ParticipantUserType>>(
                    //             (ParticipantUserType item) {
                    //           return DropdownMenuItem<ParticipantUserType>(
                    //             value: item,
                    //             child: item.type != "NDIS service experts" ? Text(item.type): Text(""),
                    //           );
                    //         }).toList(),
                    //     onChanged: (ParticipantUserType? value) {
                    //       setState(() {
                    //         selectedUserType = value!.type;
                    //       });
                    //     },
                    //     hint: Text(selectedUserType,
                    //         style: textStyleCustomColor(12.0.scale(), Colors.black)),
                    //   ),
                    // ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text('Service Request Address', style: textStyleBoldCustomColor(12.0.scale(), Colors.black,),),
                  InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(ServiceEnquiryAddressbtnClick("service_enquiry"));
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                      height: 50.0.scale(),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(selectLocation??"Select Address", style: textStyleCustomColor(14.0.scale(),
                          selectLocation != null ? Colors.black :Colors.grey),),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    height: 50.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Select Region', style: textStyleCustomColor(14.0.scale(), Colors.grey),),
                    // child: DropdownButtonHideUnderline(
                    //   child: DropdownButton<ParticipantUserType>(
                    //     isExpanded: true,
                    //     items: items
                    //         .map<DropdownMenuItem<ParticipantUserType>>(
                    //             (ParticipantUserType item) {
                    //           return DropdownMenuItem<ParticipantUserType>(
                    //             value: item,
                    //             child: item.type != "NDIS service experts" ? Text(item.type): Text(""),
                    //           );
                    //         }).toList(),
                    //     onChanged: (ParticipantUserType? value) {
                    //       setState(() {
                    //         selectedUserType = value!.type;
                    //       });
                    //     },
                    //     hint: Text(selectedUserType,
                    //         style: textStyleCustomColor(12.0.scale(), Colors.black)),
                    //   ),
                    // ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    height: 50.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Main Category', style: textStyleCustomColor(14.0.scale(), Colors.grey),),
                    // child: DropdownButtonHideUnderline(
                    //   child: DropdownButton<ParticipantUserType>(
                    //     isExpanded: true,
                    //     items: items
                    //         .map<DropdownMenuItem<ParticipantUserType>>(
                    //             (ParticipantUserType item) {
                    //           return DropdownMenuItem<ParticipantUserType>(
                    //             value: item,
                    //             child: item.type != "NDIS service experts" ? Text(item.type): Text(""),
                    //           );
                    //         }).toList(),
                    //     onChanged: (ParticipantUserType? value) {
                    //       setState(() {
                    //         selectedUserType = value!.type;
                    //       });
                    //     },
                    //     hint: Text(selectedUserType,
                    //         style: textStyleCustomColor(12.0.scale(), Colors.black)),
                    //   ),
                    // ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    height: 50.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Sub Category', style: textStyleCustomColor(14.0.scale(), Colors.grey),),
                    // child: DropdownButtonHideUnderline(
                    //   child: DropdownButton<ParticipantUserType>(
                    //     isExpanded: true,
                    //     items: items
                    //         .map<DropdownMenuItem<ParticipantUserType>>(
                    //             (ParticipantUserType item) {
                    //           return DropdownMenuItem<ParticipantUserType>(
                    //             value: item,
                    //             child: item.type != "NDIS service experts" ? Text(item.type): Text(""),
                    //           );
                    //         }).toList(),
                    //     onChanged: (ParticipantUserType? value) {
                    //       setState(() {
                    //         selectedUserType = value!.type;
                    //       });
                    //     },
                    //     hint: Text(selectedUserType,
                    //         style: textStyleCustomColor(12.0.scale(), Colors.black)),
                    //   ),
                    // ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    height: 50.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Third Category', style: textStyleCustomColor(14.0.scale(), Colors.grey),),
                    // child: DropdownButtonHideUnderline(
                    //   child: DropdownButton<ParticipantUserType>(
                    //     isExpanded: true,
                    //     items: items
                    //         .map<DropdownMenuItem<ParticipantUserType>>(
                    //             (ParticipantUserType item) {
                    //           return DropdownMenuItem<ParticipantUserType>(
                    //             value: item,
                    //             child: item.type != "NDIS service experts" ? Text(item.type): Text(""),
                    //           );
                    //         }).toList(),
                    //     onChanged: (ParticipantUserType? value) {
                    //       setState(() {
                    //         selectedUserType = value!.type;
                    //       });
                    //     },
                    //     hint: Text(selectedUserType,
                    //         style: textStyleCustomColor(12.0.scale(), Colors.black)),
                    //   ),
                    // ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                    height: 50.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Type of Service Provider', style: textStyleCustomColor(14.0.scale(), Colors.grey),),
                    // child: DropdownButtonHideUnderline(
                    //   child: DropdownButton<ParticipantUserType>(
                    //     isExpanded: true,
                    //     items: items
                    //         .map<DropdownMenuItem<ParticipantUserType>>(
                    //             (ParticipantUserType item) {
                    //           return DropdownMenuItem<ParticipantUserType>(
                    //             value: item,
                    //             child: item.type != "NDIS service experts" ? Text(item.type): Text(""),
                    //           );
                    //         }).toList(),
                    //     onChanged: (ParticipantUserType? value) {
                    //       setState(() {
                    //         selectedUserType = value!.type;
                    //       });
                    //     },
                    //     hint: Text(selectedUserType,
                    //         style: textStyleCustomColor(12.0.scale(), Colors.black)),
                    //   ),
                    // ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  customTextField(
                      textController: _textFiledMessage,
                      focus: focusMessage,
                      height: 120.0.scale(),
                      maxLine: 10,
                      hint: 'Enter Your Query or Message'
                  ),
                  AVerticalSpace(10.0.scale()),
                  ARoundedButton(
                    btnText: "Submit",
                    btnHeight: 50.0.scale(),
                    btnFontSize: 12.0.scale(),
                    btnFontWeight: FontWeight.bold,
                    btnBgColor: kColorThemePurpleColor,
                    btnTextColor: Colors.white,
                    btnOnPressed: (){},
                  ),
                  AVerticalSpace(10.0.scale()),

                ],
              ).horPadding(15.0.scale()),
            ),
          )),
    );
  }

  Widget customTextField({
    required TextEditingController textController,
    String? hint,
    required FocusNode focus,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool? isRead,
    double? height,
    int? maxLine,
  }) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focus);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
        height: height?? 50.0.scale(),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: TextField(
          controller: textController,
          focusNode: focus,
          readOnly: isRead == true ? true : false,
          maxLines:maxLine?? 1,
          textInputAction: textInputAction?? TextInputAction.done,
          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint ?? '',
            hintStyle: textStyleCustomColor(14.0.scale(), Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget trending_news() {
    return Column(
      children: [
        AVerticalSpace(5.0.scale()),
        Text(
          'Trending',
          style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
        ).align(Alignment.center),
        SizedBox(
          height: 350.0.scale(),
          child: ListView.builder(
              itemCount: trendingnews!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if(trendingnews?[index].newsId != null){
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context).add(HomeNewsDetilsPageClick(trendingnews![index].newsId,""));
                    }
                  },
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 15.0.scale(), top: 10.0.scale()),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.25,
                          height: 400.0.scale(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: NetworkImagesWidgets(
                              url:  trendingnews![index].newsImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 400.0.scale(),
                          width: MediaQuery.of(context).size.width / 1.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0.scale(),
                                    vertical: 5.0.scale()),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                ),
                                child: Text(
                                  "${trendingnews?[index].categoryName}",
                                  style: textStyleBoldCustomColor(
                                      12.0.scale(), Colors.white),
                                ),
                              ),
                              AVerticalSpace(5.0.scale()),
                              SizedBox(
                                width: 250.0.scale(),
                                child: Text(
                                  "${trendingnews?[index].newsTitle}",
                                  maxLines: 5,
                                  style: textStyleBoldCustomColor(
                                      20.0.scale(), Colors.white),
                                ),
                              ),
                              AVerticalSpace(5.0.scale()),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 8.0.scale()),
                                color: Colors.black.withOpacity(0.6),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      color: Colors.white,
                                      size: 13.0.scale(),
                                    ),
                                    AHorizontalSpace(5.0.scale()),
                                    Text(
                                      trendingnews![index].date!,
                                      style: textStyleCustomColor(
                                          11.0.scale(), Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget slider_news() {
    return Column(
      children: [
        AVerticalSpace(5.0.scale()),
        SizedBox(
          height: 250.0.scale(),
          child: ListView.builder(
              itemCount: newslidelist!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if(newslidelist?[index].newsId != null) {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeNewsDetilsPageClick(
                              newslidelist![index].newsId, ""));
                    }
                  },
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 15.0.scale(), top: 10.0.scale()),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.25,
                          height: 400.0.scale(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: NetworkImagesWidgets(
                              url:  newslidelist![index].newsImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 400.0.scale(),
                          width: MediaQuery.of(context).size.width / 1.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0.scale(),
                                    vertical: 5.0.scale()),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                ),
                                child: Text(
                                  "${newslidelist?[index].categoryName}",
                                  style: textStyleBoldCustomColor(
                                      12.0.scale(), Colors.white),
                                ),
                              ),
                              AVerticalSpace(5.0.scale()),
                              SizedBox(
                                width: 250.0.scale(),
                                child: Text(
                                  "${newslidelist?[index].newsTitle}",
                                  maxLines: 5,
                                  style: textStyleBoldCustomColor(
                                      20.0.scale(), Colors.white),
                                ),
                              ),
                              AVerticalSpace(5.0.scale()),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 8.0.scale()),
                                color: Colors.black.withOpacity(0.6),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      color: Colors.white,
                                      size: 13.0.scale(),
                                    ),
                                    AHorizontalSpace(5.0.scale()),
                                    Text(
                                      "${DateFormat("dd, MMM yyyy").format(DateTime.parse(newslidelist![index].date!))}",
                                      style: textStyleCustomColor(
                                          11.0.scale(), Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget latest_popular_news() {
    return Column(
      children: [
        AVerticalSpace(10.0.scale()),
        Text(
          'Latest & Popular',
          style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
        ).align(Alignment.center),
        AVerticalSpace(5.0.scale()),
        SizedBox(
          height: 200.0.scale(),
          child: ListView.builder(
              itemCount: latestAndPopular!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if(newslidelist?[index].newsId != null) {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeNewsDetilsPageClick(
                              latestAndPopular![index].newsId, ""));
                    }
                  },
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 15.0.scale(), top: 10.0.scale()),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 200.0.scale(),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  child: NetworkImagesWidgets(
                                    url:  latestAndPopular![index].newsImage!,
                                    fit: BoxFit.cover,
                                  ),


                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 200.0.scale(),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0.scale(),
                                      horizontal: 8.0.scale()),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.white,
                                        size: 13.0.scale(),
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text("${latestAndPopular![index].totalCount!} views",
                                        style: textStyleCustomColor(11.0.scale(), Colors.white),
                                      ),
                                    ],
                                  ),
                                ),),
                              Positioned(
                                bottom: 20.0.scale(),
                                left: 10.0.scale(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0.scale(),
                                          vertical: 5.0.scale()),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                      ),
                                      child: Text(
                                        latestAndPopular![index].categoryName!,
                                        style: textStyleBoldCustomColor(
                                            12.0.scale(), Colors.white),
                                      ),
                                    ),
                                    AVerticalSpace(5.0.scale()),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2.0.scale(),
                                          horizontal: 8.0.scale()),
                                      color: Colors.black.withOpacity(0.6),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.access_time_outlined,
                                            color: Colors.white,
                                            size: 13.0.scale(),
                                          ),
                                          AHorizontalSpace(5.0.scale()),
                                          Text("${DateFormat("dd, MMM yyyy").format(DateTime.parse(latestAndPopular![index].date!))}",
                                            style: textStyleCustomColor(11.0.scale(), Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0.scale(),
                                top: 10.0.scale(),
                                bottom: 10.0.scale()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 140.0.scale(),
                                  child: Text(
                                    latestAndPopular![index].newsTitle!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        14.0.scale(), Colors.black),
                                  ),
                                ),
                                AVerticalSpace(10.0.scale()),
                                SizedBox(
                                  width: 140.0.scale(),
                                  child: Text(
                                    latestAndPopular![index].newsDescription!,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        11.0.scale(), Colors.black),
                                  ),
                                ),
                                AVerticalSpace(5.0.scale()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).rightPadding(10.0.scale()),
        ),
      ],
    );
  }

  Widget latest_post() {
    return Column(
      children: [
        AVerticalSpace(10.0.scale()),
        Text(
          'Latest Post',
          style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.black),
        ).align(Alignment.center),
        AVerticalSpace(5.0.scale()),
        SizedBox(
          height: 200.0.scale(),
          child: ListView.builder(
              itemCount: latest!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if(newslidelist?[index].newsId != null) {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeNewsDetilsPageClick(
                              latest![index].newsId, ""));
                    }
                  },
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 15.0.scale(), top: 10.0.scale()),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 200.0.scale(),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  child: NetworkImagesWidgets(
                                    url:  latest![index].newsImage!,
                                    fit: BoxFit.cover,
                                  ),


                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 200.0.scale(),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0.scale(),
                                      horizontal: 8.0.scale()),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.white,
                                        size: 13.0.scale(),
                                      ),
                                      AHorizontalSpace(5.0.scale()),
                                      Text("${latest![index].eyeCount!} views",
                                        style: textStyleCustomColor(11.0.scale(), Colors.white),
                                      ),
                                    ],
                                  ),
                                ),),
                              Positioned(
                                bottom: 20.0.scale(),
                                left: 10.0.scale(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0.scale(),
                                          vertical: 5.0.scale()),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                      ),
                                      child: Text(
                                        latest![index].categoryName!,
                                        style: textStyleBoldCustomColor(
                                            12.0.scale(), Colors.white),
                                      ),
                                    ),
                                    AVerticalSpace(5.0.scale()),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2.0.scale(),
                                          horizontal: 8.0.scale()),
                                      color: Colors.black.withOpacity(0.6),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.access_time_outlined,
                                            color: Colors.white,
                                            size: 13.0.scale(),
                                          ),
                                          AHorizontalSpace(5.0.scale()),
                                          Text(
                                            latest![index].date!,
                                            style: textStyleCustomColor(
                                                11.0.scale(), Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0.scale(),
                                top: 10.0.scale(),
                                bottom: 10.0.scale()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 140.0.scale(),
                                  child: Text(
                                    latest![index].newsTitle!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBoldCustomColor(
                                        14.0.scale(), Colors.black),
                                  ),
                                ),
                                AVerticalSpace(10.0.scale()),
                                SizedBox(
                                  width: 140.0.scale(),
                                  child: Text(
                                    latest![index].newsDescription!,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleCustomColor(
                                        11.0.scale(), Colors.black),
                                  ),
                                ),
                                AVerticalSpace(5.0.scale()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).rightPadding(10.0.scale()),
        ),
      ],
    );
  }
}
