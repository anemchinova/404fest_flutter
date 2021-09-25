import 'package:fest404/native_interfaces_comparer/cupertino_interface_page.dart';
import 'package:fest404/native_interfaces_comparer/material_interface_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NativeInterfacesComparerDemoPage extends StatefulWidget {
  const NativeInterfacesComparerDemoPage({Key? key}) : super(key: key);

  @override
  _NativeInterfacesComparerDemoPageState createState() => _NativeInterfacesComparerDemoPageState();
}

class _NativeInterfacesComparerDemoPageState extends State<NativeInterfacesComparerDemoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  final GlobalKey _cupertinoPageKey = GlobalKey(debugLabel: 'cupertino_page_key');
  final GlobalKey _materialPageKey = GlobalKey(debugLabel: 'material_page_key');

  double xAxisOffset = 0;

  bool swapped = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, value: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    Widget first = CupertinoInterfacePage(
      key: _cupertinoPageKey,
    );
    Widget second = MaterialInterfacePage(
      key: _materialPageKey,
    );

    if (swapped) {
      var temp = first;
      first = second;
      second = temp;
    }

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Material(
        child: Stack(
          children: [
            first,
            SizeTransition(
              sizeFactor: animationController,
              axis: Axis.horizontal,
              axisAlignment: -1,
              child: second,
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                var center = MediaQuery.of(context).size.width * animationController.value;
                return Positioned(
                  left: center - 15,
                  top: 0,
                  width: 30,
                  bottom: 0,
                  child: child!,
                );
              },
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanStart: (details) {
                  xAxisOffset = 0;
                },
                onPanUpdate: (details) {
                  var width = MediaQuery.of(context).size.width;

                  animationController.value = ((width * animationController.value) + xAxisOffset) / width;

                  xAxisOffset = details.delta.dx;
                },
                child: SizedBox.expand(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 3,
                        color: Colors.white,
                        height: double.infinity,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.arrow_right_arrow_left_circle_fill,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CupertinoButton(
                    child: const Icon(
                      Icons.swap_horiz,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        swapped = !swapped;
                      });
                    },
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
