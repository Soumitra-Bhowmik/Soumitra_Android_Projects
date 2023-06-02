import 'dart:math';

import 'package:e_commerce/Model/model.dart';
import 'package:e_commerce/Model/model2.dart';
import 'package:e_commerce/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Deatil_P extends StatefulWidget {
   Deatil_P({ Key? key,this.details,this.img,this.model,this.name,this.price,this.model2,this.status }) : super(key: key);

  String? img;
  String? name;
  double? price;
  String? details;
  Model? model;
  bool ?status;
  Mode2? model2;

  @override
  State<Deatil_P> createState() => _Deatil_PState();
}

class _Deatil_PState extends State<Deatil_P> {
  bool bl=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(onPressed: (){
      //     Navigator.pop(context);
      //   }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
       
      // ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: 
                [
                  
                  InkWell(
                    
                    child: Card(
                      shadowColor: Color.fromARGB(255, 21, 6, 241),
                      elevation: 8,
                      color: Color.fromARGB(255, 226, 209, 209),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.network("${widget.img}",fit: BoxFit.contain,width: double.infinity,height: 280,),
                    ),
                    onTap: (){
                      showDialog(
                              context: context,
                               builder: (_) => AlertDialog(
                                 content: Image.network("${widget.img}",fit: BoxFit.contain,),
                                actions: [
                                  FlatButton(height: 50,
                                   //color: Color.fromARGB(255, 167, 164, 164),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                    onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Icon(Icons.close_outlined,color: Colors.red,size: 25,))
                                ],
                                                         ),        
                               );       
                    },
                  ),
                Positioned(left: 10,top: 10,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Container(
                  child: Row(
                   
                    children: [
                       Padding(
                         padding: const EdgeInsets.only(left:12.0),
                         child: Icon(Icons.shopping_bag,color: Color.fromARGB(255, 29, 8, 223),),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left:12.0),
                         child: Text("Shopping",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromARGB(211, 25, 56, 230))),
                       ),
                      
                      
                    ],
                  ),
                ),
                  SizedBox(
              height: 10,
            ),
            Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Padding(
                         padding: const EdgeInsets.only(left:12.0),
                         child: Text("${widget.name}",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromARGB(249, 3, 182, 42))),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(right:12.0),
                         child: Icon(Icons.link,color: Colors.black,),
                       ),
                    ],
                  ),
                ),
                      SizedBox(
              height: 10,
            ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("Hi-Fi Shop & Service",),
                  Text("Audio Shop on Rustaveli Ave 57."),
                 
          
                      ],
                    ),
                  ),
                ),

          
           ListTile(
             leading: Icon(Icons.map),
            title: Text("Rustaveli Ave 57"),
            subtitle: Text("17-001,Batumi"),
            trailing:Icon(Icons.arrow_forward_ios) ,
          ),
            
           
           
           Divider(
          color: Color.fromARGB(255, 156, 152, 152),
          height: 20,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
         SizedBox(
              height: 5,
            ),

      ListTile(
            title: Text("\$${widget.price}",style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("Tax Rate 2%"),
             
          ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 245, 26, 6),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Cart_Add(
                                  name: widget.name,
                                  price: widget.price,
                                  img: widget.img,
                                )));
                  },
                  child: Text(
                    "ADD To Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                  )),
            )
          ],
        ),
      ),
    );
  }
}