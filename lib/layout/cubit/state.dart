abstract class NewsStates {}

class NewsIntialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsAppModeChange extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetSciencesSuccessState extends NewsStates {}

class NewsGetSciencesErrorState extends NewsStates {
  final String error;
  NewsGetSciencesErrorState(this.error);
}

class NewsGetSettingsLoadingState extends NewsStates {}

class NewsGetSettingsSuccessState extends NewsStates {}

class NewsGetSettingsErrorState extends NewsStates {
  final String error;
  NewsGetSettingsErrorState(this.error);
}
