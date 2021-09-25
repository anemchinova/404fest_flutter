import 'package:fest404/core/widgets/svg_icon.dart';
import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/crypto_wallet/crypto_wallet.dart';
import 'package:fest404/crypto_wallet/neu/neu.dart';
import 'package:fest404/crypto_wallet/widgets/resources.dart';
import 'package:fest404/instagram/instagram_assets.dart';
import 'package:fest404/instagram/widgets/instagram_profile/instagram_profile_page.dart';
import 'package:fest404/native_interfaces_comparer/native_interface_comparer.dart';
import 'package:fest404/onboard/widgets/cuberto_app_bar.dart';
import 'package:fest404/onboard/widgets/cuberto_onboard/cuberto_onboard.dart';
import 'package:fest404/onboard/widgets/cuberto_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  void navigatedToInstagramPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<InstagramProfilePage>(
        builder: (context) => const InstagramProfilePage(),
      ),
    );
  }

  void navigatedToCryptoWalletPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<InstagramProfilePage>(
        builder: (context) => const CryptoWalletDemoPage(),
      ),
    );
  }

  void navigatedToNativeSwipe(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<InstagramProfilePage>(
        builder: (context) => const NativeInterfacesComparerDemoPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CubertoAppBar(),
      extendBodyBehindAppBar: true,
      body: CubertoOnboard(
        colors: const [
          Color(0xFFF3AABE),
          AppColors.accent,
          Color(0xFF3438B1),
        ],
        children: [
          CubertoPage(
            onTap: () {
              // TODO scroll to next page
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () => navigatedToInstagramPage(context),
                  child: const SvgIcon(
                    InstagramAssets.icon,
                    size: 60,
                  ),
                  padding: EdgeInsets.zero,
                  minSize: 40,
                ),
                const VerticalSpace(16),
                const Text(
                  'Tap there \u261D',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          CubertoPage(
            onTap: () {
              // TODO scroll to next page
            },
            child: Center(
              child: NeuIconButton(
                onTap: () => navigatedToCryptoWalletPage(context),
                child: const SizedBox(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: Text(
                      '\u{1F44B}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          CubertoPage(
            onTap: () {
              // TODO scroll to next page
            },
            child: Center(
              child: ElevatedButton(
                child: const Text('Press here'),
                onPressed: () => navigatedToNativeSwipe(context),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFF3AABE),
                  minimumSize: const Size(100, 48),
                  textStyle: const TextStyle(
                    color: Color(0xFF3438B1),
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
