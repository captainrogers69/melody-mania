import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants/k_assets.dart';
import '../utils/constants/k_colors.dart';
import '../utils/constants/k_routes.dart';

class SplashScreen extends StatefulWidget {
  static const String id = KRoutes.splashScreen;
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  double _opacity = 0;
  bool _value = true;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Timer(
              const Duration(milliseconds: 300),
              () {
                scaleController.reset();
              },
            );
            context.go(KRoutes.authScreen);
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
        _value = false;
      });
    });
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.blackColor,
      body: Stack(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Padding(
              //   padding: EdgeInsets.only(top: 80),
              //   child: Text(
              //     'Here will be your app\'s logo',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.w600,
              //       fontSize: 18,
              //     ),
              //   ),
              // ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(seconds: 6),
              opacity: _opacity,
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 2),
                height: _value ? 50 : 200,
                width: _value ? 50 : 200,
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       color: KColors.primaryColor.withOpacity(.2),
                //       blurRadius: 100,
                //       spreadRadius: 10,
                //     ),
                //   ],
                //   // color: KColors.primaryColor,
                //   borderRadius: BorderRadius.circular(20),
                // ),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          KAssets.logo,
                        ),
                      ),
                    ),
                    child: AnimatedBuilder(
                      animation: scaleAnimation,
                      builder: (c, child) => Transform.scale(
                        scale: scaleAnimation.value,
                        child: Image.asset(
                          KAssets.logo,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   static const String id = KRoutes.splashScreen;
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {

//     /* return AnimatedSplashScreen(
//       duration: 3000,
//       splash: Image.asset(KAssets.logo),
//       nextScreen: const BottomScreen(),
//       nextRoute: KRoutes.bottomScreen,
//       splashTransition: SplashTransition.fadeTransition,
//       pageTransitionType: PageTransitionType.scale,
//       backgroundColor: KColors.blackColor,
//     ); */
//   }
// }

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Go Back',
          style: TextStyle(color: KColors.blackColor),
        ),
        centerTitle: true,
        backgroundColor: KColors.primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
