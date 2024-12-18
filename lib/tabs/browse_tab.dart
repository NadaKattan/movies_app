import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/category/movies_list.dart';
import '../category/category_item.dart';
import '../category/category_model.dart';

class BrowseTab extends StatefulWidget {
  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(id: 28, imageName: 'assets/images/action.jpg', name: 'Action'),
      CategoryModel(id: 12, imageName: 'assets/images/adventure.jpg', name: 'Adventure'),
      CategoryModel(id: 16, imageName: 'assets/images/animation.jpg', name: 'Animation'),
      CategoryModel(id: 35, imageName: 'assets/images/comedy.jpg', name: 'Comedy'),
      CategoryModel(id: 80, imageName: 'assets/images/crime.jpg', name: 'Crime'),
      CategoryModel(id: 99, imageName: 'assets/images/documentary.jpg', name: 'Documentary'),
      CategoryModel(id: 18, imageName: 'assets/images/drama.jpg', name: 'Drama'),
      CategoryModel(id: 10751, imageName: 'assets/images/family.jpg', name: 'Family'),
      CategoryModel(id: 14, imageName: 'assets/images/fantasy.png', name: 'Fantasy'),
      CategoryModel(id: 36, imageName: 'assets/images/history.jpg', name: 'History'),
      CategoryModel(id: 27, imageName: 'assets/images/horror.jpg', name: 'Horror'),
      CategoryModel(id: 10402, imageName: 'assets/images/music.jpg', name: 'Music'),
      CategoryModel(id: 9648, imageName: 'assets/images/mystery.png', name: 'Mystery'),
      CategoryModel(id: 10749, imageName: 'assets/images/romance.jpg', name: 'Romance'),
      CategoryModel(id: 878, imageName: 'assets/images/sci.jpg', name: 'Sci-Fi'),
      CategoryModel(id: 10770, imageName: 'assets/images/tv.jpg', name: 'TV Movies'),
      CategoryModel(id: 53, imageName: 'assets/images/thriller.jpg', name: 'Thriller'),
      CategoryModel(id: 10752, imageName: 'assets/images/war.jpg', name: 'War'),
      CategoryModel(id: 37, imageName: 'assets/images/western.jpg', name: 'Western'),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        margin: EdgeInsets.only(top: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Browse Categories',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    onCategorySelected(categories[index]);
                  },
                  child: CategoryItem(
                    category: categories[index],
                    index: index,
                  ),
                ),
                itemCount: categories.length, // Updated the item count
              ),
            ),
          ],
        ),
      ),
    );
}

  onCategorySelected(CategoryModel category){
    selectedCategory = category; // Update the selected category
    Navigator.pushNamed(context, MoviesList.routeName, arguments: selectedCategory);
    setState(() {});
  }
}
