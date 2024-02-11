import 'package:flutter/material.dart';
import 'package:week5/favorite.dart';
import 'package:week5/popular.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MenuModel>list=[
    MenuModel('Salad', 'assets/images/salad.png', const Color(0xFFEBF8E6)),
    MenuModel('Steak', 'assets/images/Steak.png', const Color(0xFFFFE8ED)),
    MenuModel('Chicken', 'assets/images/Chicken.png', const Color(0xFFE5EDFA)),
    MenuModel('Korean', 'assets/images/Korean.png', const Color(0xFFFFEFB6)),
    MenuModel('Pasta', 'assets/images/Pasta.png', const Color(0xFFC5C19C)),
    MenuModel('Rice', 'assets/images/Rice.png', const Color(0xFFFFBB76)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:
         Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
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
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(),
                    TextButton.icon(
                        onPressed: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Favorite()),
                          );
                        },
                        icon:const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        label:const Text(
                          'favorite',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0, // spacing between columns
                ),
                padding: const EdgeInsets.all(8.0), // padding around the grid
                itemCount: list.length, // total number of items
                itemBuilder: (context, index)=>menuWidget(
                  list[index].type,
                  list[index].imagePath,
                  list[index].color,(){
                    Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Popular()),
                          );
                  }) ,
                ),
              ],
            ))));
  }
}

class MenuModel{
  String type;
  String imagePath;
  Color color;
  MenuModel(this.type,this.imagePath,this.color);
}
Widget menuWidget(String type,String path,Color mColor, Function mView){
  return Container(
    width: 100,
    height: 100,
color: mColor, // color of grid items
child: Column(
  children: [
    TextButton(onPressed:(){
      mView();
    }, child: 
    Text(type,
    style:const  TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700
    ),),),
    Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(path), fit: BoxFit.cover),
                ),
              ),
  ],
)
);
}