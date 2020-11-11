import 'package:flutter/material.dart';
import 'package:shops/models/categories.dart';
import 'package:shops/widgts/home_categories.dart';
import '../widgts/ProductsGrid.dart';
import 'package:provider/provider.dart';
import '../widgts/badge.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgts/app_drawer.dart';
import '../providers/products.dart';

enum FliterOptions {
  favourites,
  All,
}

class product_overview extends StatefulWidget {
  @override
  _product_overviewState createState() => _product_overviewState();
}

class _product_overviewState extends State<product_overview> {
  @override
  var _isInit = true;
  var _spinner = false;
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _spinner = true;
      });
      Provider.of<Products>(context).fetchandSetProducts().then((_) {
        setState(() {
          _spinner = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refresh(BuildContext ctx) async {
    await Provider.of<Products>(ctx).fetchandSetProducts();
  }

  var showFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FliterOptions selectedvalue) {
              setState(() {
                if (selectedvalue == FliterOptions.favourites) {
                  showFavourite = true;
                } else {
                  showFavourite = false;
                }
              });
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FliterOptions.favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FliterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(cart_screen.routedname);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
         padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(children: [
           Container(
              height: 65.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null?0:categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categories[index];
                  return HomeCategory(
                    title: cat['name'],
                    items: cat['items'].toString(),
                    isHome: true,
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),
          FutureBuilder(
              future: _refresh(context),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                return RefreshIndicator(
                    child: ProductsGrid(showFavourite),
                    onRefresh: () => _refresh(context));
              }),
        ]),
      ),
    );
  }
}


//  builder: (context, AsyncSnapshot<dynamic> snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//             return Center(
//               child: Text('Error, no connection state'),
//             );
//             break;
//           case ConnectionState.waiting:
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [CircularProgressIndicator(),SizedBox(height: 6,) ,Text('Loading....')],
//               ),
//             );
//             break;
//           case ConnectionState.done:
//             return RefreshIndicator(
//                 child: ProductsGrid(showFavourite),
//                 onRefresh: () => _refresh(context));
//             break;
//           default:
//             return Center(
//               child: Text('Error, no connection state'),
//             );
//         }
