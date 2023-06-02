class Model {
  String? img;
  String? name;
  double? price;
  bool ? status;
  String? details;

  Model({this.details, this.price, this.img, this.name,this.status});
}

List<Model> myList = [
  Model(
      status: true,
      details:"Good",
      price: 190.00,
      img:
          "https://pngimg.com/uploads/headphones/headphones_PNG101933.png",
      name: "HAVIT HV-H2178D 3.5mm \nWired Headphone"),
  Model(
      status: false,
      details: "Best",
      price: 200.00,
      img:
          "https://pngimg.com/uploads/headphones/headphones_PNG101976.png",
      name: "Havit H2168d 3.5mm USB \nGaming headphone"),

   Model(
      status: true,
      details:"Better",
      price: 210.00,
      img:
          "https://pngimg.com/uploads/headphones/headphones_PNG7651.png",
      name: "HAVIT HV-H2178D 3.5mm \nWired Headphone"),
  Model(
      status: true,
      details: "Best",
      price: 250.00,
      img:
          "https://pngimg.com/uploads/headphones/headphones_PNG101983.png",
      name: "Havit H2168d 3.5mm USB \nGaming headphone"),
  
   Model(
      status: false,
      details:"Good",
      price: 300.00,
      img:
          "https://pngimg.com/uploads/headphones/headphones_PNG101966.png",
      name: "HAVIT HV-H2178D 3.5mm \nWired Headphone"),
  Model(
      status: true,
      details: "Very good",
      price: 320.00,
      img:
          "https://pngimg.com/uploads/headphones/headphones_PNG101947.png",
      name: "Havit H2168d 3.5mm USB \nGaming headphone"),
  
];
