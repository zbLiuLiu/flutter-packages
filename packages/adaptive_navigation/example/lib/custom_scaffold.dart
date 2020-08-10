import 'package:adaptive_navigation/scaffold.dart';
import 'package:flutter/material.dart';

class CustomScaffoldDemo extends StatefulWidget {
  @override
  _CustomScaffoldDemoState createState() =>
      _CustomScaffoldDemoState();
}

class _CustomScaffoldDemoState
    extends State<CustomScaffoldDemo> {
  int _destinationCount = 5;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      selectedIndex: 0,
      destinations: _allDestinations.sublist(0, _destinationCount),
      appBar: AppBar(title: Text('Custom Demo')),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () { },
      ),
      navigationTypeResolver: (context) {
        if (MediaQuery.of(context).size.width > 600) {
          return NavigationType.drawer;
        } else {
          return NavigationType.bottom;
        }
      },
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('''
          This is a custom behavior of the AdaptiveNavigationScaffold.
          It switches between bottom navigation and a drawer.
          Resize the window to switch between the navigation types.
          '''),
          SizedBox(height: 40),
          Slider(
            min: 2,
            max: _allDestinations.length.toDouble(),
            divisions: _allDestinations.length - 2,
            value: _destinationCount.toDouble(),
            label: _destinationCount.toString(),
            onChanged: (value) {
              setState(() {
                _destinationCount = value.round();
              });
            },
          ),
          Text('Destination Count'),
          SizedBox(height: 40),
          RaisedButton(
            child: Text('BACK'),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
    );
  }
}

const _allDestinations = [
  AdaptiveScaffoldDestination(title: 'Alarm', icon: Icons.alarm),
  AdaptiveScaffoldDestination(title: 'Book', icon: Icons.book),
  AdaptiveScaffoldDestination(title: 'Cake', icon: Icons.cake),
  AdaptiveScaffoldDestination(title: 'Directions', icon: Icons.directions),
  AdaptiveScaffoldDestination(title: 'Email', icon: Icons.email),
  AdaptiveScaffoldDestination(title: 'Favorite', icon: Icons.favorite),
  AdaptiveScaffoldDestination(title: 'Group', icon: Icons.group),
  AdaptiveScaffoldDestination(title: 'Headset', icon: Icons.headset),
  AdaptiveScaffoldDestination(title: 'Info', icon: Icons.info),
];