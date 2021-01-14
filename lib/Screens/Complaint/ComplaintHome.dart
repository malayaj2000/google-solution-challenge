import '../../Helper/Widgets/RequiredWidgets.dart';
import '../../Helper/Service/Services.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

bool _isLoading = false;

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String formId;
String name;
String email;
String description;
String address;
String phoneNumber;
String additionalDescription;
DatabaseService databaseService = new DatabaseService();

class FormScreenState extends State<FormScreen> {

  createFormOnline() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      formId = randomAlphaNumeric(16);

      Map<String, String> formMap = {
        "formId": formId,
        "name": name,
        "email": email,
        "description": description,
        "address": address,
        "phoneNumber": phoneNumber,
        "additionalInformation": additionalDescription,
      };

      await databaseService.addComplaintData(formMap, formId).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onChanged: (String value) {
        name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onChanged: (String value) {
        email = value;
      },
    );
  }

  Widget _builddescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'description'),
      maxLength: 200,
      validator: (String value) {
        if (value.isEmpty) {
          return 'description is Required';
        }

        return null;
      },
      onChanged: (String value) {
        description = value;
      },
    );
 
  }

  Widget _buildaddress() {
     return TextFormField(
      decoration: InputDecoration(labelText: 'Address'),
      maxLength: 100,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onChanged: (String value) {
        address = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onChanged: (String value) {
        phoneNumber = value;
      },
    );
  }

  Widget _buildadditionaldescription() {
     return TextFormField(
      decoration: InputDecoration(labelText: 'Additional description'),
      maxLength: 100,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Additional description is Required';
        }

        return null;
      },
      onChanged: (String value) {
        additionalDescription = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: appBar(context, "Complaints"), backgroundColor: Colors.orange,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              Container(
                height: 300,
                child: Image(
                  image: AssetImage("images/complaint.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "Complaint Form",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5,),
              Form(
                key: _formKey,
                child:  _isLoading ? Container(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 15,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text(
                          "Your Complaint has been Successfully Lodged",
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ) : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildName(),
                    _buildEmail(),
                    _builddescription(),
                    _buildaddress(),
                    _buildPhoneNumber(),
                    _buildadditionaldescription(),
                    SizedBox(height: 50),
                    RaisedButton(
                      color: Colors.orange,
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        createFormOnline();
                      },
                    )
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}


