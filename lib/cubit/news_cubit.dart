 import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/modules/business_page/business_screen.dart';
import 'package:news_project/modules/science_page/science_screen.dart';
import 'package:news_project/modules/sport_page/sport_screen.dart';
import 'package:news_project/network/local/sharedpreference.dart';
import 'package:news_project/network/remote/dio.dart';
import 'news_states.dart';





class NewsCubit extends Cubit <NewsStates>
 {
   NewsCubit() : super(NewsInitialState());

   static NewsCubit get(context) => BlocProvider.of(context) ;

   int? currentindex = 0 ;

   List<BottomNavigationBarItem> Items = [
     BottomNavigationBarItem( icon:Icon(Icons.business) , label:'business' ) ,
     BottomNavigationBarItem( icon:Icon(Icons.sports) , label:'sports' ) ,
     BottomNavigationBarItem( icon:Icon(Icons.science) , label:'science' ) ,
   ];

   List <Widget> Screens = [
     BusinessScreen(),
     SportsScreen() ,
     ScienceScreen(),

   ];

   List <String> Titles = [
     'Business ' ,
     'Sports' ,
     'Science' ,
   ] ;

   void changeBottomNavBar( int index)
   {
     currentindex = index ;

     if (index == 1)
       {
         getSport();
       }
     if(index == 2)
       {
         getScience() ;
       }
     emit(NewsChangeBottomNavSuccessfulState()) ;
   }

   List<dynamic> Business = [] ;

void getBusiness()
{
  emit(NewsLoadingBusinessState()) ;

  DioHelper.getData(
      Url:"v2/top-headlines" ,
    query: {
        "country" : "eg" ,
      "apikey " : " 3d85d2ee292a4b88b23a04b8274f18ad" ,
      "category " : "business " ,

    }).then((value) {
      // منساش املى ال ليسته
      Business = value.data["articles"];
      print(Business[0]['title']);

      emit(NewsSuccessfulBusinessState());
  }).catchError((error) {
      print(error.toString()) ;
      emit(NewsErrorBusinessState(error));

  } ) ;
}

   List <dynamic> Sport= [] ;

void  getSport() {
  emit(NewsLoadingSportState());
  DioHelper.getData(
    Url: "top-headlines",
    query: {
      "country": "eg ",
      "apikey ": "3d85d2ee292a4b88b23a04b8274f18ad" ,
      "category ": "Sports ",
    },
  ).then((value) {
    Sport = value.data["articles"];
    print(Sport[0]['title']);
    emit(NewsSuccessfulSportState());
  }).catchError((error) {
    print(" error Sport is  ${error.toString} ");
    emit(NewsErrorSportState(error));
  });
}

  List<dynamic> Science = [] ;
  void getScience()
  {
    emit(NewsLoadingScienceState());
    DioHelper.getData(Url: " top-headlines" ,
    query: {
      " country" : "eg" ,
      "apikey " : "3d85d2ee292a4b88b23a04b8274f18ad",
      " category" : "Science " ,
    }
    ).then((value) {
      Science = value.data['articles'] ;
      print(Science[0]['title']) ;
      emit(NewsSuccessfulScienceState()) ;
    }).catchError((error) {
      print("Science error is ${error.toString()}");
      emit(NewsErrorScienceState(error));

    });
  }

  List <dynamic> Search = [] ;

  void getSearch( String value)
  {
    emit(NewsLoadingSearchState());
    DioHelper.getData(Url: "v2/everything" , query:
    {
      "q " : "$value" ,
      " apikey" : "65f7f556ec7644fa7dc7c0069f040ca " ,

    } ).then((value) {

      Search=value.data['atricles'] ;
      print(Search[0]['title']);
      emit(NewsSuccessfulSportState());
    } ).catchError((error) {
      print(" Search error is ${error.toString()}");
      emit(NewsErrorSearchState(error));
    } ) ;

  }


  bool isDark = false;

  void ChangeNewsMode({bool? fromshared})
  {
if( fromshared != null)
  {
    isDark = fromshared ;
    emit(ChangeModeState());
  }
else
{
  isDark = ! isDark ;
  ChacheHelper.saveData(key :" isDark" , value :isDark).then((value) {
    emit(ChangeModeState()) ;
  });

}


  }


  int changeColor = 0 ;
  void selectOneItem(index)
  {
    changeColor = index ;
    emit(ChangeSelectedItemState());
  }

}
