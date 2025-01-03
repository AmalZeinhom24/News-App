import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;

  TabItem(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFF02066F) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0xFF02066F),
          )),
      child: Text(
        sources.name ?? '',
        style: TextStyle(color: isSelected ? Colors.white : Colors.teal),
      ),
    );
  }
}
