import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../home_navigator.dart';
import '../../../model/support_worker/support_worker_cat_list_model.dart';

SupportWorkerCatListData? supportWorkerCatListData;
List<SupportWorkerCatList>? supportWorkerCatList;
String screen='';

class HomeSupportWorkerListPage extends StatefulWidget {
  const HomeSupportWorkerListPage({Key? key}) : super(key: key);

  @override
  _HomeSupportWorkerListPageState createState() => _HomeSupportWorkerListPageState();
}

class _HomeSupportWorkerListPageState extends State<HomeSupportWorkerListPage> {

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }
  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if(homeState is HomeSupportWorkerPageState)
    {
      supportWorkerCatListData=homeState.supportWorkerCatListData;
      supportWorkerCatList=supportWorkerCatListData!.supportWorkerCatList;
      screen = homeState.screenName.toString();
      print("screen_name__here_$screen");
    }
    super.initState();
  }
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
    listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
    listener: (context, state) {
      if(state is HomeInitial){
        Navigator.pop(context, true);
      }
      if(state is HomeFindSupportPageState){
        Navigator.pop(context, true);
      }
      if(state is HomeerrorloadingState)
      {
        showHideProgress(false);
        showSnackBar(state.message, Colors.black, context);
        BlocProvider.of<HomeBloc>(context).add(HomeSupportWorkerPageBtnClick("find_support"));
      }
      else if(state is HomeSupportWorkerSubCategoryPageState){
        showHideProgress(false);
        Navigator.of(context).pushNamed(HomeNavigator.homeSupportWorkerSubCatgoryListDetailsPage);
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
                BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(screen));
              },
              child: Icon(Icons.arrow_back, color: Colors.white))),
    body: SupportWorkerCategoryList(supportWorkerCatList!,showHideProgress),
    )
    )
    );
  }
}
class SupportWorkerCategoryList extends StatefulWidget {
  List<SupportWorkerCatList> supportWorkerCatList1;
  Function showHideProgress1;
   SupportWorkerCategoryList(this.supportWorkerCatList1,this.showHideProgress1);

  @override
  _SupportWorkerCategoryListState createState() => _SupportWorkerCategoryListState();
}

class _SupportWorkerCategoryListState extends State<SupportWorkerCategoryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.supportWorkerCatList1!.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: ()
              {
                widget.showHideProgress1(true);
                BlocProvider.of<HomeBloc>(context).add(HomeEventSupportWorkerSubCatgoryListDetailsBtnClick("${widget.supportWorkerCatList1?[index].suppOfferId}",screen));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: kColorThemePurpleColor,
                      blurRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5.0.scale()),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0.scale(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0.scale()),
                            topLeft: Radius.circular(5.0.scale()),
                            bottomRight: Radius.circular(5.0.scale()),
                            bottomLeft: Radius.circular(5.0.scale()),
                          ),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0.scale()),
                          topLeft: Radius.circular(5.0.scale()),
                          bottomRight: Radius.circular(5.0.scale()),
                          bottomLeft: Radius.circular(5.0.scale()),
                        ),
                        child: NetworkImagesWidgets(
                          url:  widget.supportWorkerCatList1![index].suppOfferImage!,
                          // color: const Color.fromRGBO(200, 200, 200, 10),
                          // colorBlendMode: BlendMode.modulate,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0.scale(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                          color: Colors.black.withOpacity(0.3)
                      ),
                    ),
                    Column(
                      children: [
                        Text(widget.supportWorkerCatList1![index].offerName.toString(),textAlign: TextAlign.center,
                            style: textStyleBoldCustomColor(16.0.scale(), Colors.white)),
                        Text("Experts ${widget.supportWorkerCatList1?[index].totalExpertsCount}",textAlign: TextAlign.center,
                            style: textStyleBoldCustomColor(16.0.scale(), Colors.white)),
                      ],
                    ).align(Alignment.topCenter).topPadding(150.0.scale()),
                  ],

                ),
              ).leftPadding(10.0.scale()).rightPadding(10.0.scale()).topPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            )
    );
  }
}

