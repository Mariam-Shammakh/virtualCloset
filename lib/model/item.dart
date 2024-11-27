class Item {
  String imgPath;
  String Category;
  String location;
  String name;

  Item({required this.imgPath, required this.name,  this.location = "Main branch",required this.Category});
}

// final List<Item> items = [
//   Item(name: "product1", imgPath: "assets/img/D1.jpg", location: "Ali shop",Category: "dress"),
//   Item(name: "product2", imgPath: "assets/img/D2.jpg",Category: "dress"),
//   Item(name: "product3", imgPath: "assets/img/D3.jpg",Category: "lower clothes"),
//   Item(name: "product4", imgPath: "assets/img/D4.jpg",Category: "shoes"),
//   Item(name: "product5", imgPath: "assets/img/D5.jpg",Category: "dress"),
//   Item(name: "product6", imgPath: "assets/img/D6.jpg",Category: "shoes"),
//   Item(name: "product7", imgPath: "assets/img/D7.jpg",Category: "top clothes"),
//   Item(name: "product8", imgPath: "assets/img/D8.jpg",Category: "top clothes"),
// ];
final List<Item> items = [
  Item(name: "product1", imgPath: "assets/img/D1.jpg", location: "Ali shop",Category: "dress"),
  Item(name: "product2", imgPath: "assets/img/D2.jpg",Category: "dress"),
  Item(name: "product3", imgPath: "assets/img/g3.jpg",Category: "lower clothes"),
  Item(name: "product4", imgPath: "assets/img/s4.jpg",Category: "shoes"),
  Item(name: "product5", imgPath: "assets/img/D5.jpg",Category: "dress"),
  Item(name: "product6", imgPath: "assets/img/s6.jpg",Category: "shoes"),
  Item(name: "product7", imgPath: "assets/img/t7.jpg",Category: "top clothes"),
  Item(name: "product8", imgPath: "assets/img/t8.jpg",Category: "top clothes"),
];