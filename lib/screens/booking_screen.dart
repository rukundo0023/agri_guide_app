import 'package:flutter/material.dart';

class ConsultationBookingPage extends StatefulWidget {
  final Color customGreen;

  ConsultationBookingPage({required this.customGreen});

  @override
  _ConsultationBookingPageState createState() =>
      _ConsultationBookingPageState();
}

class _ConsultationBookingPageState extends State<ConsultationBookingPage> {
  DateTime _selectedDate = DateTime.now();

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book A Consultation'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CalendarDatePicker(
              initialDate: _selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
              onDateChanged: _onDateChanged,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('Dec 15, Wednesday'),
                      subtitle: Text('9:00 AM - 10:00 AM'),
                    ),
                    ListTile(
                      title: Text('Dec 16, Thursday'),
                      subtitle: Text('11:00 AM - 12:00 PM'),
                    ),
                    ListTile(
                      title: Text('Dec 17, Friday'),
                      subtitle: Text('3:00 PM - 4:00 PM'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Show a SnackBar with a success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Successfully Booked'),
                    backgroundColor:
                        Colors.green, // Customize the SnackBar color if needed
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.customGreen, // Custom button color
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Center(
                child: Text('Confirm'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
