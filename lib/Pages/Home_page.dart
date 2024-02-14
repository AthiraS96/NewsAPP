import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Items/articlemodel.dart';
import 'package:news_app/Items/bottomnavigation.dart';
import 'package:news_app/Items/categorymodel.dart';
import 'package:news_app/Items/slidermodel.dart';
import 'package:news_app/Pages/all_categorypage.dart';

//import 'package:news_app/Pages/all_categorypage.dart';
import 'package:news_app/Pages/all_newspage.dart';
import 'package:news_app/Pages/article_viewpage.dart';
import 'package:news_app/Pages/news_categorypage.dart';
import 'package:news_app/Pages/profile.dart';
import 'package:news_app/Services/customalert.dart';
//import 'package:news_app/Pages/profile.dart';
import 'package:news_app/Services/data.dart';
import 'package:news_app/Services/news.dart';
import 'package:news_app/Services/slider_data.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true, loading2 = true;

  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getSlider();
    getNews();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
      loading2 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    MyCustomAlertDialog alertDialog = MyCustomAlertDialog();
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black26,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News ",
                style: GoogleFonts.acme(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .6)),
            Text(" Pulse",
                style: GoogleFonts.acme(
                    color: Colors.red,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .6)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                alertDialog.showCustomAlertdialog(
                    context: context,
                    title: 'Confirm',
                    subtitle: 'Do you want to log out and exit.',
                    onTapOkButt: () {},
                    button: true,
                    onTapCancelButt: () {
                      Navigator.of(context).pop();
                    });
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ))
          // IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      // drawer: Drawer(),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 13.0, right: 13.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Breaking News!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllNews(news: "Breaking")));
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    loading2
                        ? Center(child: CircularProgressIndicator())
                        : CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIndex) {
                              String? res = sliders[index].urlToImage;
                              String? res1 = sliders[index].title;
                              return buildImage(res!, index, res1!);
                            },
                            options: CarouselOptions(
                                height: size.height * 0.45,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                })),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Center(child: buildIndicator()),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending News!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllNews(news: "Trending")));
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                  url: articles[index].url!,
                                  desc: articles[index].description!,
                                  imageUrl: articles[index].urlToImage!,
                                  title: articles[index].title!);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Bottomappbar(),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //Drawer header for Heading part of drawer
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/background4.jpg',
                    ),
                    fit: BoxFit.cover),
              ),

              //Title of header
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/sports1.jpg'),
                  ),
                  Text(
                    'Athira S',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    'athira@gmail.com',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )
                ],
              ),
            ),
            //Child tile of drawer with specified title
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.home),
              title: const Text('Home'),
              //To perform action on tapping at tile
              onTap: () {},
            ),

            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.list_alt_rounded),
              title: const Text('Categories'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllCategory(),
                    ));
              },
            ),

            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.add),
              title: const Text('Add items'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.share),
              title: const Text('Share With Friends'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.rate_review),
              title: const Text('Rate and Review'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.flag),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ));
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                alertDialog.showCustomAlertdialog(
                    context: context,
                    title: 'Confirm',
                    subtitle: 'Do you want to log out and exit.',
                    onTapOkButt: () {},
                    button: true,
                    onTapCancelButt: () {
                      Navigator.of(context).pop();
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.45,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            imageUrl: image,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.10,
          padding: EdgeInsets.only(left: 10.0),
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.35,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Center(
            child: Text(
              name,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex, 
        count: 5,
        effect: SlideEffect(
            dotWidth: MediaQuery.of(context).size.width * 0.02,
            dotHeight: MediaQuery.of(context).size.height * 0.01,
            activeDotColor: Colors.white),
      );
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(name: categoryName)));
      },
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        margin: EdgeInsets.only(right: 16, bottom: 20, left: 16, top: 20),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 120,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  // color: Colors.black38,
                ),
                child: Center(
                    child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
      // Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(bottom: 15),
      //       child: Container(
      //         width: MediaQuery.of(context).size.width * 0.25,
      //         height: 100,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(6),
      //           color: Colors.white,
      //         ),
      //         child: Center(
      //             child:
      //             Text(
      //           categoryName,
      //           style: TextStyle(
      //               color: Colors.blue,
      //               fontSize: 15,
      //               fontWeight: FontWeight.bold),
      //         )),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class BlogTile extends StatelessWidget {
  String imageUrl, title, desc, url;
  BlogTile(
      {required this.desc,
      required this.imageUrl,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ))),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          title,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0),
                        ),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          desc,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/foundation.dart';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:news_app/Items/list.dart';
