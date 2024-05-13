import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_horizontal_space.dart';
import 'package:ndisparticipant/components/a_vertical_space.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';

import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../profile_model/job_profile_dropdown_model.dart';

class JobProfilePage extends StatefulWidget {
  const JobProfilePage({Key? key}) : super(key: key);

  @override
  State<JobProfilePage> createState() => _JobProfilePageState();
}

class _JobProfilePageState extends State<JobProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController yoexpController = TextEditingController();
  TextEditingController availTimeController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController exp1Controller = TextEditingController();
  TextEditingController exp2Controller = TextEditingController();
  TextEditingController exp3Controller = TextEditingController();
  TextEditingController exp4Controller = TextEditingController();
  TextEditingController edu1Controller = TextEditingController();
  TextEditingController edu2Controller = TextEditingController();
  TextEditingController edu3Controller = TextEditingController();
  TextEditingController edu4Controller = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController add3Controller = TextEditingController();
  TextEditingController add4Controller = TextEditingController();
  bool isAddExpDetails = false;
  bool isAddEducation = false;
  bool isAdditional = false;
  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeComName = FocusNode();
  final FocusNode _focusNodeYoexp = FocusNode();
  final FocusNode _focusNodeAvailTime = FocusNode();
  final FocusNode _focusNodeEduc = FocusNode();
  final FocusNode _focusNodeExp1 = FocusNode();
  final FocusNode _focusNodeExp2 = FocusNode();
  final FocusNode _focusNodeExp3 = FocusNode();
  final FocusNode _focusNodeExp4 = FocusNode();
  final FocusNode _focusNodeEdu1 = FocusNode();
  final FocusNode _focusNodeEdu2 = FocusNode();
  final FocusNode _focusNodeEdu3 = FocusNode();
  final FocusNode _focusNodeEdu4 = FocusNode();
  final FocusNode _focusNodeadd1 = FocusNode();
  final FocusNode _focusNodeadd2 = FocusNode();
  final FocusNode _focusNodeadd3 = FocusNode();
  final FocusNode _focusNodeadd4 = FocusNode();
  File? _resumeImage;
  String? base64ResumeImage = "";
  String selectedPath = "Upload File";
  File? _jobProfileImage;
  String? base64jobProImage = "";
  String selectedPath2 = "Upload File";
  File? _coverProfileImage;
  String? base64coverProImage = "";
  String selectedPath3 = "Upload File";
  List<String> department = [
    'Trade & Services',
    'Sports & Recreation',
    'Sales',
    'Real Estate & Property',
    'Human Resource'
  ];
  List<String> skills = [
    'Working with Children Check',
    'Medication Training',
    'Manual handling Training',
    'Australian Driver License',
    'First Aid Certificate'
  ];
  String selectedDepartment = "Training and Support Office ";
  String selectedNotice = "Immediate joinee";
  String selectedSkills = "Reliable smart phone with data";
  String selectedSkillSetId = "11";
  String selectedJobProfessionId = "119";
  var selectedTime = TimeOfDay.fromDateTime(DateTime.now());
  List<JobProfession>? job_profession;
  List<String>? noticePeriod;
  List<SkillList>? skillList;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });
    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
        print("selectedTime____${selectedTime.format(context)}");
        availTimeController.text = selectedTime.format(context);
      });
  }


  void _showPicker(context, String imageType) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Stack(
            children: [
              SafeArea(
                child: Container(
                  child: Wrap(
                    children: [
                      ListTile(
                          leading: new Icon(Icons.photo_library),
                          title: new Text('Photo Library'),
                          onTap: () {
                            _imgFromGallery(imageType);
                            Navigator.of(context).pop();
                          }),
                      ListTile(
                        leading: new Icon(Icons.photo_camera),
                        title: new Text('Camera'),
                        onTap: () {
                          _imgFromCamera(imageType);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  _imgFromGallery(String type) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        if (type == "resume") {
          _resumeImage = File(pickedFile.path);

          final bytes = File(pickedFile.path).readAsBytesSync();
          base64ResumeImage = "data:image/png;base64," + base64Encode(bytes);
          print(base64ResumeImage.toString());
          selectedPath = pickedFile.path;
        } else if (type == "job_profile_image") {
          _jobProfileImage = File(pickedFile.path);

          final bytes = File(pickedFile.path).readAsBytesSync();
          base64jobProImage = "data:image/png;base64," + base64Encode(bytes);
          print(base64jobProImage.toString());
          selectedPath2 = pickedFile.path;
        } else if (type == "cover_image") {
          _coverProfileImage = File(pickedFile.path);

          final bytes = File(pickedFile.path).readAsBytesSync();
          base64coverProImage = "data:image/png;base64," + base64Encode(bytes);
          print(base64coverProImage.toString());
          selectedPath3 = pickedFile.path;
        }

        print(pickedFile.path);
      });
    }
  }

  _imgFromCamera(String type) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        if (type == "resume") {
          _resumeImage = File(pickedFile.path);

          final bytes = File(pickedFile.path).readAsBytesSync();
          base64ResumeImage = "data:image/png;base64," + base64Encode(bytes);
          print(base64ResumeImage.toString());
          selectedPath = pickedFile.path;
        } else if (type == "job_profile_image") {
          _jobProfileImage = File(pickedFile.path);

          final bytes = File(pickedFile.path).readAsBytesSync();
          base64jobProImage = "data:image/png;base64," + base64Encode(bytes);
          print(base64jobProImage.toString());
          selectedPath2 = pickedFile.path;
        } else if (type == "cover_image") {
          _coverProfileImage = File(pickedFile.path);

          final bytes = File(pickedFile.path).readAsBytesSync();
          base64coverProImage = "data:image/png;base64," + base64Encode(bytes);
          print(base64coverProImage.toString());
          selectedPath3 = pickedFile.path;
        }

        print(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    if (sharedPrefs.IsLogin == true) {
      nameController.text = sharedPrefs.userName;
    }

    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is JobProfileClickState) {
      noticePeriod = profileState.jobProfDropdownModel?.data?.noticePeriod;
      job_profession = profileState.jobProfDropdownModel?.data?.jobProfession;
      skillList = profileState.jobProfDropdownModel?.data?.skillList;
    }
    super.initState();
  }

  @override
  void dispose() {
    _focusNodeName.dispose();
    _focusNodeComName.dispose();
    _focusNodeYoexp.dispose();
    _focusNodeAvailTime.dispose();
    _focusNodeEduc.dispose();
    _focusNodeExp1.dispose();
    _focusNodeExp2.dispose();
    _focusNodeExp3.dispose();
    _focusNodeExp4.dispose();
    _focusNodeEdu1.dispose();
    _focusNodeEdu2.dispose();
    _focusNodeEdu3.dispose();
    _focusNodeEdu4.dispose();
    super.dispose();
  }

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ProfileInitial) {
          showHideProgress(false);
           
          Navigator.of(context).pop();
        }
        if (state is ProfileUserDataPageErrorState) {
          showHideProgress(false);
           
          Navigator.of(context).pop();
          showSnackBar("${state.message}", Colors.black, context);
        }
      },
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
            backgroundColor: kColorThemePurpleColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Job Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0.scale(),
                  fontWeight: FontWeight.w700),
            ),
            leading: InkWell(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(ProfileEventBackBtnClick(""));
                },
                child: Icon(Icons.arrow_back, color: Colors.white))),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AVerticalSpace(10.0.scale()),
                Text(
                  'Employee Name*',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                customTextField(
                    textController: nameController,
                    focus: _focusNodeName,
                    readOnly: true),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Job profession',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                Container(
                  height: 50.0.scale(),
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<JobProfession>(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: job_profession!
                          .map<DropdownMenuItem<JobProfession>>(
                              (JobProfession items) {
                        return DropdownMenuItem<JobProfession>(
                          value: items,
                          child: Text(
                            "${items.subCategoryName}",
                            style: textStyleCustomColor(
                              14.0.scale(),
                              kColorLoginBtn,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (JobProfession? newValue) {
                        setState(() {
                          selectedDepartment = newValue!.subCategoryName!;
                          selectedJobProfessionId = newValue!.subCategoryId!;
                          print(
                              "selectedDepartment__${selectedJobProfessionId}");
                        });
                      },
                      hint: Text(selectedDepartment,
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black)),
                    ),
                  ),
                ),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Current company',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                customTextField(
                    textController: companyNameController,
                    hint: "Current company",
                    focus: _focusNodeComName),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Year(s) of experience',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                customTextField(
                    textController: yoexpController,
                    hint: "Year(s) of experience",
                    focus: _focusNodeYoexp),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Notice period',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                Container(
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
                      value: selectedNotice,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: noticePeriod!
                          .map<DropdownMenuItem<String>>((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: textStyleCustomColor(
                              14.0.scale(),
                              kColorLoginBtn,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedNotice = newValue!;
                          print("selectedNotice____${selectedNotice}");
                        });
                      },
                      hint: Text(selectedNotice,
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black)),
                    ),
                  ),
                ),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Available time to talk',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: customTextField(
                        textController: availTimeController,
                        readOnly: true,
                        hint: "__:__ ",
                        focus: _focusNodeAvailTime)),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Education & Qualification',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                customTextField(
                    textController: educationController,
                    hint: "Education & Qualification",
                    focus: _focusNodeEduc),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Resume',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                uploadFileDesign(
                    onTap: () {
                      _showPicker(context, "resume");
                    },
                    select: selectedPath),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Job profile image',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                uploadFileDesign(
                    onTap: () {
                      _showPicker(context, "job_profile_image");
                    },
                    select: selectedPath2),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Profile cover image',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                uploadFileDesign(
                    onTap: () {
                      _showPicker(context, "cover_image");
                    },
                    select: selectedPath3),
                AVerticalSpace(10.0.scale()),
                Text(
                  'Skill set',
                  style: textStyleCustomColor(14.0.scale(), Colors.black),
                ),
                AVerticalSpace(5.0.scale()),
                Container(
                  height: 50.0.scale(),
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<SkillList>(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: skillList!
                          .map<DropdownMenuItem<SkillList>>((SkillList items) {
                        return DropdownMenuItem<SkillList>(
                          value: items,
                          child: Text(
                            "${items.categoryName}",
                            style: textStyleCustomColor(
                              14.0.scale(),
                              Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (SkillList? newValue) {
                        setState(() {
                          selectedSkills = newValue!.categoryName!;
                          selectedSkillSetId = newValue!.categoryId!;
                          print("selectedSkills__${selectedSkills}");
                          print("selectedSkillSetId ${selectedSkillSetId}");
                        });
                      },
                      hint: Text(selectedSkills,
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black)),
                    ),
                  ),
                ),
                AVerticalSpace(10.0.scale()),
                Container(
                  height: 45.0.scale(),
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    onTap: () {
                      isAddExpDetails = !isAddExpDetails;
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Experience Details',
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ),
                        Text(
                          '+',
                          style:
                              textStyleCustomColor(24.0.scale(), Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                isAddExpDetails == true
                    ? Column(
                        children: [
                          AVerticalSpace(10.0.scale()),
                          customTextField(
                              textController: exp1Controller,
                              hint: "Experience 1",
                              focus: _focusNodeExp1),
                          AVerticalSpace(5.0.scale()),
                          customTextField(
                              textController: exp2Controller,
                              hint: "Experience 2",
                              focus: _focusNodeExp2),
                          AVerticalSpace(5.0.scale()),
                          customTextField(
                              textController: exp3Controller,
                              hint: "Experience 3",
                              focus: _focusNodeExp3),
                          AVerticalSpace(5.0.scale()),
                          customTextField(
                              textController: exp4Controller,
                              hint: "Experience 4",
                              focus: _focusNodeExp4),
                        ],
                      )
                    : SizedBox(),
                AVerticalSpace(10.0.scale()),
                Container(
                  height: 45.0.scale(),
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    onTap: () {
                      isAddEducation = !isAddEducation;
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Education & Qualification',
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ),
                        Text(
                          '+',
                          style:
                              textStyleCustomColor(24.0.scale(), Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                isAddEducation == true
                    ? Column(
                        children: [
                          AVerticalSpace(10.0.scale()),
                          customTextField(
                              textController: edu1Controller,
                              hint: "Education 1",
                              focus: _focusNodeEdu1),
                          AVerticalSpace(5.0.scale()),
                          customTextField(
                              textController: edu2Controller,
                              hint: "Education 2",
                              focus: _focusNodeEdu2),
                          AVerticalSpace(5.0.scale()),
                          customTextField(
                              textController: edu3Controller,
                              hint: "Education 3",
                              focus: _focusNodeEdu3),
                          AVerticalSpace(5.0.scale()),
                          customTextField(
                              textController: edu4Controller,
                              hint: "Education 4",
                              focus: _focusNodeEdu4),
                        ],
                      )
                    : SizedBox(),
                AVerticalSpace(10.0.scale()),
                Container(
                  height: 45.0.scale(),
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    onTap: () {
                      isAdditional = !isAdditional;
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Additional information',
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ),
                        Text(
                          '+',
                          style:
                              textStyleCustomColor(24.0.scale(), Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                isAdditional == true
                    ? Column(
                        children: [
                          AVerticalSpace(10.0.scale()),
                          customTextField(
                              textController: add1Controller,
                              hint: "Extra Courses",
                              focus: _focusNodeadd1),
                          AVerticalSpace(5.0.scale()),
                          customTextField(
                              textController: add2Controller,
                              hint: "Training Details",
                              focus: _focusNodeadd2),
                          AVerticalSpace(5.0.scale()),
                          customTextField(
                              textController: add3Controller,
                              hint: "Others 1",
                              focus: _focusNodeadd3),
                          AVerticalSpace(5.0.scale()),
                          customTextField(
                              textController: add4Controller,
                              hint: "Others 2",
                              focus: _focusNodeadd4),
                        ],
                      )
                    : SizedBox(),
                AVerticalSpace(20.0.scale()),
                InkWell(
                  onTap: () {
                    if (base64ResumeImage == "" || base64ResumeImage == null) {
                      showSnackBar(
                          "Please upload your resume", Colors.black, context);
                    } else if (base64jobProImage == "" ||
                        base64jobProImage == null) {
                      showSnackBar("Please upload your job profile image",
                          Colors.black, context);
                    } else if (base64coverProImage == "" ||
                        base64coverProImage == null) {
                      showSnackBar("Please upload your cover image",
                          Colors.black, context);
                    } else if (selectedSkillSetId == "" ||
                        selectedSkillSetId == null) {
                      showSnackBar(
                          "Please select skill set", Colors.black, context);
                    } else if (selectedJobProfessionId == "" ||
                        selectedJobProfessionId == null) {
                      showSnackBar("Please select Job Profession", Colors.black,
                          context);
                    } else if (selectedNotice == "" || selectedNotice == null) {
                      showSnackBar(
                          "Please select Notice Period", Colors.black, context);
                    } else if (companyNameController.text.isEmpty) {
                      showSnackBar("Please enter your current company name",
                          Colors.black, context);
                    } else if (yoexpController.text.isEmpty) {
                      showSnackBar("Please enter your experience", Colors.black,
                          context);
                    } else if (yoexpController.text.isEmpty) {
                      showSnackBar("Please enter your experience", Colors.black,
                          context);
                    } else if (availTimeController.text.isEmpty) {
                      showSnackBar("Please select available time to talk",
                          Colors.black, context);
                    } else if (educationController.text.isEmpty) {
                      showSnackBar("Please enter your qualification",
                          Colors.black, context);
                    } else if (educationController.text.isEmpty) {
                      showSnackBar("Please enter your qualification",
                          Colors.black, context);
                    } else {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(CreateJobProfileBtnClick(
                        job_profile_resume: base64ResumeImage.toString(),
                        user_id: sharedPrefs.userID,
                        job_profile_image: base64jobProImage.toString(),
                        cover_image: base64coverProImage.toString(),
                        skill_set: selectedSkillSetId,
                        sub_category_id: selectedJobProfessionId,
                        current_company: companyNameController.text,
                        years_of_experience: yoexpController.text,
                        notice_period: selectedNotice,
                        available_time_start: availTimeController.text,
                        educational_qualification: educationController.text,
                        experience_1: exp1Controller.text ?? "",
                        experience_2: exp2Controller.text ?? "",
                        experience_3: exp3Controller.text ?? "",
                        experience_4: exp4Controller.text ?? "",
                        education_1: edu1Controller.text ?? "",
                        education_2: edu2Controller.text ?? "",
                        education_3: edu3Controller.text ?? "",
                        education_4: edu4Controller.text ?? "",
                        additional_info_1: add1Controller.text ?? "",
                        additional_info_2: add2Controller.text ?? "",
                        additional_info_3: add3Controller.text ?? "",
                        additional_info_4: add4Controller.text ?? "",
                      ));
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45.0.scale(),
                    decoration: BoxDecoration(
                      color: Color(0xff00BDAA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Submit Now".toUpperCase(),
                      style: textStyleBoldCustomLargeColor(
                          15.0.scale(), Colors.white),
                    ).align(Alignment.center),
                  ),
                ),
                AVerticalSpace(20.0.scale()),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget customTextField(
      {required TextEditingController textController,
      String? hint,
      bool? readOnly,
      required FocusNode focus,
      TextInputType? keyboardType}) {
    return GestureDetector(
      onTap: readOnly == true
          ? null
          : () {
              FocusScope.of(context).requestFocus(focus);
            },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: TextField(
          controller: textController,
          focusNode: focus,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
          readOnly: readOnly ?? false,
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

  Widget uploadFileDesign(
      {required VoidCallback onTap, required String select}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.0.scale(),
        padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Icon(
              Icons.upload,
              color: Colors.grey,
            ),
            AHorizontalSpace(5.0.scale()),
            SizedBox(
              width: 270.0.scale(),
              child: Text(
                "$select",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyleBoldCustomLargeColor(14.0.scale(), Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
