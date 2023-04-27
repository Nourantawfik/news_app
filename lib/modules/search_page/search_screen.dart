import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/componant/componant.dart';
import 'package:news_project/cubit/news_cubit.dart';
import 'package:news_project/cubit/news_states.dart';

class SearchScreen extends StatelessWidget {

var searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (BuildContext context , NewsStates state){},
      builder:(BuildContext context , NewsStates state){
      var  List = NewsCubit.get(context).Search ;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'search here',
                    labelStyle:Theme.of(context).textTheme.subtitle1 ,
                    hintText: 'search',
                    hintStyle: Theme.of(context).textTheme.subtitle1,
                    prefixIcon: Icon(Icons.search),

                  ),
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),

              Expanded(child: buildArticleItem(List, context , isSearch: true)) ,

            ],
          ),
        );
      } ,
    );
  }
}
