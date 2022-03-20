import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/headermenuprofile.dart';
import 'components/profilemenu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          HeaderMenuProfile(),
          const SizedBox(height: 20),
          Profilemenu(
            icon: Icon(Icons.bookmark_border),
            text: 'Bookmarks',
            press: () {},
          ),
          Profilemenu(
            icon: Icon(Icons.message),
            text: 'Kritik & Saran',
            press: () {
              Navigator.of(context, rootNavigator: false).pushNamed('/kritik');
            },
          ),
          Profilemenu(
            icon: Icon(Icons.question_answer_rounded),
            text: 'Tentang',
            press: () {
              Navigator.of(context, rootNavigator: false).pushNamed('/about');
            },
          ),
        ],
      ),
    );
  }
}
