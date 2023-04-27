import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/cubit/news_cubit.dart';
import 'package:news_project/cubit/news_states.dart';
import 'package:news_project/modules/webview/webview_screen.dart';
import 'package:news_project/style/constant.dart';

import '../modules/adabtive_indicator/adabitve_indicator.dart';

Widget buildArticle(context, article , index) => Container(
  color: NewsCubit.get(context).changeColor == index ? Colors.grey[300] : null,
  child:   InkWell(

        onTap: () {
          NewsCubit.get(context).selectOneItem(index) ;

         // Navigator.push(

            //  context,

             // MaterialPageRoute(

                 // builder: (context) => WebViewScreen(Url: '${article["Url"]}')));

        },

        child: Padding(

          padding: const EdgeInsets.all(20.0),

          child: Row(

            // crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Padding(

                padding: const EdgeInsets.all(20.0),

                child: Container(

                    decoration:

                        BoxDecoration(borderRadius: BorderRadius.circular(25)),

                    height: 120,

                    width: 120,

                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: Image(

                        image: NetworkImage(

                      " ${article["urlToImage"]}",

                    ))),

              ),

              SizedBox(

                width: 20,

              ),

              Expanded(

                child: Container(

                  //width: double.infinity,

                  height: 120,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Expanded(

                        child: Text(" ${article["title"]}",

                            style: Theme.of(context).textTheme.bodyText1,

                            overflow: TextOverflow.ellipsis,

                            maxLines: 3),

                      ),

                      // SizedBox(height: 5,) ,



                      Text(

                        " ${article["publishedAt"]}",

                        style: Theme.of(context).textTheme.caption,

                      ),

                    ],

                  ),

                ),

              ),

            ],

          ),

        ),

      ),
);

Widget MyDivider() => Divider(
      color: Colors.black12,
      height: 1,
      thickness: 1,
    );

Widget buildArticleItem(List, context, {isSearch}) => ConditionalBuilder(
      condition: //state is! NewsLoadingState,
          //List.length >= 0,
      true,
      builder: (
        BuildContext context,
      ) =>
          ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, index) =>Text('heloo' , style: Theme.of(context).textTheme.bodyText1,) ,
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: buildArticle(List[index], context , index),
                  // ),
              separatorBuilder: (BuildContext context, index) => MyDivider(),
              itemCount: 200),
      fallback: (BuildContext context) =>
         // isSearch ? Container() :
          Center(child: Adaptiveindcator(getoS())),
    );
