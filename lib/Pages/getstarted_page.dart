import 'package:flutter/material.dart';
import 'package:news_app/Items/allcontent.dart';

import 'package:news_app/Pages/Login_page.dart';

class Sliding extends StatefulWidget {
  const Sliding({super.key});

  @override
  State<Sliding> createState() => _SlidingState();
}

class _SlidingState extends State<Sliding> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: contents.length,
            onPageChanged: (int i) {
              setState(() {
                currentIndex = i;
              });
            },
            itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/' + contents[index].image),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.2,
                    margin: EdgeInsets.only(top: size.height * 0.10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              contents[index].title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Text(
                            contents[index].discription,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.34,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: size.height * 0.04,
                                  margin: EdgeInsets.all(40),
                                  width: size.width * 0.26,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          backgroundColor: Colors.black),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen(),
                                            ));
                                      },
                                      child: Text('skip',
                                          style:
                                              TextStyle(color: Colors.white))),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: size.height * 0.04,
                                  margin: EdgeInsets.all(40),
                                  width: size.width * 0.26,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    child: Text(
                                      currentIndex == contents.length - 1
                                          ? "Continue"
                                          : "Next",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (currentIndex == contents.length - 1) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => SignInScreen(),
                                          ),
                                        );
                                      }
                                      _controller.nextPage(
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.bounceIn,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    contents.length,
                                    (index) => buildDot(index, context),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    ]));
  }

  Container buildDot(int index, BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.01,
      width: currentIndex == index ? size.width * 0.10 : size.width * 0.05,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? Colors.black : Colors.grey),
    );
  }
}
