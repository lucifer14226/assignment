import 'package:flutter/material.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/view/home_view.dart';

class CategoryContainer extends StatelessWidget {
  final String title;
  final String imageurl;
  const CategoryContainer(
      {super.key, required this.title, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageurl),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Homepage(title: title, date: currentdate);
                },
              ));
            },
            child: Center(
              child: Text(title),
            ),
          )),
    );
  }
}
