import 'package:e_commerce/Model/model.dart';
import 'package:e_commerce/Model/model2.dart';
import 'package:e_commerce/detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageUi extends StatefulWidget {
  const HomepageUi({ Key? key }) : super(key: key);

  @override
  State<HomepageUi> createState() => _HomepageUiState();
}

class _HomepageUiState extends State<HomepageUi> {
 
  bool bl=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,shadowColor: Colors.blueAccent,
        backgroundColor: Colors.black38.withOpacity(.3),
        leading: Icon(Icons.menu,color: Colors.black,),
        title: Text("Gadget Seekers",style:  GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 22,color: Color.fromARGB(255, 124, 44, 70)),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:15.0),
            child: Icon(Icons.search,color: Colors.black,),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(left:12.0),
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          

               SizedBox(
                height: 5,
              ),
        
        
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Text("Hi-Fi Shop & Service",style: GoogleFonts.abrilFatface(fontSize: 20),),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Text("Audio Shop on Rustaveli Ave 57.",style: GoogleFonts.roboto(color: Colors.black45,fontSize: 12),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Text("This Shop Offers Both Products and services",style: GoogleFonts.roboto(color: Colors.black45,fontSize: 12),),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(left:12.0),
                       child: Text("Products 41",style:  GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromARGB(211, 25, 56, 230)),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right:12.0),
                       child: Text("Show All",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromARGB(211, 25, 56, 230)),),
                     ),
                  ],
                ),
              ),
       SizedBox(
                height: 5,
              ),

               Container(
            
            height: 220,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
            child: ListView.builder(
             
              scrollDirection: Axis.horizontal,
              itemCount: myList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Deatil_P(
                              name: myList[index].name,
                              status: myList[index].status,
                                  price: myList[index].price,
                                  details: myList[index].details,
                                  img: myList[index].img,
                                  model: myList[index],
                              
                            )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromARGB(218, 240, 236, 178),
                           image: DecorationImage(image: NetworkImage("${myList[index].img}"), fit: BoxFit.contain)),
                          height: 130,
                          width: 180,
                         
                          ),
                          SizedBox(height: 6,),
                          Text("${myList[index].name}",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 13,color: Color.fromARGB(248, 39, 30, 61)),),
                      
                          
                          Text(myList[index].status==bl ? "◉ Avialable": "◉ Unaviable", style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 12,
                            color: (bl==myList[index].status? Colors.green:Colors.red)
                          ),),
                          Text("\$${myList[index].price}",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromARGB(255, 138, 91, 103)))
                      ],
                    ),
                  )
                );
              },
            ),
          ),

             Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(left:12.0),
                       child: Text("Accessories ",style:  GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromARGB(211, 25, 56, 230)),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right:12.0),
                       child: Text("Show All",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromARGB(211, 25, 56, 230)),),
                     ),
                  ],
                ),
              ),
       

          
            Container(
            
            height: 220,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
            child: ListView.builder(
             
              scrollDirection: Axis.horizontal,
              itemCount: myList2.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Deatil_P(
                              name: myList2[index].name,
                                  status: myList2[index].status,
                                  price: myList2[index].price,
                                  details: myList2[index].details,
                                  img: myList2[index].img,
                                  model2: myList2[index],
                              
                            )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromARGB(218, 240, 236, 178),
                           image: DecorationImage(image: NetworkImage("${myList2[index].img}"), fit: BoxFit.fill)),
                          height: 130,
                          width: 180,
                         
                          ),
                          SizedBox(height: 6,),
                          Text("${myList2[index].name}",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 13,color: Color.fromARGB(248, 39, 30, 61)),),
                      
                          
                          Text(myList2[index].status==bl ? "◉ Avialable": "◉ Unaviable", style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 12,
                            color: (bl==myList2[index].status? Colors.green:Colors.red)
                          ),),
                          Text("\$${myList2[index].price}",style: GoogleFonts.merriweather(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromARGB(255, 138, 91, 103)))
                      ],
                    ),
                  )
                );
              },
            ),
          ),
          
            ],
          ),
        ),
      ),
      
    );
  }
}

avaiable()
 {
   return Text("Availale",style: TextStyle(color: Color.fromARGB(255, 7, 114, 3),fontWeight: FontWeight.bold));
}


unAvaiable()
 {
   return Text("Availale",style: TextStyle(color: Color.fromARGB(255, 7, 114, 3),fontWeight: FontWeight.bold));
}