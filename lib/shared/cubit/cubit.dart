import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/modules/business/business_screen.dart';
import 'package:newsapplication/modules/science/science_screen.dart';
import 'package:newsapplication/modules/sports/sport_screen.dart';
import 'package:newsapplication/shared/cubit/states.dart';
import 'package:newsapplication/shared/network/local/cashe_helper.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<Widget> Screens = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
  ];

  List<String> Titles = [
    "Business News",
    "Sport News",
    "Science News",
  ];

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    if (index == 1) getSportsData();
    if (index == 2) getScienceData();

    emit(NewsBottomNavState());
  }

  List<dynamic> businessData = [];
  void getBusinessData() {
    emit(NewsGetBussinesDataLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '3fd82181a68e4fca92cec6aec11693aa',
    }).then((value) {
      businessData = value?.data['articles'];
      // print(businessData);

      emit(NewsGetBussinesDataSucessState());
    }).catchError((error) {
      emit(NewsGetBusinessDataErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> sportsData = [];
  void getSportsData() {
    emit(NewsGetSportsDataLoadingState());

    if (sportsData.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '3fd82181a68e4fca92cec6aec11693aa',
      }).then((value) {
        sportsData = value?.data['articles'];
        //  print(sportsData);

        emit(NewsGetSportsDataSucessState());
      }).catchError((error) {
        emit(NewsGetSportsDataErrorState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(NewsGetSportsDataSucessState());
    }
  }

  List<dynamic> scienceData = [];
  void getScienceData() {
    emit(NewsGetScienceDataLoadingState());
    if (scienceData.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '3fd82181a68e4fca92cec6aec11693aa',
      }).then((value) {
        scienceData = value?.data['articles'];
        // print(scienceData);

        emit(NewsGetScienceDataSucessState());
      }).catchError((error) {
        emit(NewsGetScienceDataErrorState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(NewsGetScienceDataSucessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'q': value,
      'apiKey': '3fd82181a68e4fca92cec6aec11693aa',
    }).then((value) {
      search = value?.data['articles'];
      emit(NewsGetSearchSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeAppModeState());
      print(isDark);
    } else {
      isDark = !isDark;
      print(isDark);
      SharedPrefrenceHelper.saveData(key: 'isDark', value: isDark)
          .then((value) {
        emit(NewsChangeAppModeState());
      });
    }
  }
}
