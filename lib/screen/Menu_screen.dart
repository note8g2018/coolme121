//import 'dart:io';
//import 'dart:ui';
//import '../screen/AddFriend_screen.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:image_cropper/image_cropper.dart';
//import '../screen/Wall_screen.dart';
//import '../screen/WritingArticle_screen.dart';
//import '../screen/Register_screen.dart';
//import 'package:flutter/services.dart';
//import '../constant/textStyle.dart';
//import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import '../widget/LinkBall_widget.dart';
//import 'package:image_picker/image_picker.dart';
//import '../screen/MyFriends_screen.dart';
//import 'package:hive/hive.dart';
//import '../model/Person_model.dart';

import '../MyLibrary/import_file.dart';

class Menu extends StatefulWidget
{
  static const String route = 'Menu';

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();
  Box<Person> _boxPerson = Hive.box<Person>(GlobalPersonBoxLog);

  void _logOut(BuildContext context) async
  {
    final Person person = _boxPerson.get(0);
    await LogOutController.logout(person);
    _boxPerson.delete(0);
    Navigator.pushNamed(context, LogIn.route);
  }

  void _getImage() async
  {
    PickedFile _pickedFile = await _picker.getImage(source: ImageSource.camera);
    File _croppedFileImage = await ImageCropper.cropImage(
      sourcePath: _pickedFile.path,
      cropStyle: CropStyle.circle,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0,)
    );

    setState(() {
      _imageFile = _croppedFileImage;
    });
  }

  ImageProvider _getImageWidget(File imageFile)
  {
    if(imageFile == null)
      {
        return AssetImage("images/image18.jpg",
          //height: 200.0,
          //width: 200.0,
        );
      }
    else
      {
        return FileImage(_imageFile,
          //height: 200.0,
          //width: 200.0,
        );
      }
  }

  @override
  Widget build(BuildContext context)
  {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      //resizeToAvoidBottomInset: true,
      //resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("Menu",
          style: kAppBareStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
              child: GestureDetector(
                onTap: (){
                  _getImage();
                },
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: _getImageWidget(_imageFile),
                ),
              ),
                ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.start,
                  spacing: 15.0,
                  runSpacing: 15.0,
                  children: <Widget>[
                    LinkBall(
                      title: "Write Article",
                      onTap: (){
                        Navigator.pushNamed(context, WritingArticle.route);
                      },
                    ),
                    LinkBall(
                      title: "Wall",
                      onTap: (){
                        Navigator.pushNamed(context, Wall3.route);
                      },
                    ),
                    LinkBall(
                      title: "My Friends",
                      onTap: (){
                        Navigator.pushNamed(context, MyFriends.route);
                      },
                    ),
                    LinkBall(
                      title: "Add Friend",
                      onTap: (){
                        Navigator.pushNamed(context, AddFriend.route);
                      },
                    ),
                    LinkBall(
                      title: "Log Out",
                      onTap: (){
                        _logOut(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


