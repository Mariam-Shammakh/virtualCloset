
import 'package:flutter/material.dart';

import '../model/item.dart';
import '../shared/appbar.dart';
import '../shared/colors.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  Item product;
  Details({required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // const Details({Key? key}) : super(key: key);
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ProductsAndPrice()

          ],
          backgroundColor: appbarGreen,
          title:const Text("Details screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.product.imgPath),
              
             const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding:const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 129, 129),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child:const Text(
                        "New",
                        style: TextStyle(fontSize: 15),
                      ),
                      ),
                 const SizedBox(
                    width: 8,
                  ),
                 const Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                    ],
                  ),
                 const SizedBox(
                    width: 66,
                  ),
                  Row(
                    children: [
                     const Icon(
                        Icons.edit_location,
                        size: 26,
                        color: Color.fromARGB(168, 3, 65, 27),
                        // color: Color.fromARGB(255, 186, 30, 30),
                      ),
                     const SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.product.location,
                        style:const TextStyle(fontSize: 19),
                      ),
                    ],
                  )
                ],
              ),
            const  SizedBox(
                height: 16,
              ),
             const SizedBox(
                width: double.infinity,
                child: Text(
                  "Details : ",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.start,
                ),
              ),
            const SizedBox(
                height: 16,
              ),
              Text(
                "A Clothes, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). The biological function of a flower is to facilitate reproduction, usually by providing a mechanism for the union of sperm with eggs. Flowers may facilitate outcrossing (fusion of sperm and eggs from different individuals in a population) resulting from cross-pollination or allow selfing (fusion of sperm and egg from the same flower) when self-pollination occurs.",
                style:const TextStyle(
                  fontSize: 18,
                ),
                maxLines: isShowMore ? 3 : null,
                overflow: TextOverflow.fade,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isShowMore = !isShowMore;
                    });
                  },
                  child: Text(
                    isShowMore ? "Show more" : "Show less",
                    style:const TextStyle(
                      fontSize: 18,
                    ),
                  ))
            ],
          ),
        ));
  }
}