import 'package:flutter/material.dart';

class MarketPricesScreen extends StatefulWidget {
  @override
  _MarketPricesScreenState createState() => _MarketPricesScreenState();
}

class _MarketPricesScreenState extends State<MarketPricesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Sample data for fruits and their prices
  final List<Map<String, String>> _marketPrices = [
    {'fruit': 'Avocado', 'price': '\$2.50 per piece'},
    {'fruit': 'Banana', 'price': '\$1.20 per bunch'},
    {'fruit': 'Strawberry', 'price': '\$3.00 per pint'},
    {'fruit': 'Mango', 'price': '\$1.80 per piece'},
    {'fruit': 'Pineapple', 'price': '\$4.00 per piece'},
    {'fruit': 'Apple', 'price': '\$1.50 per piece'},
    {'fruit': 'Orange', 'price': '\$2.00 per dozen'},
    {'fruit': 'Blueberry', 'price': '\$5.00 per pint'},
    {'fruit': 'Grapes', 'price': '\$2.20 per pound'},
    {'fruit': 'Peach', 'price': '\$3.50 per piece'},
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredMarketPrices = _marketPrices
        .where((item) => item['fruit']!.toLowerCase().contains(_searchQuery))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Market Prices'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Optionally, you can show a search bar in the app bar or navigate to another screen for search
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for fruits',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: filteredMarketPrices.length,
                itemBuilder: (context, index) {
                  final item = filteredMarketPrices[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        item['fruit']!,
                        style: TextStyle(
                          color: Color(0xFF141C0D),
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        item['price']!,
                        style: TextStyle(
                          color: Color(0xFF141C0D),
                          fontFamily: 'Manrope',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
