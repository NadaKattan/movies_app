import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final void Function()? onTap;

  const AddButton({required this.onTap, super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  Widget addIcon = const Icon(Icons.add);
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () => setState(() {
        isClicked = !isClicked;
        addIcon = !isClicked ? const Icon(Icons.add) : const Icon(Icons.check);
        widget.onTap?.call();
      }),
      child: Material(
        color:
            !isClicked ? ColorManager.unSelectedAdd : ColorManager.selectedAdd,
        elevation: 5,
        // shape: const ,
        // shadowColor: ColorManager.primary,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(!isClicked
                      ? ImageAssets.bookmark
                      : ImageAssets.selectedBookmark))),
          color: ColorManager.white,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: addIcon,
          ),
        ),
      ),
    );
  }
}
