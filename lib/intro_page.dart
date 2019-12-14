import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_workshop/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyIntroPage extends StatefulWidget {
  final SharedPreferences prefs;
  MyIntroPage({Key key, @required this.prefs});
  @override
  _MyIntroPageState createState() => _MyIntroPageState();
}

class _MyIntroPageState extends State<MyIntroPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro Page'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                FormBuilder(
                  key: _fbKey,
                  initialValue: {
                    'date': DateTime.now(),
                    'accept_terms': false,
                  },
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
//                      FormBuilderDateTimePicker(
//                        attribute: "date",
//                        inputType: InputType.date,
//                        decoration:
//                            InputDecoration(labelText: "Appointment Time"),
//                      ),
//                      FormBuilderSlider(
//                        attribute: "slider",
//                        validators: [FormBuilderValidators.min(6)],
//                        min: 0.0,
//                        max: 10.0,
//                        initialValue: 1.0,
//                        divisions: 20,
//                        decoration:
//                            InputDecoration(labelText: "Number of things"),
//                      ),
                      FormBuilderTextField(
                        attribute: "name",
                        decoration: InputDecoration(labelText: "Name"),
                        validators: [
                          FormBuilderValidators.max(70),
                        ],
                      ),
                      FormBuilderTextField(
                        attribute: "age",
                        decoration: InputDecoration(labelText: "Age"),
                        validators: [
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.max(70),
                        ],
                      ),
                      FormBuilderDropdown(
                        attribute: "gender",
                        decoration: InputDecoration(labelText: "Gender"),
                        // initialValue: 'Male',
                        hint: Text('Select Gender'),
                        validators: [FormBuilderValidators.required()],
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                                value: gender, child: Text("$gender")))
                            .toList(),
                      ),
                      FormBuilderCheckbox(
                        attribute: 'accept_terms',
                        label: Text(
                            "I have read and agree to the terms and conditions"),
                        validators: [
                          FormBuilderValidators.requiredTrue(
                            errorText:
                                "You must accept terms and conditions to continue",
                          ),
                        ],
                      ),
//                      FormBuilderSegmentedControl(
//                        decoration:
//                            InputDecoration(labelText: "Movie Rating (Archer)"),
//                        attribute: "movie_rating",
//                        options: List.generate(5, (i) => i + 1)
//                            .map((number) =>
//                                FormBuilderFieldOption(value: number))
//                            .toList(),
//                      ),
//                      FormBuilderSwitch(
//                        label: Text('I Accept the tems and conditions'),
//                        attribute: "accept_terms_switch",
//                        initialValue: true,
//                      ),
//                      FormBuilderStepper(
//                        decoration: InputDecoration(labelText: "Stepper"),
//                        attribute: "stepper",
//                        initialValue: 10,
//                        step: 1,
//                      ),
//                      FormBuilderRate(
//                        decoration:
//                            InputDecoration(labelText: "Rate this form"),
//                        attribute: "rate",
//                        iconSize: 32.0,
//                        initialValue: 1,
//                        max: 5,
//                      ),
//                      FormBuilderCheckboxList(
//                        decoration: InputDecoration(
//                            labelText: "The language of my people"),
//                        attribute: "languages",
//                        initialValue: ["Dart"],
//                        options: [
//                          FormBuilderFieldOption(value: "Dart"),
//                          FormBuilderFieldOption(value: "Kotlin"),
//                          FormBuilderFieldOption(value: "Java"),
//                          FormBuilderFieldOption(value: "Swift"),
//                          FormBuilderFieldOption(value: "Objective-C"),
//                        ],
//                      ),
//                      FormBuilderSignaturePad(
//                        decoration: InputDecoration(labelText: "Signature"),
//                        attribute: "signature",
//                        height: 100,
//                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    MaterialButton(
                      child: Text("Submit"),
                      onPressed: () {
                        if (_fbKey.currentState.saveAndValidate()) {
                          print(_fbKey.currentState.value);

                          var name = _fbKey.currentState.value['name'];
                          print(name);

                          widget.prefs.setBool('isFirstLaunch', false);
                          widget.prefs.setString('name', name);

                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePage(prefs: widget.prefs);
                          }), (Route<dynamic> route) => false);
                        }
                      },
                    ),
                    MaterialButton(
                      child: Text("Reset"),
                      onPressed: () {
                        _fbKey.currentState.reset();
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
