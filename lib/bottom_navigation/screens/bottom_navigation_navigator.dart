import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../root/root.dart';
import '../bottom_navigation.dart';

class BottomNavigationNavigator extends StatefulWidget {
  static const String bottomNavigatorMainPage = '/bnMainPage';
  final UserRepository? userRepository;

  BottomNavigationNavigator({this.userRepository});

  @override
  _BottomNavigationNavigatorState createState() =>
      _BottomNavigationNavigatorState();
}

class _BottomNavigationNavigatorState extends State<BottomNavigationNavigator> {
  _BottomNavigationRouter? _router;

  @override
  void initState() {
    super.initState();
    _router = _BottomNavigationRouter(widget.userRepository!);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: BottomNavigationNavigator.bottomNavigatorMainPage,
      onGenerateRoute: _router!.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _router!.dispose();
    super.dispose();
  }
}

class _BottomNavigationRouter {
  UserRepository? userRepository;
  BottomNavigationBloc? _bottomNavigationBloc;

  _BottomNavigationRouter(UserRepository userRepository) {
    this.userRepository = userRepository;
    _bottomNavigationBloc = BottomNavigationBloc(userRepository);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BottomNavigationNavigator.bottomNavigatorMainPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BottomNavigationBloc>.value(
            value: _bottomNavigationBloc!,
            child: BottomNavigationMainTabPage(userRepository: userRepository),
          ),
        );

      default:
        return null;
    }
  }

  void dispose() {
    _bottomNavigationBloc!.close();
  }
}
