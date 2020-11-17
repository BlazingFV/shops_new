import 'package:shops/screens/categories_in_screens.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shops/models/categories.dart';
import 'package:shops/providers/items.dart';
import 'package:shops/widgts/home_categories.dart';
import 'package:shops/widgts/slider_item.dart';
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
      Provider.of<Products>(context,listen: false).fetchandSetProducts().then((_) {
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

  @override
  void dispose() {
    super.dispose();
    Provider.of<Products>(context,listen: false).fetchandSetProducts();
    _refresh(context);
  }

  var showFavourite = false;
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/backgroundscafold.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text('Halla|حلا'),
          actions: <Widget>[
            // PopupMenuButton(
            //   onSelected: (FliterOptions selectedvalue) {
            //     setState(() {
            //       if (selectedvalue == FliterOptions.favourites) {
            //         showFavourite = true;
            //       } else {
            //         showFavourite = false;
            //       }
            //     });
            //   },
            //   itemBuilder: (ctx) => [
            //     PopupMenuItem(
            //       child: Text('Only Favourites'),
            //       value: FliterOptions.favourites,
            //     ),
            //     PopupMenuItem(
            //       child: Text('Show All'),
            //       value: FliterOptions.All,
            //     ),
            //   ],
            // ),
            // Consumer<Cart>(
            //   builder: (_, cart, ch) => Badge(
            //     child: ch,
            //     value: cart.itemCount.toString(),
            //   ),
            //   child: IconButton(
            //     icon: Icon(
            //       Icons.shopping_cart,
            //     ),
            //     onPressed: () {
            //       Navigator.of(context).pushNamed(cart_screen.routedname);
            //     },
            //   ),
            // ),
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(children: [
//           CarouselSlider(
//             height: MediaQuery.of(context).size.height * .14,
//             items: map<Widget>(
//               items,
//               (index, i) {
//                 Map stuff = items[index];
//                 return SliderItem(
//                   img: stuff['img'],
//                   isFav: false,
//                   name: stuff['name'],
//                   raters: 0,
//                 );
//               },
//             ).toList(),
//             autoPlay: true,
// //                enlargeCenterPage: true,
//             viewportFraction: 1.0,
// //              aspectRatio: 2.0,
//             onPageChanged: (index) {
//               setState(() {
//                 _current = index;
//               });
//             },
//           ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 65.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null ? 0 : categories.length,
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
