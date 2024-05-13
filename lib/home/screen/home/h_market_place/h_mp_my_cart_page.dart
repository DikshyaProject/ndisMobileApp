import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_separator_line.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/bloc/home_bloc.dart';
import 'package:ndisparticipant/home/bloc/home_event.dart';
import 'package:ndisparticipant/home/model/market_place/cart_list_model.dart';

class HomeMpMyCartPage extends StatefulWidget {
  const HomeMpMyCartPage({super.key});

  @override
  State<HomeMpMyCartPage> createState() => _HomeMpMyCartPageState();
}

class _HomeMpMyCartPageState extends State<HomeMpMyCartPage> {
  List count = [1,1,1,1,1,1,1,1,1,1];
  bool? goToCheckout;
  String? screen;
  CartData? cartData;
  List<CartList>? cart_list;
  CartListBottom? cart_list_bottom;
  String? actual_price;

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if(homeState is HomeMyCartPageClickState)
    {
     goToCheckout = homeState.isCheckOut;
     screen = homeState.screenName;
     cartData = homeState.cartListModel?.data;
     cart_list = cartData?.cartList;
     cart_list_bottom = cartData?.cartListBottom;
     print("cart_list_bottom____is_${goToCheckout}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if(state is HomeMpProductDetailPageState){
          if(goToCheckout == true){
            setState(() {
              goToCheckout = false;
            });
            BlocProvider.of<HomeBloc>(context).add(EventPlaceOrderClick());
          }else if(goToCheckout == false){
            Navigator.of(context).pop();
          }
        } if(state is HomeMpVehicalDetailPageState){
          if(goToCheckout == true){
            setState(() {
              goToCheckout = false;
            });
            BlocProvider.of<HomeBloc>(context).add(EventPlaceOrderClick());
          }else if(goToCheckout == false){
            Navigator.of(context).pop();
          }
        }

      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "My Cart",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      print("screen___$screen");
                      BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(screen));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white))),

            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(top: 7.5.scale()),
                    child: ListView.builder(
                      itemCount: cart_list?.length,
                        itemBuilder: (context, index){

                          var item = cart_list?[index];

                          if (item != null && item.price != null && item.quantity != null) {
                            var price = double.parse(item.price!);
                            var quantity = double.parse(item.quantity!);
                            var result = price * quantity;
                            actual_price = result.toString();
                          }

                      return Padding(
                        padding:  EdgeInsets.only(left: 15.0.scale(), right: 15.0.scale(), top: 7.5.scale(), bottom: 7.5.scale(), ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                         child: Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 10.0.scale(), vertical: 10.0.scale()),
                           child: Row(
                              children: [
                                Container(
                                    height: 90.0.scale(), width: 90.0.scale(),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0.scale()),
                                      border: Border.all(color: Colors.grey)
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0.scale()),
                                        child: NetworkImagesWidgets(  fit: BoxFit.fill, url: '${cart_list?[index].galleryImage}',))),
                                AHorizontalSpace(10.0.scale()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("${cart_list?[index].productName}",
                                      maxLines: 2,
                                      style: textStyleCustomColor(13.0.scale(), Colors.black),),
                                    AVerticalSpace(5.0.scale()),
                                    Row(
                                      children: [
                                        Text("${cart_list?[index].price}",  style: textStyleBoldCustomLargeColor(14.0.scale(), kColorThemePurpleColor),),
                                        Text(" (${cart_list?[index].quantity} items)",  style: textStyleCustomColor(12.0.scale(), Colors.black),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("${actual_price}",  style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 14.0.scale())),
                                        Text(" ${cart_list?[index].totalPrice}", style: textStyleBoldCustomLargeColor(14.0.scale(), kColorThemePurpleColor),),
                                      ],
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   children: [
                                    //     InkWell(
                                    //       onTap: (){
                                    //         decrement(index);
                                    //         print("tapped_index_is==$index");
                                    //         setState(() {});
                                    //
                                    //       },
                                    //       child: Container(
                                    //         padding: EdgeInsets.symmetric(horizontal: 13.0.scale()),
                                    //         decoration: BoxDecoration(
                                    //             color: Color(0xffE6E6E6),
                                    //             borderRadius: BorderRadius.circular(5)
                                    //         ),
                                    //         child: Center(child: Text("-", style: textStyleBoldCustomColor(20.0.scale(),Color(0xff797979),),)),
                                    //       ),
                                    //     ),
                                    //     AHorizontalSpace(20.0.scale()),
                                    //     Text("${count[index]}", style: textStyleBoldCustomColor(15.0.scale(), Colors.black,),),
                                    //     AHorizontalSpace(20.0.scale()),
                                    //     InkWell(
                                    //       onTap: (){
                                    //         increment(index);
                                    //         setState(() {});
                                    //       },
                                    //       child: Container(
                                    //         padding: EdgeInsets.symmetric(horizontal: 13.0.scale()),
                                    //         decoration: BoxDecoration(
                                    //             color: Color(0xff1DB404),
                                    //             borderRadius: BorderRadius.circular(5)
                                    //         ),
                                    //         child: Center(child: Text("+", style: textStyleBoldCustomColor(20.0.scale(), Colors.white,),)),
                                    //       ),
                                    //     ),
                                    //
                                    //   ],
                                    // ),

                                  ],
                                ).expand()
                              ],
                            ),
                         )
                        ),
                      );
                    }),
                  ),
                ),

                goToCheckout == true?
                checkOutWidget():
                cartWidget(),


              ],
            ),

          )),
    );
  }

  increment(i) {
    if(count[i]<=10){
      count[i]++;
    }
  }

  decrement(i) {
    if(count[i]>1){
      count[i]--;
    }
  }

  Widget cartWidget(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.0.scale()),
      child: Column(
        children: [
          ASeparatorLine(
            height: 1.0.scale(),
            color: Colors.grey.withOpacity(0.3),
          ),
          AVerticalSpace(20.0.scale()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal',  style: textStyleCustomColor(15.0.scale(), Colors.black),),
              Text('${cart_list_bottom?.subTotal}',  style: textStyleCustomColor(15.0.scale(), Colors.black),),

            ],
          ),
          AVerticalSpace(5.0.scale()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount',  style: textStyleCustomColor(15.0.scale(), Colors.black),),
              Text('${cart_list_bottom?.discountAmount}',  style: textStyleCustomColor(15.0.scale(), Colors.black),),

            ],
          ),
          AVerticalSpace(5.0.scale()),
          ASeparatorLine(
            height: 1.0.scale(),
            color: Colors.grey.withOpacity(0.3),
          ),
          AVerticalSpace(5.0.scale()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',  style: textStyleBoldCustomColor(15.0.scale(), Colors.black),),
              Text('${cart_list_bottom?.total}',  style: textStyleBoldCustomColor(15.0.scale(), Color(0xff048D11)),),

            ],
          ),
          AVerticalSpace(20.0.scale()),
          InkWell(
            onTap: (){
              setState(() {
                goToCheckout = true;
              });

              if(screen == "vehicle_detail") {
                BlocProvider.of<HomeBloc>(context).add(EventVehicleCheckoutClick());
              }else {
                BlocProvider.of<HomeBloc>(context).add(EventProductCheckoutClick());
              }
            },
            child: Container(
              height: 50.0.scale(),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff45BD14),
                borderRadius: BorderRadius.circular(10.0.scale()),

              ),
              child: Center(child: Text('Place Order',  style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.white),)),

            ),
          ),
          AVerticalSpace(20.0.scale()),

        ],
      ),
    );
  }

  Widget checkOutWidget(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.0.scale()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Summary',  style: textStyleBoldCustomColor(16.0.scale(), Colors.black),),
          AVerticalSpace(10.0.scale()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal',  style: textStyleCustomColor(15.0.scale(), Colors.black),),
              Text('\$13.00',  style: textStyleCustomColor(15.0.scale(), Colors.black),),

            ],
          ),
          AVerticalSpace(5.0.scale()),
          ASeparatorLine(
            height: 1.0.scale(),
            color: Colors.grey.withOpacity(0.3),
          ),
          AVerticalSpace(5.0.scale()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping',  style: textStyleCustomColor(15.0.scale(), Colors.black),),
              Text('\$3.20',  style: textStyleCustomColor(15.0.scale(), Colors.black),),

            ],
          ),
          AVerticalSpace(5.0.scale()),
          Text('1536 java Lane, North Augusta, 29841',  style: textStyleCustomColor(14.0.scale(), Colors.black),),
          AVerticalSpace(5.0.scale()),
          Text('Change Address',  style: TextStyle(fontSize: 15.0.scale(), decoration: TextDecoration.underline),),
          AVerticalSpace(10.0.scale()),
          ASeparatorLine(
            height: 1.0.scale(),
            color: Colors.grey.withOpacity(0.3),
          ),
          AVerticalSpace(10.0.scale()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax',  style: textStyleCustomColor(15.0.scale(), Colors.black),),
              Text('\$3.20',  style: textStyleCustomColor(15.0.scale(), Colors.black),),

            ],
          ),
          AVerticalSpace(10.0.scale()),
          ASeparatorLine(
            height: 1.0.scale(),
            color: Colors.grey.withOpacity(0.3),
          ),
          AVerticalSpace(10.0.scale()),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',  style: textStyleBoldCustomColor(15.0.scale(), Colors.black),),
              Text('\$16.20',  style: textStyleBoldCustomColor(15.0.scale(), Color(0xff048D11)),),

            ],
          ),
          AVerticalSpace(20.0.scale()),
          InkWell(
            onTap: (){

            },
            child: Container(
              height: 50.0.scale(),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff45BD14),
                borderRadius: BorderRadius.circular(10.0.scale()),

              ),
              child: Center(child: Text('Check Out',  style: textStyleBoldCustomLargeColor(16.0.scale(), Colors.white),)),

            ),
          ),
          AVerticalSpace(20.0.scale()),

        ],
      ),
    );
  }

}
