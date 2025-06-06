import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          // Replace with actual user profile picture
          backgroundImage: NetworkImage(
            'https://lh3.googleusercontent.com/ogw/AF2bZygM3j8GxfkrCgNixO2JATpOboCh1JXSxg5hwll5oTKWzA=s32-c-mo',
          ),
        ),
        centerTitle: true,
        title: Text(
          'DeepSeek Agent',
          style: TextStyle(color: Colors.blueAccent),
          textAlign: TextAlign.center,
        ),
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
          ),
        ],
      ),
      endDrawer: Drawer(
        // Add your drawer content here
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item tap
              },
            ),
            // Add more ListTiles for other menu items
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome $userName',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                // Replace with your ad images/widgets
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://bs-uploads.toptal.io/blackfish-uploads/components/blog_post_page/8251604/cover_image/regular_1708x683/Untitled-b91bdf8e478c7dbafa86afd20f3b519a.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://bs-uploads.toptal.io/blackfish-uploads/components/blog_post_page/8251604/cover_image/regular_1708x683/Untitled-b91bdf8e478c7dbafa86afd20f3b519a.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Add more ad items
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              padding: EdgeInsets.all(15.0),
              children: [
                CategoryItem(icon: Icons.calculate, text: 'Maths'),
                CategoryItem(icon: Icons.science, text: 'Science'),
                CategoryItem(icon: Icons.history, text: 'History'),
                CategoryItem(icon: Icons.sports, text: 'Sports'),
                CategoryItem(icon: Icons.movie, text: 'Entertainment'),
                CategoryItem(icon: Icons.article, text: 'News'),
                CategoryItem(icon: Icons.lightbulb, text: 'GK'),
                CategoryItem(icon: Icons.computer, text: 'Coding'),
                CategoryItem(icon: Icons.comment, text: 'Translation'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const CategoryItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          // navigate to chat page
          Navigator.pushNamed(context, '/chat');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40.0, color: Colors.blue),
            SizedBox(height: 8.0),
            Text(text, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
