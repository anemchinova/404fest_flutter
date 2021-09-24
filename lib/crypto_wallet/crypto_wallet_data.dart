const testCryptoWalletData = CryptoWalletData(
  sales: 230000.0,
  customers: 8549,
  products: 1423,
  revenue: 9745.0,
  owner: CryptoWalletUser(
    name: 'David',
    avatarUrl: 'https://st.depositphotos.com/1814084/1639/i/600/depositphotos_16398251-stock-photo-brad-pitt.jpg',
  ),
);

class CryptoWalletData {
  const CryptoWalletData({
    required this.sales,
    required this.customers,
    required this.products,
    required this.revenue,
    required this.owner,
  });

  final CryptoWalletUser owner;
  final double sales;
  final int customers;
  final int products;
  final double revenue;
}

class CryptoWalletUser {
  const CryptoWalletUser({
    required this.name,
    this.avatarUrl,
  });

  final String name;
  final String? avatarUrl;
}
