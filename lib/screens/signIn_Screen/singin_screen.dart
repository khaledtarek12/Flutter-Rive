import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive_ui/samples/Rive_ui/assets.dart';
import 'package:rive_ui/samples/Rive_ui/theme.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key, required this.onPressed});

  final Function onPressed;

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

bool isLoading = false;
final emilController = TextEditingController();
final passwordController = TextEditingController();
late rive.SMITrigger successAnimation;
late rive.SMITrigger errorAnimation;
late rive.SMITrigger confittAnimation;

class _SinginScreenState extends State<SinginScreen> {
  @override
  void dispose() {
    emilController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onCheckRiveInit(rive.Artboard artboard) {
    final controller =
        rive.StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    successAnimation = controller.findInput<bool>('Check') as rive.SMITrigger;
    errorAnimation = controller.findInput<bool>('Error') as rive.SMITrigger;
  }

  void onConfettRiveInit(rive.Artboard artboard) {
    final controller =
        rive.StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    confittAnimation =
        controller.findInput<bool>('Trigger explosion') as rive.SMITrigger;
  }

  void login() {
    setState(() {
      isLoading = true;
    });
    bool isEmailValid = emilController.text.trim().isNotEmpty;
    bool isPaswwordValid = passwordController.text.trim().isNotEmpty;
    bool isValid = isEmailValid & isPaswwordValid;

    Future.delayed(
      const Duration(seconds: 1),
      () {
        isValid ? successAnimation.fire() : errorAnimation.fire();
      },
    );
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          isLoading = false;
        });
        if (isValid) confittAnimation.fire();
      },
    );
    if (isValid) {
      Future.delayed(const Duration(seconds: 4), () {
        widget.onPressed();
        emilController.clear();
        passwordController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
                        controller: emilController,
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
                        controller: passwordController,
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
                          onPressed: () {
                            if (!isLoading) login();
                          },
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
              Positioned.fill(
                  child: IgnorePointer(
                ignoring: true,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isLoading)
                      SizedBox(
                          width: 100,
                          height: 100,
                          child: rive.RiveAnimation.asset(
                            checkRiv,
                            onInit: onCheckRiveInit,
                          )),
                    Positioned.fill(
                        child: SizedBox(
                            width: 500,
                            height: 500,
                            child: Transform.scale(
                              scale: 3,
                              child: rive.RiveAnimation.asset(
                                confettiRiv,
                                onInit: onConfettRiveInit,
                              ),
                            ))),
                  ],
                ),
              )),
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
                    onPressed: () {
                      widget.onPressed();
                    },
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
