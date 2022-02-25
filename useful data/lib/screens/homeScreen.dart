import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_web1/models/contaner_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_web/image_picker_web.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode _node = FocusNode();
  @override
  void initState() {
    super.initState();
    _node.requestFocus();
  }
  Uint8List? _imageByteList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        // http.Response response= await http.get(
          // Uri.parse("https://flutter-web-1-server.herokuapp.com/",),
          // headers: {
          //  "Accept": "application/json",
            // "Access-Control-Allow-Origin": "*",
            // "Content-Type": "application/json"
        // });
        // print(response.statusCode);
      },child:const Padding(
        padding:  EdgeInsets.all(18.0),
        child: Icon(Icons.send_rounded,color: Colors.white,size: 22,),
      ),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              focusNode: _node,
              onHover: (e){
                    if (e) {
                      ContainerColor.textColor=Colors.black;
                      ContainerColor.primaryColor=Colors.yellow;
                    } else {
                      ContainerColor.textColor=Colors.yellow;
                      ContainerColor.primaryColor=Colors.black;
                    }
                    setState(() {});
              },
              onTap: ()async{
                    Uint8List? data= await ImagePickerWeb.getImageAsBytes(
                    );
                    if (data !=null) {
                      _imageByteList=data;
                    setState(() {});
                    }
                    _node.requestFocus();
                
              },
              borderRadius:const BorderRadius.all(Radius.circular(10)),
              child: Container(
                child: Text("Pick File",style: TextStyle(color: ContainerColor.textColor,fontWeight: FontWeight.bold,fontSize: 24),),
                padding:const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                decoration: BoxDecoration(
                  color: ContainerColor.primaryColor,
                  borderRadius:const BorderRadius.all(Radius.circular(10)),
                  boxShadow:const [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(1.5, 1.5),
                      blurRadius: 1.5
                    )
                  ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            if(_imageByteList !=null) Container(
              width: 300,
              // height: 100,
              // color: Colors.red,
               child: Image.memory(
                 _imageByteList!,width: 300,height: 400,),
             ),
          ],
        ),
        ),
    );
  }
}