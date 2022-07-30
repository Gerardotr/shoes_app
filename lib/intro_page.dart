import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shoes_app/constants.dart';
import 'package:shoes_app/home_page.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opasity;

  @override
  void initState() {
    // TODO: implement initState

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _position = Tween<double>(begin: 20, end: 50).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0, 1)))..addListener(() {
          setState(() {
            
          });
        });
    _opasity = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0, 1)))..addListener(() {
          setState(() {
            
          });
        });

    _controller.repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Constants.myBlack,
        child: Stack(
          children: [
            Positioned(
                bottom: -250,
                child: Container(
                  width: size.width,
                  height: size.width + 250,
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          radius: 0.65,
                          colors: [Constants.myOrange, Constants.myBlack])),
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: size.width,
                  child: Image.asset('assets/img_nike_text.png'),
                  padding: EdgeInsets.all(50)),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(50),
                width: size.width,
                child: Image.asset(
                  'assets/img_shoes.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 40),
                height: size.height / 2,
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'LIVE YOUR \nPERFECT',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 37,
                              fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Smart, gorgeous & fashionable\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          )),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (details) {
                        int sensitivity = 8;
                        if (details.delta.dy < -sensitivity) {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: HomePage(),
                                  type: PageTransitionType.bottomToTop));
                        }
                      },
                      child: AbsorbPointer(
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Opacity(
                                  opacity: _opasity.value,
                                  child: const Icon(
                                    CommunityMaterialIcons.chevron_double_up,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                              RichText(textAlign: TextAlign.center, text: TextSpan(text: "Get Started", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              )),),
                              const SizedBox(height: 20,)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
