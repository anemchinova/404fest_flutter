import 'package:fest404/native_interfaces_comparer/cupertino_interface_page.dart';
import 'package:fest404/native_interfaces_comparer/material_interface_page.dart';
import 'package:flutter/material.dart';

class NativeInterfacesComparerDemoPage extends StatefulWidget {
  const NativeInterfacesComparerDemoPage({Key? key}) : super(key: key);

  @override
  _NativeInterfacesComparerDemoPageState createState() => _NativeInterfacesComparerDemoPageState();
}

class _NativeInterfacesComparerDemoPageState extends State<NativeInterfacesComparerDemoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> sizeAnimation;

  double xAxisOffset = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CupertinoInterfacePage(),
        SizeTransition(
          sizeFactor: animationController,
          axis: Axis.horizontal,
          axisAlignment: -1,
          child: const MaterialInterfacePage(),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanStart: (details) {
            xAxisOffset = 0;
          },
          onPanUpdate: (details) {
            var width = MediaQuery.of(context).size.width;
            print(width);

            animationController.value = ((width * animationController.value) + xAxisOffset) / width;

            print(animationController.value);
            xAxisOffset = details.delta.dx;
          },
          child: SizedBox.expand(),
        )
      ],
    );
  }
}
