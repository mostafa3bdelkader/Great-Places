import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import '../screens/details_screens.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(child: Text('There is no places yet.')),
                builder: (ctx, greatPlaces, ch) => ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (ctx, i) => greatPlaces.items.length <= 0
                      ? ch
                      : ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlaces.items[i].image),
                          ),
                          title: Text(greatPlaces.items[i].title),
                          subtitle: Text(greatPlaces.items[i].location.address),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                DetailsScreen.routeName,
                                arguments: greatPlaces.items[i].id);
                          },
                        ),
                ),
              ),
      ),
    );
  }
}
