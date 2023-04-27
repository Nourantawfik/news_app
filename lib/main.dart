import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/cubit/news_cubit.dart';
import 'package:news_project/cubit/news_layout.dart';
import 'package:news_project/cubit/news_states.dart';
import 'package:news_project/network/local/sharedpreference.dart';
import 'package:news_project/network/remote/dio.dart';
import 'package:news_project/style/theme/theme_Screen.dart';

bool isDark = false ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  print('this is dioo');

 await ChacheHelper.int() ;

 Widget widget ;
 bool? isDark = ChacheHelper.getData(key: "isDark") ?? false ;

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  //const MyApp(bool isDark, {super.key});
  bool? isDark  ;
  //final Widget startWigdet ;

  MyApp(this.isDark ,); // this.startWigdet) ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return 
      //عملنا wrap  لل ماتريال ااب
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => NewsCubit()..getBusiness()..ChangeNewsMode(fromshared: isDark)),
        ],
        child: BlocConsumer<NewsCubit , NewsStates>(
          listener: (BuildContext context , NewsStates state) {},
          builder:(BuildContext context , NewsStates state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: NewsCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,

              theme:lightTheme,
              darkTheme: darkTheme,

              home:
              //startWigdet
              Builder(builder:(BuildContext context )
                  {
                    MediaQuery.of(context).size.width;
                    print(MediaQuery.of(context).size.width.toInt());

                    if(MediaQuery.of(context).size.width.toInt() <= 566)

                      return MediaQuery(
                          data:MediaQuery.of(context).copyWith(textScaleFactor: 0.9),
                          child: NewsLayOut()) ;

                    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.25),
                        child: NewsLayOut()) ;


                  }
              ) ,
            );
          } ,

        ),
      );
  }
}
