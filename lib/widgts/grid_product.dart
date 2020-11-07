import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shops/providers/product.dart';
import 'package:shops/providers/products.dart';

class GridProduct extends StatelessWidget {
  final String category;

  GridProduct({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.6,
              width: MediaQuery.of(context).size.width / 2.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  "",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //   Positioned(
            //     right: -10.0,
            //     bottom: 3.0,
            //     child: RawMaterialButton(
            //       onPressed: (){},
            //       fillColor: Colors.white,
            //       shape: CircleBorder(),
            //       elevation: 4.0,
            //       child: Padding(
            //         padding: EdgeInsets.all(5),
            //         child: Icon(
            //           isFav
            //               ?Icons.favorite
            //               :Icons.favorite_border,
            //           color: Colors.red,
            //           size: 17,
            //         ),
            //       ),
            //     ),
            //   ),
            // ],
          ]),
          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              "",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context){
        //       return ProductDetails();
        //     },
        //   ),
        // );
      },
    );
  }
}
