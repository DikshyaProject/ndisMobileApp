import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/components.dart';
import '../home.dart';

class SupportCoordinatorRegistrationPage extends StatefulWidget {
  @override
  State<SupportCoordinatorRegistrationPage> createState() =>
      _SupportCoordinatorRegistrationPageState();
}

class _SupportCoordinatorRegistrationPageState
    extends State<SupportCoordinatorRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeEventSupportWorkerBackbtnClick());
                },
                child: Icon(Icons.arrow_back, color: Colors.black)
                    .leftPadding(10.0.scale()))),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

          ],
        ),
      ),
    );
  }
}
