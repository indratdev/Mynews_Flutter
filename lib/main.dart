import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news/helpers/routes.dart';
import 'package:my_news/resources/repository.dart';
import 'package:my_news/screens/bottom_nav/bloc/bottomnav_bloc.dart';
import 'package:my_news/screens/criticismsuggestions/bloc/critics_bloc.dart';
import 'package:my_news/screens/detailNews/bloc/detailnews_bloc.dart';
import 'package:my_news/screens/home/bloc/news_bloc.dart';
import 'package:my_news/screens/menu/menu_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomnavBloc>(
          create: (context) => BottomnavBloc(),
        ),
        BlocProvider(
          create: (context) => NewsBloc(repo: Repository())
            ..add(
              FetchNewsEvent(type: 'General'),
            ),
        ),
        BlocProvider(
          create: (context) => DetailnewsBloc(),
        ),
        BlocProvider(
          create: (context) => CriticsBloc(),
        )
      ],
      // create: (context) => SubjectBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.getRoute(),
        // initialRoute: '/trending',
      ),
    );
  }
}
