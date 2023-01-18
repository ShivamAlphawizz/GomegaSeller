import 'dart:convert';

import 'package:eshopmultivendor/Helper/Constant.dart';
import 'package:eshopmultivendor/Helper/String.dart';
import 'package:eshopmultivendor/Model/TableModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../Helper/Color.dart';
import '../Helper/Session.dart';

class TableHis extends StatefulWidget {
  const TableHis({Key? key}) : super(key: key);

  @override
  State<TableHis> createState() => _TableHisState();
}

class _TableHisState extends State<TableHis> {

  TableModel? tableModel;
  table()async{
    var headers = {
      'Cookie': 'ci_session=5d6e057fd22531186c63595cdda2d66da62431d5'
    };
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl+'no_of_tables'));
    request.fields.addAll({
      'seller_id': '${CUR_USERID}'
    });
    print("table api here ${baseUrl+'no_of_tables'} and ${CUR_USERID}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
    var finalData = await response.stream.bytesToString();
    final jsanReponce = TableModel.fromJson(json.decode(finalData));
    print(jsanReponce.message);
    setState(() {
      tableModel = jsanReponce;
    });
    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    table();
  }
  @override
  Widget build(BuildContext context){
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightWhite,
      appBar: getAppBar("Table History", context),
      body: Container(
        child:tableModel == null || tableModel!.error == true ?
        Center(child: Text(
          "Tables not found!!"
        ),) :  GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: tableModel!.data!.map((e){
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 110,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network("$imageUrl${e.qrCode}",fit: BoxFit.fill,)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                    children: [
                      Text("Table NO : "),
                      Text("${e.table}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                    ],
                ),
                  ),
                  SizedBox(height: 2,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: e.status == "1" ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Text(e.status == "1" ? "Open" :"Close",style: TextStyle(color: Colors.white),)),
                  ),

                ],
              ),

            );
          }).toList()
        )
      )
    );
  }
}
