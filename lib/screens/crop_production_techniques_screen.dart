import 'package:flutter/material.dart';

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
                    'Soil management is the foundation of successful farming. It involves maintaining proper soil structure and managing nutrients and pH levels.',
                icon: Icons.nature,
              ),
              _buildSection(
                context: context,
                title: 'Water Management',
                description:
                    'Proper water management significantly impacts crop production. This includes irrigation scheduling and water conservation techniques.',
                icon: Icons.water,
              ),
              _buildSection(
                context: context,
                title: 'Sowing Rate',
                description:
                    'The sowing rate refers to the number of seeds planted per acre. The optimal rate varies by crop species, variety, and environmental conditions.',
                icon: Icons.crop_square,
              ),
              _buildSection(
                context: context,
                title: 'Pesticide Management',
                description:
                    'Pesticides help reduce crop damage from pests. Effective pesticide management involves selecting the right type and applying it at the appropriate time.',
                icon: Icons.pest_control,
              ),
              _buildSection(
                context: context,
                title: 'Crop Rotation',
                description:
                    'Crop rotation involves alternating crops in a specific sequence to improve soil health, manage pests, and optimize nutrient use.',
                icon: Icons.rotate_left,
              ),
              _buildSection(
                context: context,
                title: 'Fertilization',
                description:
                    'Fertilization is the application of nutrients to enhance crop growth. It includes understanding the types of fertilizers and their correct application methods.',
                icon: Icons.grain,
              ),
              _buildSection(
                context: context,
                title: 'Harvesting Techniques',
                description:
                    'Harvesting techniques ensure the proper timing and method for collecting crops to maximize yield and quality.',
                icon: Icons.agriculture,
              ),
              _buildSection(
                context: context,
                title: 'Pest Management',
                description:
                    'Effective pest management strategies help in controlling pests and diseases that can harm crops. Integrated pest management (IPM) is often used.',
                icon: Icons.bug_report,
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
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32,
            color: Color(0xFF141C0D),
          ),
          SizedBox(width: 10),
          Expanded(
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
                SizedBox(height: 8),
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
          ),
        ],
      ),
    );
  }
}
