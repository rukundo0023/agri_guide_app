import 'package:flutter/material.dart';

class MarketPricesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for fruits and their prices
    final List<Map<String, String>> marketPrices = [
      {'fruit': 'Avocado', 'price': '\$2.50 per piece'},
      {'fruit': 'Banana', 'price': '\$1.20 per bunch'},
      {'fruit': 'Strawberry', 'price': '\$3.00 per pint'},
      {'fruit': 'Mango', 'price': '\$1.80 per piece'},
      {'fruit': 'Pineapple', 'price': '\$4.00 per piece'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Market Prices'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: marketPrices.length,
          itemBuilder: (context, index) {
            final item = marketPrices[index];
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
    );
  }
}
