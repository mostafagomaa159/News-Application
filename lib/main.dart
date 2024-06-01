import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/shared/bloc_observer/bloc_observer.dart';
import 'package:newsapplication/shared/cubit/states.dart';
import 'package:newsapplication/shared/network/local/cashe_helper.dart';
import 'package:newsapplication/shared/network/remote/dio_helper.dart';
import 'layout/news_layout.dart';
import 'shared/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await SharedPrefrenceHelper.init();
  bool isDark = SharedPrefrenceHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()
          ..changeAppMode(fromShared: isDark)
          ..getBusinessData(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20.0,
                    backgroundColor: Colors.white),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark,
                  ),
                ),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
                useMaterial3: true,
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                  backgroundColor: HexColor("333739"),
                ),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  backgroundColor: HexColor("333739"),
                  titleTextStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor("333739"),
                    statusBarBrightness: Brightness.light,
                  ),
                ),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
                useMaterial3: true,
                scaffoldBackgroundColor: HexColor("333739"),
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const NewsLayout(),
              //Directionality(textDirection: TextDirection.rtl,child: NewsLayout()),
            );
          },
        ));
  }
}
