import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remake_quran_app/pages/home_sceen.dart';
import 'package:remake_quran_app/theme.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'splash_screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Quran App", 
                style: GoogleFonts.poppins(
                  color: orange,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(
                  height: 14,
                ),
              Text(
                "Learn Quran and\nRecite once everyday",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  
                  fontSize: 18,
                  color: Secondary,
                ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      
                      height: 430,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SvgPicture.asset('assets/svg/splash.svg'),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: -20,
                    child: Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 45 ,vertical: 15),
                          decoration: BoxDecoration(
                            color: orange, borderRadius: BorderRadius.circular(25)
                          ),
                          child: Text("Get Start"
                          , style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                            textAlign: TextAlign.center,
                          )
                          ,
                        ),
                      ),
                    )
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}