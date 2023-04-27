import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/componant/componant.dart';
import 'package:news_project/cubit/news_cubit.dart';
import 'package:news_project/cubit/news_states.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (BuildContext context , NewsStates state){},
      builder:(BuildContext context , NewsStates state){
      var List = NewsCubit.get(context).Business;

        return buildArticleItem(List , context);



      },
    );

  }
}