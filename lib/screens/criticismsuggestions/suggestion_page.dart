import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news/screens/criticismsuggestions/bloc/critics_bloc.dart';

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _kritik = TextEditingController();

    return BlocBuilder<CriticsBloc, CriticsState>(
      builder: (context, state) {
        if (state is LoadedKritikSaran) {
          return AlertDialog(
            // backgroundColor: Colors.transparent,
            title: const Text('Berhasil'),

            // content: SingleChildScrollView(
            //   child: ListBody(
            //     children: <Widget>[
            //       const Text('Berhasil'),
            //       const Text('kirim kritik dan saran'),
            //     ],
            //   ),
            // ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Navigator.of(context, rootNavigator: true).pop();
                  Navigator.of(context).pop();

                  BlocProvider.of<CriticsBloc>(context).add(ResetKritikSaran());
                },
                child: const Text('OK'),
              ),
            ],
          );
        }
        if (state is FailureKritikSaran) {
          return AlertDialog(
            title: const Text('GAGAL'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('GAGAL'),
                  Text('kirim kritik dan saran'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  BlocProvider.of<CriticsBloc>(context).add(ResetKritikSaran());
                },
                child: const Text('OK'),
              ),
            ],
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Kritik & Saran'),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                const Text('Email : '),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: _email,
                    autocorrect: false,
                    autofocus: true,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Kritik & Saran'),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: _kritik,
                    autocorrect: false,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(hintText: 'Kritik / Saran'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CriticsBloc>(context, listen: false).add(
                        SendKritikSaran(
                            email: _email.text, kritiksaran: _kritik.text));
                  },
                  child: const Text('Kirim'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
