/*import 'package:flower_app/model/item.dart';
import 'package:flower_app/model/Sitem.dart';
import 'package:flower_app/pages/checkout.dart';
import 'package:flower_app/pages/details_screen.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/shared/appbar.dart';
import 'package:flower_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DisplayD extends StatelessWidget {
  const DisplayD ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final carttt = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [

          ProductsAndPrice()
        ],
        backgroundColor: appbarGreen,
        title: Text("Display Shoes"),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(""),
                        fit: BoxFit.cover),
                  ),
                  currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("")),
                  accountEmail: Text("maria@61.com",style: TextStyle(color: Color.fromARGB(255, 9, 5, 5),),),
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
                          builder: (context) => DisplayD(),
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
                    onTap: () {}),
                ListTile(
                    title: Text("Change Accont"),
                    leading: Icon(Icons.change_circle_outlined),
                    onTap: () {}),
                ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {}),
              ],
            ),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 33),
            itemCount: Sitems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(product:Sitem[index]),
                    ),
                  );
                },
                child: GridTile(
                  child: Stack(children: [
                    Positioned(
                      top: -3,
                      bottom: -9,
                      right: 0,
                      left: 0,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(55),
                          child: Image.asset(Sitems[index].imgPath)),
                    ),
                  ]),

                  footer: GridTileBar(
                    trailing:

                    IconButton(
                        color: Color.fromARGB(103, 106, 64, 18),
                        onPressed: () {
                          carttt.add(Sitems[index] as Item);
                        },
                        icon: Icon(Icons.favorite)),



                  ),
                ),
              );
            }),

      ),


    );
  }
}*/