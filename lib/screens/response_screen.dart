import 'package:domiciliary_care/constants/color.dart';
import 'package:flutter/material.dart';

class ResponsePage extends StatefulWidget {
  const ResponsePage({Key? key}) : super(key: key);

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Personal care',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // print('close button');
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const TextField(
                keyboardType: TextInputType.text,
                maxLines: 27,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText:
                      'Please leave some notes about how you\'ve helped with this task',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
