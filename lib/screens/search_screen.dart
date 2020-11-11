import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shops/models/users.dart';
import 'package:shops/providers/product.dart';
import 'package:shops/providers/products.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller = TextEditingController();
  List<Widget> searchResults;

  handleSearch(String query) {
    if (query.trim().isNotEmpty) {
      final productData = Provider.of<Products>(context);
      final List<Product> products = productData.searchForProducts(query);
      setState(() {
        searchResults = products.map((produc) {
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
      });
    }
  }

  AppBar buildSearchBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search for a user...',
          filled: true,
          prefixIcon: Icon(
            Icons.supervisor_account,
            size: 28,
          ),
          suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _controller.clear();
              }),
        ),
        onChanged: handleSearch,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: buildSearchBar(),
      body: ListView(
        children: searchResults,
      ),
    );
  }
}
