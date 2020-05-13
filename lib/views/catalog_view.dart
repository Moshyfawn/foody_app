import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:foody_app/models/food_model.dart';

class CatalogView extends StatelessWidget {
  final List<Food> foods = [
    Food('Fruits Bowl', 22, 'assets/fruits_bowl.png'),
    Food('Salmon Bowl', 26, 'assets/salmon_bowl.png'),
    Food('Fruits Bowl', 22, 'assets/fruits_bowl.png'),
    Food('Salmon Bowl', 26, 'assets/salmon_bowl.png'),
    Food('Fruits Bowl', 22, 'assets/fruits_bowl.png'),
    Food('Salmon Bowl', 26, 'assets/salmon_bowl.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[300],
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                sliver: SliverSafeArea(
                  sliver: _buildSliverAppBar(context),
                ),
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
            ];
          },
          physics: const BouncingScrollPhysics(),
          body: _buildListView(),
        ),
        bottomNavigationBar: _buildBottomAppBar(),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            OutlineButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(
                Icons.search,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            OutlineButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Badge(
                badgeColor: Colors.white,
                badgeContent: Text('2'),
                child: Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                color: Colors.black,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onPressed: () {},
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Container(
      padding: EdgeInsets.fromLTRB(40.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(80.0),
        ),
      ),
      child: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(10.0),
              key: Key(index.toString()),
              leading: Container(
                padding: EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(foods[index].image),
                  radius: 30.0,
                  // backgroundImage: NetworkImage(
                  //   'https://i.picsum.photos/id/225/1500/979.jpg',
                  // ),
                  // backgroundColor: Colors.transparent,
                ),
              ),
              title: Text(foods[index].title),
              subtitle: Text('\$${foods[index].price}'),
              trailing: IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () => print('add to card'),
              ),
            );
          },
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      expandedHeight: 150.0,
      stretch: true,
      pinned: true,
      backgroundColor: Colors.teal[300],
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () => print('open filters'),
        ),
        IconButton(
          icon: Icon(Icons.apps),
          onPressed: () => print('open additional'),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).primaryTextTheme.headline6,
            children: <TextSpan>[
              TextSpan(
                text: 'Healthy ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'Food',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
      ),
    );
  }
}
