import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/featuredHeading.dart';
import 'package:flutter_web_app/widgets/featuredTiles.dart';
import 'package:flutter_web_app/widgets/floatingQuickAccess.dart';
import 'package:flutter_web_app/widgets/topBarContents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: TopBarContents(_opacity),
        preferredSize: Size(screenSize.width, 70),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    child: SizedBox(
                      height: screenSize.height / 1.6,
                      width: screenSize.width / 1.3,
                      child: Image.asset(
                        'assets/images/background2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    //function for Floating
                    FloatingQuickAccessBar(screenSize: screenSize),

                    //bigText and shortText
                    FeaturedHeading(screenSize: screenSize),

                    //showImages
                    FeaturedTiles(screenSize: screenSize),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
