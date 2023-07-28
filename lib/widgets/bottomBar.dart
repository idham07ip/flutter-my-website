import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/bottomBarColumn.dart';
import 'package:flutter_web_app/widgets/infoText.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);
  static const Color gradientStartColor = Color(0xff11998e);
  static const Color gradientEndColor = Color(0xff0575E6);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: gradientStartColor,
            offset: Offset(1.0, 6.0),
            blurRadius: 1.0,
          ),
          BoxShadow(
            color: gradientEndColor,
            offset: Offset(1.0, 6.0),
            blurRadius: 1.0,
          ),
        ],
        // gradient: LinearGradient(
        //     colors: [gradientStartColor, gradientEndColor],
        //     begin: FractionalOffset(0.2, 0.2),
        //     end: FractionalOffset(1.0, 1.0),
        //     stops: [0.0, 1.0],
        //     tileMode: TileMode.clamp),
        color: Colors.redAccent,
      ),
      padding: const EdgeInsets.all(30),
      //color: Colors.blueGrey[900],
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),

                    //
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),

                    //
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Instagram',
                      s2: 'Facebook',
                      s3: 'Twitter',
                    ),
                  ],
                ),

                //
                Divider(
                  color: Colors.white60,
                ),

                //
                const SizedBox(
                  height: 10,
                ),

                //
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoText(
                      type: 'Email',
                      text: 'idham16ip@gmail.com',
                    ),
                    const SizedBox(height: 5),
                    InfoText(
                      type: 'Address',
                      text: 'jl.Alternatif Sentul, Kp. Tegal Pilar 01/01',
                    )
                  ],
                ),

                //
                const SizedBox(
                  height: 10,
                ),

                //
                const Divider(
                  color: Colors.white60,
                ),

                //
                const SizedBox(height: 20,),

                  Text(
                  'Copyright © 2023 | Idham Irama Permana',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),

                    //
                    const BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),

                    //
                    const BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Instagram',
                      s2: 'Facebook',
                      s3: 'Twitter',
                    ),
                    Container(
                      color: Colors.white,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: 'idham16ip@gmail.com',
                        ),
                        const SizedBox(height: 5),
                        InfoText(
                          type: 'Address',
                          text: 'jl.Alternatif Sentul, Kp. Tegal Pilar 01/01',
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  'Copyright © 2023 | Idham Irama Permana',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
    );
  }
}
