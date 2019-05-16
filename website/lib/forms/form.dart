import 'package:flutter_web/material.dart';

import 'package:website/models/user.dart';
import 'package:website/utils/color_constants.dart';

class FormMaterial extends StatefulWidget {
  @override
  _FormMaterialState createState() => _FormMaterialState();
}

class _FormMaterialState extends State<FormMaterial> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 2,
        margin: EdgeInsets.fromLTRB(64, 32, 64, 64),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Builder(
                  builder: (context) => Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue',
                              ),
                              decoration: InputDecoration(
                                labelText: 'First name',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.firstName = val),
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Last name',
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your last name.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.lastName = val)),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                              child: Text(
                                'Subscribe',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                            ),
                            SwitchListTile(
                                title: const Text(
                                  'To our Monthly Subscription',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.monthlyNewsletter,
                                onChanged: (bool val) => setState(
                                    () => _user.monthlyNewsletter = val)),
                            SwitchListTile(
                                title: const Text(
                                  'To our Yearly Subscription',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.yearlyNewsletter,
                                onChanged: (bool val) => setState(
                                    () => _user.yearlyNewsletter = val)),
                            SwitchListTile(
                                title: const Text(
                                  'To our Weekly Subscription',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.weeklyNewsletter,
                                onChanged: (bool val) => setState(
                                    () => _user.weeklyNewsletter = val)),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                              child: Text(
                                'Interests',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                            ),
                            CheckboxListTile(
                                title: const Text(
                                  'Writing',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.passions[User.PassionWriting],
                                onChanged: (val) {
                                  setState(() => _user
                                      .passions[User.PassionWriting] = val);
                                }),
                            CheckboxListTile(
                                title: const Text(
                                  'Singing',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.passions[User.PassionSinging],
                                onChanged: (val) {
                                  setState(() => _user
                                      .passions[User.PassionSinging] = val);
                                }),
                            CheckboxListTile(
                                title: const Text(
                                  'Travelling',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.passions[User.PassionTraveling],
                                onChanged: (val) {
                                  setState(() => _user
                                      .passions[User.PassionTraveling] = val);
                                }),
                            CheckboxListTile(
                                title: const Text(
                                  'Cooking',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.passions[User.PassionCooking],
                                onChanged: (val) {
                                  setState(() => _user
                                      .passions[User.PassionCooking] = val);
                                }),
                            Container(
                                height: 80,
                                // margin: EdgeInsets.only(left: 200, right: 200),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: RaisedButton(
                                    color: ColorConstants.blue,
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        _user.save();
                                        _showDialog(context);
                                        print(_user);
                                        print(_user.firstName);
                                      }
                                    },
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'HelveticaNeue',
                                      ),
                                    ))),
                          ])))),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}
