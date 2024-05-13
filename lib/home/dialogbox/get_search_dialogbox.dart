import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';

import '../../Helpers/theme/ft_theme_colors.dart';
import '../../Helpers/theme/ft_theme_styles.dart';
import '../../components/a_vertical_space.dart';

const double _kVerticalSpaceTopHeartLogo = 90.0;
const double _kVerticalSpaceAfterUserNameField = 25.0;
const double _kCommonPadding = 14.0;
const double _kCommonHintTextFieldFontSize = 14.0;
const double _kWelcomeTextFont = 15.0;
const double _kSignInTextFont = 14.0;
final FocusNode _focusNodeemailIdController = FocusNode();
final FocusNode _focusNodepassWordController = FocusNode();
final List<String> audiMake = [
  'A3',
  'A4',
];
final List<String> bmwMake = [
  '1 Series',
  '2 Series',
];

String? selectedCardModel;
String? selectedMake;

late Map<String, List<String>> dataset = {
  'Audi': audiMake,
  'BMW': bmwMake,
};

var items = [
  'Select Service',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];
String dropdownvalue = 'Select Service';

getSearchdilogbox({
  required BuildContext context,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return _getOneButtonDialog(
        context: context,
      );
    },
  );
}

Dialog _getOneButtonDialog({
  required BuildContext context,
}) {
  return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.scale())),
      elevation: 8,
      insetAnimationDuration: Duration(milliseconds: 30),
      insetPadding: EdgeInsets.all(10.0.scale()),
      child: Container(
        height: 450.0.scale(),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xFF20334C),
              centerTitle: false,
              elevation: 0,
              title: Text(
                "Search All Service",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ).align(Alignment.topCenter).rightPadding(15.0.scale()),
              leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    //keyBoardHideFocusChange(context);
                    // BlocProvider.of<HomeBloc>(context)
                    //     .add(HomeEventBackBtnClick());
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white)
                      .leftPadding(5.0.scale()))),
          body: Searchlist(),
        ),
      ));
}

class Searchlist extends StatefulWidget {
  Searchlist({super.key});

  @override
  State<Searchlist> createState() => _SearchlistState();
}

class _SearchlistState extends State<Searchlist> {
  onCarModelChanged(String? value) {
    //dont change second dropdown if 1st item didnt change
    if (value != selectedCardModel) selectedMake = null;
    setState(() {
      selectedCardModel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AVerticalSpace(10.0.scale()),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 40.0.scale(),
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
              child: DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down).leftPadding(10.0.scale()),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items).align(Alignment.center),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ).align(Alignment.center),
          ),
          DropdownButton<String?>(
              value: selectedCardModel,
              items: dataset.keys.map((e) {
                return DropdownMenuItem<String?>(
                  value: e,
                  child: Text('$e'),
                );
              }).toList(),
              onChanged: onCarModelChanged),
          DropdownButton<String?>(
              value: selectedMake,
              items: (dataset[selectedCardModel] ?? []).map((e) {
                return DropdownMenuItem<String?>(
                  value: e,
                  child: Text('$e'),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedMake = val!;
                });
              }),
          AVerticalSpace(10.0.scale()),
          Container(
            height: 60.0.scale(),
            width: 150.0.scale(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.grey),
              color: kColorThemePurpleColor,
            ),
            child: Text("Search",
                    textAlign: TextAlign.center,
                    style: textStyleCustomColor(16.0.scale(), Colors.white))
                .align(Alignment.center),
          ),
          AVerticalSpace(50.0.scale())
        ],
      ),
    );
  }
}
