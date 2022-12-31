import 'package:api_project/constants/constant.dart';
import 'package:api_project/widgets/custom_text_form_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
   final TextEditingController _titleController = TextEditingController();
   final TextEditingController _descriptionController = TextEditingController();
   bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
     return
    // LoadingOverlay(
    //   isLoading: _isLoading,
       Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Notes"),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
               CustomTextFormField(
                label: "Title",
                controller: _titleController,
                validator: (value) {
                  if(value == null){
                    return "Title is required ****";
                  }else if(value.isEmpty){
                    return "Title is required";
                  }else{
                    return null;
                  }
                },
                ),
        
                CustomTextFormField(
                label: "Description",
                controller: _descriptionController,
                 validator: (value) {
                  if(value == null){
                    return "Description is required ****";
                  }else if(value.isEmpty){
                    return "Description is required";
                  }else if(value.length<10){
                    return "Description is required";
                  }else{
                    return null;
                  }
                },
                ),
        
                MaterialButton(
                  onPressed: ()  {
                    if(_formkey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Save Successfully")));
                     // Fluttertoast.showToast(msg:"Show toast massage");
                    // Fluttertoast.showToast(msg:"save succesfully");
    
                    // try{
                    //   setState(() {
                    //     _isLoading = true;
                    //   });
                    //   final _dio = Dio();
                    //   final Map<String, dynamic> _data = {
                    //     "title": _titleController.text,
                    //     "description": _descriptionController.text,
                    //   };
                    //   final _response = await _dio.post(
                    //     Constant.notes, data: _data);
                    //     if(_response.statusCode! >= 200 && _response.statusCode! < 300){
                    //       Fluttertoast.showToast(msg: "Not Save Successfully ");
                    //       Navigator.of(context).pop(true);
    
                    //     } else{
                    //       Fluttertoast.showToast(msg: _response.data["message"] ?? "Unable to post note");
                    //     }
    
                    // } on DioError catch(e){
                    //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message())));
    
                    //     // Fluttertoast.showToast(msg: e.message());
                    // }catch(e){
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                    //  // Fluttertoast.showToast(msg: e.toString());
                    // }finally{
                    //   setState(() {
                    //     _isLoading = false;
                    //   });
                    // }
                     
                     }
                  },
                  child: Text("Save"),
                  ),
            ],
          ),
        ),
   //   ),
    );
  }
}