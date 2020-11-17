import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shops/models/categories.dart';
import 'package:shops/providers/product.dart';
import 'package:shops/providers/products.dart';
import 'package:shops/widgts/ProductsGrid.dart';
import 'package:shops/widgts/categories_item.dart';
import 'package:shops/widgts/grid_product.dart';
import 'package:shops/widgts/home_categories.dart';
import '../data/data.dart';

class CategoriesScreen extends StatefulWidget {
  final String category;

  CategoriesScreen({this.category});
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // var _isInit = true;
  // var _isLoading = false;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<Products>(context).fetchandSetCategories();
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  //   _isInit = false;
  // }

  var showFavourite = false;
  @override
  Widget build(BuildContext context) {
    String catie = widget.category;

    // var product = Provider.of<Products>(context,listen: false).getCategoriesProduct(catie);
    final productData = Provider.of<Products>(context,listen: false);
    List<Product> products = productData.getCategoriesProduct(catie);
    List<Widget> widgt = products.map((produc) {
      return  InkWell(
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
                  "${produc.image}",
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
              "${produc.title}",
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
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "$catie",
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            // Container(
            //   height: 65.0,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     itemCount: categories == null ? 0 : categories.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       Map cat = categories[index];
            //       return HomeCategory(
            //         title: cat['name'],
            //         items: cat['items'].toString(),
            //         isHome: false,
            //         tap: () {
            //           setState(() {
            //             catie = "${cat['name']}";
            //           });
            //         },
            //       );
            //     },
            //   ),
            // ),

            SizedBox(height: 20.0),

            // Text(
            //   "$catie",
            //   style: TextStyle(
            //     fontSize: 23,
            //     fontWeight: FontWeight.w800,
            //   ),
            // ),
            Divider(),
            SizedBox(height: 10.0),

            ListView(
              children: widgt,

              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   childAspectRatio: MediaQuery.of(context).size.width /
              //       (MediaQuery.of(context).size.height / 1.25),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
