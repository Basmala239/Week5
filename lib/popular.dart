
import 'package:flutter/material.dart';
import 'package:week5/details.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<FoodModel>list=[
    FoodModel('Pakistan Food', 'Foodbase', 'assets/images/pakistan.png', 24, 4.8, 12, 99),
    FoodModel('Pieces Chicken', '', 'assets/images/piecesChicken.png', 12,0, 8,88 ),
    FoodModel('Shrimp Pasta', '', 'assets/images/ShrimpPasta.png', 14,0 , 10, 40),
    FoodModel('Vegetarian Noodles', '', 'assets/images/noodles.png', 22, 0, 23, 40),
    FoodModel('Shrimp Pasta', '', 'assets/images/ShrimpPasta.png', 14,0 , 10, 40),
    FoodModel('Vegetarian Menu', 'Food', 'assets/images/Vegetarian.png', 24, 4.8, 12, 99),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title:const Text('Back'),
      ),
        body:  SingleChildScrollView(
          child:
         Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'what would you like to order',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search your food..',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Most Popular',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700
                ),),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                ),
                
                itemCount: list.length, 
                itemBuilder: (context, index)=>foodWidget1(
                        list[index].name,
                        list[index].discription,
                        list[index].imagePath,
                        list[index].time,
                        list[index].rate,
                        list[index].price,
                        list[index].fractions,
                         () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Details()),
                          );
                        },
                ))
                     
              ],
            ))));

  }
}
class FoodModel{
  String name;
  String discription;
  String imagePath;
  int time;
  double price;
  double fractions;
  double rate;
  FoodModel(this.name,this.discription,this.imagePath,this.time,this.rate,this.price,this.fractions);
}
Widget foodWidget1(String name,String discription,String path,int time,double rate,double price,double fractions, Function details){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(10)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        TextButton(onPressed: (){
          details();
        }, child:  Text(name
        ,style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black
        ),)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(discription,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey
            ),),
            const Icon(Icons.favorite),
          ],
          
        ),
        Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(path), fit: BoxFit.cover),
                ),
              ),
        const SizedBox(height: 15,),
        Row(children: [
          Text('$time min . ',
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey
            ),),
          const Icon(Icons.star,size: 15,),
          Text(' $rate',
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey
            ),),
        ],),
        const SizedBox(height: 15,),
        Row(
          children: [
            Text('\$$price'
            ,style:const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700
            ),),
            Text('.$fractions',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey
            ),
            ),
            const SizedBox(width: 20,),
            IconButton(onPressed: (){
              details();
            }, icon:const  Icon(Icons.shopping_cart,color: Colors.white,),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),)
          ],
        )
      ]),
    ),
  );
}
Widget foodWidget2(String path,int time,String name,double price,double fractions, Function details){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(10)
    ),
    child: Column(
      children: [
        Row(
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
            Text('$time min . ',
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.grey
          ),),
          ],
        ),
        TextButton(onPressed: (){
        details();
      }, child:  Text(name
      ,style:const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700
      ),)),
      const SizedBox(width: 20,),
          IconButton(onPressed: (){
            details();
          }, icon:const  Icon(Icons.shopping_cart,color: Colors.white,),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),)
    ]),
  );
}