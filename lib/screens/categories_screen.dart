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
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchandSetCategories();
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
  }

  String catie = "Sweets";
  Future<void> _refresh(BuildContext ctx) async {
    Provider.of<Products>(ctx).fetchandSetCategories();
  }

  var showFavourite = false;
  @override
  Widget build(BuildContext context) {
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
          "${catie}",
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
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
                    isHome: false,
                    tap: () {
                      setState(() {
                        catie = "${cat['name']}";
                      });
                    },
                  );
                },
              ),
            ),

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

            GridView(
              children: [
                FutureBuilder(
                    future: _refresh(context),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      return RefreshIndicator(
                          child: ProductsGrid(
                           false
                          ),
                          onRefresh: () => _refresh(context));
                    })
              ],
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
