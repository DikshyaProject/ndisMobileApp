import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';

import '../../Helpers/theme/theme.dart';
import '../../components/components.dart';
import '../home.dart';

class BillingDetailPage extends StatefulWidget {
  @override
  State<BillingDetailPage> createState() => _BillingDetailPageState();
}

class _BillingDetailPageState extends State<BillingDetailPage> {
  TextEditingController? _textFiledUserName;

  final focusUserName = FocusNode();

  TextEditingController? _textFiledAddress;

  final focusUserAddress = FocusNode();
  TextEditingController? _textFiledCity;

  final focusUserCity = FocusNode();
  TextEditingController? _textFiledPostCode;

  final focusUserPostCode = FocusNode();
  TextEditingController? _textFiledPhoneNumber;

  final focusUserPhoneNumber = FocusNode();
  TextEditingController? _textFiledEmailId;

  final focusUserEmailId = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    _textFiledUserName=TextEditingController();
    _textFiledAddress=TextEditingController();
    _textFiledCity=TextEditingController();
    _textFiledPostCode=TextEditingController();
    _textFiledPhoneNumber=TextEditingController();
    _textFiledEmailId=TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {},
        child: SafeArea(
          child: Scaffold(




            appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: false,
                elevation: 0,
                leading: InkWell(
                    onTap: () {
                      // BlocProvider.of<HomeBloc>(context)
                      //     .add(HomeEventPlanPricingListBackBtnClick(features!,pricingDataPlanModel));

                    },
                    child: Icon(Icons.arrow_back, color: Colors.grey))),
            body: Column(
              children: [
                Text(
                  "Billing Details",
                  style: textStyleBoldCustomColor(18.0.scale(), Colors.black),
                ),
                AVerticalSpace(15.0.scale()),
                Text(
                  "Name",
                  style: textStyleCustomColor(12.0.scale(), Colors.black),
                ).align(Alignment.centerLeft),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(focusUserName);
                  },
                  child: Container(
                    height: 40.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode: focusUserName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                      ),
                      textInputAction: TextInputAction.next,
                      controller: _textFiledUserName,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {},
                      onChanged: (value) {},
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusUserName);
                      },
                      autofocus: true,
                      cursorColor: kColorDialogNameTitle,
                    ),
                  ),
                ),
                ASeparatorLine(
                  height: 1.0.scale(),
                  color: Colors.grey,
                ),
                AVerticalSpace(10.0.scale()),
                Text(
                  "Address",
                  style: textStyleCustomColor(12.0.scale(), Colors.black),
                ).align(Alignment.centerLeft),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(focusUserAddress);
                  },
                  child: Container(
                    height: 40.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode: focusUserAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                      ),
                      textInputAction: TextInputAction.next,
                      controller: _textFiledAddress,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {},
                      onChanged: (value) {},
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusUserAddress);
                      },
                      autofocus: true,
                      cursorColor: kColorDialogNameTitle,
                    ),
                  ),
                ),
                ASeparatorLine(
                  height: 1.0.scale(),
                  color: Colors.grey,
                ),
                AVerticalSpace(10.0.scale()),
                Text(
                  "City",
                  style: textStyleCustomColor(12.0.scale(), Colors.black),
                ).align(Alignment.centerLeft),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(focusUserCity);
                  },
                  child: Container(
                    height: 40.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode: focusUserCity,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                      ),
                      textInputAction: TextInputAction.next,
                      controller: _textFiledCity,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {},
                      onChanged: (value) {},
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusUserCity);
                      },
                      autofocus: true,
                      cursorColor: kColorDialogNameTitle,
                    ),
                  ),
                ),
                ASeparatorLine(
                  height: 1.0.scale(),
                  color: Colors.grey,
                ),
                AVerticalSpace(10.0.scale()),
                Text(
                  "PostCode",
                  style: textStyleCustomColor(12.0.scale(), Colors.black),
                ).align(Alignment.centerLeft),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(focusUserPostCode);
                  },
                  child: Container(
                    height: 40.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode: focusUserPostCode,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                      ),
                      textInputAction: TextInputAction.next,
                      controller: _textFiledPostCode,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {},
                      onChanged: (value) {},
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusUserPostCode);
                      },
                      autofocus: true,
                      cursorColor: kColorDialogNameTitle,
                    ),
                  ),
                ),
                ASeparatorLine(
                  height: 1.0.scale(),
                  color: Colors.grey,
                ),
                AVerticalSpace(10.0.scale()),

                Text(
                  "Phone Number",
                  style: textStyleCustomColor(12.0.scale(), Colors.black),
                ).align(Alignment.centerLeft),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(focusUserPhoneNumber);
                  },
                  child: Container(
                    height: 40.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode: focusUserPhoneNumber,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                      ),
                      textInputAction: TextInputAction.next,
                      controller: _textFiledPhoneNumber,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {},
                      onChanged: (value) {},
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusUserPhoneNumber);
                      },
                      autofocus: true,
                      cursorColor: kColorDialogNameTitle,
                    ),
                  ),
                ),
                ASeparatorLine(
                  height: 1.0.scale(),
                  color: Colors.grey,
                ),
                AVerticalSpace(10.0.scale()),
                Text(
                  "Email Id",
                  style: textStyleCustomColor(12.0.scale(), Colors.black),
                ).align(Alignment.centerLeft),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(focusUserEmailId);
                  },
                  child: Container(
                    height: 40.0.scale(),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      focusNode: focusUserEmailId,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                      ),
                      textInputAction: TextInputAction.next,
                      controller: _textFiledEmailId,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {},
                      onChanged: (value) {},
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusUserEmailId);
                      },
                      autofocus: true,
                      cursorColor: kColorDialogNameTitle,
                    ),
                  ),
                ),
                ASeparatorLine(
                  height: 1.0.scale(),
                  color: Colors.grey,
                ),
                AVerticalSpace(10.0.scale()),
                AVerticalSpace(25.0.scale()),
                ARoundedButton(
                  btnBgColor: kColorThemeDarkGreenColor,
                  btnTextColor: Colors.white,
                  btnOnPressed: () {

                  },
                  btnText: 'Submit',
                  btnHeight: 45.0.scale(),
                  btnWidth: 260.0.scale(),
                  btnFontSize: 12.0.scale(),
                  btnFontWeight: FontWeight.bold,
                  btnElevation: 0,
                  btnBorderSideColor: Colors.transparent,
                ).align(Alignment.center),
              ],
            ).scroll().leftPadding(10.0.scale()).rightPadding(10.0.scale()),
          ),
        ));
  }
}
