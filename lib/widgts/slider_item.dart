import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final String name;
  final String img;
  final bool isFav;
  final int raters;

  SliderItem(
      {Key key,
      @required this.name,
      @required this.img,
      @required this.isFav,
      @required this.raters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.15,
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: 500 / 1080,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "$img",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
