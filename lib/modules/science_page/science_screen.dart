import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componant/componant.dart';
import '../../cubit/news_cubit.dart';
import '../../cubit/news_states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit , NewsStates>(

      listener: (BuildContext context , NewsStates state){},
      builder:(BuildContext context , NewsStates state){
        var List = NewsCubit.get(context).Science;

        return buildArticleItem(List , context);


      },
    );
  }
}