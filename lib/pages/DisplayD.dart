import 'package:fashion/pages/Login.dart';
import 'package:fashion/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/item.dart';
import '../provider/cart.dart';
import '../shared/appbar.dart';
import '../shared/colors.dart';
import 'Home.dart';
import 'checkout.dart';
import 'closet_selection.dart';
import 'details_screen.dart';

class DisplayD extends StatelessWidget {
  final String category;
  DisplayD({required this.category});

  @override
  Widget build(BuildContext context) {
    final filteredItems = items
        .where((item) => item.Category.toLowerCase() == category.toLowerCase())
        .toList();
    
    return Scaffold(
      appBar: AppBar(
        actions: [ProductsAndPrice()],
        backgroundColor: appbarGreen,
        title: Text("Display $category"),
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
                        image: AssetImage("assets/img/1.jpg"),
                        fit: BoxFit.cover),
                  ),
                  currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("assets/img/2.jpg")),
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
                    title: Text("Profile"),
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
                    title: Text("My Favorite"),
                    leading: Icon(Icons.favorite),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckOut(),
                        ),
                      );
                    }),
                ListTile(
                    title: Text("New"),
                    leading: Icon(Icons.next_week_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClosetSelectionPage(),
                        ),
                      );
                    }),
                ListTile(
                    title: Text("Change Accont"),
                    leading: Icon(Icons.change_circle_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilePage(),
                        ),
                      );
                    }),
                ListTile(
                    title: const Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: filteredItems.isEmpty
            ? Center(
                child: Text(
                  "No items found for $category",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 33),
                itemCount: filteredItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = filteredItems[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(product: item),
                          ),
                        );
                      },
                      child: GridTile(
                        footer: SizedBox(
                          height: 2,
                          child: GridTileBar(
                            trailing: IconButton(
                                color: Color.fromARGB(255, 138, 134, 134),
                                onPressed: () {
                                  final carttt =
                                      Provider.of<Cart>(context, listen: false);
                                  carttt.add(item);
                                },
                                icon: const Icon(Icons.favorite_border_sharp)),
                            title: const Text(
                              "",
                            ),
                          ),
                        ),
                        child: Stack(children: [
                          Positioned(
                            top: -3,
                            bottom: -9,
                            right: 0,
                            left: 0,
                            child: SizedBox(
                              height: 100,
                              width: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item.imgPath,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
