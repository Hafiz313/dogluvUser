import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:dogluv_user_app/views/widgets/VideoPlayerWidget.dart';
import 'package:path/path.dart' as Path;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogluv_user_app/views/pages/GetAddressFromMap.dart';
import 'package:dogluv_user_app/views/widgets/EmojiPickerWidget.dart';
import 'package:dogluv_user_app/views/widgets/FullImageWidget.dart';
import 'package:dogluv_user_app/views/widgets/PDFView.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:giphy_picker/giphy_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class ChatDetail extends StatefulWidget {
   String roomID;
   String otherName;
   String otherPic;
   String otherID;
   String selectedLatitude;
   String selectedLongitude;
   String selectedPlace;
   ChatDetail({@required this.roomID
     ,@required this.otherName
     ,@required this.otherPic
     ,@required this.otherID
     ,@required this.selectedPlace
     ,@required this.selectedLatitude
     ,@required this.selectedLongitude});

    @override
    _ChatDetailState createState() => _ChatDetailState();

}

class _ChatDetailState extends State<ChatDetail> with TickerProviderStateMixin{
  AnimationController _controller;
  Position position;
  bool isEmojiVisible = false;
   bool isKeyboardVisible = false;
   bool isLoading;
    bool isScroll=false;
    bool showMenu=false;
    bool _play=false;
    File imageFile;
    File videoFile;

    int indexofBottom=0;
    bool writeCaption=false;
    String listViewIndex='10.0';
    String gifAPIKey='JMegQfe8vU5P4XUJt0SxmG9AV5K43Veq';
    final TextEditingController messageController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    final ScrollController scrollController= ScrollController();
     ScrollController scrollControllerTop;
     ScrollController scrollControllerBottom;
    bool isDisplaySticker;
    GiphyGif _gif;
    final TextEditingController captionController = TextEditingController();
    bool _progressVisibility = false;
    var myMood;
    var myName;
    bool loadingMain=false;
    var myID;
    var myPic="https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png";
    String url;
    int _currentPage = 0;
    final assetsAudioPlayer = AssetsAudioPlayer();
    Animation _fabAnimation;

