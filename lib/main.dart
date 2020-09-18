import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ask Pankhuri',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //font color for
  Color fontColor = Color.fromRGBO(113, 21, 206, 1);

  //dummy title and subTitle for listview items
  String title = 'Photography';
  String subTitle =
      'Hi there how are you there how are you here how are you there how are you';

  //list of categories
  List<String> _categories = [
    'Wellness & Selfcare',
    'Bridal Fashion',
    'Photography',
    'Makeup',
    'Beauty & Skincare',
    'Talk to Stylist',
    'Customise',
    'Explore'
  ];

  int index = 0; //index to keep track of tapped item in navigation bar

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              title: Text(
                'ask pankhuri',
                style: TextStyle(color: fontColor, fontSize: 30),
              ),
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(3.5))),
                    )
                  ],
                )
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  if (index == 0) return gridViewContainer();
                  return listView(
                      title, subTitle); // can pass here dynamic parameter
                },
                childCount: 15,
              ),
            )
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  //widget for bottom navigation bar
  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 23,
      selectedFontSize: 13,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      showUnselectedLabels: true,
      backgroundColor: Colors.grey.withOpacity(0.2),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: index == 0 ? fontColor.withOpacity(0.7) : Colors.grey,
          ),
          title: Text(
            'home',
            style: TextStyle(
              color: index == 0 ? fontColor.withOpacity(0.7) : Colors.grey,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_bubble,
            color: index == 1 ? fontColor.withOpacity(0.7) : Colors.grey,
          ),
          title: Text(
            'ask',
            style: TextStyle(
              color: index == 1 ? fontColor.withOpacity(0.7) : Colors.grey,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.grain,
            color: index == 2 ? fontColor.withOpacity(0.7) : Colors.grey,
          ),
          title: Text(
            'explore',
            style: TextStyle(
              color: index == 2 ? fontColor.withOpacity(0.7) : Colors.grey,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: index == 3 ? fontColor.withOpacity(0.7) : Colors.grey,
          ),
          title: Text(
            'create',
            style: TextStyle(
              color: index == 3 ? fontColor.withOpacity(0.7) : Colors.grey,
            ),
          ),
        ),
      ],
      onTap: (selectedIndex) {
        setState(() {
          index = selectedIndex;
        });
      },
    );
  }

  //widget for items in grid view
  Widget categoryBox(String str) {
    return Container(
      //margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: fontColor.withOpacity(0.1),
            spreadRadius: 0.8,
            blurRadius: 1,
            offset: Offset(0, 0.7), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          str,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: fontColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  //widget for generating list
  Widget listView(String title, String subTitle) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.2, color: Colors.grey.withOpacity(0.4)),
          )),
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple.withOpacity(0.1),
            maxRadius: 25,
            child: Icon(
              Icons.camera_alt,
              color: fontColor,
              size: 28,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      '9.30am',
                      style: TextStyle(color: fontColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          color: fontColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        '12',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
                ),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //widget for creating grid view
  Widget gridViewContainer() {
    return Container(
        child: Column(
          children: [
            Container(
              //padding: EdgeInsets.all(12),
              color: Colors.purple.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin:
                    EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                    child: Text(
                      'Select Catergory',
                      style: TextStyle(
                        color: fontColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12)
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: StaggeredGridView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        itemBuilder: (context, index) {
                          return categoryBox(_categories[index]);
                        },
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                        SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          staggeredTileCount: _categories.length - 1,
                          staggeredTileBuilder: (index) {
                            return StaggeredTile.extent(
                                1,
                                _categories[index].length *
                                    MediaQuery.of(context).devicePixelRatio *
                                    4); // may not the right way to define dynamic size but it worked
                          },
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                      )),
                  _askPankhuriCard()
                ],
              ),
            ),
          ],
        ));
  }

  //widget for ask pankhuri card
  Widget _askPankhuriCard(){
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 12),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: fontColor, width: 1.5)),
      child: Row(
        children: [

          Icon(Icons.stars, color: fontColor,),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              'Ask Pankhuri something else',
              style: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
