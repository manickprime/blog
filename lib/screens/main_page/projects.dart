import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map> projects = [
      {
        "title": "online movie booking simulation",
        "descImgName": "movies.jpeg",
        "repo-link": "https://github.com/manickprime/school_project",
      },
      {
        "title": "List of small games made on python",
        "descImgName": "snake_pygame.png",
        "repo-link": "https://github.com/manickprime/pygame",
      }
    ];
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffA7D3A6),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        print(constraints.maxWidth);
        double customHeight = 567,
            customWidth = constraints.maxWidth - (constraints.maxWidth * 0.5);
        if (constraints.maxWidth <= 900) {
          customHeight = customHeight - customHeight * 0.4;
          customWidth = constraints.maxWidth - (constraints.maxWidth * 0.5);
        }
        return Container(
          decoration: BoxDecoration(
            color: Color(0xff7BB17A),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: Column(
              children: [
                Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  options: CarouselOptions(height: customHeight),
                  items: projects
                      .map((item) => GestureDetector(
                            onTap: () async {
                              String url = item["repo-link"];
                              launch(url);
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                    item["title"],
                                    style: TextStyle(
                                      color: Color(0xff5E5E5E),
                                      fontFamily: 'RobotoMono',
                                      fontSize: constraints.maxWidth / 80,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: customWidth,
                                  height: customHeight - 62,
                                  decoration: BoxDecoration(
                                    color: Color(0xffA7D3A6),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        item["descImgName"],
                                      ),
//                                    fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
//92C9B1
