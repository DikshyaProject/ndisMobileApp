import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../../components/a_non_scroll_grid_view.dart';
import '../../../home_navigator.dart';
import '../../../model/find_support/find_support_list_model.dart';
import '../../../model/general/ourserviceList_model.dart';
FindSupportListData? findSupportListData;
List<FindSupport>? findSupport=[];
List<OurServiceModel>? ourServiceList = [];

class HomeFindSupport extends StatefulWidget {
  const HomeFindSupport({super.key});

  @override
  State<HomeFindSupport> createState() =>
      _HomeFindSupportState();
}

class _HomeFindSupportState extends State<HomeFindSupport> {

  List<OurServiceModel> ourServiceList = [

  OurServiceModel(image: "ic_support_worker", title: "Support Workers"),

  OurServiceModel(
  image: "ic_support_corrdinator", title: "Support Coordinators"),

  OurServiceModel(image: "ic_plan_manager", title: "Plan Managers"),
    OurServiceModel(image: "ic_plan_manager", title: "Plan Managers"),
    OurServiceModel(image: "ic_plan_manager", title: "Plan Managers"),


  ];
  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeFindSupportPageState){
      findSupportListData=homeState.findSupportListData;
      findSupport=findSupportListData!.findSupport;
    }
    // TODO: implement initState
    super.initState();
  }
  void showHideProgress(bool show)
  {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeSupportWorkerPageState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.homeSupportWorkerListPage);
        }
        if (state is HomeSupportCoordinatorsPageState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.supportCoordinatorPage);
        }
        if(state is HomePlanManagersBtnClickState){
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hPlanManagersPage);
        }
        if(state is HomePsychosocialBtnClickState){
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hPsychoRecoveryPage);
        }
        if(state is AdvocacySupportBtnClickState){
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.AdvocacySupportPage);
        }
        if(state is HomeerrorloadingState){
           
          showHideProgress(false);
          showSnackBar(state.message, Colors.black, context);
        }
        if(state is HomeInitial)
        {
           
          showHideProgress(false);
          Navigator.pop(context,true);
        }

      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Find Support",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),

            body: SingleChildScrollView(
              child: GoogleGrid(
                columnCount: 2,
                gap: 10.0.scale(),
                padding: const EdgeInsets.all(5.0),
                children: [
                  for(int i=0; i<findSupport!.length; i++)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        print("nfkjsjfhe${findSupport![i].supportName}");
                         if(findSupport![i].supportName=="Support Coordinators"){
                          showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(HomeSupportCoordinatorPageBtnClick("find_support"));
                        }else if(findSupport![i].supportName=="Support Workers"){
                         showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(HomeSupportWorkerPageBtnClick("find_support"));
                        }else if(findSupport![i].supportName=="Plan Managers") {
                          showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(HomePlanManagersBtnClick("find_support"));
                        }else if(findSupport![i].supportName=="Psychosocial Recovery Coach") {
                          showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(HomePsychosocialBtnClick());
                        }else if(findSupport![i].supportName=="Advocacy and Support Orgnisation") {
                          showHideProgress(true);
                          BlocProvider.of<HomeBloc>(context).add(AdvocacySupportBtnClick());
                        }

                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child:
                              Image.asset(
                                "assets/images/${ourServiceList![i].image}.png",
                                height: 150.0.scale(),
                                width: 150.0.scale(),
                                color: const Color.fromRGBO(200, 100, 100, 10),
                                colorBlendMode: BlendMode.modulate,
                              )),
                          ),

                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 150.0.scale(),
                            padding: EdgeInsets.symmetric(horizontal: 10.0.scale(), ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${findSupport![i].supportName}",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyleBoldCustomColor(12.0.scale(), Colors.white, ),
                            ).bottomPadding(10.0.scale()),
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
