import 'package:flutter/material.dart';

class ItemColour extends StatefulWidget {
  // const ItemColour({super.key});
  Color ItemColors;

  ItemColour(this.ItemColors);

  @override
  State<ItemColour> createState() => _ItemColourState();
}

class _ItemColourState extends State<ItemColour> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,


      onTap: () {
        if (flag == false) {
          flag = true;
        } else
          flag = false;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 35,
          height: 35,
          child: flag == true
              ? Center(
                  child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 20,
                ))
              : SizedBox.shrink(),
          decoration: BoxDecoration(
            color: widget.ItemColors,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
