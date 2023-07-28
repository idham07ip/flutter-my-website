import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/bottomBar.dart';
import 'package:flutter_web_app/widgets/carousel.dart';
import 'package:flutter_web_app/widgets/featuredHeading.dart';
import 'package:flutter_web_app/widgets/featuredTiles.dart';
import 'package:flutter_web_app/widgets/floatingQuickAccess.dart';
import 'package:flutter_web_app/widgets/mainHeading.dart';
import 'package:flutter_web_app/widgets/menuDrawer.dart';
import 'package:flutter_web_app/widgets/topBarContents.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: screenSize.width < 800
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.redAccent),
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(_opacity),
              title: Text(
                'Author',
                style: GoogleFonts.poppins(
                  color: const Color(0xFFFF735C),
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: TopBarContents(_opacity),
            ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: screenSize.height / 1.6,
                    width: screenSize.width / 1.3,
                    child: Image.asset(
                      'assets/images/background2.jpg',
                      fit: BoxFit.cover,
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

                    //HeadingTitle
                    MainHeading(screenSize: screenSize),

                    //CarouselSlider
                    MainCarousel(),

                    //
                    SizedBox(height: screenSize.height / 10),

                    //Footer
                    const BottomBar(),
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
