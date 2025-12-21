// ignore_for_file: public_member_api_docs, sort_constructors_first
// lib/widgets/diploma_card.dart

import 'package:flutter/material.dart';
import 'package:yusur_app/models/diplomas_model.dart';

class DiplomaItem extends StatelessWidget {
  final Diploma diploma;
  final Widget customIcon;
  final Widget textOrIcon;
  final String titleOfDiploma;
  final String descriptionOfDiploma;
  final String imageUrl;
  final Function()? onTap;
  const DiplomaItem({
    super.key,
    required this.diploma,
    required this.customIcon,
    required this.textOrIcon,
    required this.titleOfDiploma,
    required this.descriptionOfDiploma,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onTap,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: screenWidth * 0.95,
                height: screenWidth * 0.5,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customIcon,
                      const SizedBox(width: 4),
                      textOrIcon,
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Text(
                    titleOfDiploma,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    descriptionOfDiploma,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
