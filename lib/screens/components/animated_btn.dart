import 'package:flutter/material.dart';

import 'package:rive/rive.dart' as rive;
import 'package:rive_ui/samples/Rive_ui/assets.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({super.key, this.onTap, required this.btnController});

  final void Function()? onTap;
  final rive.RiveAnimationController btnController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 10,
              offset: const Offset(0, 10))
        ]),
        width: 236,
        height: 64,
        child: Stack(
          children: [
            rive.RiveAnimation.asset(
              buttonRiv,
              fit: BoxFit.cover,
              controllers: [btnController],
            ),
            Center(
              child: Transform.translate(
                offset: const Offset(4, 4),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward_rounded),
                    SizedBox(width: 8),
                    SizedBox(width: 4),
                    Text(
                      "Start the course",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Inter'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // return GestureDetector(
    //   onTap: press,
    //   child: SizedBox(
    //     height: 64,
    //     width: 260,
    //     child: Stack(
    //       children: [
    //         // Just a button no animation
    //         // Let's fix that
    //         RiveAnimation.asset(
    //           "assets/RiveAssets/button.riv",
    //           // Once we restart the app it shows the animation
    //           controllers: [_btnAnimationColtroller],
    //         ),
    //         const Positioned.fill(
    //           // But it's not center
    //           top: 8,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Icon(CupertinoIcons.arrow_right),
    //               SizedBox(width: 8),
    //               Text(
    //                 "Start the course",
    //                 style: TextStyle(fontWeight: FontWeight.w600),
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
