import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final void Function()? onTap;

  const AddButton({this.onTap, super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  Widget addIcon = const Icon(Icons.add);
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {
              setState(() {
                isClicked = !isClicked;
              });
            },
            child: Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                // color: ColorManager.unSelectedAdd,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: isClicked
                      ? AssetImage("assets/images/selectedBookmark.png")
                      : AssetImage("assets/images/bookmark.png"),
                )),
                child: Icon(
                  Icons.add,
                  size: 16,
                )),
          );   
  }
}
