import 'package:flutter/material.dart';

import '../../../core/utils/assets_path.dart';
class MovieHomePage extends StatefulWidget {
  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  final categories = ['All', 'Action', 'Drama', 'Horror'];
  String selectedCategory = 'All';

  final Map<String, List<Map<String, String>>> categoryMovies = {
    'All': [
      {'title': 'Wreck It Ralph 2', 'image': AssetsPath.socialSharingImage},
      {'title': 'Frozen II', 'image': AssetsPath.tvImage1},
      {'title': 'Avengers', 'image': AssetsPath.socialSharingImage},
    ],
    'Action': [
      {'title': 'Avengers', 'image': AssetsPath.socialSharingImage},
    ],
    'Drama': [
      {'title': 'Frozen II', 'image': AssetsPath.tvImage1},
    ],
    'Horror': [
      {'title': 'Wreck It Ralph 2', 'image': AssetsPath.socialSharingImage},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final movies = categoryMovies[selectedCategory] ?? [];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Find Your Best\nMovie',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Search bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search movie',
                      filled: true,
                      fillColor: Color(0xFF1E293B),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.tune),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Categories
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = category == selectedCategory;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            /// Now Playing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$selectedCategory Movies", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("view all", style: TextStyle(color: Colors.blueAccent)),
              ],
            ),
            const SizedBox(height: 15),

            /// Movie Cards
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return movieCard(movie['title']!, movie['image']!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget movieCard(String title, String imagePath) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('New', style: TextStyle(fontSize: 10, color: Colors.white)),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(Icons.star, size: 12, color: Colors.amber),
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