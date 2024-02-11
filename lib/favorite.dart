import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

List<FavoriteModel> favoriteList = [
  FavoriteModel(
      'The Breakfast Club', 'assets/images/Breakfast.png', '1.4 km', 4.7, 1.7, 2.00),
  FavoriteModel(
      "Custard’s Last Stand", 'assets/images/Custard.png', '1.6 km', 4.6, 1.5, 2.50),
  FavoriteModel(
      'Planet of the Salad', 'assets/images/planetSalad.png', '800 m', 4.9, 2.3, 2.00),
  FavoriteModel(
      'Lord of the Wings', 'assets/images/LordWings.png', '1.2 km', 4.5, 1.9, 1.50),
];

class _FavoriteState extends State<Favorite> {
  @override
   build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
                  icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
                  ),
                  onPressed: () {
        Navigator.pop(context);
                  },
                ),
        title: const Text(
          'Favorite list',
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body:ListView.builder(
        itemCount:favoriteList.length ,
        itemBuilder: (context, index) => favoriteWidget(
          favoriteList[index].imagePath,
          favoriteList[index].title,
          favoriteList[index].distance,
          favoriteList[index].rate,
          favoriteList[index].ordered,
          favoriteList[index].price,
           () {
                    setState(() {
                      favoriteList.removeAt(index);
                    });
                   }))
        
      ))
    
    ;
  }
}

class FavoriteModel {
  String imagePath;
  String title;
  String distance;
  double rate;
  double ordered;
  double price;
  FavoriteModel(this.title, this.imagePath, this.distance, this.rate,
      this.ordered, this.price);
}

Widget favoriteWidget(String path,String title,String distance,double rate,double ordered,double price, Function removeFav) {
  return Padding(
      padding: const EdgeInsets.all(18),
      child:  Row(
        children: [
          Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(path), fit: BoxFit.cover),
                ),
              ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Text(distance,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),),
                  const VerticalDivider(
                    color: Color(0xffa5a5a5),
                    thickness: 0.5,
                  ),
                   Container(
                    width: 1,
                    height: 12,
                    color: Colors.grey,
                    ),
                    const SizedBox(width: 10,),
                  const Icon(Icons.star,size: 15,),
                  Text('  $rate  ',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),),
                  Text('(${ordered}K)',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.delivery_dining),
                  Text('\$$price',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),),
                  
                  const SizedBox(width: 90,),
                  IconButton(
                    icon: const Icon(Icons.favorite,color: Colors.black,),
                    onPressed: () {
                      removeFav();
                    },
                  ),
                ],
              )
            ],
          )
        ],
      )
      )
      ;
}
