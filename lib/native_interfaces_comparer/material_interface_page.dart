import 'package:fest404/native_interfaces_comparer/base_layout.dart';
import 'package:flutter/material.dart';

class MaterialInterfacePage extends StatelessWidget {
  const MaterialInterfacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App bar'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: BaseLayout(
                  textField: const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Label',
                      alignLabelWithHint: true,
                      hintText: 'Hint',
                      helperText: 'Helper',
                      errorText: null,
                    ),
                  ),
                  switcher: Switch(
                    value: true,
                    onChanged: (_) {},
                  ),
                  button: SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text('Text'),
                      color: Colors.blue,
                    ),
                  ),
                  textButton: MaterialButton(
                    onPressed: () {},
                    child: const Text('Text'),
                  ),
                  slider: Slider(
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
    );
  }
}
