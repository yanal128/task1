
import 'package:flutter/material.dart';
class DetailesPage extends StatelessWidget {
  String? photoUrl;
  String? name;
  double? price;
  String? createdAt;
  String? description;

  String? category;
  String? updatedAt;
  DetailesPage(this.name,this.price,this.photoUrl,this.updatedAt,this.category,this.description,this.createdAt);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        // Return true to prevent back navigation
        return false;
      } ,
      child: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading:IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back,color: Colors.black,)) ,
    ),
      body:  Column(
          children: [
            Container(
              height: 210,
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 120),
                color:Colors.grey,
                child: Image.network(photoUrl!,)),

            ListTile(
              subtitle:Text(category!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)) ,
            ),
            ListTile(
              
              subtitle: Text(name! ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              title: Text("Distributor Name",style: TextStyle(color: Colors.grey),),),

            ListTile(
              subtitle:Text(name!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

              title:Text("Scientific Name",style: TextStyle(color: Colors.grey,)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text("Retal Price",style: TextStyle(color: Colors.black)),
              subtitle: Text("${price!}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            ),
            ListTile(
              title: Text("Made in",style: TextStyle(color: Colors.grey)),
              subtitle: Text(updatedAt!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            )

          ],
        ),

    )

    );
  }
}
