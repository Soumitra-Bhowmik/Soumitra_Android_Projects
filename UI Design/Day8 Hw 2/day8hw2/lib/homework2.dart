import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiDesign extends StatefulWidget {
  const UiDesign({ Key? key }) : super(key: key);

  @override
  State<UiDesign> createState() => _UiDesignState();
}

class _UiDesignState extends State<UiDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Color.fromARGB(255, 84, 198, 226),
        leading: Icon(Icons.arrow_back_ios,size: 20,color: Color.fromARGB(255, 11, 10, 12),),
        title: Text("VogiJogi  Cafe",style: GoogleFonts.abrilFatface(fontSize: 23,color: Colors.red), ),
        actions: [
          SizedBox( width: 40,
            child: Icon(Icons.more_vert,size: 20,color: Color.fromARGB(255, 11, 10, 12),)),
        ],
        ),

        body: Stack(
          children: 
            [SingleChildScrollView(
              child: Column(
                children: [
                 // Image.asset('asset/food.jpg')
                 Padding(
                   padding: const EdgeInsets.only(left: 10,right: 10),
                   child: Image.network("https://media.istockphoto.com/photos/bowl-of-corkscrew-penne-pasta-primavera-fusilli-picture-id187312335?k=20&m=187312335&s=612x612&w=0&h=eiUrdEZHzgb4e1zhcjbHOVrm6hb7XURNDmU_VexN9yA=",
                   fit: BoxFit.cover,width: double.infinity,height: 200,),
                 ),
                 
                 Container(height: 150,width: 480, 
                   decoration: BoxDecoration(color: Color.fromARGB(240, 228, 227, 240),borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 148, 147, 147).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],),
              child:ListTile( 
                 subtitle: Text("4 Decilious Food",style: GoogleFonts.abrilFatface(fontSize: 20,color: Color.fromARGB(255, 73, 69, 69))),
                   title: Text("Eat Healthy...", style: GoogleFonts.abrilFatface(fontSize: 12,color: Color.fromARGB(255, 65, 61, 61))) ,
                 ),
                 
                 ),
                 SizedBox(
                   height: 25,
                 ),
                  Padding(
                   padding: const EdgeInsets.only(left: 10,right: 10),
                   child: Image.network("https://media.istockphoto.com/photos/bowl-of-corkscrew-penne-pasta-primavera-fusilli-picture-id187312335?k=20&m=187312335&s=612x612&w=0&h=eiUrdEZHzgb4e1zhcjbHOVrm6hb7XURNDmU_VexN9yA=",
                   fit: BoxFit.cover,width: double.infinity,height: 200,),
                 ),
                ],
              ),
            ),
          Positioned(top: 270,left: 25,
            child: Text("Hey, Whats Up Do you Need Anything Special! Then press those button for \nfurthur action.",style: GoogleFonts.abrilFatface(fontSize: 12,color: Color.fromARGB(255, 14, 13, 13)))),
          Positioned(top: 225,right: 40,
            child: CircleAvatar(
                  radius: 22,
                 backgroundImage: NetworkImage("https://images.unsplash.com/photo-1583864697784-a0efc8379f70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80",
                  ),
                ), 
                
          ),
          Positioned(bottom: 230,left: 60,
            child: ElevatedButton(onPressed: (){}, child: Text("View"))),
            Positioned(bottom: 230,left: 150,
              child: ElevatedButton(onPressed: (){}, child: Text("Learn"))),
          
          ],
        ),
    );
  }
}