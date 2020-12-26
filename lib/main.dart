import 'package:flutter/material.dart';
import 'screens/place_list_screen.dart';
import 'providers/great_places.dart';
import 'package:provider/provider.dart';
import 'screens/add_place_screen.dart';
import 'screens/details_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
          DetailsScreen.routeName: (ctx) => DetailsScreen()
        },
      ),
    );
  }
}
