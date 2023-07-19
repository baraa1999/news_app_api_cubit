import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api_cubit/consts/vars.dart';
import 'package:news_app_api_cubit/services/utils.dart';
import 'package:news_app_api_cubit/widget/vertical_spacing.dart';
import '../widget/drawer_widget.dart';
import '../widget/tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newstype = NewsType.allNews;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: color),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(
            'News App',
            style: GoogleFonts.lobster(
              textStyle:
                  TextStyle(color: color, fontSize: 20, letterSpacing: 0.6),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(IconlyLight.search))
          ],
        ),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  TabsWidget(
                      text: 'All news',
                      color: newstype == NewsType.allNews
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newstype == NewsType.allNews) {
                          return 'hi';
                        }
                        setState(() {
                          newstype == NewsType.allNews;
                        });
                      },
                      fontSize: newstype == NewsType.allNews ? 22 : 14),
                  const SizedBox(
                    width: 25,
                  ),
                  TabsWidget(
                      text: 'Top tranding',
                      color: newstype == NewsType.topTrending
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newstype == NewsType.topTrending) {
                          return;
                        }
                        setState(() {
                          newstype == NewsType.topTrending;
                        });
                      },
                      fontSize: newstype == NewsType.topTrending ? 22 : 14),
                ],
              ),
              const VerticalSpacing(10),
              newstype == NewsType.topTrending
                  ? Container()
                  : SizedBox(
                      height: kBottomNavigationBarHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          pageinationButtons(
                            text: 'Prev',
                            function: () {
                              if (currentPageIndex == 0) {
                                return;
                              }
                              setState(() {
                                currentPageIndex -= 1;
                              });
                            },
                          ),
                          Flexible(
                            flex: 2,
                            child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      color: currentPageIndex == index
                                          ? Colors.blue
                                          : Theme.of(context).cardColor,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            currentPageIndex = index;
                                          });
                                        },
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${index + 1}'),
                                        )),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                          pageinationButtons(
                            text: 'Next',
                            function: () {
                              if (currentPageIndex == 4) {
                                return;
                              }
                              setState(() {
                                currentPageIndex += 1;
                              });
                              print('$currentPageIndex index');
                            },
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageinationButtons(
      {required Function function, required String text}) {
    return ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.all(6),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        child: Text(text));
  }
}
