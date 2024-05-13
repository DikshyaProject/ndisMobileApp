import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/model/ndis_expert/ndis_service_category_model.dart';
import '../../../../Helpers/theme/theme.dart';
import '../../../home.dart';


class HomeServiceExpertMainCategoryList extends StatefulWidget {
  @override
  State<HomeServiceExpertMainCategoryList> createState() =>
      _HomeServiceExpertMainCategoryListState();
}

class _HomeServiceExpertMainCategoryListState extends State<HomeServiceExpertMainCategoryList> {
  NdisServiceCatData? CategoryData;
  List<NdisServiceExpertCatData>? ndisServiceExpertCatData;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeNdisServiceExpertMainListingPageState){
      CategoryData = homeState.categoryModelData;
      ndisServiceExpertCatData = CategoryData!.ndisServiceExpertCatData;
      print("ndis_service_list_length====${ndisServiceExpertCatData?.length}");
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
        if (state is HomeServiceExpertDetilsPageState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.hServiceExpertListPage);
        }
        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          showSnackBar(state.message, Colors.black, context);
          BlocProvider.of<HomeBloc>(context).add(HomeGridNdisServiceExpertBtnClick());
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "All Service Expert",
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
                AVerticalSpace(10.0.scale()),
                Container(
                        width: MediaQuery.of(context).size.width,
                        child: _GridMainServiceExpertListWidget(ndisServiceExpertCatData, showHideProgress)),
                AVerticalSpace(20.0.scale())
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _GridMainServiceExpertListWidget extends StatefulWidget {
  List<NdisServiceExpertCatData>?  mainCatList;
  Function showHideProgress1;

  _GridMainServiceExpertListWidget(this.mainCatList, this.showHideProgress1);

  @override
  _GridMainServiceExpertListWidgetState createState() =>
      _GridMainServiceExpertListWidgetState();
}

class _GridMainServiceExpertListWidgetState extends State<_GridMainServiceExpertListWidget> {

  @override
  Widget build(BuildContext context) {
    return GoogleGrid(
      columnCount: 2,
      gap: 2.0.scale(),
      padding: const EdgeInsets.all(5.0),
      children: [
        for (int i = 0; i < int.parse("${widget.mainCatList?.length}"); i++)
          GestureDetector(
            onTap: (){
              widget.showHideProgress1(true);
              BlocProvider.of<HomeBloc>(context).add(HomeServiceExpertDetilsPageClick("${widget.mainCatList![i].categoryId}"));
            },
            child: Container(
              height: 120.0.scale(),
              width: 200.0.scale(),
              child: Stack(
                children: [
                  Container(
                    width: 180.0.scale(),
                    height: 120.0.scale(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0.scale()),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: NetworkImagesWidgets(
                        url: '${widget.mainCatList![i].categoryImage}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                      alignment: Alignment.center,
                      height: 120.0.scale(),
                      width: 180.0.scale(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.mainCatList![i].categoryName}',
                            textAlign: TextAlign.center,
                            style: textStyleCustomColor(12.0.scale(), Colors.white),
                          ),
                          Text(
                            'Experts ${widget.mainCatList![i].categoryExpertCount}',
                            textAlign: TextAlign.center,
                            style: textStyleBoldCustomColor(10.0.scale(), Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
                .leftPadding(5.0.scale())
                .rightPadding(5.0.scale())
                .topPadding(5.0.scale())
                .bottomPadding(5.0.scale()),
          ),
      ],
    );
  }
}
