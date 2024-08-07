import 'package:flutter/material.dart';
import 'dart:ui'; // Import FontFeature class

class CropProductionTechniquesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Production Techniques'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                context: context,
                title: 'Soil Management',
                description:
                    'Soil management is the foundation to successful farming. It involves maintaining proper soil structure, and managing nutrients and pH levels.',
              ),
              _buildSection(
                context: context,
                title: 'Water Management',
                description:
                    'Proper water management can make a huge difference in crop production. This includes irrigation scheduling and water conservation.',
              ),
              _buildSection(
                context: context,
                title: 'Sowing Rate',
                description:
                    'The sowing rate is the number of seeds planted per acre. The optimum rate varies by crop species, variety, and environmental conditions.',
              ),
              _buildSection(
                context: context,
                title: 'Pesticide Management',
                description:
                    'Pesticides are used to reduce crop damage from pests. Proper pesticide management includes selecting the right type and using it at the right time.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF141C0D),
              fontFamily: 'Manrope',
              fontSize: 22,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              height: 28 / 22,
              fontFeatures: [FontFeature.enable('dlig')],
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Color(0xFF141C0D),
              fontFamily: 'Manrope',
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
              fontFeatures: [FontFeature.enable('dlig')],
            ),
          ),
        ],
      ),
    );
  }
}
