import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive_ui/samples/Rive_ui/assets.dart';
import 'package:rive_ui/screens/components/animated_btn.dart';
import 'package:rive_ui/screens/signIn_Screen/singin_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

AnimationController? singInAnimationController;
late rive.RiveAnimationController btnController;

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    btnController = rive.OneShotAnimation('active', autoplay: false);
    singInAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 350),
        upperBound: 1);

    const SpringDescription springDescription =
        SpringDescription(mass: 0.1, stiffness: 40, damping: 5);

    btnController.isActiveChanged.addListener(
      () {
        if (!btnController.isActive) {
          final SpringSimulation springSimulation =
              SpringSimulation(springDescription, 0, 1, 0);
          singInAnimationController!.animateWith(springSimulation);
        }
      },
    );
  }

  @override
  void dispose() {
    singInAnimationController!.dispose();
    btnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Center(
                child: OverflowBox(
              maxWidth: double.infinity,
              child: Transform.translate(
                offset: const Offset(200, 100),
                child: Image.asset(spline, fit: BoxFit.cover),
              ),
            )),
          ),
          ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const rive.RiveAnimation.asset(shapesRiv)),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  width: 260,
                  child: const Text(
                    "Learn design & code",
                    style: TextStyle(
                      fontSize: 60,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Text(
                  "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                  style: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontFamily: 'Inter',
                      fontSize: 17),
                ),
                const SizedBox(height: 16),
                const Spacer(),
                AnimatedBtn(
                  btnController: btnController,
                  onTap: () => btnController.isActive = true,
                ),
                const SizedBox(height: 16),
                Text(
                  "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontFamily: 'Inter'),
                ),
              ],
            ),
          )),
          AnimatedBuilder(
            animation: singInAnimationController!,
            builder: (context, child) => Transform.translate(
                offset: Offset(
                    0,
                    -MediaQuery.of(context).size.height *
                        (1 - singInAnimationController!.value)),
                child: SinginScreen(
                  onPressed: () {
                    singInAnimationController!
                        .reverse(); // Reverse the animation here
                  },
                )),
          ),
        ],
      ),
    );
  }
}
