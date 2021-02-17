import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar';

  @override
  TextStyle get searchFieldStyle => TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color.fromRGBO(147, 146, 149, 1));

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.qr_code_scanner,
              color: Color.fromRGBO(24, 103, 182, 1)),
          onPressed: () {})
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: Color.fromRGBO(109, 110, 112, 1),
          size: 30,
        ),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Text(''),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return ListTile(
      leading: Icon(Icons.search),
      title: Text(query),
      onTap: () {},
    );
  }
}
