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
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                // color: ColorManager.unSelectedAdd,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: isClicked
                      ? const AssetImage("assets/images/selectedBookmark.png")
                      : const AssetImage("assets/images/bookmark.png"),
                )),
                child: const Icon(
                  Icons.add,
                  size: 16,
                )),
          );   
  }
}
