import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/cubit/news_cubit.dart';
import 'package:news_project/cubit/news_states.dart';

import '../modules/search_page/search_screen.dart';


class NewsLayOut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (BuildContext context , NewsStates state) {},
      builder: (BuildContext context , NewsStates state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title: Text(cubit.Titles[cubit.currentindex!], style: Theme
                .of(context).textTheme.bodyText1),
           actions:[
             IconButton(onPressed:(){
               Navigator.push(context, MaterialPageRoute(builder:(context) => SearchScreen()));}

                 , icon :Icon(Icons.search)) ,
             IconButton(onPressed:(){
               cubit.ChangeNewsMode() ;
             } , icon :Icon(Icons.dark_mode)),

           ],

          ),

          body: cubit.Screens[cubit.currentindex!],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.Items,
            currentIndex: cubit.currentindex!,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),


        );
      },
    );
  }
}
