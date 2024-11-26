import 'package:fashion/pages/Logo.dart';
import 'package:fashion/pages/closet_selection.dart';
import 'package:fashion/pages/edit_profile.dart';
import 'package:flutter/material.dart';

import '../shared/appbar.dart';
import '../shared/colors.dart';
import 'DisplayD.dart';
import 'checkout.dart';
import 'search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          ProductsAndPrice()
        ],
        backgroundColor: appbarGreen,
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/2.jpg"),
                        fit: BoxFit.cover),
                  ),
                  currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("assets/img/1.jpg")),
                  accountEmail: Text(
                    "maria@61.com",
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 5, 5),
                    ),
                  ),
                  accountName: Text("Maria Zaid",
                      style: TextStyle(
                        color: Color.fromARGB(255, 9, 5, 5),
                      )),
                ),
                ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.person),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }),
                ListTile(
                    title: const Text("My Favorite"),
                    leading: const Icon(Icons.favorite),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckOut(),
                        ),
                      );
                    }),
                ListTile(
                    title: const Text("My Closet"),
                    leading: const Icon(Icons.next_week_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClosetSelectionPage(),
                        ),
                      );
                    }),
                ListTile(
                  title: const Text("Change Accont"),
                  leading: const Icon(Icons.change_circle_outlined),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()));
                  },
                ),
                ListTile(
                    title: const Text("Logout"),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Logo(),
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Clip the child with rounded corners
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/img/2.jpg',
                        fit:
                            BoxFit.cover, // Makes the image cover the container
                        width: double
                            .infinity, // Ensures the image fills the container
                        height: double.infinity,
                      ),
                      Positioned(
                        bottom: 10, // Position text at the bottom
                        left: 10, // Add some padding from the left
                        child: Text(
                          'In Our Shop U can See A lot of  fashions\n also u can put your real clothes \n inside my closet :)', // Replace with your desired text
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 15, // Font size
                            fontWeight: FontWeight.normal, // Bold text
                            shadows: [
                              Shadow(
                                offset: Offset(2,
                                    2), // Slight shadow for better readability
                                color: Color.fromARGB(255, 61, 60, 60).withOpacity(0.7),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Categories:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayD(category: 'shoes')),
                      );
                    },
                    child: _CategoryItem(
                      imagePath: 'assets/img/6.jpg',
                      label: 'Shoes',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayD(category: 'dress')),
                      );
                    },
                    child: _CategoryItem(
                      imagePath: 'assets/img/1.jpg',
                      label: 'Dresses',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DisplayD(category: 'Top clothes')),
                      );
                    },
                    child: _CategoryItem(
                      imagePath: 'assets/img/7.jpg',
                      label: 'Top clothes',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DisplayD(category: 'Lower clothes')),
                      );
                    },
                    child: _CategoryItem(
                      imagePath: 'assets/img/3.jpg',
                      label: 'Lower clothes',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const _CategoryItem({
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 8.0),
        Text(label),
      ],
    );
  }
}
