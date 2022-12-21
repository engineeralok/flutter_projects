import 'package:flutter/material.dart';
import 'package:to_do_ui/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          print(("Clicke on ToDo List Item"));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: const Icon(
          Icons.check_box,
          color: toBlue,
        ),
        title: const Text(
          'Check Mail',
          style: (TextStyle(
            fontSize: 16,
            color: toBlack,
            decoration: TextDecoration.lineThrough,
          )),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: toRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              print('Clicked on Delete Icon');
            },
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
