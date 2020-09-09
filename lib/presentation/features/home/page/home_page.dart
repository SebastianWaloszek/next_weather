import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/injector.dart';
import '../bloc/home_page_bloc.dart';

import 'home_page_body.dart';
import 'home_page_body_parameters.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc get pageBloc => Injector.resolve();

  @override
  void initState() {
    _loadHomePage();
    super.initState();
  }

  void _loadHomePage() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      pageBloc.add(LoadHomePageEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      cubit: pageBloc,
      builder: (context, state) {
        return HomePageBody(
          HomePageBodyParameters(
            context,
            weatherForecast: state.weatherForecast,
            loadWeatherForecast: _loadHomePage,
            isLoading: state is LoadingHomePageState,
          ),
        );
      },
    );
  }
}
