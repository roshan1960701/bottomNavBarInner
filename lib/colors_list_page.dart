import 'package:bottom_nav/samplePage.dart';
import 'package:flutter/material.dart';

class ColorsListPage extends StatelessWidget {
  ColorsListPage({this.color, this.title, this.onPush});
  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
          backgroundColor: color,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Center(
                child: MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: ()async{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => samplePage()));
                },
                child: Text("Sample Page"),
                ),
              ),

              /*Container(
                color: Colors.white,
                child: _buildList(context),
              ),*/

            ],

          ),
        ));
  }

  final List<int> materialIndices = [900, 800, 700, 600, 500, 400, 300, 200, 100, 50];

  Widget _buildList(context) {
    return ListView.builder(
        itemCount: materialIndices.length,
        itemBuilder: (BuildContext content, int index) {
          int materialIndex = materialIndices[index];
          return Container(
            color: color[materialIndex],
            child: ListTile(
              title: Text('$materialIndex', style: TextStyle(fontSize: 24.0)),
              trailing: Icon(Icons.chevron_right),
              onTap: () => onPush(materialIndex),
            ),
          );
        });
  }
}
