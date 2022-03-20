import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news/helpers/constants.dart';
import 'package:my_news/screens/bottom_nav/bloc/bottomnav_bloc.dart';
import 'package:my_news/screens/home/bloc/news_bloc.dart';
import 'package:my_news/screens/home/home_page.dart';
import 'package:my_news/screens/menu/menu_page.dart';
import 'package:my_news/screens/trending/trending_page.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    print('current index: $currentIndex');

    List<Widget> _widgetOption = <Widget>[
      HomePage(),
      TrendingPage(),
      MenuPage()
    ];

    // void _selectedPage

    return BlocBuilder<BottomnavBloc, BottomnavState>(
      builder: (context, state) {
        if (state is MovedPage) {
          currentIndex = state.page;

          switch (state.page) {
            case 0:
              BlocProvider.of<NewsBloc>(context)
                  .add(FetchNewsEvent(type: 'General'));
              break;
            case 1:
              BlocProvider.of<NewsBloc>(context)
                  .add(FetchTrendingNewsEvent(type: 'entertainment'));
              break;
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(Constants.appName),
          ),
          body: _widgetOption.elementAt(currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trending_up),
                label: 'Trending',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: 'Profile',
              )
            ],
            currentIndex: currentIndex,
            onTap: (value) {
              BlocProvider.of<BottomnavBloc>(context)
                  .add(changePages(page: value));
            },
          ),
        );
      },
    );
  }
}
