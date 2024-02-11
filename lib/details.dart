import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int cnt=0;
  @override
  Widget build(BuildContext context) {
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
          'Details',
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/images/ShrimpPasta.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,),
            ),
            const SizedBox(height: 30,),
            const Row(
              children: [
                Icon(Icons.watch_later,size: 15,),
                Text(' 24min',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),),
                SizedBox(width: 10,),
                Icon(Icons.star,size: 15,),
                Text(' 4,5',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),),
                SizedBox(width: 10,),
                Icon(Icons.local_fire_department,size: 15,),
                Text(' 348Kcal',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),),
        
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.grey
                   ), 
                    borderRadius:const  BorderRadius.all(
                      Radius.circular(10),
                    ),
        
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('Small',style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                   border: Border.all(
                    width: 1
                   ), 
                    borderRadius:const  BorderRadius.all(
                      Radius.circular(10),
                    ),
        
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('Medium',style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.grey
                   ), 
                    borderRadius:const  BorderRadius.all(
                      Radius.circular(10),
                    ),
        
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('Large',style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Text('Shrimo Pasta',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24
                ),),
                const Spacer(),
                TextButton(onPressed: (){
                  setState(() {
                    cnt>0?cnt--:cnt;
                  });
                }, child:const Text('--',
                style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  color: Colors.black
                ),),),
                Text("  $cnt  "),
                TextButton(onPressed: (){
                  setState(() {
                    cnt++;
                  });
                }, child:const Text('+',
                style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  color: Colors.black
                ),),),

              ],
            ),
            const SizedBox(height: 20,),
            const Text('Ingradients',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.grey
                   ), 
                    borderRadius:const  BorderRadius.all(
                      Radius.circular(10),
                    ),
        
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('Black Pasta')
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.grey
                   ), 
                    borderRadius:const  BorderRadius.all(
                      Radius.circular(10),
                    ),
        
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('Black Pasta')
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.grey
                   ), 
                    borderRadius:const  BorderRadius.all(
                      Radius.circular(10),
                    ),
        
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('Black Pasta')
                  ),
                )
              ],

            ),
            const SizedBox(height: 20,),
            const Expanded(child:Text('About',
            style: TextStyle(
              color: Colors.grey
            ),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('\$10.49',style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      child: const Text('Add to cart',style: TextStyle(color: Colors.white),),
                     ),
                )
              ],
            )
          ],
        ),
      ),
      ));
  }
}
