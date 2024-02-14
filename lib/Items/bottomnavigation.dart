import 'package:flutter/material.dart';
import 'package:news_app/Pages/Home_page.dart';
import 'package:news_app/Pages/all_categorypage.dart';
import 'package:news_app/Pages/profile.dart';

class Bottomappbar extends StatefulWidget {
  const Bottomappbar({super.key});

  @override
  State<Bottomappbar> createState() => _BottomappbarState();
}

class _BottomappbarState extends State<Bottomappbar> {
  static int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        children: [
          Spacer(),
          IconButton(
              onPressed: () {
                currentPage = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => Home())),
                );
              },
              icon: Icon(Icons.home,
                  color: currentPage == 0 ? Colors.red : Colors.white)),
          Spacer(),
          IconButton(
              onPressed: () {
                currentPage = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => AllCategory())),
                );
              },
              icon: Icon(Icons.menu,
                  color: currentPage == 1 ? Colors.red : Colors.white)),
          Spacer(),
          IconButton(
            onPressed: () {
              currentPage = 2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => Profile())),
              );
            },
            icon: Icon(Icons.person,
                color: currentPage == 2 ? Colors.red : Colors.white),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
