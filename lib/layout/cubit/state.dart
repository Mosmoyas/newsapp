abstract class NewsStates {}

class NewsIntialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrortate extends NewsStates {
  String error;
  NewsGetBusinessErrortate(this.error);
}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrortate extends NewsStates {
  String error;
  NewsGetSportsErrortate(this.error);
}

class NewsGetSciencesSuccessState extends NewsStates {}

class NewsGetSciencesErrortate extends NewsStates {
  String error;
  NewsGetSciencesErrortate(this.error);
}

class NewsGetSettingsSuccessState extends NewsStates {}

class NewsGetSettingsErrortate extends NewsStates {
  String error;
  NewsGetSettingsErrortate(this.error);
}
