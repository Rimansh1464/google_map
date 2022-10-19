import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class googleMap extends StatefulWidget {
  const googleMap({Key? key}) : super(key: key);

  @override
  State<googleMap> createState() => _googleMapState();
}

class _googleMapState extends State<googleMap> {
  @override
  void initState() {
    latlogfinder();
    super.initState();
  }

    dynamic lat;
    dynamic long;

  latlogfinder() async {
    //PermissionStatus permissionStatus = await Permission.location.status;
    Geolocator.getPositionStream().listen((event) {
      setState(() {
        lat = event.latitude.toDouble();
        long = event.longitude.toDouble();
      });
      print("==============================================================");
      print("==============================================================");
      print(lat);
      print(long);
      print("==============================================================");
      print("==============================================================");
    });
  }

  List<Placemark> place = [];

  void _getPlace() async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, long);
    print(newPlace);
    setState(() {
      place = newPlace;
    });
  }

  @override
  late GoogleMapController controller;

  // final CameraPosition _intitalPosition =
  //     CameraPosition(target: LatLng(21.239378, 72.878378), zoom: 15);
  //Location _location = Location();

  final List<Marker> _markers = [];
  GoogleMapController? mapController;
  String address = "";

  void addmark(condinate) async {

    int id = Random().nextInt(100);
    LatLng postion = LatLng(lat, long);

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(postion.toString()),
        position: postion,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
          title: postion.toString(),
        ),
      ));

    });
  }

  // void _onCameraMove(CameraPosition position) {
  //   var positions = position.target;
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Google Map"),
      ),


      body:latlogfinder()== null ?Center(child: CircularProgressIndicator()) : Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(lat, long), zoom: 16),
            mapType: MapType.normal,
            markers: _markers.toSet(),
            myLocationEnabled: false,

          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    place.isEmpty
                        ? SizedBox()
                        : Container(
                            height: 170,
                            width: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 9,
                                      offset: Offset(3.4, 2.4))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text.rich(
                                    TextSpan(
                                        text: "name: ",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                        children: [
                                          TextSpan(
                                            text: " ${place.last.name}\n",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                          const TextSpan(
                                            text: "Street: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: "${place.first.street}\n",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                          const TextSpan(
                                            text: "Pincode: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),TextSpan(
                                            text: "${place.first.postalCode}\n",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                          const TextSpan(
                                            text: "landmark: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),TextSpan(
                                            text: "${place.first.subLocality}\n",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                          const TextSpan(
                                            text: "city: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),TextSpan(
                                            text: "${place.first.subAdministrativeArea}\n",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                          const TextSpan(
                                            text: "State: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),TextSpan(
                                            text: "${place.first.administrativeArea}\n",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                          const TextSpan(
                                            text: "Country: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),TextSpan(
                                            text: "${place.first.country}\n",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            )),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.location_on),
                      backgroundColor: Colors.red,
                      onPressed: () {
                        place.clear();
                        _markers.clear();
                        setState(() {
                          //print("----------------------;;;;;;;;;;;;;;;;;;;;;-----------${address[1]}");
                          addmark(context);
                          _getPlace();
                          LatLng newlatlang = LatLng(lat, long);
                          CameraPosition(target: LatLng(lat, long), zoom: 17);
                          mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(
                                  CameraPosition(target: newlatlang, zoom: 17)
                                  //17 is new zoom level

                                  ));
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
