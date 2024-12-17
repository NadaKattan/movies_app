import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.category,
    required this.index,
  });

  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: [
            // Background image for each category
            Image.asset(
              category.imageName,
              fit: BoxFit.cover, // Changed to cover to better scale the image
              width: double.infinity, // Make sure it fills the container's width
              height: double.infinity, // Make sure it fills the container's height
            ),
            // Category name overlayed on top of the image
            Center(
              child: Text(
                category.name,
                style: TextStyle(
                  fontSize: 16, // Adjusted for better readability
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.6),
                      offset: Offset(1, 1),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
