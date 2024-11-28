
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../provider/cart.dart';
// import '../shared/appbar.dart';
// import '../shared/colors.dart';

// class CheckOut extends StatelessWidget {
//   const CheckOut({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final carttt = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appbarGreen,
//         title: Text("Favorite"),
//         actions: [ProductsAndPrice()],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SingleChildScrollView(
//               child: SizedBox(
//                 height: 550,
//                 child: ListView.builder(
//                     padding: const EdgeInsets.all(8),
//                     itemCount: carttt.selectedProducts.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Card(
//                         child: ListTile(
//                           title: Text(carttt.selectedProducts[index].name),
//                           // subtitle: Text(
//                           //     "${carttt.selectedProducts[index].price} - ${carttt.selectedProducts[index].location}"),
//                           leading: CircleAvatar(
//                             backgroundImage: AssetImage(
//                                 carttt.selectedProducts[index].imgPath),
//                           ),
//                           trailing: IconButton(
//                               onPressed: () {
//                                 carttt.delete(carttt.selectedProducts[index]);
//                               },
//                               icon: Icon(Icons.delete_forever_outlined)),
//                         ),
//                       );
//                     }),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               style: ButtonStyle(
//                 backgroundColor: WidgetStateProperty.all(BTNpink),
//                 padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
//                 shape: WidgetStateProperty.all(RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8))),
//               ),
//               child: Text(
//                 "go to home",
//                 style: TextStyle(fontSize: 19),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../shared/appbar.dart';
import '../shared/colors.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("Favorite"),
        actions: [ProductsAndPrice()],
      ),
      body: carttt.selectedProducts.isEmpty
          ? const Center(
              child: Text(
                "No favorite items yet!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: carttt.selectedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                final item = carttt.selectedProducts[index];
                return Card(
                  child: ListTile(
                    title: Text(item.name),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(item.imgPath),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_forever_outlined),
                      onPressed: () {
                        carttt.delete(item);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
