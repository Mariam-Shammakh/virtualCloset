class Item {
  String imgPath;
  String Category;
  String location;
  String name;

  Item({required this.imgPath, required this.name,  this.location = "Main branch",required this.Category});
}


final List<Item> items = [
  Item(name: "product1", imgPath: "assets/img/D1.jpg", location: " shop",Category: "dress"),
  Item(name: "product2", imgPath: "assets/img/D2.jpg",Category: "dress"),
    Item(name: "product2", imgPath: "assets/img/D1.jpg",Category: "dress"),
      Item(name: "product2", imgPath: "assets/img/D3.jpg",Category: "dress"),
        Item(name: "product2", imgPath: "assets/img/D4.jpg",Category: "dress"),
          Item(name: "product2", imgPath: "assets/img/D8.jpg",Category: "dress"),
            Item(name: "product2", imgPath: "assets/img/D6.jpg",Category: "dress"),
              Item(name: "product2", imgPath: "assets/img/D7.jpg",Category: "dress"),

  Item(name: "product3", imgPath: "assets/img/g1.jpg",Category: "lower clothes"),
   Item(name: "product3", imgPath: "assets/img/g2.jpg",Category: "lower clothes"),
    Item(name: "product3", imgPath: "assets/img/g3.jpg",Category: "lower clothes"),
     Item(name: "product3", imgPath: "assets/img/g4.jpg",Category: "lower clothes"),
      Item(name: "product3", imgPath: "assets/img/g5.jpg",Category: "lower clothes"),
       Item(name: "product3", imgPath: "assets/img/g6.jpg",Category: "lower clothes"),
        Item(name: "product3", imgPath: "assets/img/g7.jpg",Category: "lower clothes"),
         Item(name: "product3", imgPath: "assets/img/g8.jpg",Category: "lower clothes"),
         
  Item(name: "product4", imgPath: "assets/img/s1.jpg",Category: "shoes"),
   Item(name: "product4", imgPath: "assets/img/s2.jpg",Category: "shoes"),
    Item(name: "product4", imgPath: "assets/img/s3.jpg",Category: "shoes"),
     Item(name: "product4", imgPath: "assets/img/s4.jpg",Category: "shoes"),
      Item(name: "product4", imgPath: "assets/img/s5.jpg",Category: "shoes"),
       Item(name: "product4", imgPath: "assets/img/s6.jpg",Category: "shoes"),
        Item(name: "product4", imgPath: "assets/img/s7.jpg",Category: "shoes"),
         Item(name: "product4", imgPath: "assets/img/s8.jpg",Category: "shoes"),
         
  Item(name: "product5", imgPath: "assets/img/D5.jpg",Category: "dress"),
   Item(name: "product7", imgPath: "assets/img/t1.jpg",Category: "top clothes"),
    Item(name: "product7", imgPath: "assets/img/t2.jpg",Category: "top clothes"),
     Item(name: "product7", imgPath: "assets/img/t3.jpg",Category: "top clothes"),
      Item(name: "product7", imgPath: "assets/img/t4.jpg",Category: "top clothes"),
       Item(name: "product7", imgPath: "assets/img/t5.jpg",Category: "top clothes"),
  Item(name: "product7", imgPath: "assets/img/t6.jpg",Category: "top clothes"),
   Item(name: "product7", imgPath: "assets/img/t7.jpg",Category: "top clothes"),
  Item(name: "product8", imgPath: "assets/img/t8.jpg",Category: "top clothes"),
];