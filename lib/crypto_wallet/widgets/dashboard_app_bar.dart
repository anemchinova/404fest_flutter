import 'package:fest404/crypto_wallet/crypto_wallet_data.dart';
import 'package:fest404/crypto_wallet/widgets/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cryptoWalletData = Provider.of<CryptoWalletData>(context);

    return SliverAppBar(
      elevation: 0.0,
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      leading: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.back,
            color: AppColors.textColor,
          ),
          minSize: 0,
        ),
      ),
      stretch: true,
      toolbarHeight: 80,
      collapsedHeight: 100,
      expandedHeight: 150,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello ${cryptoWalletData.owner.name}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                    const Text(
                      'Welcome back!',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                minSize: 0,
                child: const Icon(
                  CupertinoIcons.slider_horizontal_3,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

