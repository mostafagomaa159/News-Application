abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsGetBussinesDataLoadingState extends NewsState {}

class NewsGetBussinesDataSucessState extends NewsState {}

class NewsGetBusinessDataErrorState extends NewsState {
  final String error;

  NewsGetBusinessDataErrorState(this.error);
}

class NewsGetSportsDataLoadingState extends NewsState {}

class NewsGetSportsDataSucessState extends NewsState {}

class NewsGetSportsDataErrorState extends NewsState {
  final String error;

  NewsGetSportsDataErrorState(this.error);
}

class NewsGetScienceDataLoadingState extends NewsState {}

class NewsGetScienceDataSucessState extends NewsState {}

class NewsGetScienceDataErrorState extends NewsState {
  final String error;

  NewsGetScienceDataErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsState {}

class NewsGetSearchSucessState extends NewsState {}

class NewsGetSearchErrorState extends NewsState {
  final String error;

  NewsGetSearchErrorState(this.error);
}

class NewsChangeAppModeState extends NewsState {}