  @override
  void dispose() {
    this._controller.dispose();
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override


    void initState() {
//      _controller.repeat(reverse: true);

  if(widget.selectedLatitude != "" && widget.selectedLongitude != "")
    {
      onSendMessage(widget.selectedPlace, 12,"",widget.selectedLatitude,widget.selectedLongitude);
    }

    focusNode.addListener(onFocusChange);
    isDisplaySticker=false;
    isLoading=false;

    getStringValue("mood").then((value) {

    setState(() {
    myMood = value;
    });
    }).then((value) {
    setState(() {
    loadingMain=false;
    });
    });


    getStringValue("UserID").then((value) {
    setState(() {
    myID = "1";
    });
    });

    // getStringValue("UserImage").then((value) {
    // setState(() {
    // myPic = value;
    // });
    // });
    getStringValue("UserName").then((value) {
    setState(() {
    myName = "Umar Ghaffar";
    });
    });


    KeyboardVisibility.onChange.listen((bool isKeyboardVisible) {
      setState(() {
        this.isKeyboardVisible = isKeyboardVisible;
      });

      if (isKeyboardVisible && isEmojiVisible) {
        setState(() {
          isEmojiVisible = false;
        });
      }
    });
    super.initState();
    }
    onFocusChange()
    {
    if(focusNode.hasFocus)
    {
    setState(() {
    isDisplaySticker=false;
    });
    }
    }
    _onPagedChanged(int index){
    setState(() {
    _currentPage = index;
    });
    }
    @override
    Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "images/chat_bg.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),

          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                title: Text('Jack Leech',
                style: TextStyle(color: Colors.white,
                fontSize: 20,fontFamily: 'Poppins',),),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(myPic),
                      maxRadius: 20,
                    ),
                  )
                ],
              ),

              resizeToAvoidBottomPadding: true,
          body: AnimatedContainer(
          duration: Duration(
          milliseconds: 400
          ),
          child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          children: [
          Flexible(
          flex: 1,
          child: Stack(
          children: <Widget>[
          Flex(
          direction: Axis.vertical,
          children: <Widget>[
          createListMessage(),
          (isDisplaySticker ? createStickers():Container()),
            showMenu?popupMenu(context):Container(),
            createInput(),
            Offstage(
              child: EmojiPickerWidget(onEmojiSelected: onEmojiSelected),
              offstage: !isEmojiVisible,
            ),
          ],
          ),

          createLoading()

          ],

          ),
          )
          // :
          // Container(height:0,width:0),
          ],
          ),

          )
          ),
        ],
      ),
    );
    }




    createLoading()
    {
    return Positioned(
    child: isLoading ?  circularProgress():Container()
    );
    }

    createInput()
    {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Flex(
    direction: Axis.horizontal,
    children: [
    Expanded(
    flex: 3,
    child: Container(
    margin:EdgeInsets.fromLTRB(0, 0, 5, 0) ,
    padding: EdgeInsets.fromLTRB(5, 2, 10, 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.transparent,
          border: Border(
            top: BorderSide(
                color:Colors.white,
                width: 1
            ),
            bottom: BorderSide(
                color:Colors.white,
                width: 1
            ),
            left: BorderSide(
                color:Colors.white,
                width: 1
            ),
            right: BorderSide(
                color:Colors.white,
                width: 1
            ),
          )

      ),
      child: Row(
    children:<Widget>[
      InkWell(
          onTap: (){
            // getSticker();
            onClickedEmoji();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.face,
                color: const Color(0xffFAFAFA)
            ),
          )),
      Flexible(



    child:TextField(
    style:TextStyle(
    color:Colors.white,
    fontSize: 15.0,
    fontFamily: "Poppins",
    ),
    controller:messageController,
    focusNode: focusNode,
    cursorColor: Colors.white,

    decoration:InputDecoration(hintText: "Type Message",
    contentPadding: const EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
    border: new OutlineInputBorder(

    borderSide: BorderSide.none,

    ),
    hintStyle: TextStyle(
    color:Colors.white,
    fontSize: 15.0,
    fontFamily: "Poppins",
    )),

    )
    ),

      InkWell(
          onTap: (){
            _controller =
                AnimationController(duration:
                const Duration(milliseconds: 1000), vsync: this);


            if(!showMenu) {
              _fabAnimation = Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: _controller, curve: Curves.elasticOut));
              }
            else
              {
                _fabAnimation = Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: _controller, curve: Curves.elasticIn));

              }

               WidgetsBinding.instance.addPostFrameCallback((_) {
              //Future.delayed(const Duration(seconds: 5), () =>
              _controller.forward();
              //);
            });

            setState(() {
              showMenu=!showMenu;
            });
  //        getImage();
          },
          child: Icon(Icons.attach_file_outlined,
              color:const Color(0xffFAFAFA)),
        ),
      SizedBox(width: 5,),
      InkWell(
          onTap: (){
            sendMessage();
            },
          child:Image.asset(
              "images/send.png",
              width:24.0,
              height: 24.0,
              color: Colors.blue,
          )
      ),


    ]
    ),
    ),
    ),
    ],
    ),
    );
    }

    createStickers()
    {
    return Container(
    child:Column(
    children:<Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget> [
    FlatButton(
    onPressed: ()=>{onSendMessage("mimi1",2,"","","")},
    child:Image.asset(
    "assets/img/mimi1.gif",
    width:50.0,
    height: 50.0,
    fit:BoxFit.cover
    )
    ),
    FlatButton(
    onPressed: ()=>{onSendMessage("mimi2",2,"","","")},
    child:Image.asset(
    "assets/img/mimi2.gif",
    width:50.0,
    height: 50.0,
    fit:BoxFit.cover
    )
    ),
    FlatButton(
    onPressed: ()=>{onSendMessage("mimi3",2,"","","")},
    child:Image.asset(
    "assets/img/mimi3.gif",
    width:50.0,
    height: 50.0,
    fit:BoxFit.cover
    ),

    ),
    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget> [
    FlatButton(
    onPressed: ()=>{onSendMessage("mimi4",2,"","","")},
    child:Image.asset(
    "assets/img/mimi4.gif",
    width:50.0,
    height: 50.0,
    fit:BoxFit.cover
    )
    ),
    FlatButton(
    onPressed: ()=>{onSendMessage("mimi5",2,"","","")},
    child:Image.asset(
    "assets/img/mimi5.gif",
    width:50.0,
    height: 50.0,
    fit:BoxFit.cover
    )
    ),
    FlatButton(
    onPressed: ()=>{onSendMessage("mimi6",2,"","","")},
    child:Image.asset(
    "assets/img/mimi6.gif",
    width:50.0,
    height: 50.0,
    fit:BoxFit.cover
    )
    ),
    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget> [
    FlatButton(
    onPressed: ()=>{onSendMessage("mimi7",2,"","","")},
    child:Image.asset(

    "assets/img/mimi7.gif",
    width:50.0,
    height: 50.0,
    fit:BoxFit.cover
    )
    ),
    FlatButton(
    onPressed: ()=>{onSendMessage("mimi8",2,"","","")},
    child:Image.asset(
    "assets/img/mimi8.gif",
    width:50.0,
    height: 50.0,
    fit:BoxFit.cover
    )
    ),
    FlatButton(
    onPressed: ()=>{onSendMessage("mimi9",2,"","","")},
    child:Image.asset(
    "assets/img/mimi9.gif",
    width:50.0,
    height: 50.0,
    fit:BoxFit.cover
    )
    ),
    ],
    ),
    ],

    ),
    decoration: BoxDecoration(
    border:Border(
    top:BorderSide(
    color:const Color(0xff141726),
    width:1,
    )
    ),
    color: const Color(0xff1A1D30),

    ),
    padding: EdgeInsets.all(5.0),
    height:180.0
    );
    }

    Future getImage() async{

    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(imageFile != null)
    {
    setState(() {
    isLoading=true;

    });
    }

    uploadImageFile();
    }

    Future getVideo() async{
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['ogg','mp4','webm','mpg', 'mp2', 'mpeg', 'mpe', 'mpv'],
      );

      if(result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          isLoading=true;

        });

        print(file.name);
        uploadVideoFile(file.name,File(file.path));
        setState(() {
//                                  filename=file.name;
        });
      } else {
        // User canceled the picker
      }

    }

    getSticker()
    {
    focusNode.unfocus();
    print("hello worldd");
    setState(() {
    isDisplaySticker = !isDisplaySticker;
    });
    }

    Future uploadImageFile() async{
    String fileName=DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference storageReference=FirebaseStorage.instance.ref().child("Live Chat Images").child("myMood").child(fileName);
    StorageUploadTask storageUploadTask=storageReference.putFile(imageFile);
    StorageTaskSnapshot storageTaskSnapshot=await storageUploadTask.onComplete;
    storageTaskSnapshot.ref.getDownloadURL().then((value) => onSendMessage(value,1,"","",""));


    storageTaskSnapshot.ref.getDownloadURL().then((value) => (downloadUrl){
    url=downloadUrl;
    print("downloadable    "+downloadUrl);

    },onError: (error){
    setState(() {
    isLoading=false;
    });
    Fluttertoast.showToast(msg: "Error: "+error);
    });
    }


    Future uploadVideoFile(String filename, File file) async{
    StorageReference storageReference=FirebaseStorage.instance.ref().child("Live Chat Images").child("myMood").child(filename);
    StorageUploadTask storageUploadTask=storageReference.putFile(file);
    StorageTaskSnapshot storageTaskSnapshot=await storageUploadTask.onComplete;
    storageTaskSnapshot.ref.getDownloadURL().then((value) => onSendMessage(value,14,filename,"",""));

    storageTaskSnapshot.ref.getDownloadURL().then((value) => (downloadUrl){
    url=downloadUrl;
    print("downloadable    "+downloadUrl);

    },onError: (error){
    setState(() {
    isLoading=false;
    });
    Fluttertoast.showToast(msg: "Error: "+error);
    });
    }


    Future uploadDocFile(String name, File file) async{
      setState(() {
        isLoading=true;
      });
    StorageReference storageReference=FirebaseStorage.instance.ref().child("Live Chat Images").child("myMood").child(name);
    StorageUploadTask storageUploadTask=storageReference.putFile(file);
    StorageTaskSnapshot storageTaskSnapshot=await storageUploadTask.onComplete;
    storageTaskSnapshot.ref.getDownloadURL().then((value) => onSendMessage(value,11,name,"",""));


    storageTaskSnapshot.ref.getDownloadURL().then((value) => (downloadUrl){
    url=downloadUrl;
    print("downloadable    "+downloadUrl);

    },onError: (error){
    setState(() {
    isLoading=false;
    });
    Fluttertoast.showToast(msg: "Error: "+error);
    });
    }

    Future uploadDocFileMp3(String name, File file) async{
      setState(() {
        isLoading=true;
      });
    StorageReference storageReference=FirebaseStorage.instance.ref().child("Live Chat Images").child("myMood").child(name);
    StorageUploadTask storageUploadTask=storageReference.putFile(file);
    StorageTaskSnapshot storageTaskSnapshot=await storageUploadTask.onComplete;
    storageTaskSnapshot.ref.getDownloadURL().then((value) => onSendMessage(value,13,name,"",""));


    storageTaskSnapshot.ref.getDownloadURL().then((value) => (downloadUrl){
    url=downloadUrl;
    print("downloadable    "+downloadUrl);

    },onError: (error){
    setState(() {
    isLoading=false;
    });
    Fluttertoast.showToast(msg: "Error: "+error);
    });
    }


    circularProgress() {
    return Center(
    child:NutsActivityIndicator(
    radius: 25,
    relativeWidth: 0.5,
    )
    );

    }
    Future<bool> onBackPress()
    {
      if (isEmojiVisible) {
        toggleEmojiKeyboard();
      }
      else
      {
        Navigator.of(context).pop();
      }

      return Future.value(false);

    }
    Future<String> getStringValue(String key) async {
    // get shared preference instance.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Set the key ('isLoggenIn') with a value (true/false) here.
    String value = prefs.getString(key);
    return value;
    }
    createListMessage()
    {
    return Flexible(
    child:StreamBuilder(
    stream:FirebaseFirestore.instance.collection("Message Friends").doc("myMood")
        .collection(widget.roomID).orderBy(
        "timestamp", descending: true)
        .snapshots(),
    builder: (context,snapshot)
    {

    if(!snapshot.hasData)
    {
    return  Center(
    child:NutsActivityIndicator(
    radius: 25,
    relativeWidth: 0.5,
    )
    );
    }
    else{
    //listMessages=snapshot.data.documents;
    return ListView.builder(
    padding: EdgeInsets.all(0.0),
    itemBuilder: (context,index) {
      return createItem(index, snapshot.data.documents[index]);
    },
    itemCount: snapshot.data.documents.length,
    physics: AlwaysScrollableScrollPhysics(),
    reverse: true,
    controller: scrollController,
    );
    }
    },
    )
    );
    }

    onSendMessage(String url,int type,String fileName,String lat,String lon) async {
    if(url != "")
    {
    setState(() {
    isLoading=false;
    });
    String uid=await getStringValue("UserID");
print(widget.roomID);
    var docRef=FirebaseFirestore.instance.collection("Message Friends").doc("myMood")
        .collection(widget.roomID).doc(DateTime.now().millisecondsSinceEpoch.toString());
    print(docRef);
    FirebaseFirestore.instance.runTransaction((transaction) async => {
      transaction.set(docRef, {
        'toID':widget.otherID,
        'Lat':lat,
        'Long':lon,
        'fileName':fileName,
        'fromID':myID,
        'isRead':false,
        'content':url,
        'fromName':myName,
        'fromPic':myPic,
        'toName':widget.otherName,
        'toPic':widget.otherPic,
        'type':type,
        'timestamp':DateTime.now().millisecondsSinceEpoch.toString(),
        "reciever_token":"",
      })
    }).then((value) {
      messageController.clear();
      if (isKeyboardVisible) {
        FocusScope.of(context).unfocus();
      }
      if(isEmojiVisible) {
        setState(() {
          isEmojiVisible = !isEmojiVisible;
        });
      }
      scrollController.animateTo(0.0, duration: Duration(microseconds: 300), curve: Curves.easeOut);
    }).catchError((onError,stack){
      print('firebase error ${onError}');
    });


    String name=await getStringValue("UserName");
    // _sendNotification(selected_fcm,"Message from "+name,url,type);
    }
    else
    {
    Fluttertoast.showToast(msg: "Empty message cannot be send");
    }

    }
    _onStartScroll(ScrollMetrics metrics) {
      print("Scroll Start");
      setState(() {
        //listViewIndex=metrics.pixels.toString();
      });
    }

    _onUpdateScroll(ScrollMetrics metrics) {
      print("Scroll Update"+metrics.pixels.toString());
      setState(() {
        listViewIndex=metrics.pixels.toString();
      });
    }

    _onEndScroll(ScrollMetrics metrics) {
 //     print("Scroll End");
    }
    sendMessage() {

  //  focusNode.unfocus();
    if(messageController.text.toString().length > 0)
    {
    onSendMessage(messageController.text, 0,"","","");
    }
    }

    Widget  popupMenu(BuildContext context)
    {
      return ScaleTransition(
        scale: _fabAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(

                runSpacing: 20.0, // gap between lines
                children: [
                  Container(
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize:MainAxisSize.max,
                      children: [
                         Expanded(
                          flex:1,
                          child: InkWell(
                            onTap:(){
                              setState(() {
                                showMenu=false;
                              });
                              getImage();
                            },
                            child: Column(
                              children: [
                                Icon(Icons.image,
                                    color:const Color(0xff000000),
                                size: 32,),
                                SizedBox(height:3),
                                Text("Image",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize:13,
                                ),)
                              ],
                            ),
                          ),
                        ),
                         Expanded(
                           flex:1,
                           child: InkWell(
                             onTap:() async {
                               setState(() {
                                 showMenu=false;
                               });

                               final gif = await GiphyPicker.pickGif(
                                 context:context,
                                 fullScreenDialog: false,
                                 showPreviewPage: true,
                                 apiKey: gifAPIKey,
                                 decorator: GiphyDecorator(
                                   showAppBar: false,
                                   searchElevation: 4,
                                   giphyTheme: ThemeData.dark(),
                                 ),
                               );
                               if(gif!=null){
                                 setState(() {
                                   _gif = gif;
                                   onSendMessage(json.encode(gif), 6,"","","");
                                 });
                               }

                             },
                             child: Column(
                               children: [
                                 Icon(Icons.gif,
                                     color:const Color(0xff000000),
                                 size: 32,),
                                 SizedBox(height:3),
                                 Text("GIF",
                                 style: TextStyle(
                                   fontFamily: 'Poppins',
                                   fontSize:13,
                                 ),)
                               ],
                             ),
                           ),
                         ),
                         Expanded(
                           flex:1,
                           child: InkWell(
                             onTap:(){
                               setState(() {
                                 showMenu=false;
                               });
                               getVideo();
                             },

                             child: Column(
                              children: [
                                Icon(Icons.video_call_sharp,
                                    color:const Color(0xff000000),
                                size: 32,),
                                SizedBox(height:3),
                                Text("Video",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize:13,
                                ),)
                              ],
                            ),
                           ),
                         ),
                      ],


                    ),
                  ),
                  Container(
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize:MainAxisSize.max,
                      children: [
                        Expanded(
                          flex:1,
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                showMenu=false;
                              });
                              FilePickerResult result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf'],
                              );

                              if(result != null) {
                                PlatformFile file = result.files.first;

                                print(file.name);
                                uploadDocFile(file.name,File(file.path));
                                setState(() {
//                                  filename=file.name;
                                });
                              } else {
                                // User canceled the picker
                              }
                            },

                            child: Column(
                              children: [
                                Icon(Icons.file_copy,
                                    color:const Color(0xff000000),
                                size: 32,),
                                SizedBox(height:3),
                                Text("Document",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize:13,
                                ),)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                           flex:1,
                           child: InkWell(
                             onTap: () async {
                               setState(() {
                                 showMenu=false;
                               });
                               FilePickerResult result = await FilePicker.platform.pickFiles(
                                 type: FileType.custom,
                                 allowedExtensions: ['mp3'],
                               );

                               if(result != null) {
                                 PlatformFile file = result.files.first;

                                 print(file.name);
                                 uploadDocFileMp3(file.name,File(file.path));
                                 setState(() {
//                                  filename=file.name;
                                 });
                               } else {
                                 // User canceled the picker
                               }
                             },

                             child: Column(
                               children: [
                                 Icon(Icons.audiotrack_outlined,
                                     color:const Color(0xff000000),
                                 size: 32,),
                                 SizedBox(height:3),
                                 Text("Audio",
                                 style: TextStyle(
                                   fontFamily: 'Poppins',
                                   fontSize:13,
                                 ),)
                               ],
                             ),
                           ),
                         ),
                        Expanded(
                           flex:1,
                           child: InkWell(
                             onTap: (){
                               setState(() {
                                 showMenu=false;
                               });

                               // Geolocator.requestPermission().then((value) {
                                 _determinePosition();
//                               });
                             },
                             child: Column(
                              children: [
                                Icon(Icons.add_location_alt_outlined,
                                    color:const Color(0xff000000),
                                size: 32,),
                                SizedBox(height:3),
                                Text("Location",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize:13,
                                ),)
                              ],
                            ),
                           ),
                         ),
                      ],


                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }


    
    Widget createItem(int index, DocumentSnapshot documentSnapshot)
    {

     Map getDocs = documentSnapshot.data();
     String thumbnail="";
    if(getDocs["fromID"] == myID)
     {
           return Container(
             padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
             child: Row(
               mainAxisAlignment:MainAxisAlignment.start,
               children: <Widget>[
                 CircleAvatar(
                   backgroundImage: NetworkImage(myPic),
                   maxRadius: 20,
                 )
                 ,SizedBox(width: 6,),
                 getDocs["type"] == 0
                     ?Flexible(
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.white12,
                     ),
                     padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text(getDocs["content"],
                           style: TextStyle(
                               fontSize: 12,
                               fontFamily: "PoppinsMedium",
                               color: Colors.white,
                               fontWeight: FontWeight.w400
                           ),),
                         SizedBox(height: 2,),
                         Text(DateFormat("dd-MM-yy hh:mm aa").format(
                             DateTime.fromMillisecondsSinceEpoch(int.parse(
                                 getDocs["timestamp"])))
                           ,
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               fontSize: 10,

                               fontFamily: "Poppins",
                               color: Colors.white,
                               fontWeight: FontWeight.w200
                           ),),

                       ],
                     ),
                   ),
                 )
                     :getDocs["type"] == 1
                     ?Flexible(
                   child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         InkWell(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (context) => FullPhoto(url: getDocs['content'])
                             ));
                           },
                           child: Material(

                             elevation: 0,

                             child: CachedNetworkImage(
                               placeholder: (context,url) => Container(
                                 child:NutsActivityIndicator(
                                   radius: 15,
                                   relativeWidth: 0.5,
                                 ),
                                 width: 200,
                                 height: 200,
                                 padding: EdgeInsets.all(70.0),
                                 decoration: BoxDecoration(
                                     color: Colors.grey,
                                     borderRadius: BorderRadius.all(Radius.circular(8.0))
                                 ),
                               ),
                               errorWidget: (context,url,error) => Material(
                                 child: Image.asset("images/img_not_available.jpeg",width:200,height:200,fit: BoxFit.cover,),
                                 borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                 clipBehavior: Clip.hardEdge,

                               ),
                               imageUrl: getDocs["content"],
                               width:200,height:200,fit: BoxFit.cover,alignment:Alignment.centerLeft ,

                             ),
                             borderRadius: BorderRadius.all(Radius.circular(8.0)),
                             clipBehavior: Clip.hardEdge,
                           ),
                         ),
                         SizedBox(height: 2,),
                         Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                           ,
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               fontSize: 10,

                               fontFamily: "PoppinsMedium",
                               color: Colors.white,
                               fontWeight: FontWeight.w200
                           ),),

                       ],
                     ),
                   ),
                 )
                     :getDocs["type"] == 12
                     ?Flexible(
                   child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Column(
                           children: [
                             InkWell(
                               onTap: () {
                                 openMap(double.parse(getDocs['Lat'].toString()),double.parse(getDocs['Long'].toString()));
                               },
                               child: Material(

                                 elevation: 0,

                                 child: Image.asset(
                                     "images/google_map_sc.png",
                                     width: 200,
                                     height:200
                                 ),
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                                 clipBehavior: Clip.hardEdge,
                               ),
                             ),
                             Container(
                               width: 200,
                               decoration: BoxDecoration(
                                   color: Colors.white12,
                                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                                   border: Border(
                                     top: BorderSide(
                                         color:Colors.white,
                                         width: 5
                                     ),
                                     bottom: BorderSide(
                                         color:Colors.white,
                                         width: 5
                                     ),
                                     left: BorderSide(
                                         color:Colors.white,
                                         width: 5
                                     ),
                                     right: BorderSide(
                                         color:Colors.white,
                                         width: 5
                                     ),
                                   )

                               ),

                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Flex(
                                   direction: Axis.horizontal,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                     Expanded(child: Text(getDocs['content'].toString(),
                                       style: TextStyle(
                                           fontSize: 14,

                                           fontFamily: "PoppinsMedium",
                                           color: Colors.white,
                                           fontWeight: FontWeight.w200
                                       ),textAlign: TextAlign.center,)),
                                   ],
                                 ),
                               ),

                             ),
                           ],
                         ),
                         SizedBox(height: 2,),
                         Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                           ,
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               fontSize: 10,

                               fontFamily: "PoppinsMedium",
                               color: Colors.white,
                               fontWeight: FontWeight.w200
                           ),),

                       ],
                     ),
                   ),
                 )
                     :getDocs["type"] == 11
                     ?Flexible(
                   child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         InkWell(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (context) => PDFViews(url: getDocs['content'],name:getDocs['fileName'])
                             ));
                           },
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Colors.white12,
                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                                 border: Border(
                                   top: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                   bottom: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                   left: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                   right: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                 )

                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Flex(
                                 direction: Axis.horizontal,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   Icon(
                                       Icons.file_present,
                                       color: Colors.white,
                                       size:28
                                   ),
                                   SizedBox(width: 8.0,),
                                   Expanded(child: Text(getDocs['fileName'].toString(),
                                     style: TextStyle(
                                         fontSize: 14,

                                         fontFamily: "PoppinsMedium",
                                         color: Colors.white,
                                         fontWeight: FontWeight.w200
                                     ),textAlign: TextAlign.center,)),
                                 ],
                               ),
                             ),

                           ),
                         ),
                         SizedBox(height: 2,),
                         Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                           ,
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               fontSize: 10,

                               fontFamily: "PoppinsMedium",
                               color: Colors.white,
                               fontWeight: FontWeight.w200
                           ),),

                       ],
                     ),
                   ),
                 )
                     :getDocs["type"] == 13
                     ?Flexible(
                   child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         InkWell(
                           onTap: () async {
                             try {


                               await assetsAudioPlayer.open(
                                 Audio.network(getDocs['content']),
                               );
//                               assetsAudioPlayer.playOrPause();
                             } catch (t) {
                               //mp3 unreachable
                             }
                           },
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Colors.white12,
                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                                 border: Border(
                                   top: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                   bottom: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                   left: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                   right: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                 )

                             ),

                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Flex(
                                 direction: Axis.horizontal,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   Icon(
                                       Icons.music_note_outlined,
                                       color: Colors.white,
                                       size:28
                                   ),
                                   SizedBox(width: 8.0,),
                                   Icon(
                                       Icons.play_arrow,
                                       color: Colors.white,
                                       size:28
                                   ),
                                   SizedBox(width: 8.0,),
                                   Expanded(child: Text(getDocs['fileName'].toString(),
                                     style: TextStyle(
                                         fontSize: 14,

                                         fontFamily: "PoppinsMedium",
                                         color: Colors.white,
                                         fontWeight: FontWeight.w200
                                     ),textAlign: TextAlign.center,)),
                                 ],
                               ),
                             ),

                           ),
                         ),
                         SizedBox(height: 2,),
                         Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                           ,
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               fontSize: 10,

                               fontFamily: "PoppinsMedium",
                               color: Colors.white,
                               fontWeight: FontWeight.w200
                           ),),

                       ],
                     ),
                   ),
                 )
                     :getDocs["type"] == 14
                     ?Flexible(
                   child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         InkWell(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (context) => VideoPlayerWidget(url: getDocs['content'])
                             ));
                           },
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Colors.white12,
                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                                 border: Border(
                                   top: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                   bottom: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                   left: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                   right: BorderSide(
                                       color:Colors.white,
                                       width: 5
                                   ),
                                 )

                             ),

                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Flex(
                                 direction: Axis.horizontal,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   Icon(
                                       Icons.video_library,
                                       color: Colors.white,
                                       size:28
                                   ),
                                   SizedBox(width: 8.0,),
                                   Expanded(child: Text(getDocs['fileName'].toString(),
                                     style: TextStyle(
                                         fontSize: 14,

                                         fontFamily: "PoppinsMedium",
                                         color: Colors.white,
                                         fontWeight: FontWeight.w200
                                     ),textAlign: TextAlign.center,)),
                                 ],
                               ),
                             ),

                           ),
                         ),
                         SizedBox(height: 2,),
                         Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                           ,
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               fontSize: 10,

                               fontFamily: "PoppinsMedium",
                               color: Colors.white,
                               fontWeight: FontWeight.w200
                           ),),

                       ],
                     ),
                   ),
                 )
                     :getDocs["type"]==6
                     ?Flexible(
                   child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [

                         GiphyImage.original(gif: GiphyGif.fromJson(json.decode(getDocs['content'])),
                             fit: BoxFit.fitWidth,
                             width:200,
                             placeholder: Container(
                               child: NutsActivityIndicator(
                                 radius: 15,
                                 relativeWidth: 0.5,
                               ),
                               padding: EdgeInsets.all(60.0),
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.all(
                                       Radius.circular(5.0))
                               ),
                             )),
                         SizedBox(height: 2,),
                         Text(DateFormat("dd-MM-yy hh:mm aa").format(
                             DateTime.fromMillisecondsSinceEpoch(int.parse(
                                 getDocs["timestamp"]))),
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               fontSize: 10,
                               fontFamily: "Poppins",
                               color: Colors.white,
                               fontWeight: FontWeight.w200
                           ),),

                       ],
                     ),
                   ),

                 )
                     :Flexible(
                   child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [

                         Image.asset("images/${getDocs['content']}.gif",
                             width: 100.0,
                             height: 100.0,
                             fit:BoxFit.cover
                         ),
                         SizedBox(height: 2,),
                         Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"]))),
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               fontSize: 10,
                               fontFamily: "PoppinsMedium",
                               color: Colors.black54,
                               fontWeight: FontWeight.w200
                           ),),

                       ],
                     ),
                   ),

                 ),
               ],
             ),
           );
     }
     else
     {
       if(getDocs['isRead'] == false)
       {
         print('lili');
         FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
           myTransaction.update(documentSnapshot.reference, {'isRead': true});
         });

       }
       return Container(
         padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
         child: Row(
           mainAxisAlignment:MainAxisAlignment.end,
           children: <Widget>[
             getDocs["type"] == 0
                 ?Flexible(
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.blue.withOpacity(0.3),
                 ),
                 padding: EdgeInsets.fromLTRB(16,10,16,10),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text(getDocs["content"],
                       style: TextStyle(
                           fontSize: 12,
                           fontFamily: "PoppinsMedium",
                           color: Colors.white60,
                           fontWeight: FontWeight.w600
                       ),),
                     SizedBox(height: 2,),
                     Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                       ,
                       textAlign: TextAlign.start,
                       style: TextStyle(
                           fontSize: 10,
                           fontFamily: "PoppinsMedium",
                           color: Colors.white60,
                           fontWeight: FontWeight.w200
                       ),),

                   ],
                 ),
               ),
             )
                 :getDocs["type"] == 1
                 ?Flexible(
               child: Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     InkWell(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context) => FullPhoto(url: getDocs['content'])
                         ));
                       },
                       child: Material(
                         child: CachedNetworkImage(
                             placeholder: (context,url) => Container(
                               child:NutsActivityIndicator(
     radius: 15,
     relativeWidth: 0.5,
     ),
                               width: 200,
                               height: 200,
                               padding: EdgeInsets.all(70.0),
                               decoration: BoxDecoration(
                                   color: Colors.grey,
                                   borderRadius: BorderRadius.all(Radius.circular(8.0))
                               ),
                             ),
                             errorWidget: (context,url,error) => Material(
                               child: Image.asset("images/img_not_available.jpeg",width:200,height:200,fit: BoxFit.cover,),
                               borderRadius: BorderRadius.all(Radius.circular(8.0)),
                               clipBehavior: Clip.hardEdge,

                             ),
                             imageUrl: getDocs["content"],
                             width:200,height:200,fit: BoxFit.cover

                         ),
                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                         clipBehavior: Clip.hardEdge,
                       ),
                     ),
                     SizedBox(height: 2,),
                     Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                       ,
                       textAlign: TextAlign.end,
                       style: TextStyle(
                           fontSize: 10,
                           fontFamily: "PoppinsMedium",
                           color: Colors.white,
                           fontWeight: FontWeight.w200
                       ),),
                   ],
                 ),
               ),
             )
                 :getDocs["type"] == 12
                 ?Flexible(
               child: Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Column(
                       children: [
                         InkWell(
                           onTap: () {
                             openMap(double.parse(getDocs['Lat'].toString()),double.parse(getDocs['Long'].toString()));
                             // Navigator.push(context, MaterialPageRoute(
                             //     builder: (context) => FullPhoto(url: getDocs['content'])
                             // ));
                           },
                           child: Material(
                             child:Image.asset(
                                 "images/google_map_sc.png",
                                 width: 200,
                                 height:200
                             ),
                             borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                             clipBehavior: Clip.hardEdge,
                           ),
                         ),
                         Container(
                           width:200,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                               color: Colors.blue.withOpacity(0.3),
                               border: Border(
                                 top: BorderSide(
                                     color:Colors.white,
                                     width: 5
                                 ),
                                 bottom: BorderSide(
                                     color:Colors.white,
                                     width: 5
                                 ),
                                 left: BorderSide(
                                     color:Colors.white,
                                     width: 5
                                 ),
                                 right: BorderSide(
                                     color:Colors.white,
                                     width: 5
                                 ),
                               )

                           ),

                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Flex(
                               direction: Axis.horizontal,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Expanded(child: Text(getDocs['content'].toString(),
                                   style: TextStyle(
                                       fontSize: 14,

                                       fontFamily: "PoppinsMedium",
                                       color: Colors.white,
                                       fontWeight: FontWeight.w200
                                   ),textAlign: TextAlign.center,)),

                               ],
                             ),
                           ),

                         ),
                       ],
                     ),
                     SizedBox(height: 2,),
                     Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                       ,
                       textAlign: TextAlign.end,
                       style: TextStyle(
                           fontSize: 10,
                           fontFamily: "PoppinsMedium",
                           color: Colors.white,
                           fontWeight: FontWeight.w200
                       ),),
                   ],
                 ),
               ),
             )
                 :getDocs["type"] == 11
                 ?Flexible(
               child: Container(
                 child: Column(

                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     InkWell(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context) => PDFViews(url: getDocs['content'],name:getDocs['fileName'])
                         ));
                       },
                       child: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                             color: Colors.blue.withOpacity(0.3),
                             border: Border(
                               top: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                               bottom: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                               left: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                               right: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                             )

                         ),

                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Flex(
                             direction: Axis.horizontal,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Expanded(child: Text(getDocs['fileName'].toString(),
                                 style: TextStyle(
                                     fontSize: 14,

                                     fontFamily: "PoppinsMedium",
                                     color: Colors.white,
                                     fontWeight: FontWeight.w200
                                 ),textAlign: TextAlign.center,)),
                               SizedBox(width: 8.0,),

                               Icon(
                                   Icons.file_present,
                                   color: Colors.white,
                                   size:28
                               ),
                             ],
                           ),
                         ),

                       ),
                     ),
                     SizedBox(height: 2,),
                     Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                       ,
                       textAlign: TextAlign.end,
                       style: TextStyle(
                           fontSize: 10,
                           fontFamily: "PoppinsMedium",
                           color: Colors.grey,
                           fontWeight: FontWeight.w200
                       ),),

                   ],
                 ),
               ),
             )
                 :getDocs["type"] == 13
                 ?Flexible(
               child: Container(
                 child: Column(

                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     InkWell(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context) => PDFViews(url: getDocs['content'],name:getDocs['fileName'])
                         ));
                       },
                       child: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                             color: Colors.blue.withOpacity(0.3),
                             border: Border(
                               top: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                               bottom: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                               left: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                               right: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                             )

                         ),

                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Flex(
                             direction: Axis.horizontal,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Expanded(child: Text(getDocs['fileName'].toString(),
                                 style: TextStyle(
                                     fontSize: 14,

                                     fontFamily: "PoppinsMedium",
                                     color: Colors.white,
                                     fontWeight: FontWeight.w200
                                 ),textAlign: TextAlign.center,)),
                               SizedBox(width: 8.0,),

                               Icon(
                                   Icons.play_arrow,
                                   color: Colors.white,
                                   size:28
                               ),
                               SizedBox(width: 8.0,),

                               Icon(
                                   Icons.music_note_outlined,
                                   color: Colors.white,
                                   size:28
                               ),
                             ],
                           ),
                         ),

                       ),
                     ),
                     SizedBox(height: 2,),
                     Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                       ,
                       textAlign: TextAlign.end,
                       style: TextStyle(
                           fontSize: 10,
                           fontFamily: "PoppinsMedium",
                           color: Colors.grey,
                           fontWeight: FontWeight.w200
                       ),),

                   ],
                 ),
               ),
             )
                 :getDocs["type"] == 14
                 ?Flexible(
               child: Container(
                 child: Column(

                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     InkWell(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context) => VideoPlayerWidget(url: getDocs['content'])
                         ));
                       },
                       child: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                             color: Colors.blue.withOpacity(0.3),
                             border: Border(
                               top: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                               bottom: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                               left: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                               right: BorderSide(
                                   color:Colors.white,
                                   width: 5
                               ),
                             )

                         ),

                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Flex(
                             direction: Axis.horizontal,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Expanded(child: Text(getDocs['fileName'].toString(),
                                 style: TextStyle(
                                     fontSize: 14,

                                     fontFamily: "PoppinsMedium",
                                     color: Colors.white,
                                     fontWeight: FontWeight.w200
                                 ),textAlign: TextAlign.center,)),
                               SizedBox(width: 8.0,),

                               Icon(
                                   Icons.video_library,
                                   color: Colors.white,
                                   size:28
                               ),
                             ],
                           ),
                         ),

                       ),
                     ),
                     SizedBox(height: 2,),
                     Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                       ,
                       textAlign: TextAlign.end,
                       style: TextStyle(
                           fontSize: 10,
                           fontFamily: "PoppinsMedium",
                           color: Colors.white,
                           fontWeight: FontWeight.w200
                       ),),

                   ],
                 ),
               ),
             )
                 :getDocs["type"] == 6
                 ? Flexible(
     child: Container(

     child: Column(
     crossAxisAlignment: CrossAxisAlignment.end,
     children: [
     GiphyImage.original(gif: GiphyGif.fromJson(json.decode(getDocs['content'])),
     fit: BoxFit.fitWidth,
     width:200,
     placeholder: Container(
     child: NutsActivityIndicator(
     radius: 15,
     relativeWidth: 0.5,
     ),
     padding: EdgeInsets.all(60.0),
     decoration: BoxDecoration(
     color: Colors.white,
     borderRadius: BorderRadius.all(
     Radius.circular(5.0))
     ),
     )),
     SizedBox(height: 2,),
     Text(DateFormat("dd-MM-yy hh:mm aa").format(
     DateTime.fromMillisecondsSinceEpoch(int.parse(
     getDocs["timestamp"])))
     ,
     textAlign: TextAlign.start,
     style: TextStyle(
     fontSize: 10,
     fontFamily: "Poppins",
     color: Colors.white,
     fontWeight: FontWeight.w200
     ),),


     ],
     ),

     ),

     )
                 :Flexible(
               child: Container(

                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Image.asset("images/${getDocs['content']}.gif",
                         width: 100.0,
                         height: 100.0,
                         fit:BoxFit.cover
                     ),
                     SizedBox(height: 2,),
                     Text(DateFormat("dd-MM-yy hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(getDocs["timestamp"])))
                       ,
                       textAlign: TextAlign.start,
                       style: TextStyle(
                           fontSize: 10,
                           fontFamily: "PoppinsMedium",
                           color: Colors.black54,
                           fontWeight: FontWeight.w200
                       ),),


                   ],
                 ),

               ),

             ),
             SizedBox(width: 6,),

             CircleAvatar(
               backgroundImage: NetworkImage(widget.otherPic),
               maxRadius: 20,
             )

           ],
         ),
       );

     }

   }

 Future<String> getThumbnail(String path) async{

  final thumbnail =  await VideoThumbnail.thumbnailFile(
    video: path,
    thumbnailPath: (await getTemporaryDirectory()).path,
    imageFormat: ImageFormat.JPEG,
    maxHeight: 128, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
    quality: 100,
  );

  return File(thumbnail).path;

}

  showLocationPermissionDialog(BuildContext context, GestureTapCallback onPressed, String msg)
  {
// set up the buttons
    Widget continueButton = FlatButton(child: Text("OK"), onPressed: onPressed);

// set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Location Permission Required"),
      content: Text(msg),
      actions: [
        continueButton,
      ],
    );

