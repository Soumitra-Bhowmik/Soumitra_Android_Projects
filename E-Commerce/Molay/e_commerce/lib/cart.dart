
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart_Add extends StatefulWidget {
   Cart_Add({ Key? key,this.name,this.price,this.img }) : super(key: key);
 String? name;
 String ? img;
  double? price;
  @override
  State<Cart_Add> createState() => _Cart_AddState();
}

class _Cart_AddState extends State<Cart_Add> {
  int i=0;
  //double ? price= widget.price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
       
      ),
      

      body: 
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 10,), 
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text("My CART",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromARGB(248, 18, 1, 85)),),
            ),
             SizedBox(height: 20,), 
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black38),
                              height: 160,
                              width: 180,
                              child: Image.network("${widget.img}",)
                              ),
                ),
                
                        SizedBox(width: 10,),    
              Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(width: 15,),
                            Text("${widget.name}",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 13,color: Color.fromARGB(248, 17, 1, 1)),),
                            Text("\$${widget.price}",textAlign: TextAlign.start,),
                             Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              
               SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      i++;
                    });
                  },
                  child: Icon(Icons.add)),
              SizedBox(
                width: 10,
              ),
              Text("$i"),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (i > 0) i--;
                    });
                  },
                  child: Icon(Icons.remove))
            ]),
                ],
              )
                           
              ],
            ),
            SizedBox(height: 10,),
              SizedBox(height: 10,), 
           
           Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text("Delivery Location",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromARGB(249, 3, 182, 42))),
  
            
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

            SizedBox(height: 10,), 
            Center(
              child: Container( height: 80,width: 150,
              decoration: BoxDecoration(color: Color.fromARGB(255, 2, 45, 71),borderRadius: BorderRadius.circular(25)),
                child: Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("TOTAL PRICE",textAlign: TextAlign.center,style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromARGB(248, 246, 1, 1)), ),
                     Text(" ${((widget.price)! * i)}",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromARGB(248, 255, 255, 255)),)
                  ],
                )),
              ),
            ),
            Center(
              child: ElevatedButton.icon(  
              
                onPressed: (){
              
                showDialog(barrierColor: Colors.yellow,
                                  context: context,
                                   builder: (_) => AlertDialog(
                                     content: Image.network("${widget.img}",fit: BoxFit.contain,),
                                    actions: [
                                      FlatButton(height: 50, minWidth: 100,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                        onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Icon(Icons.close_outlined,color: Colors.red,size: 25,)),
                                      Text("\$${((widget.price)! * i)}\nOrder Successful",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromARGB(248, 72, 1, 1)),)
                                    ],
                                                             ),        
                                   ); 
              }, icon:Icon(Icons.money), label: Text("ORDER NOW")),
            )
          
          ],
        ),
      ),
     
    );
  }
}
//((widget.mylist3)*100).round() 