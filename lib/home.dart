import 'package:flutter/material.dart';
import 'package:flutter_application_1/apiservice.dart';
import 'package:flutter_application_1/userprofile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Service serviceAPI = Service();
  final _globalKey = GlobalKey<FormState>();
  var userProfile = UserProfile("", "", 0, 0, false, "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _globalKey,
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'First Name'),
                validator: (currentValue) {
                  if (currentValue!.isEmpty) {
                    return 'First name is required';
                  }
                },
                onChanged: (currentValue) {
                  userProfile.firstName = currentValue;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Last Name'),
                validator: (currentValue) {
                  if (currentValue!.isEmpty) {
                    return 'Last name is required';
                  }
                },
                onChanged: (currentValue) {
                  userProfile.lastName = currentValue;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Loyalty Points'),
                keyboardType: TextInputType.number,
                validator: (currentValue) {
                  if (int.parse(currentValue!) <= 0) {
                    return 'Loyalty point must be greater than zero';
                  }
                },
                onChanged: (currentValue) {
                  userProfile.loyaltyPoints = int.parse(currentValue);
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(hintText: 'Fitness Goal'),
                onChanged: (newValue) {
                  userProfile.fitnessGoal = newValue as int;
                },
                items: [
                  ['Lose weight', 1],
                  ['Build muscle', 2],
                  ['Train for a sport', 3],
                  ['Recreation', 4]
                ].map((item) {
                  return DropdownMenuItem(
                      child: Text("${item[0]}"), value: item[1]);
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              SwitchListTile(
                value: userProfile.isActive!,
                onChanged: (value) {
                  setState(() {
                    if (userProfile.isActive == true) {
                      userProfile.isActive = false;
                    } else {
                      userProfile.isActive = true;
                    }
                  });
                },
                title: Text('Active'),
              ),
              // Switch(
              //   value: userProfile.isActive!,
              //   onChanged: (value) {
              //     setState(
              //       () {
              //         userProfile.isActive = true;
              //       },
              //     );
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  // var _message = '';
                  // if (_globalKey.currentState!.validate()) {
                  //   _globalKey.currentState!.save();
                  //   _message = 'to json';
                  // } else {
                  //   _message = 'There was an error in the form';
                  // }
                  // showDialog(
                  //   context: context,
                  //   builder: (_) {
                  //     return AlertDialog(
                  //       title: Text(userProfile.toJson()),
                  //       content: Text(_message),
                  //       actions: [
                  //         TextButton(
                  //           child: Text('OK'),
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                  print(userProfile.firstName);
                  // serviceAPI.postData(
                  //     userProfile.firstName!,
                  //     userProfile.lastName!,
                  //     userProfile.loyaltyPoints!,
                  //     userProfile.fitnessGoal!,
                  //     userProfile.isActive!);
                  serviceAPI.postData(userProfile);
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
