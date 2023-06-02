import 'package:exam03/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<UIappProvider>(context, listen: false).getUiappData();
    super.initState();
  }


  Widget build(BuildContext context) {
    final categories = Provider.of<UIappProvider>(context);
    return Scaffold(

        //  body:ListView.builder(
        //   itemCount: categories.categoryList.length,
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) {
        //     return Container(
        //       child: Text(
        //           "${categories.categoryList[index].downloadUrl!}"),
        //     );
        //   }),

        body: GridView.builder(
                itemCount: _userModel!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      height: 150,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.network(
                              _userModel![index].downloadUrl.toString(),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              bottom: 5,
                              left: 10,
                              child: Text(
                                _userModel![index].author.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
    );
  }
}