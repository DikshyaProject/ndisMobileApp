import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/model/support-coordinator/h_s_coordinator_category_model.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../components/a_non_scroll_grid_view.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../home_navigator.dart';

class HomeSupportCoordinators extends StatefulWidget {
  const HomeSupportCoordinators({super.key});

  @override
  State<HomeSupportCoordinators> createState() =>
      _HomeSupportCoordinatorsState();
}

class _HomeSupportCoordinatorsState extends State<HomeSupportCoordinators> {
  ScoordData? CategoryData;
  List<Subcategories>? allSupportCordinatersCatData;
  String screen='';

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeSupportCoordinatorsPageState){
      CategoryData = homeState.categoryModelData;
      for(int i=0; i<CategoryData!.allSupportCordinatersCatData!.length; i++){
        for(int j=0; j<CategoryData!.allSupportCordinatersCatData![i].subcategories!.length; j++){
          allSupportCordinatersCatData = CategoryData!.allSupportCordinatersCatData![i].subcategories;
        }
      }
      screen = homeState.screenName.toString();
      print("screen_name__here_$screen");
      print("support_coordinator_list_length====${allSupportCordinatersCatData?.length}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {

        if (state is HomeInitial) {
          Navigator.of(context).pop(true);
        }
        if(state is HomeFindSupportPageState){
          Navigator.pop(context, true);
        }

        if(state is HomeSupportCoordinatorsListPageState){
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.HomeSupportCoordinatorsList);
        }
        if(state is HomeerrorloadingState)
        {
          showHideProgress(false);
          showSnackBar(state.message, Colors.black, context);
          BlocProvider.of<HomeBloc>(context).add(HomeSupportCoordinatorPageBtnClick("find_support"));
        }

      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "All Support Coordinators",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(screen));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),
        body: SingleChildScrollView(
          child: GoogleGrid(
            columnCount: 2,
            gap: 5.0.scale(),
            padding: const EdgeInsets.all(5.0),
            children: [
              for(int i=0; i<CategoryData!.allSupportCordinatersCatData!.length; i++)
              for (int j = 0; j < CategoryData!.allSupportCordinatersCatData![i].subcategories!.length; j++)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  showHideProgress(true);
                  BlocProvider.of<HomeBloc>(context).add(
                      HomeSupportCoordinatorListClick(CategoryData!.allSupportCordinatersCatData?[i].categoryId,
                          CategoryData!.allSupportCordinatersCatData?[i].subcategories?[j].subCategoryId, screen));
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0.scale()),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child:  NetworkImagesWidgets(
                          url: "${CategoryData!.allSupportCordinatersCatData?[i].subcategories?[j].subCategoryImage}", fit: BoxFit.cover,
               ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${CategoryData!.allSupportCordinatersCatData?[i].subcategories?[j].subCategoryName}",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textStyleCustomColor(12.0.scale(), Colors.white),
                          ),
                          Text(
                            "Experts ${CategoryData!.allSupportCordinatersCatData?[i].subcategories?[j].subCategoryListCount}",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textStyleCustomColor(8.0.scale(), Colors.white),
                          ),
                          AVerticalSpace(5.0.scale()),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
