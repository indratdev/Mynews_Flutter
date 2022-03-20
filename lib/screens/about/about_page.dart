import 'package:flutter/material.dart';
import 'package:my_news/helpers/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wit = MediaQuery.of(context).size.width;
    double top = 20;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang'),
      ),
      body: Container(
        color: Colors.white70,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              top: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                width: wit - 40,
                height: wit,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: top + 110),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          Constants.about,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.justify,
                          // softWrap: true,
                        ),
                      ),
                      const Divider(),
                      Text('Version : ${Constants.versionApp}'),
                      Text('By : ${Constants.devName}'),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: top,
              child: SizedBox(
                height: wit / 2,
                width: wit / 2,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//         child: Stack(
//           alignment: Alignment.topCenter,
//           clipBehavior: Clip.antiAlias,
//           children: <Widget>[
//             Positioned(
//               top: 100,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.amber,
//                 ),
//                 padding: EdgeInsets.only(top: 50),
//                 alignment: Alignment.topCenter,
//                 width: wit - 40,
//                 height: wit,
//                 child: Text('dadadadadasda'),
//               ),
//             ),
//             Positioned(
//               child: SizedBox(
//                 // height: 200,
//                 // width: 200,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   backgroundImage: AssetImage('assets/images/logo.jpg'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),


        //   child: Column(
        //     children: <Widget>[
        //       SizedBox(
        //         height: 200,
        //         width: 200,
        //         child: CircleAvatar(
        //           backgroundColor: Colors.transparent,
        //           backgroundImage:
        //               AssetImage('assets/images/account_circle.png'),
        //         ),
        //       ),
        //       Container(
        //         margin: EdgeInsets.all(5),
        //         decoration: BoxDecoration(
        //           border: Border.all(color: Colors.blue),
        //           shape: BoxShape.rectangle,
        //         ),
        //         padding: EdgeInsets.only(left: 20, right: 20),
        //         child: Text(
        //             'dakdaskdjasld adajsdsa dasdas dasddasdas dasdasd sad a dasd asd a'),
        //       ),
        //     ],
        //   ),
        // ));