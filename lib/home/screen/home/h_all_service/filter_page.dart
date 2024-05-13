import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_rounded_button.dart';
import 'package:ndisparticipant/components/a_separator_line.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/home_bloc.dart';
import 'package:ndisparticipant/home/bloc/home_event.dart';
import 'package:ndisparticipant/home/bloc/home_state.dart';
import 'package:ndisparticipant/home/home.dart';
import 'package:ndisparticipant/root/user_repository.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  int starIndex = -1;

  List top_serv_list = [
    {'title': "Margaret Carty Podiatrion Pvt ltd", 'sub':"Golden Beach QLD Ring Road, Australia, 7131"},
    {'title': "Liberty Speech Pathology", 'sub':"18 Finamore Cres, Qunab"},
    {'title': "Acacia Plan Management", 'sub':"Bunker Street, Minchinbu"},
    {'title': "Life Without Barriers", 'sub':"65 Broadmeadow Road"},
    {'title': "Cerebral Paldy Alliance", 'sub':"61 Parklea Avenue, Croud"},
  ];
 List sub_cat_list = [
    {'title': "Home Modifications and Maintenance", 'check':true},
    {'title': "SDA -High Physical Support", 'check':false},
    {'title': "SDA -Robust", 'check':false},
    {'title': "SDA- Fully Accessible", 'check':true},
    {'title': "SIL /Supported Independent Living", 'check':false},
    {'title': "STA- Respite / Short Term Accomondation", 'check':false},
    {'title': "MTA / Medium Term Accomondation", 'check':false},
    {'title': "SDA - Improved Liveability", 'check':false},
  ];

  List register_drop = [
    'Registered',
    'Un Registered',
  ];
  String? addressData;
  String? latData;
  String? lngData;
  String selectedName ='Select';


  @override
  Widget build(BuildContext context) {
    latData = UserRepository.filter_lat;
    lngData = UserRepository.filter_lng;
    addressData = UserRepository.filter_address;
    print("In_filter_page_lat1__$latData _long__$lngData _place__$addressData");

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeSubCatgoryListDetailsState) {
          Navigator.pop(context);
        }
        if (state is FilterSearchLocationState) {
          Navigator.of(context).pushNamed(HomeNavigator.hLocationSearch);
        }
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: kColorThemePurpleColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Filter",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0.scale(),
                  fontWeight: FontWeight.w700),
            ),
            leading: InkWell(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context).add(
                      HomeEventBackBtnClick(''));
                },
                child: Icon(Icons.arrow_back, color: Colors.white))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AVerticalSpace(10.0.scale()),
              Center(child: Text("Top Service Providers", style: textStyleBoldCustomColor(22, Colors.black),)),
              AVerticalSpace(10.0.scale()),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: ListView.builder(
                    itemCount: top_serv_list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0.scale()),
                                border: Border.all(color: Colors.grey)
                              ),
                              child: Image.asset('assets/images/ic_congratulation_bg.png', height: 50.0.scale(),width: 50.0.scale(),)),
                          AHorizontalSpace(10.0.scale()),
                          SizedBox(
                            width: 200.0.scale(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${top_serv_list[index]['title']}", style: textStyleBoldCustomColor(14, Colors.black),),
                                Text("${top_serv_list[index]['sub']}", style: textStyleBoldCustomColor(12, Colors.black.withOpacity(0.5)),),
                              ],
                            ),
                          ),
                         Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.0.scale(), vertical: 3.0.scale()),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text("5.0", style: textStyleBoldCustomColor(14, Colors.white),),
                          )
                        ],
                      ).verPadding(5.0.scale()),
                      if(index != top_serv_list.length-1)
                      ASeparatorLine(height: 1, color: Colors.grey.withOpacity(0.5),),
                    ],
                  );
                }).horPadding(10.0.scale()),
              ),
              AVerticalSpace(20.0.scale()),

              Text("Registered /Unregistered Providers", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              customDropdown(register_drop, selectedName),
              AVerticalSpace(10.0.scale()),

              Text("Main Categories", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              customDropdown(register_drop, selectedName),
              AVerticalSpace(10.0.scale()),

              Text("Sub category", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              for(int i=0; i<sub_cat_list.length; i++)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  setState(() {
                    sub_cat_list[i]['check'] = !sub_cat_list[i]['check'];
                  });
                },
                child: Row(
                  children: [
                    Icon(sub_cat_list[i]['check']? Icons.check_box : Icons.check_box_outline_blank,
                      color: sub_cat_list[i]['check']? Colors.green : Colors.grey,),
                    AHorizontalSpace(5.0.scale()),

                    Text("${sub_cat_list[i]['title']}", style: textStyleCustomColor(14, Colors.black),),
                  ],
                ),
              ),
              AVerticalSpace(10.0.scale()),

              Text("Features", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              for(int i=0; i<sub_cat_list.length; i++)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  setState(() {
                    sub_cat_list[i]['check'] = !sub_cat_list[i]['check'];
                  });
                },
                child: Row(
                  children: [
                    Icon(sub_cat_list[i]['check']? Icons.check_box : Icons.check_box_outline_blank,
                      color: sub_cat_list[i]['check']? Colors.green : Colors.grey,),
                    AHorizontalSpace(5.0.scale()),

                    Text("${sub_cat_list[i]['title']}", style: textStyleCustomColor(14, Colors.black),),
                  ],
                ),
              ),
              AVerticalSpace(10.0.scale()),

              Text("Filter by Kilometers", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              customDropdown(register_drop, selectedName),
              AVerticalSpace(10.0.scale()),

              Text("Search By Location", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  BlocProvider.of<HomeBloc>(context).add(HomeSearchLocationCityBtnClick('filter'));
                },
                child: Container(
                  height: 50.0.scale(),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width ,
                  child: Text(
                    addressData ?? "Search Place",
                    style: textStyleCustomColor(
                        14.0.scale(),
                        kColorDialogNameTitle),
                  ),
                ),
              ),
              AVerticalSpace(10.0.scale()),

              Text("Age Group", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              customDropdown(register_drop, selectedName),
              AVerticalSpace(10.0.scale()),

              Text("Language", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              customDropdown(register_drop, selectedName),
              AVerticalSpace(10.0.scale()),

              Text("Service Specilisation", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              customDropdown(register_drop, selectedName),
              AVerticalSpace(10.0.scale()),

              Text("Ratings", style: textStyleBoldCustomColor(18, Colors.black),),
              AVerticalSpace(5.0.scale()),
              ratingWidget(0, 5,0),
              ratingWidget(1, 4,1),
              ratingWidget(2, 3,2),
              ratingWidget(3, 2,3),
              ratingWidget(4, 1,4),
              AVerticalSpace(20.0.scale()),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ARoundedButton(
                    btnText: "Apply",
                      btnWidth: 160.0.scale(),
                      btnHeight: 45.0.scale(),
                      btnTextColor: Colors.white,
                      btnFontSize: 14,
                      btnFontWeight: FontWeight.w700,
                      btnBgColor: kColorThemePurpleColor,
                      btnOnPressed: (){}),
                  ARoundedButton(
                    btnText: "Reset",
                      btnWidth: 160.0.scale(),
                      btnHeight: 45.0.scale(),
                      btnTextColor: Colors.black,
                      btnFontSize: 14,
                      btnFontWeight: FontWeight.w700,
                      btnBgColor: Colors.black.withOpacity(0.2),
                      btnElevation: 0,
                      btnOnPressed: (){}),
                ],
              ),
              AVerticalSpace(20.0.scale()),
            ],
          ).horPadding(15.0.scale()),
        ),
      ),
    );
  }

  Widget customDropdown(List drop_items, String selectedName){
    return Container(
      height: 50.0.scale(),
      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down),
          items: drop_items!
              .map<DropdownMenuItem<String>>(
                  (dynamic items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    "${items}",
                    style: textStyleCustomColor(
                      14.0.scale(),
                      kColorLoginBtn,
                    ),
                  ),
                );
              }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedName = newValue!;
              print(" selectedName___ ${selectedName}");
            });
          },
          hint: Text(selectedName,
              style:
              textStyleCustomColor(14.0.scale(), Colors.black)),
        ),
      ),
    );
  }
  Widget ratingWidget(int index, int count, int count2){
    return   GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        setState(() {
          starIndex = index;
        });
      },
      child: Row(
        children: [
          Icon(starIndex == index? Icons.radio_button_checked : Icons.radio_button_off,
            color: starIndex == index? Colors.green : Colors.grey,),
          AHorizontalSpace(5.0.scale()),

          for(int i=0; i<count; i++)
            Container(
              padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color:starIndex == index? Colors.orange : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.star, color: starIndex == index? Colors.white: Colors.orange,)).rightPadding(5).topPadding(5),

          for(int i=0; i<count2; i++)
            Container(
              padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color:starIndex == index? Colors.orange : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.star_border, color:starIndex == index? Colors.white: Colors.orange,)).rightPadding(5).topPadding(5),
        ],
      ),
    );
  }
}
