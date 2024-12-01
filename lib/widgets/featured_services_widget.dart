import 'package:flutter/material.dart';

class FeaturedServicesWidget extends StatelessWidget {
  final Color primaryColor;
  final List<String> features;

  const FeaturedServicesWidget({
    super.key,
    required this.primaryColor,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Featured Services',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: features.map((feature) {
              return Container(
                margin: const EdgeInsets.only(right: 8),
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryColor,
                    side: BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  icon: Icon(_getFeatureIcon(feature), size: 18),
                  label: Text(
                    feature,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  IconData _getFeatureIcon(String feature) {
    switch (feature.toLowerCase()) {
      case 'quickdeposit':
        return Icons.camera_alt;
      case 'zelle®':
        return Icons.send;
      case 'online bill pay':
        return Icons.receipt_long;
      case 'real-time fraud monitoring':
        return Icons.security;
      default:
        return Icons.star_outline;
    }
  }
}