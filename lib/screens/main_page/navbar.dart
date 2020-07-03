import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1110) {
          return DesktopNavbar(width: constraints.maxWidth);
        } else if (constraints.maxWidth >= 600) {
          return TabNavbar(constraints.maxWidth);
        } else {
          return MobileNavbar(constraints.maxWidth, 600 - constraints.maxWidth);
        }
      },
    );
  }
}

class DesktopNavbar extends StatefulWidget {
  final double width;

  DesktopNavbar({this.width});

  @override
  _DesktopNavbarState createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends State<DesktopNavbar> {
  int selected = 0;
  Widget explanation = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '- Introduction',
        style: TextStyle(
          color: Color(0xff5E5E5E),
          fontFamily: 'RobotoMono',
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        'App Designer and \nDeveloper',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'Flutter app developer who could make you \nan shitty,'
        'fully functional app in return for \npizza or rarely money.',
        style: TextStyle(
          color: Color(0xff5E5E5E),
          fontFamily: 'OpenSans',
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: BoxDecoration(
        color: Color(0xffA7D3A6),
        image: DecorationImage(
          image: AssetImage("removed.png"),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  child: Image.asset('beerr.png', width: 60),
                  tag: 'logo',
                ),
                SizedBox(
                  height: 120,
                ),
                Text(
                  'Manick',
                  style: TextStyle(
                    fontSize: 150,
                    color: Color(0xffFCFAF9),
                    fontFamily: 'OpenSans',
                  ),
                ),
                Text(
                  'Prime.',
                  style: TextStyle(
                    fontSize: 150,
                    color: Color(0xffFCFAF9),
                    fontFamily: 'OpenSans',
                  ),
                ),
                Container(
                  height: 13,
                  width: 80,
                  color: Color(0xff5E5E5E),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        'ig_logo.png',
                        width: 40,
                      ),
                      onTap: () async {
                        String url = 'https://www.instagram.com/manickprime/';
                        launch(url);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'linked_in.png',
                        width: 40,
                      ),
                      onTap: () {
                        launch(
                            'https://in.linkedin.com/in/manick-prime-014213191');
                      },
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildGestureDetector(
                        title: 'Services',
                        no: 0,
                        title2: 'App Designer and\nDeveloper',
                        titleDesc: '- Introduction',
                        description:
                            'Flutter app developer who could make you \nan shitty,'
                            'fully functional app in return for \npizza or rarely money.'),
                    SizedBox(
                      width: 20,
                    ),
                    buildGestureDetector(
                        title: 'Works',
                        no: 1,
                        title2: 'Example code',
                        titleDesc: '- Projects',
                        description:
                            'Did two projects in 12th grade \nthe complete,'
                            'source code is available\non my github.'),
                    SizedBox(
                      width: 20,
                    ),
                    buildGestureDetector(
                        title: 'Blog',
                        no: 2,
                        title2: 'Weekly updates',
                        titleDesc: '- Activities',
                        description:
                            'Shows what I\'m up to all week if it\'s \ninteresting '
                            'hop on and let\'s team up.\n:)'),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                explanation,
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(
      {String title,
      int no,
      String title2,
      String description,
      String titleDesc}) {
    return GestureDetector(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          decoration: selected == no ? TextDecoration.underline : null,
          color: selected == no ? Color(0xff5E5E5E) : Color(0xffFCFAF9),
        ),
      ),
      onTap: () {
        setState(() {
          selected = no;
          explanation = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleDesc,
                style: TextStyle(
                  color: Color(0xff5E5E5E),
                  fontFamily: 'RobotoMono',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                title2,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: TextStyle(
                  color: Color(0xff5E5E5E),
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          );
        });
      },
    );
  }
}

class TabNavbar extends StatelessWidget {
  final double width;

  TabNavbar(this.width);

  @override
  Widget build(BuildContext context) {
    print(width);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffA7D3A6),
        image: DecorationImage(
          image: AssetImage("removed.png"),
        ),
      ),
      height: 800,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 120, top: 50, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('beerr.png', width: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: ((120 + (1110 - width)) / 2) < 120
                      ? 130
                      : ((120 + (1110 - width)) / 2),
                ),
                Text(
                  'Manick',
                  style: TextStyle(
                      fontSize: width / 7.4,
                      color: Color(0xffFCFAF9),
                      fontFamily: 'OpenSans'),
                ),
                Text(
                  'Prime.',
                  style: TextStyle(
                      fontSize: width / 7.4,
                      color: Color(0xffFCFAF9),
                      fontFamily: 'OpenSans'),
                ),
                Container(
                  height: 13,
                  width: 80,
                  color: Color(0xff5E5E5E),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        'ig_logo.png',
                        width: 40,
                      ),
                      onTap: () async {
                        String url = 'https://www.instagram.com/manickprime/';
                        launch(url);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'linked_in.png',
                        width: 40,
                      ),
                      onTap: () {
                        launch(
                            'https://in.linkedin.com/in/manick-prime-014213191');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  final double width;
  final double height;

  MobileNavbar(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    print(width);
    print(height);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffA7D3A6),
        image: DecorationImage(
          image: AssetImage("removed.png"),
        ),
      ),
      height: 800 - height * 2,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 50, top: 50, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('beerr.png', width: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 315 - height,
                ),
                Text(
                  'Manick',
                  style: TextStyle(
                      fontSize: width / 7.4,
                      color: Color(0xffFCFAF9),
                      fontFamily: 'OpenSans'),
                ),
                Text(
                  'Prime.',
                  style: TextStyle(
                      fontSize: width / 7.4,
                      color: Color(0xffFCFAF9),
                      fontFamily: 'OpenSans'),
                ),
                Container(
                  height: 5,
                  width: 30,
                  color: Color(0xff5E5E5E),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        'ig_logo.png',
                        width: 40 - height / 7,
                      ),
                      onTap: () async {
                        String url = 'https://www.instagram.com/manickprime/';
                        launch(url);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'linked_in.png',
                        width: 40 - height / 7,
                      ),
                      onTap: () {
                        launch(
                            'https://in.linkedin.com/in/manick-prime-014213191');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
