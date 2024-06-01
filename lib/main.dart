import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/shared/bloc_observer/bloc_observer.dart';
import 'package:newsapplication/shared/cubit/states.dart';
import 'package:newsapplication/shared/network/local/cashe_helper.dart';
import 'package:newsapplication/shared/network/remote/dio_helper.dart';
import 'package:newsapplication/shared/styles/themes.dart';
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
              theme: lightTheme,
              darkTheme: darkTheme,
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
