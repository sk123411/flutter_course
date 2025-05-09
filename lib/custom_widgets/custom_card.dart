import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
