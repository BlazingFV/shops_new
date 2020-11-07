import 'package:flutter/material.dart';
import 'package:shops/models/meal.dart';

class CategoriesInScreen extends StatefulWidget {
  static const routeName = '/categories_in_screen';
  final List<Meal> available;

  CategoriesInScreen({this.available});

  @override
  _CategoriesInScreenState createState() => _CategoriesInScreenState();
}

class _CategoriesInScreenState extends State<CategoriesInScreen> {
  String categoryTitle;
  List<Meal> displayedItems;
  bool _loadedInitData = false;
  String categoryId;
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArguments['title'];
       categoryId = routeArguments['id'];
      displayedItems = widget.available.where((everyItem) {
        return everyItem.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryId),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return ItemScreen(
            id: displayedItems[index].id,
            title: displayedItems[index].title,
            imageUrl: categoryTitle,
          );
        },
        itemCount: displayedItems.length,
        ));
  }
}

class ItemScreen extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;

  const ItemScreen({Key key, this.id, this.imageUrl, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconsAndText = Container(
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 7,
          ),
          Icon(
            Icons.schedule,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 30,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.work,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 6,
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
          Container(
            width: 120,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.attach_money,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );

    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.asset(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(7),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7, horizontal: 11.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        iconsAndText,
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
