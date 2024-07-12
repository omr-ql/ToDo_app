import 'package:flutter/material.dart';
import 'package:to_do/utilities/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              textAlign: TextAlign.center, // Center the text
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add Your Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
              children: [
                // Save Button:
                Button(
                  name: "Cancel",
                  onPressed: onCancel,
                  color: Colors.yellow,
                  textColor: Colors.black, // Change to desired font color
                ),
                // Put Some Space:
                const SizedBox(
                  width: 8,
                ),
                // Cancel Button:
                Button(
                  name: "Save",
                  onPressed: onSave,
                  color: Colors.yellow,
                  textColor: Colors.black, // Change to desired font color
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
