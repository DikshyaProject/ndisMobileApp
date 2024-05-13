import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/services.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/home_search/search_model.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  HomeSearchData? homeSearchData;
  late String SearchListitem = "";
  late String SearchListsubcat = "";
  late String catid="";
  late String subcatid="";
  List<SelectServiceList>? selectServiceList = [];
  List<Subcategories>? subcategoriesMainList = [];
  List<String>? subcalue = [];
  List<int> dropdownValues = [];

  void onDropDownChange(dropDownIndex, value) {
    setState(() {
      dropdownValues[dropDownIndex] = value;
    });
    print('onDropDownChange: $dropDownIndex -> $value');

  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeSearchState) {
      homeSearchData = homeState.homeSearchData;
      selectServiceList = homeSearchData!.selectServiceList;
      print(selectServiceList![0].subcategories![0].subCategoryName);
    }
sharedPrefs.searchLocation="";
    // TODO: implement initState
    super.initState();
  }

  // void method(){
  //   setState(() {
  //     for(int i =0;i<subcategories!.length;i++)
  //     {
  //       subcategories=selectServiceList![i].subcategories;
  //       for(int j=1; j<subcategories!.length; j++)
  //       {
  //         subcalue=subcategories![j].subCategoryName as List<String>?;
  //       }
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeInitial)
        {
          Navigator.pop(context, true);
        }
        if (state is HomeSearchLocationCityState)
        {
          Navigator.of(context).pushNamed(HomeNavigator.hLocationSearch);
        }

      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Find Your Local Needs",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Providing Choice and Control on your needs to achieve individual goals.",
                style: textStyleBoldCustomColor(18.0.scale(), Colors.black),
                textAlign: TextAlign.center,
              )
                  .align(Alignment.center)
                  .leftPadding(20.0.scale())
                  .rightPadding(10.0.scale())
                  .topPadding(30.0.scale()),
              AVerticalSpace(10.0.scale()),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 60.0.scale(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1.0,
                      // assign the color to the border color
                      color: kColorThemePurpleColor,
                    ),
                    borderRadius: new BorderRadius.all(
                      Radius.circular(2.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                    children: [
                      AHorizontalSpace(5.0.scale()),
                      Image.asset(
                        "assets/images/ic_search1.png",
                        height: 25.0.scale(),
                        width: 25.0.scale(),
                      ),
                      AHorizontalSpace(10.0.scale()),
                      Container(
                        height: 60.0.scale(),
                        width: 200.0.scale(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0.scale()),
                          border: Border.all(
                              color: Colors.white10, width: 1.0.scale()),
                          color: Colors.white10,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<SelectServiceList>(
                            isExpanded: true,
                            items: selectServiceList!
                                .map<DropdownMenuItem<SelectServiceList>>(
                                    (SelectServiceList itemdate) {
                              return DropdownMenuItem<SelectServiceList>(
                                value: itemdate,
                                child: Text(itemdate!.option.toString()),
                              );
                            }).toList(),
                            onChanged: (SelectServiceList? value) {
                              setState(() {
                                subcategoriesMainList = value!.subcategories;
                                catid = value!.value.toString();

                                print(selectServiceList!.indexOf(value!));
                                // subcategoriesMainList  = selectServiceList![selectServiceList!.indexOf(value)].subcategories;
                                //  print( value.subcategories![0].subCategoryName);
                                SearchListitem = "${value.option.toString()}";

                                //  widget.dates(Tourstartedate,Tourenddate);
                              });
                            },
                            hint: Text(
                                SearchListitem != ""
                                    ? SearchListitem
                                    : "Select Service",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleCustomColor(
                                    14.0.scale(), Colors.black)),
                          ),
                        ),
                      ).align(Alignment.center),
                    ],
                  ),
                ).align(Alignment.center),
              ),
              AVerticalSpace(10.0.scale()),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 60.0.scale(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1.0,
                      // assign the color to the border color
                      color: kColorThemePurpleColor,
                    ),
                    borderRadius: new BorderRadius.all(
                      Radius.circular(2.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                    children: [
                      AHorizontalSpace(5.0.scale()),
                      Image.asset(
                        "assets/images/ic_search2.png",
                        height: 25.0.scale(),
                        width: 25.0.scale(),
                      ),
                      AHorizontalSpace(10.0.scale()),
                      Container(
                        height: 60.0.scale(),
                        width: 200.0.scale(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0.scale()),
                          border: Border.all(
                              color: Colors.white10, width: 1.0.scale()),
                          color: Colors.white10,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Subcategories>(
                            isExpanded: true,
                            items: subcategoriesMainList!
                                .map<DropdownMenuItem<Subcategories>>(
                                    (Subcategories itemdate) {
                              return DropdownMenuItem<Subcategories>(
                                value: itemdate,
                                child:
                                    Text(itemdate!.subCategoryName.toString()),
                              );
                            }).toList(),
                            onChanged: (Subcategories? value) {
                              setState(() {
                                value!.subCategoryName;
                                subcatid=value.subCategoryId!.toString();
                                print("${value.subCategoryName!.toString()}");

                                SearchListsubcat =
                                    "${value.subCategoryName!.toString()}";
                                subcatid=value.subCategoryId!.toString();


                              });
                            },
                            hint: Text(
                                SearchListsubcat != ""
                                    ? SearchListsubcat
                                    : "Select SubCategory",
                                overflow: TextOverflow.ellipsis,
                                style: textStyleCustomColor(
                                    14.0.scale(), Colors.black)),
                          ),
                        ),
                      ).align(Alignment.center),
                    ],
                  ),
                ).align(Alignment.center),
              ),
              AVerticalSpace(10.0.scale()),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: (){

                    BlocProvider.of<HomeBloc>(context)
                        .add(HomeSearchLocationCityBtnClick(''));
                  },
                  child: Container(
                    height: 60.0.scale(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1.0,
                        // assign the color to the border color
                        color: kColorThemePurpleColor,
                      ),
                      borderRadius: new BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,


                      children: [
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {

                            BlocProvider.of<HomeBloc>(context)
                                .add(HomeSearchLocationCityBtnClick(''));
                          },
                          child: Image.asset(
                            "assets/images/ic_search3.png",
                            height: 25.0.scale(),
                            width: 25.0.scale(),
                          ),
                        ),
                        AHorizontalSpace(10.0.scale()),
                        Container(
                          height: 60.0.scale(),
                          width: 200.0.scale(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0.scale()),
                            border: Border.all(
                                color: Colors.white10, width: 1.0.scale()),
                            color: Colors.white10,
                          ),
                          child:Text(sharedPrefs.searchLocation!=""?sharedPrefs.searchLocation!:"Search Place",
                              style: textStyleCustomColor(14.0.scale(), Colors.black), maxLines: 2, overflow: TextOverflow.ellipsis,)
                              .align(Alignment.center),

                        ),

                      ],
                    ),
                  ).align(Alignment.center),
                ),
              ),
              AVerticalSpace(30.0.scale()),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: ()
                {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeSearchPageBtnClick());
                },
                child: Container(
                  height: 60.0.scale(),
                  width: 200.0.scale(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey),
                    color: kColorThemePurpleColor,
                  ),
                  child: Text("Search",
                          textAlign: TextAlign.center,
                          style: textStyleCustomColor(16.0.scale(), Colors.white))
                      .align(Alignment.center),
                ),
              ),
              AVerticalSpace(50.0.scale()),

            ],
          ),
        ),
      )),
    );
  }
}
