import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DynamicList(),
    );
  }
}

class DynamicList extends StatefulWidget {
  @override
  _DynamicListState createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {
  List<String> items = []; // List to store dynamic items
  int counter = 1; // Counter for item labels

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic List Builder'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  items.removeAt(index); // Remove the item from the list
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            items.add('Item $counter'); // Add a new item to the list
            counter++; // Increment the counter
          });
        },
      ),
    );
  }
}