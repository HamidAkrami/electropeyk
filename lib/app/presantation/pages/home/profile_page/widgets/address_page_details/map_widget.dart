// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';

// import 'package:latlong2/latlong.dart' as latLng;

// class MapWidgetJobProfile extends StatelessWidget {
//   latLng.LatLng? position;
//   MapWidgetJobProfile({this.position}) {}
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.35),
//           spreadRadius: 0.2,
//           blurRadius: 3,
//           offset: Offset(0, 3), // changes position of shadow
//         ),
//       ], borderRadius: BorderRadius.all(Radius.circular(40))),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(40)),
//             child: FlutterMap(
//               options: MapOptions(
//                 center: position,
//                 zoom: 13.0,
//               ),
//               layers: [
//                 TileLayerOptions(
//                     urlTemplate:
//                         "https://api.mapbox.com/styles/v1/cr7me/ckquo98p97p3x17nwjiwt6zgy/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY3I3bWUiLCJhIjoiY2txczFqNjliMTU2NjJxbmJpZ2plcGlheSJ9.bQ_5pM6WnHdac7QnK26vgA",
//                     additionalOptions: {
//                       'accessToken':
//                           "sk.eyJ1IjoiY3I3bWUiLCJhIjoiY2w2YnZ2N2FyMDBlbTNqbzFvM24yMHMxbSJ9.TgAbU78YdcZ5TsQHnHatgQ",
//                       'id': 'mapbox.mapbox-streets-v8',
//                       'language': 'fa-IR'
//                     }),
//                 MarkerLayerOptions(
//                   markers: [
//                     Marker(
//                       width: 50.0,
//                       height: 50.0,
//                       point: position!,
//                       builder: (ctx) => Container(
//                           // color: Colors.yellow,
//                           child: Stack(
//                         children: [
//                           Align(
//                               alignment: Alignment.topCenter,
//                               child: Padding(
//                                   padding: const EdgeInsets.only(top: 5.0),
//                                   child: Icon(Icons.location_on))),
//                           Align(
//                               alignment: Alignment.center,
//                               child: Icon(Icons.add)),
//                         ],
//                       )),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
