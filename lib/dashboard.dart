import 'dart:io';

import 'package:api_project/add_note_screen.dart';
import 'package:api_project/constants/constant.dart';
import 'package:api_project/model/notes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  final List<Notes> _items = [
    Notes(id: '1', title: 'Test 1', description: 'Test 1 description'),
    Notes(id: '2', title: 'Test 2', description: 'Test 2 description'),
    Notes(id: '3', title: 'Test 3', description: 'Test 3 description'),
  ];

  Future<List<Notes>> fetchNotes() async {

  // try{
  //    final _dio = Dio();
  //    final _res = await _dio.get(Constant.notes);
  //    final _temp = List.from(_res.data["data"]);
  //    final _formatedData = _temp.map((e) => Notes.fromJson(e)).toList();
  //    return _formatedData;  


  //   //return List.from(_res.data["data"]).map((e) => Notes.fromJson(e)).toList();

  // } on DioError catch (e) {
  //   rethrow;
  // } catch (e) {
  //   rethrow;
  // }

    await Future.delayed(const Duration(seconds: 2));
    return _items;
   //throw SocketException('Lost Connection');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () async {
         final _res = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddNoteScreen()),);

         if(_res == true) {
          setState(() {});
         }
        }

        ),

      body: Container(
        child: FutureBuilder<List<Notes>>(
          future: fetchNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting || 
            snapshot.connectionState == ConnectionState.none) {
              return Center(child: CircularProgressIndicator());
            } else if(snapshot.connectionState == ConnectionState.active || 
            snapshot.connectionState == ConnectionState.done){
              if (snapshot.hasData && snapshot.data != null) {
                 return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data! [index].title),
                  subtitle: Text(snapshot.data![index].description),
                );
              },
              itemCount: snapshot.data!.length,
              
              );
               }else{ return Center(
                  child: Text(snapshot.error?.toString() ?? "Error Occured"),
                );
              }
           
            }else {
              return Container();
            }
          }
        ),
      ),
    );

  }
}