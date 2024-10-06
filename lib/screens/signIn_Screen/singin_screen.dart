import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive_ui/samples/Rive_ui/theme.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.8),
                      Colors.white10
                    ])),
                child: Container(
                  padding: const EdgeInsets.all(29),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: RiveAppTheme.shadow.withOpacity(.3),
                          blurRadius: 30,
                          offset: const Offset(0, 30),
                        ),
                        BoxShadow(
                          color: RiveAppTheme.shadow.withOpacity(.3),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: CupertinoColors.secondarySystemBackground,
                      backgroundBlendMode: BlendMode.luminosity),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 34, fontFamily: 'Poppins'),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Access to 240+ hours of content, Learn design and code , by building real apps with React and Swift.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            fontFamily: 'Inter'),
                      ),
                      const SizedBox(height: 24),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                              color: CupertinoColors.secondaryLabel,
                              fontSize: 15,
                              fontFamily: 'Inter'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: authInputStyle(
                            iconName:
                                'assets/samples/ui/rive_app/images/icon_email.png'),
                      ),
                      const SizedBox(height: 24),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              color: CupertinoColors.secondaryLabel,
                              fontSize: 15,
                              fontFamily: 'Inter'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        obscureText: true,
                        decoration: authInputStyle(
                            iconName:
                                'assets/samples/ui/rive_app/images/icon_lock.png'),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xfff77d8e).withOpacity(.5),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.all(20),
                          color: const Color(0xfff77d8e),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_forward_rounded),
                              SizedBox(width: 4),
                              Text(
                                'Sign In',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: 'Inter'),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Row(
                          children: [
                            const Expanded(child: Divider()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 15,
                                    fontFamily: 'Inter'),
                              ),
                            ),
                            const Expanded(child: Divider()),
                          ],
                        ),
                      ),
                      const Text(
                        'Sign Up with Email, Apple or Google',
                        style: TextStyle(
                            color: CupertinoColors.secondaryLabel,
                            fontSize: 15,
                            fontFamily: 'Inter'),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                              'assets/samples/ui/rive_app/images/logo_apple.png'),
                          Image.asset(
                              'assets/samples/ui/rive_app/images/logo_email.png'),
                          Image.asset(
                              'assets/samples/ui/rive_app/images/logo_google.png'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(36 / 2),
                    padding: EdgeInsets.zero,
                    color: Colors.red,
                    minSize: 36,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: RiveAppTheme.shadow.withOpacity(0.3),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36 / 2)),
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

InputDecoration authInputStyle({required String iconName}) {
  return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Image.asset(iconName),
      ));
}
