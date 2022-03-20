import 'package:flutter/material.dart';
import 'package:my_news/screens/about/about_page.dart';
import 'package:my_news/screens/criticismsuggestions/suggestion_page.dart';
import 'package:my_news/screens/detailNews/detailnews_page.dart';
import 'package:my_news/screens/home/home_page.dart';
import 'package:my_news/screens/menu/menu_page.dart';
import 'package:my_news/screens/trending/trending_page.dart';

import '../newsApp.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => const NewsApp(),
      '/home': (_) => const HomePage(),
      '/trending': (_) => const TrendingPage(),
      '/menu': (_) => const MenuPage(),
      '/detailnews': (_) => const DetailNewsPage(),
      '/about': (_) => const AboutPage(),
      '/kritik': (_) => const SuggestionPage(),
    };
  }
}
