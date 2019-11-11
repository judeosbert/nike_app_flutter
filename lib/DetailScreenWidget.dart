import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/custom/nike_icons_icons.dart';
import 'package:music_app/dummy/DataManager.dart';

import 'ItemTile.dart';
ScreenUtil instance = ScreenUtil.getInstance();
class DetailScreenWidget extends StatefulWidget {
  static const String routeName = "/details";

  @override
  _DetailScreenWidgetState createState() => _DetailScreenWidgetState();
}

class _DetailScreenWidgetState extends State<DetailScreenWidget> {
  int _scrollIndicatorSelectedPosition = 0;
  @override
  Widget build(BuildContext context) {
    final Map argument = ModalRoute.of(context).settings.arguments;
    final itemId = argument["id"];
    final ItemTileData itemData = DataManager.getDataAt(itemId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: Container(
            child: SvgPicture.asset("assets/images/NIKE.svg")
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size.square(MediaQuery.of(context).size.width),
                  child: PageView.builder(itemBuilder: (context,index){

                    return Image.asset("assets/images/shoes/shoe-large.png",
                      fit: BoxFit.fitWidth,);

                  },
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    onPageChanged: (index){
                      setState(() {
                        _scrollIndicatorSelectedPosition = index;
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: instance.setHeight(10),
                  child: Center(
                    child: SizedBox.fromSize(
                      size: Size(instance.setWidth(200), instance.setHeight(2)),
                      child: ListView.builder(itemBuilder: (context,index){
                        return Icon(Icons.minimize,
                            color: (index == _scrollIndicatorSelectedPosition)?Colors.black:Colors.grey[300]);
                      },
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Divider(),
                SizedBox.fromSize(
                  size: Size(MediaQuery.of(context).size.width,121),
                  child: ListView.builder(itemBuilder: (context,index){
                    int imageIndex = index+1;
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, DetailScreenWidget.routeName,arguments: {
                          "id":itemData.itemId,
                        });
                      },
                      child: Image.asset("assets/images/shoes/$imageIndex.png",
                        fit: BoxFit.fitWidth,),
                    );
                  },
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,),
                ),
                SizedBox(
                  height: instance.setHeight(50),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("NIKE AIR MAX SUPERSKY",
                            style: TextStyle(
                              color: Color(0xff0A1734),
                              fontSize: instance.setSp(18),
                            ),),
                          Text("Men's Running Shoe",
                            style: TextStyle(
                              color: Color(0xff9A9EB7),
                              fontSize: instance.setSp(16),
                            ),),

                        ],
                      ),
                      Text("\$${itemData.price}",
                        style: TextStyle(
                          color: Color(0xff6858C8),
                          fontSize: 23,
                        ),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child:Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color:Colors.grey[300])
                          ),
                          child: SizedBox.fromSize(
                            size: Size(instance.setWidth(40),instance.setWidth(40)),
                            child: Center(
                              child: Icon(NikeIcons.doted_heart,
                                size: instance.setWidth(20),
                                color: Color(0xff6858C8),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          flex: 8,
                          child:SizeSelectionDropdown()),
                    ],
                  ),
                ),
                SizedBox.fromSize(
                  size: Size.fromHeight(instance.setHeight(65)),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: getAddItemButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}

Widget getAddItemButton(BuildContext context){
  return SizedBox.fromSize(
    size: Size(MediaQuery.of(context).size.width, instance.setHeight(61)),
    child: FlatButton(onPressed: (){

    }, child: Center(
      child:Text(
        "ADD",
      style: TextStyle(
          fontSize: 14,
        color: Colors.white
      ),
      ),
    ),
        color: Color(0xff594CA9),

    ),
  );
}

class SizeSelectionDropdown extends StatefulWidget {
  final List<String> sizeOptions = ["S","M","L","XL"];

  @override
  _SizeSelectionDropdownState createState() => _SizeSelectionDropdownState();
}

class _SizeSelectionDropdownState extends State<SizeSelectionDropdown> {
  String selectedSizeOption = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: instance.setHeight(40),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(
              color:Colors.grey[300]
          ))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            icon: Icon(Icons.keyboard_arrow_down,
              color: Color(0xff594CA9),),
            decoration: InputDecoration.collapsed(hintText:""),
            hint: Text("SIZE",
              style: TextStyle(
                fontSize: instance.setSp(14),
                color: Color(0xff9A9EB7),

              ),
            ),

            items: widget.sizeOptions.map((String option){
              if(selectedSizeOption == ""){
                selectedSizeOption = option;
              }
              return DropdownMenuItem(
                child: Text(option),
                value: option
              );
            }).toList(),
            onChanged: (size){
            setState(() {
              selectedSizeOption = size;
            });
          },
            value: selectedSizeOption,
          ),
        ),
      ),
    ) ;
  }
}






