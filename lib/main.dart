import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/onBoardingScreen.dart';
import 'package:shop_app/Screens/shop_layout.dart';
import 'package:shop_app/Screens/shop_login_screen.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shared/styles/themes.dart';

import 'network/local/cash_helper.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();

  Widget? widget;
  bool? onBoarding = CashHelper.getData(key: "onBoarding");
   token = CashHelper.getData(key: "token");
   print(token) ;

  if (onBoarding != null) {
    if (token != null) {
      widget = ShopLayout();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  print("this bool of onboard to get inside or not is $onBoarding");

  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.startWidget,
  }) : super(key: key);
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
    create: (context) => ShopCubit()..getHomeData()..getCategories()..getFavorites()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: startWidget,
      ),
    );
  }
}
