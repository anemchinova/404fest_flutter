
import 'package:fest404/crypto_wallet/crypto_wallet_data.dart';
import 'package:fest404/crypto_wallet/widgets/dashboard_bottom_bar.dart';
import 'package:fest404/crypto_wallet/widgets/dashboard_card.dart';
import 'package:fest404/crypto_wallet/widgets/dashboard_app_bar.dart';
import 'package:fest404/crypto_wallet/widgets/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CryptoWalletDemoPage extends StatelessWidget {
  const CryptoWalletDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cryptoWalletData = testCryptoWalletData;

    return Provider.value(
      value: cryptoWalletData,
      child: Scaffold(
        backgroundColor: AppColors.accent,
        body: Stack(
          children: [
            Positioned.fill(
              child: CustomScrollView(
                slivers: [
                  const DashboardAppBar(),
                  SliverPadding(
                    padding: const EdgeInsets.all(30.0),
                    sliver: SliverStaggeredGrid.count(
                      children: [
                        DashboardCard(
                          title: formatNumber(cryptoWalletData.sales),
                          subtitle: 'Sales',
                          iconData: CupertinoIcons.graph_circle,
                          onTap: () {

                          },
                        ),
                        DashboardCard(
                          title: formatNumber(cryptoWalletData.customers),
                          subtitle: 'Customers',
                          iconData: CupertinoIcons.person_alt_circle,
                        ),
                        DashboardCard(
                          title: '\$${formatNumber(cryptoWalletData.revenue)}',
                          subtitle: 'Revenue',
                          iconData: CupertinoIcons.chart_pie,
                        ),
                        DashboardCard(
                          title: formatNumber(cryptoWalletData.products),
                          subtitle: 'Products',
                          iconData: CupertinoIcons.uiwindow_split_2x1,
                        ),
                      ],
                      staggeredTiles: const [
                        StaggeredTile.count(1, 1.2),
                        StaggeredTile.count(1, 1),
                        StaggeredTile.count(1, 1.2),
                        StaggeredTile.count(1, 1),
                      ],
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: DashboardBottomBar(),
            ),
          ],
        ),
      ),
    );
  }

  String formatNumber(num number) {
    return NumberFormat.compact().format(number).toLowerCase();
  }
}
