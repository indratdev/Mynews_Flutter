import 'package:flutter/material.dart';

class HeaderMenuProfile extends StatelessWidget {
  const HeaderMenuProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ElevatedButton(
        onPressed: () {},
        child: Text('Masuk'),
        // style: BoxDecoration(),
      ),
      subtitle: Row(
        children: <Widget>[
          Text('Tidak memiliki akun ?'),
          TextButton(
              onPressed: () {},
              child: Text(
                'Daftar',
                style: TextStyle(
                  color: Colors.red,
                ),
              ))
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: MediaQuery.of(context).size.width / 12,
        child: Image.asset(
          'assets/images/account_circle.png',
        ),
      ),
    );
  }
}
