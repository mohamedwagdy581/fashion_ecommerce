import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home_screen.dart';
import 'shared/components/constants.dart';
import 'shared/network/cubit/cubit.dart';
import 'shared/network/cubit/states.dart';
import 'shared/network/local/cash_helper.dart';
import 'shared/style/themes.dart';
import 'spalsh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //DioHelper.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getData(key: 'isDark');
  uId = CashHelper.getData(key: 'uId');
  runApp(
    FashionApp(
      isDark: isDark,
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class FashionApp extends StatelessWidget {
  final bool? isDark;

  const FashionApp({
    super.key,
    required this.isDark,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getUserData()
        ..changeAppModeTheme(
          fromShared: isDark,
        ),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            home: uId == null ? const SplashScreen() : const HomeScreen(),
          );
        },
      ),
    );
  }
}
