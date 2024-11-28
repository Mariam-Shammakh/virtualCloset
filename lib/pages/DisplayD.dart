import 'package:fashion/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/item.dart';
import '../provider/cart.dart';
import '../provider/userpro.dart';
import '../shared/appbar.dart';
import '../shared/colors.dart';
import 'Home.dart';
import 'Logo.dart';
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
    final userProvider = Provider.of<UserProvider>(context);
    final userInfo = userProvider.userInfo;

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
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(124, 218, 197, 175),
                    Color.fromARGB(92, 236, 171, 93),
                    Color.fromARGB(103, 220, 144, 63),
                  ])),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: userInfo.image != null
                        ? FileImage(userInfo.image!)
                        : const AssetImage("assets/img/1.jpg") as ImageProvider,
                  ),
                  accountEmail: Text(
                    userInfo.email.isNotEmpty
                        ? userInfo.email
                        : "No email provided",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 9, 5, 5),
                    ),
                  ),
                  accountName: Text(
                      userInfo.username.isNotEmpty
                          ? userInfo.username
                          : "No username provided",
                      style: const TextStyle(
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
                  title: const Text("Change Account"),
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
                        footer: GridTileBar(
                          trailing: IconButton(
                            icon: Consumer<Cart>(
                              builder: (context, cart, _) {
                                return Icon(
                                  cart.isFavorite(item)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: cart.isFavorite(item)
                                      ? Colors.red
                                      : Colors.grey,
                                );
                              },
                            ),
                            onPressed: () {
                              Provider.of<Cart>(context, listen: false)
                                  .toggleFavorite(item);
                            },
                          ),
                          title: Text(item.name, textAlign: TextAlign.center),
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
