
 abstract class NewsStates {}

 class NewsInitialState extends NewsStates{}

 //business
 class NewsLoadingBusinessState extends NewsStates{}

 class NewsSuccessfulBusinessState extends NewsStates{}

 class NewsErrorBusinessState extends NewsStates
 {
 String error ;
 NewsErrorBusinessState(this.error) ;
 }

//sport
 class NewsChangeBottomNavSuccessfulState extends NewsStates{}

 class NewsLoadingSportState extends NewsStates{}

 class NewsSuccessfulSportState extends NewsStates{}

 class NewsErrorSportState extends NewsStates
 {
  String error ;
  NewsErrorSportState(this.error) ;
 }

 //science
 class NewsLoadingScienceState extends NewsStates{}

 class NewsSuccessfulScienceState extends NewsStates{}

 class NewsErrorScienceState extends NewsStates
 {
  String error ;
  NewsErrorScienceState(this.error) ;
 }

 //Search
 class NewsLoadingSearchState extends NewsStates{}

 class NewsSuccessfulSearcheState extends NewsStates{}

 class NewsErrorSearchState extends NewsStates
 {
  String error ;
  NewsErrorSearchState(this.error) ;
 }

//darkMode

 class ChangeModeState extends NewsStates {}

 //to color the select item in webview
 class ChangeSelectedItemState extends NewsStates {}