// show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {


      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        print(
            "-------------Location permissions are permantly denied, we cannot request permissions------------");
        showLocationPermissionDialog(context, () async {
//AppSettings.openAppSettings();
          Navigator.pop(context);
          await Geolocator.openAppSettings();



          Geolocator.requestPermission().then((value) {
//          _determinePosition();
          });
        }, "You cannot use this application until you allow location,Location permissions are permanently denied please allow from Settings");
      }
      else if (permission == LocationPermission.denied) {
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          print(
              "-------------Location permissions are denied (actual value: $permission).-----------");
          showLocationPermissionDialog(context, () async {
            await Permission.location.request();
            Navigator.pop(context);
            _determinePosition();
          }, "You cannot use this application until you allow location permission");
        }
      }
      else{

        print("-------------Location services are allow------------");
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        _saveString("myLongitude", position.longitude.toString());
        _saveString("myLatitude", position.latitude.toString());

        Route route = MaterialPageRoute(builder: (context) => GetAddressFromMap(roomID: widget.roomID,
        otherID: widget.otherID,
        otherName: widget.otherName,
        otherPic:widget.otherID));

        Navigator.pushReplacement(context, route);
      }
    } else if (!serviceEnabled) {
      print("-------------Location services are disabled------------");
    }




  }

  Future<String> _getStringValue(String key) async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String val=pref.getString(key);
    return val;
  }

  Future<void> _saveString(String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
    await prefs.setString(key, value);
  }
    Widget createItemTop(int index, DocumentSnapshot documentSnapshot) {

    Map getDocs = documentSnapshot.data();
    if (getDocs["type"] == 1) {
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                      borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(20.0),
                          bottomRight: const Radius.circular(20.0),
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0)),
                      clipBehavior: Clip.hardEdge,

                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  FullPhoto(url: getDocs['content'])
                          ));
                        },
                        child: Material(

                          elevation: 0,

                          child: CachedNetworkImage(
                            placeholder: (context, url) =>
                                Container(
                                  child: NutsActivityIndicator(
                                    radius: 15,
                                    relativeWidth: 0.5,
                                  ),
                                  padding: EdgeInsets.all(120.0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                                Material(
                                  child: Image.asset(
                                    "assets/img/img_not_available.jpeg",
                                    fit: BoxFit.cover,width: 200,height: 200,),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0)),
                                  clipBehavior: Clip.hardEdge,

                                ),
                            imageUrl: getDocs["content"],
                            fit: BoxFit.cover,
                            alignment: Alignment.center,

                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          clipBehavior: Clip.hardEdge,
                        ),
                      )
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        10, 0, 10, 0),
                    child:
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround,

                      children: <Widget>[
                        Text(
                          getDocs["name"],
                          style: TextStyle(fontSize: 16.0,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(DateFormat("dd-MM-yy hh:mm aa").format(
                            DateTime.fromMillisecondsSinceEpoch(int.parse(
                                getDocs["timestamp"])))
                          ,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 10,

                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontWeight: FontWeight.w200
                          ),)
                      ],
                    )


                ),
              ),
            ],
          ),
        ),
      );
    }
    else if (getDocs["type"] == 5) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child:Center(
          child:Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Flexible(flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      constraints: BoxConstraints(
                          minHeight: 200),
                      padding: const EdgeInsets.all(8.0),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(

                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Text(getDocs['content'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,

                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontWeight: FontWeight.w200
                            ),

                          ),
                        ),
                      ),

                    ),
                  )),
              Flexible(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        10, 0, 10, 0),
                    child:
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround,

                      children: <Widget>[
                        Text(
                          getDocs["name"],
                          style: TextStyle(fontSize: 16.0,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(DateFormat("dd-MM-yy hh:mm aa").format(
                            DateTime.fromMillisecondsSinceEpoch(int.parse(
                                getDocs["timestamp"])))
                          ,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 10,

                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontWeight: FontWeight.w200
                          ),)
                      ],
                    )


                ),
              ),
            ],
          )
          )
        );
    }
    else  {
      return Container(
        width: 0,
        height: 0,
      );

    }


    }
    void onClickedEmoji() async {
      if (isEmojiVisible) {
        focusNode.requestFocus();
      } else if (isKeyboardVisible) {
        FocusScope.of(context).unfocus();
        await SystemChannels.textInput.invokeMethod('TextInput.hide');
        await Future.delayed(Duration(milliseconds: 10));
      }
      toggleEmojiKeyboard();
    }
   void onEmojiSelected(String emoji) => setState(() {
     messageController.text = messageController.text + emoji;
   });

   Future toggleEmojiKeyboard() async {
     if (isKeyboardVisible) {
       FocusScope.of(context).unfocus();
     }

     setState(() {
       isEmojiVisible = !isEmojiVisible;
     });
   }
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

}





