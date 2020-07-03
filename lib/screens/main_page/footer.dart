import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffA7D3A6),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.maxWidth);
          return Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  GestureDetector(
                    child: Text(
                      'manickprime@gmail.com',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff5E5E5E),
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  Text(
                    'Curriculum Vitae',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xff5E5E5E),
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  Text(
                    '91+ 6380183139',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xff5E5E5E),
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  Text(
                    'an website completely made in Flutter',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  FlutterLogo(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
