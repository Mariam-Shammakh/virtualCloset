class Sitem {
  String imgPath;
  double price;
  String location;
  String name;

  Sitem({required this.imgPath, required this.name, required this.price, this.location = "Main branch"});
}

final List<Sitem> Sitems = [
  Sitem(name: "product1", price: 12.99, imgPath: "assets/img/D1.jpg", location: "Ali shop"),
  Sitem(name: "product2", price: 12.99, imgPath: "assets/img/D2.jpg"),
  Sitem(name: "product3", price: 12.99, imgPath: "assets/img/D3.jpg"),
  Sitem(name: "product4", price: 12.99, imgPath: "assets/img/D4.jpg"),
  Sitem(name: "product5", price: 12.99, imgPath: "assets/img/D5.jpg"),
  Sitem(name: "product6", price: 12.99, imgPath: "assets/img/D6.jpg"),
  Sitem(name: "product7", price: 12.99, imgPath: "assets/img/D7.jpg"),
  Sitem(name: "product8", price: 12.99, imgPath: "assets/img/D8.jpg"),
];