// import 'package:news_app/Pages/all_newspage.dart';
// import 'package:news_app/Pages/article_viewpage.dart';
// import 'package:news_app/Pages/news_categorypage.dart';
// import 'package:news_app/Services/data.dart';
// import 'package:news_app/Services/news.dart';
// import 'package:news_app/Services/show_category_news.dart';
// import 'package:news_app/Services/slider_data.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<CategoryModel> categories = [];
//   List<sliderModel> sliders = [];
//   List<ArticleModel> articles = [];
//   bool _loading = true, loading2 = true;

//   int activeIndex = 0;
//   int selectedIndex = 15;
//   String selectedCategory = "";
//   @override
//   void initState() {
//     categories = getCategories();
//     getSlider();
//     getNews();
//     super.initState();
//   }

//   // getCategories() async {
//   //   ShowCategoryNews categoryclass =ShowCategoryNews();
//   //   await categoryclass.getCategories();
//   //   articles = categoryclass.categories;
//   //   setState(() {
//   //     _loading = false;
//   //   });
//   // }

//   getNews() async {
//     News newsclass = News();
//     await newsclass.getNews();
//     articles = newsclass.news;
//     setState(() {
//       _loading = false;
//     });
//   }

//   getSlider() async {
//     Sliders slider = Sliders();
//     await slider.getSlider();
//     sliders = slider.sliders;
//     setState(() {
//       loading2 = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("News ",
//                   style: GoogleFonts.aclonica(
//                       color: Colors.black, fontWeight: FontWeight.bold)),
//                       Text(" Pulse",
//                   style: GoogleFonts.aclonica(
//                       color: Colors.red, fontWeight: FontWeight.bold)),
//             ],
//           ),
//           centerTitle: true,
//           elevation: 0.0,
//         ),
//         drawer: Drawer(),
//         body: _loading
//             ? Center(child: CircularProgressIndicator())
//             : SingleChildScrollView(
//                 child: Container(
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                     Row(
//                       children: [
//                         CircleAvatar(
//                             // child: ListView.builder(
//                             //     shrinkWrap: true,
//                             //     scrollDirection: Axis.horizontal,
//                             //     itemCount: categories.length,
//                             //     itemBuilder: (context, index) {
//                             //       return CategoryTile(
//                             //         image: categories[index].image,
//                             //         // categoryName: categories[index].categoryName,
//                             //       );
//                             //     }),
//                             ),
//                       ],
//                     ),
//                     SizedBox(height: size.height * 0.05),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Breaking News!",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18.0),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           AllNews(news: "Breaking")));
//                             },
//                             child: Text(
//                               "See All",
//                               style: TextStyle(
//                                   // decoration: TextDecoration.underline,
//                                   // decorationColor: Colors.blue,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 16.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 12.0,
//                     ),
//                     loading2
//                         ? Center(child: CircularProgressIndicator())
//                         : CarouselSlider.builder(
//                             itemCount: 5,
//                             itemBuilder: (context, index, realIndex) {
//                               String? res = sliders[index].urlToImage;
//                               String? res1 = sliders[index].title;
//                               return buildImage(res!, index, res1!);
//                             },
//                             options: CarouselOptions(
//                                 height: 220,
//                                 autoPlay: true,
//                                 enlargeCenterPage: true,
//                                 enlargeStrategy:
//                                     CenterPageEnlargeStrategy.height,
//                                 onPageChanged: (index, reason) {
//                                   setState(() {
//                                     activeIndex = index;
//                                   });
//                                 })),
//                     SizedBox(
//                       height: 17.0,
//                     ),
//                     Center(child: buildIndicator()),
//                     SizedBox(
//                       height: 30.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Today's News!",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18.0),
//                           ),
//                          SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => changeCategory('all'),
//                   child: Text('All'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => changeCategory('business'),
//                   child: Text('Business'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => changeCategory('sports'),
//                   child: Text('Sports'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => changeCategory('entertainment'),
//                   child: Text('Entertainment'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => changeCategory('health'),
//                   child: Text('Health'),
//                 ),
//               ],
//             ),
//           ),
//                          ],
//                       ),
//                     )
//                   ]))));
//   }

//   Widget buildImage(String image, int index, String name) => Container(
//       margin: EdgeInsets.symmetric(horizontal: 5.0),
//       child: Stack(children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: CachedNetworkImage(
//             height: 250,
//             fit: BoxFit.cover,
//             width: MediaQuery.of(context).size.width,
//             imageUrl: image,
//           ),
//         ),
//         Container(
//           height: 250,
//           padding: EdgeInsets.only(left: 10.0),
//           margin: EdgeInsets.only(top: 170.0),
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               color: Colors.black45,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10))),
//           child: Center(
//             child: Text(
//               name,
//               maxLines: 2,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         )
//       ]));

