import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive_ui/samples/Rive_ui/assets.dart';
import 'package:rive_ui/screens/components/animated_btn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

late rive.RiveAnimationController btnController;

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    btnController = rive.OneShotAnimation('active', autoplay: false);
  }

  @override
  void dispose() {
    super.dispose();
    btnController.dispose();
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
          ))
        ],
      ),
    );
  }
}



// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart' as prefix;

// import '../components/animated_btn.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// // Let's run the app
// // We are done with out scrren
// // let me show you how to create the animation on RIVE
// // On Next episode i will show you how to do this popup
// // See you on the next one
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   late prefix.RiveAnimationController _btnAnimationColtroller;

//   @override
//   void initState() {
//     _btnAnimationColtroller = prefix.OneShotAnimation(
//       "active",
//       autoplay: false,
//       // Let's restart the app again
//       // No amination
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // At the end of the video i will show you
//           // How to create that animation on Rive
//           // Let's add blur
//           Positioned(
//             // height: 100,
//             width: MediaQuery.of(context).size.width * 1.7,
//             bottom: 200,
//             left: 100,
//             child: Image.asset("assets/Backgrounds/Spline.png"),
//           ),
//           Positioned.fill(
//             child: BackdropFilter(
//               // Now it's looks perfect
//               // See how easy
//               filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
//             ),
//           ),
//           const prefix.RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
//           Positioned.fill(
//             child: BackdropFilter(
//               // Now it's looks perfect
//               filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
//               child: const SizedBox(),
//             ),
//           ),
//           // Let's add text
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Spacer(),
//                   const SizedBox(
//                     width: 260,
//                     child: Column(
//                       children: [
//                         Text(
//                           "Learn design & code",
//                           style: TextStyle(
//                             fontSize: 60,
//                             fontFamily: "Poppins",
//                             height: 1.2,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Spacer(flex: 2),
//                   AnimatedBtn(
//                     btnAnimationColtroller: _btnAnimationColtroller,
//                     press: () {
//                       _btnAnimationColtroller.isActive = true;
//                     },
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 24),
//                     child: Text(
//                       "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
