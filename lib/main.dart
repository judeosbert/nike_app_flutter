import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/CatalogWidget.dart';
import 'package:music_app/ItemTile.dart';
import 'package:music_app/custom/nike_icons_icons.dart';
import 'package:music_app/dummy/DataManager.dart';

import 'DetailScreenWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: "/" ,
      routes: {
        "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'),
        DetailScreenWidget.routeName:(context) => DetailScreenWidget(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedMenuIndex = 0;
  List<Widget> _bottomMenuItems = List.generate(DataManager.getDataSize(), (index){
    return ItemTile(itemData: DataManager.getDataAt(index));
  },growable: false);


  @override
  void initState() {
    _bottomMenuItems[0] = CatalogWidget();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:375,height:812,allowFontScaling: false)..init(context);
    return Scaffold(
        backgroundColor: Color(0xffF8F8FA),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.menu

              ),
                  onPressed: (){
                
              }),
              SvgPicture.asset("assets/images/NIKE.svg"),
              IconButton(icon: Icon(Icons.adjust),
                  onPressed: (){

              })
            ],
          ),
        ),
        body: _bottomMenuItems[_selectedMenuIndex],
        bottomNavigationBar: NikeBottomNavigationBar(_selectedMenuIndex,(index){
            setState(() {
              _selectedMenuIndex = index;
            });
        }),
      );
  }
}

class NikeBottomNavigationBar extends StatelessWidget {
  final Function onSelect;
  final int selectedIndex;
  NikeBottomNavigationBar(this.selectedIndex,this.onSelect);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: Color(0xff6858C8)
      ),
        unselectedIconTheme: IconThemeData(
          color: Color(0xff04092B)
        ),
        onTap:(index){
          onSelect(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store),title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.search),title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.apps),title: Text("")),
          BottomNavigationBarItem(icon: Icon(NikeIcons.doted_heart),title: Text("")),

    ],);
  }
}

