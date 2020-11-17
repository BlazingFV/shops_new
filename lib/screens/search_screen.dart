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
   String queryR;
  handleSearch(String query) {
    if (query.trim().isNotEmpty) {
      final productData = Provider.of<Products>(context, listen: false);
      final List<Product> products = productData.searchForProducts(query);
     final widgt =  products.map((produc) {
         
      return ListView(
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
      
     
    );
    }).toList();

      setState(() {
         searchResults = widgt ;
        print(query);
        print('$searchResults');
        
      });
    }
   
  }

  buildNoContent() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Find Items',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Signatra',
                fontWeight: FontWeight.w400,
                fontSize: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
 
  
        buildSearchResult(){
          
          
        
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
        onFieldSubmitted: (query) {
           setState(() {
             queryR = query;
           });
          handleSearch(queryR);
          },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: buildSearchBar(),
      body: ListView(
        children: 
          searchResults==null?[]:searchResults
        ,
      ),
    );
  }
}




class ProductResult extends StatelessWidget {
  final Product product;

   ProductResult(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[200],
      child: Column(
        children: [
          GestureDetector(
            onTap: (){},
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(product.image),
              ),
              title: Text(
               product.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                product.price.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Divider(
            height: 2.0,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
}
