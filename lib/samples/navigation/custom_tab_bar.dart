import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:rive_ui/models/tab_items.dart';
import 'package:rive_ui/samples/Rive_ui/assets.dart';
import 'package:rive_ui/samples/Rive_ui/theme.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.onTabChanged});

  final Function(int tabIndex) onTabChanged;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

int selectedTab = 0;

final List<TabItems> icons = TabItems.tabItemList;

class _CustomTabBarState extends State<CustomTabBar> {
  void onRiveIconInit(Artboard artboard, int index) {
    final controller = StateMachineController.fromArtboard(
        artboard, icons[index].stateMachine);
    artboard.addController(controller!);
    icons[index].status = controller.findInput<bool>('active') as SMIBool;
  }

  void onTabPressed(int index) {
    if (selectedTab != index) {
      setState(() {
        selectedTab = index;
      });
      widget.onTabChanged(index);
      icons[index].status!.change(true);
      Future.delayed(const Duration(seconds: 1), () {
        icons[index].status!.change(false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
      padding: const EdgeInsets.all(1),
      constraints: const BoxConstraints(maxWidth: 768),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0)
          ])),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: RiveAppTheme.background2.withOpacity(.8),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: RiveAppTheme.background2.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 20),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            icons.length,
            (index) {
              return Expanded(
                child: CupertinoButton(
                  padding: const EdgeInsets.all(12),
                  onPressed: () {
                    onTabPressed(index);
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: selectedTab == index ? 1 : 0.5,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: -4,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 4,
                            width: selectedTab == index ? 20 : 0,
                            decoration: BoxDecoration(
                              color: RiveAppTheme.accentColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: RiveAnimation.asset(
                            iconsRiv,
                            stateMachines: [icons[index].stateMachine],
                            artboard: icons[index].artboard,
                            onInit: (artboard) {
                              onRiveIconInit(artboard, index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
