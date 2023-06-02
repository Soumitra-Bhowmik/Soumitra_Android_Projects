// To parse this JSON data, do
//
//     final uimodel = uimodelFromJson(jsonString);

import 'dart:convert';

List<Uimodel> uimodelFromJson(String str) => List<Uimodel>.from(json.decode(str).map((x) => Uimodel.fromJson(x)));


class Uimodel {
    Uimodel({
        this.id,
        this.author,
        this.width,
        this.height,
        this.url,
        this.downloadUrl,
    });

    final String ?id;
    final String ?author;
    final int ?width;
    final int ?height;
    final String ?url;
    final String ?downloadUrl;

    factory Uimodel.fromJson(Map<String, dynamic> json) => Uimodel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    
}