//   Widget buildIndicator() => AnimatedSmoothIndicator(
//         activeIndex: activeIndex,
//         count: 5,
//         effect: SlideEffect(
//             dotWidth: 12, dotHeight: 12, activeDotColor: Colors.black),
//       );
// }

// class NewsApp extends StatefulWidget {
//   @override
//   _NewsAppState createState() => _NewsAppState();
// }

// class _NewsAppState extends State<NewsApp> {
//   String category = 'general'; // Default category
//   List<dynamic> newsList = [];
//   NewsApiService apiService = NewsApiService();

//   @override
//   void initState() {
//     super.initState();
//     fetchNews();
//   }

//   Future<void> fetchNews() async {
//     try {
//       List<dynamic> news = await apiService.getNews(category);
//       setState(() {
//         newsList = news;
//       });
//     } catch (e) {
//       // Handle error
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         child: NewsList(newsList: newsList),
//       ),
//     );
//   }
// }

// class NewsList extends StatelessWidget {
//   final List<dynamic> newsList;

//   NewsList({required this.newsList});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: newsList.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           contentPadding: EdgeInsets.all(10),
//           leading: Image.network(
//             newsList[index]['urlToImage'] ?? '',
//             width: 80,
//             height: 80,
//             fit: BoxFit.cover,
//           ),
//           title: Text(newsList[index]['title'] ?? ''),
//           subtitle: Text(newsList[index]['description'] ?? ''),
//         );
//       },
//     );
//   }
// }
//  void changeCategory(String category) {
//     setState(() {
//       selectedCategory = category;
//     });

//     fetchData('$categoryApiUrl$selectedCategory&apiKey=$apiKey', 'category');
//   }
// }

// // class CategoryTile extends StatelessWidget {
// //   final categoryName;
// //   CategoryTile({
// //     this.categoryName,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         CategoryNews(
// //           name: categoryName,
// //         );
// //         // Navigator.push(
// //         //     context,
// //         //     MaterialPageRoute(
// //         //         builder: (context) => CategoryNews(name: categoryName)));
// //       },
// //       child: Container(
// //         margin: EdgeInsets.only(right: 16),
// //         child: Stack(
// //           children: [
// //             Container(
// //               width: 110,
// //               height: 30,
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(6),
// //                 color: Colors.black,
// //               ),
// //               child: Center(
// //                   child: Text(
// //                 categoryName,
// //                 style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 15,
// //                     fontWeight: FontWeight.bold),
// //               )),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class BlogTile extends StatelessWidget {
//   String imageUrl, title, desc, url;
//   BlogTile(
//       {required this.desc,
//       required this.imageUrl,
//       required this.title,
//       required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 10.0),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Material(
//             elevation: 3.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: CachedNetworkImage(
//                             imageUrl: imageUrl,
//                             height: 120,
//                             width: 120,
//                             fit: BoxFit.cover,
//                           ))),
//                   SizedBox(
//                     width: 8.0,
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width / 1.7,
//                         child: Text(
//                           title,
//                           maxLines: 2,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 17.0),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 7.0,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width / 1.7,
//                         child: Text(
//                           desc,
//                           maxLines: 3,
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15.0),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
