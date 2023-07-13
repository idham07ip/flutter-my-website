import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: SizedBox(
                  height: screenSize.height * 1.0,
                  width: screenSize.width,
                  child: Image.asset(
                    'assets/images/background2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //function
              FloatingQuickAccessBar(screenSize: screenSize),
            ],
          ),
        ],
      ),
    );
  }
}
