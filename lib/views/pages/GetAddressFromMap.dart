import 'dart:async';

import 'package:dogluv_user_app/views/pages/ChatDetail.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetAddressFromMap extends StatefulWidget {
  String roomID;
  String otherName;
  String otherPic;
  String otherID;
  GetAddressFromMap({@required this.roomID
    ,@required this.otherName
    ,@required this.otherPic
    ,@required this.otherID});

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<GetAddressFromMap> {
  String myLongitude="";
  String myLatitude="";
  Completer<GoogleMapController> controller1;
  Map<MarkerId, Marker> __markers = <MarkerId, Marker>{};
  PickResult selectedPlace;
  //static LatLng _center = LatLng(-15.4630239974464, 28.363397732282127);
  final Set<Marker> _markers = {};
  static LatLng _initialPosition;
  static LatLng _lastMapPosition = _initialPosition;
  String current_address="";
  bool showMap=false;
  @override
  void initState() {
    _getStringValue("myLatitude").then((value) {
      setState(() {
        myLatitude=value;
      });

      _getStringValue("myLongitude").then((value) {
        setState(() {
          myLongitude=value;
          showMap=true;

          _initialPosition = LatLng(double.parse(myLatitude),double.parse(myLongitude));
          _getLocation(_initialPosition);
        });
      });

    });
    super.initState();

    _getUserLocation();
  }

  void _getUserLocation() async {
    // Position position = await Geolocator().getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(
    //     position.latitude, position.longitude);
    // setState(() {
    //   _initialPosition = LatLng(position.latitude, position.longitude);
    //   print('${placemark[0].name}');
    // });
    //

  }


  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1.complete(controller);
    });
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
    _getLocation(_lastMapPosition);
  }


  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: function,
      child: icon,
      shape: new CircleBorder(),
      elevation: 8.0,
      fillColor: color,
      padding: const EdgeInsets.all(10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: PlacePicker(
            // apiKey: "AIzaSyADfrBcK2YHqmSLxvY1Xyoua68jpH7YCLo",
            apiKey: "AIzaSyAIx_eL01XVZ07Ld1Ad09orDmV3httbrgo",
            initialPosition: _initialPosition,
            useCurrentLocation: true,

            desiredLocationAccuracy: LocationAccuracy.high,
            enableMapTypeButton: true,
            enableMyLocationButton: true,
            initialMapType: MapType.satellite,
            resizeToAvoidBottomInset: true,
            selectInitialPosition: true,
            usePlaceDetailSearch: true,

            onPlacePicked: (result) {
              selectedPlace = result;
              print("selectedPlace ${selectedPlace}");
//          Navigator.of(context).pop();
              setState(() {});
            },
            //forceSearchOnZoomChanged: true,

            automaticallyImplyAppBarLeading: false,
            //autocompleteLanguage: "ko",
            //region: 'au',
            //selectInitialPosition: true,
            selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
              print("state: $state, isSearchBarFocused: $isSearchBarFocused");
              return isSearchBarFocused
                  ? Container(
                margin: EdgeInsets.only(top:20),
              )
                  : FloatingCard(
                bottomPosition: 20.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                leftPosition: 20.0,
                rightPosition: 20.0,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
              child:Container(
                padding: EdgeInsets.all(10.0),
                child: state == SearchingState.Searching
                    ? Center(

                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),

                        ),
                        SizedBox(height: 10,)

                      ],
                    )
                )
                    : Center(
                  child: Column(

                    children: [
                      Text(selectedPlace.formattedAddress,
                        textAlign: TextAlign.center,
                        style: TextStyle(

                          fontWeight: FontWeight.w300,
                          color:Colors.red,
                          fontSize: 15,
                          fontFamily: "PoppinsMedium",
                        ),),
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.red,
                        elevation: 10,
                        child: Text("Pick Here",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color:Colors.white,
                            fontSize: 13,
                            fontFamily: "PoppinsMedium",
                          ),),
                        onPressed: () {

                          _saveString("currentAddress",selectedPlace.formattedAddress).then((value){

                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => ChatDetail(roomID: widget.roomID,
                                  otherName: widget.otherName,
                                  otherID: widget.otherID,
                                  otherPic: widget.otherPic,
                                  selectedLatitude: selectedPlace.geometry.location.lat.toString(),
                                  selectedLongitude: selectedPlace.geometry.location.lng.toString(),
                                  selectedPlace: selectedPlace.formattedAddress.toString(),)
                            ));

                          });
                          // Route route = MaterialPageRoute(builder: (context) => SignUpView(selectedPlace.formattedAddress));
                          // Navigator.pushReplacement(context, route);
                          },
                      ),
                    ],
                  ),
                ),
              ));
            },
//           pinBuilder: (context, state) {
//             if (state == PinState.Idle) {
//               return Icon(Icons.add_location);
//             } else {
//               return Icon(Icons.location_on);
//             }
//           },
          ),
        ),
      ),

    );
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
  _getLocation(LatLng MapPosition) async {
    //call this async method from whereever you need
    final coordinates = new Coordinates(
        MapPosition.latitude, MapPosition.longitude);
    print(MapPosition.latitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    print(' ${first.subThoroughfare},${first
        .thoroughfare}, ${first.featureName},${first.addressLine}, ${first
        .subAdminArea},${first.subLocality}, ${first.adminArea}, ${first.locality}');


    setState(() {
      String subThoroughfareString= first.subThoroughfare == null?"" : first.subThoroughfare;
      String thoroughfare= first.thoroughfare == null?"" : first.thoroughfare;
      String featureName= first.featureName == null?"" : first.featureName;
      String addressLine= first.addressLine == null?"" : first.addressLine;
      String subAdminArea= first.subAdminArea == null?"" : first.subAdminArea;
      String subLocality= first.subLocality == null?"" : first.subLocality;
      String adminArea= first.adminArea == null?"" : first.adminArea;
      String locality= first.locality == null?"" : first.locality;

      current_address= subThoroughfareString +", "+thoroughfare+", "+featureName+", "+addressLine+", "+subAdminArea+", "+addressLine+", "+subLocality+", "+adminArea+", "+locality;
    return first;
  });
}
}