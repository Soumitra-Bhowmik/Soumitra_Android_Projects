class Mode2 {
  String? img;
  String? name;
  double? price;
  bool ? status;
  String? details;

  Mode2({this.details, this.price, this.img, this.name,this.status});
}

List<Mode2> myList2 = [
  Mode2(
      status: false,
      details:"Good",
      price: 70.00,
      img:
          "https://www.pngmart.com/files/15/Earphone-PNG-Picture.png",
      name: "Redmi 404XC 3.0mm \nWired Earphone"),
  Mode2(
      status: true,
      details: "Best",
      price: 90.00,
      img:
          "https://www.pngmart.com/files/15/Earphone-Transparent-PNG.png",
      name: "Lenovo Rx557C 3.5mm \nWireless Earphone"),

   Mode2(
      status: false,
      details:"Better",
      price: 210.00,
      img:
          "https://www.pngmart.com/files/7/Mobile-Earphone-PNG-Clipart.png",
      name: "YLC HV-H2178D 3.5mm \nWired Earphone"),
  Mode2(
      status: true,
      details: "Best",
      price: 250.00,
      img:
          "https://www.pngmart.com/files/7/Mobile-Earphone-PNG-File.png",
      name: "MCK MColor 3.5mm  \nGaming Earphone"),
  
   Mode2(
      status: false,
      details:"Good",
      price: 300.00,
      img:
          "https://www.pngmart.com/files/15/Earphone-PNG-File.png",
      name: "HAVIT HV-H2178D 3.5mm \nWired Headphone"),
  Mode2(
      status: true,
      details: "Very good",
      price: 320.00,
      img:
          "https://www.pngmart.com/files/7/Mobile-Earphone-PNG-Transparent-Image.png",
      name: "Havit H2168d 3.5mm USB \nGaming headphone"),
  
];
