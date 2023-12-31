import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_web_app/widgets/responsive.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assets = [
    'assets/images/test1.jpeg',
    'assets/images/test2.jpeg',
    'assets/images/test3.jpeg',
  ];

  final List<String> title = ['Sci-fi', 'Photography', 'Romance'];

  @override
  Widget build(BuildContext context) {
    return screenSize.width < 800
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: screenSize.width / 15),
                  ...Iterable<int>.generate(assets.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.width / 2.5,
                              width: screenSize.width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  assets[pageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                title[pageIndex],
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(assets.length).map(
                  (int pageIndex) => Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 3.8,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  assets[pageIndex],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                  color: Colors.grey.withOpacity(0.3),
                                )
                              ]),
                        ),
                      ),

                      //Responsive ROW
                      screenSize.width < 800
                          ? SingleChildScrollView(
                              child: Row(
                                children: [
                                  ...Iterable<int>.generate(assets.length).map(
                                    (int pageIndex) => Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: screenSize.width / 2.5,
                                              width: screenSize.width / 1.5,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                child: Image.asset(
                                                  assets[pageIndex],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),

                                            //

                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenSize.height / 70),
                                              child: Text(
                                                title[pageIndex],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        //
                                        SizedBox(width: screenSize.width / 15),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                title[pageIndex],
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
