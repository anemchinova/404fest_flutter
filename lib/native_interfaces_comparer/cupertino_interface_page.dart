import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/native_interfaces_comparer/base_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoInterfacePage extends StatefulWidget {
  const CupertinoInterfacePage({Key? key}) : super(key: key);

  @override
  _CupertinoInterfacePageState createState() => _CupertinoInterfacePageState();
}

class _CupertinoInterfacePageState extends State<CupertinoInterfacePage> {
  bool switchState = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          middle: const Text('App bar'),
          leading: CupertinoButton(
            child: const Text('Close'),
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const VerticalSpace(13),
                Expanded(
                  child: BaseLayout(
                    textField: const CupertinoTextField(
                      enabled: false,
                      placeholder: 'Placeholder',
                    ),
                    switcher: CupertinoSwitch(
                      value: switchState,
                      onChanged: (_) {
                        setState(() {
                          switchState = !switchState;
                        });
                      },
                    ),
                    button: SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        onPressed: () {},
                        child: const Text('Text'),
                        color: Colors.blue,
                      ),
                    ),
                    textButton: CupertinoButton(
                      onPressed: () {},
                      child: const Text('Text'),
                    ),
                    slider: CupertinoSlider(
                      value: 50,
                      max: 100,
                      min: 0,
                      onChanged: (_) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
