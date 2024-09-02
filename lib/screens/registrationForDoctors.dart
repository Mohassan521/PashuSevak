import 'dart:convert';
import 'dart:io';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/Map.dart';
import 'package:permission_handler/permission_handler.dart';

class RegistrationForDoctors extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController mobileController;

  RegistrationForDoctors({
    required this.emailController,
    required this.mobileController,
    Key? key,
  }) : super(key: key);

  @override
  _RegistrationForDoctorsPageState createState() => _RegistrationForDoctorsPageState();
}

class _RegistrationForDoctorsPageState extends State<RegistrationForDoctors> {
  TextEditingController _doctornameController = TextEditingController();
  TextEditingController _father_nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _any_experienceController = TextEditingController();
  TextEditingController _category_of_breedController = TextEditingController();
  TextEditingController _preferred_job_locationController =
      TextEditingController();
  TextEditingController _LocationController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _visitfeesController = TextEditingController();
  TextEditingController _ownclinicController = TextEditingController();
  TextEditingController _StateController = TextEditingController();
  TextEditingController _blockController = TextEditingController();
  TextEditingController _PreferedJobStateblockController =
      TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  File? _selectedFile;
  File? _selectedFileaadhar;
  File? _selectedFilepassport;
  File? _selectedFilesign;

  void showSuccessMessage(String messege) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(messege),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showErrorMessage(String messege) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(messege),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showRequiredFieldsError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Enter All Fields correctly"),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

  void login(
    doctor_name,
    father_name,
    date,
    mobile,
    email,
    address,
    any_experiance,
    category_of_breed,
    prefferd_job_location,
    job_type,
    cource,
    Location,
    longitude,
    latitude,
    visitfees,
    ownclinicvisitfees,
    state,
    block,
    preferedjoblocstate,
    ditrict,
    lastname,
    areyou,
    servicetype,
    havebike,
    areaofservice,
    registration_of_certificate,
    aadhar_card,
    passport_size,
    signature) async {

  // Check if any of the required fields is empty
  if (doctor_name.isEmpty ||
      father_name.isEmpty ||
      date.isEmpty ||
      mobile.isEmpty ||
      email.isEmpty ||
      address.isEmpty ||
      any_experiance.isEmpty ||
      category_of_breed.isEmpty ||
      prefferd_job_location.isEmpty ||
      Location.isEmpty ||
      longitude.isEmpty ||
      latitude.isEmpty ||
      state.isEmpty ||
      block.isEmpty ||
      preferedjoblocstate.isEmpty ||
      ditrict.isEmpty ||
      lastname.isEmpty) {
    showRequiredFieldsError();
    return;
  }

  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://43.205.23.114/api/method/oymom.api.doctor_register'),
    );

    // Print each field before adding it to the request to verify values
    print("doctor_name: $doctor_name");
    print("father_name: $father_name");
    print("date: $date");
    print("mobile: $mobile");
    print("email: $email");
    // Continue printing the rest of the fields...

    request.fields['doctor_name'] = doctor_name;
    request.fields['father_name'] = father_name;
    request.fields['date_of_birth'] = date;
    request.fields['mobile'] = mobile;
    request.fields['email'] = email;
    request.fields['address'] = address;
    request.fields['any_experiance'] = any_experiance;
    request.fields['category_of_breed'] = category_of_breed;
    request.fields['prefferd_job_location'] = prefferd_job_location;
    request.fields['job_type'] = job_type;
    request.fields['cource'] = cource;
    request.fields['location'] = Location;
    request.fields['longitude'] = longitude;
    request.fields['latitude'] = latitude;
    request.fields['visit_fees'] = visitfees;
    request.fields['own_clinic_visit_fees'] = ownclinicvisitfees;
    request.fields['state'] = state;
    request.fields['block'] = block;
    request.fields['preferred_job_location_state'] = preferedjoblocstate;
    request.fields['district'] = ditrict;
    request.fields['last_name'] = lastname;
    request.fields['are_you'] = areyou;
    request.fields['service_type'] = servicetype;
    request.fields['have_bike'] = havebike;
    request.fields['area_of_service_under'] = areaofservice;
    request.fields['registration_of_certificate'] = registration_of_certificate;
    request.fields['aadhar_card'] = aadhar_card;
    request.fields['passport_size'] = passport_size;
    request.fields['signature'] = signature;

    // Print the fields to verify before sending
    print("Request Fields: ${request.fields}");

    var response = await request.send();

    // Log status and response
    print("Response status: ${response.statusCode}");
    print("Response reason: ${response.reasonPhrase}");

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var data = jsonDecode(responseData);
      print("Response data: $data");

      final message = data['message']?['status'];

      if (message == 'success') {
        showSuccessMessage("Registration Successful");
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FrontPage();
        }));
      } else {
        print("Error in response: $responseData");
        showErrorMessage("response error");
      }
    } else {
      print("Error: Status Code - ${response.statusCode}");
      print("Error: Reason Phrase - ${response.reasonPhrase}");
      showErrorMessage("response error");
    }

    if (_selectedFile != null) {
      await uploadFile(_selectedFile!);
      await uploadFile(_selectedFileaadhar!);
      await uploadFile(_selectedFilepassport!);
      await uploadFile(_selectedFilesign!);
    }

  } catch (e) {
    print("Exception: ${e.toString()}");
    showErrorMessage("An error occurred: ${e.toString()}");
  }
}

  Future<void> uploadFile(File file) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://43.205.23.114/api/method/oymom.api.upload__single_file'),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
        ),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        // File uploaded successfully
        print('File uploaded successfully');
        String responseBody = await response.stream.bytesToString();
        print('Response Message: $responseBody');
      } else {
        // Handle error when file upload fails
        print('File upload failed. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  late String generatedOTP;

  Future<void> generateOTP() async {
    final apiUrl =
        'http://43.205.23.114/api/method/oymom.api.generate_otp_for_number_varification';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({
        'mobile_no': _mobileController.text,
        'email': _emailController.text,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(
          '-------------------------------------------------------------$data-------------------------------------------------------');

      if (data.containsKey('message') &&
          data['message'].containsKey('message')) {
        String fullMessage = data['message']['message'];
        extractOTPFromMessage(fullMessage);
        //print({OtpManager.generatedOTP});
      } else {
        print('Error: OTP not found in the response message');
      }
    } else {
      print('Failed to generate OTP. Status code: ${response.statusCode}');
    }
  }

  String extractOTPFromMessage(String fullMessage) {
    // Assuming the format is "OTP generated and sent successfully :094233"
    List<String> parts = fullMessage.split(':');
    if (parts.length == 2) {
      return parts[1].trim();
    } else {
      print('Error: Unexpected OTP message format');
      return '';
    }
  }

  Future<void> _requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    if (status.isGranted) {
      print(status);
      print('${permission.toString()} permission granted');
    } else {
      print(status);
      print('${permission.toString()} permission denied');
    }
  }

  Future<bool> _handleLocationPermission() async {
  LocationPermission permission;
  
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return false;
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return false;
  } 
  
  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return true;
}

Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      List<String> mainAddresses = [];

      for (Placemark placemark in placemarks) {
        String name = placemark.name ?? "";
        String street = placemark.street ?? "";

        // Concatenate the name and street into a single string
        String mainAddress = "$name";

        // Add the main address to the list
        mainAddresses.add(mainAddress);
      }
      // AIzaSyCIKgGZYd9RDjxLrSnSTj8AVw9Dwe43LII

      // print(placemarkFromCoordinates(position.latitude, position.longitude).toString());
      if (position != null) {
        _latitudeController.text = position.latitude.toString();
        
        _longitudeController.text = position.longitude.toString();
        String concatenatedAddresses = mainAddresses.join(' , ');
        print(concatenatedAddresses);
        _LocationController.text = '$concatenatedAddresses';
      } else {}
    } catch (e) {
      print("Error getting location: $e");
    }
  }

// Future<void> getCurrentLocation() async {
//     final hasPermission = await _handleLocationPermission();
//     if (!hasPermission) return;

//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );
//       List<String> mainAddresses = [];

//       for (Placemark placemark in placemarks) {
//         String name = placemark.name ?? "";
//         // You can add more fields if needed
//         String mainAddress = "$name";
//         mainAddresses.add(mainAddress);
//       }

//       if (position != null) {
//         _latitudeController.text = position.latitude.toString();
//         _longitudeController.text = position.longitude.toString();
//         String concatenatedAddresses = mainAddresses.join(', ');
//         _LocationController.text = concatenatedAddresses;
//       }
//     } catch (e) {
//       print("Error getting location: $e");
//     }
//   }



  // Future<void> getCurrentLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.bestForNavigation,
  //     );

  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(position.latitude, position.longitude);
  //     List<String> mainAddresses = [];

  //     for (Placemark placemark in placemarks) {
  //       String name = placemark.name ?? "";
  //       String street = placemark.street ?? "";

  //       // Concatenate the name and street into a single string
  //       String mainAddress = "$name";

  //       // Add the main address to the list
  //       mainAddresses.add(mainAddress);
  //     }
  //     // AIzaSyCIKgGZYd9RDjxLrSnSTj8AVw9Dwe43LII

  //     // print(placemarkFromCoordinates(position.latitude, position.longitude).toString());
  //     if (position != null) {
  //       _latitudeController.text = position.latitude.toString();
  //       _longitudeController.text = position.longitude.toString();
  //       String concatenatedAddresses = mainAddresses.join(' , ');
  //       print(concatenatedAddresses);
  //       _LocationController.text = '$concatenatedAddresses';
  //     } else {}
  //   } catch (e) {
  //     print("Error getting location: $e");
  //   }
  // }

  final format = DateFormat("yyyy-MM-dd");
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> JobtypeOptions = ['External', 'company'];
  List<String> courcesOption = [
    'BVSC',
    'diploma Paravet',
    'diploma animal',
    'health worker',
    'AIl work'
  ];
  List<String> are_youOption = [
    'DOCTOR',
    'PARA VET',
    'AHW',
    'AI - WORKER',
    'STUDENT',
    'UNEMPLOYED'
  ];
  List<String> service_typeoptions = ['Paid', 'Unpaid'];
  List<String> have_bikeoptions = ['Yes', 'No'];
  double _selectedValue = 15.0;

  String selectedJobTypeOption = 'company';
  String selectedCoursesOption = 'BVSC';
  String selectedare_youOption = 'DOCTOR';
  String selectedservice_type = 'Paid';
  String selectedhave_bike = 'No';

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _pickFileaadhar_card() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFileaadhar = File(result.files.single.path!);
      });
    }
  }

  Future<void> _pickFilepassport_size() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFilepassport = File(result.files.single.path!);
      });
    }
  }

  Future<void> _pickFilesignature() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFilesign = File(result.files.single.path!);
      });
    }
  }

  void onLocationSelected(String location) {
    _LocationController.text = location;
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                'You are not registerd yet. Do you really want to exit ?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Yes',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

    @override
  void initState() {
    super.initState();
    getCurrentLocation();
    _requestPermission(Permission.location).then((value){
      value = _blockController.text  ;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("block controller value: ${_blockController.text}");
    Color themeColor = Theme.of(context).primaryColor;
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        _onBackPressed(context);
      } ,
      child: Scaffold(
          body: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Doctor Registration", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(widget.mobileController.text.toString(),),
                  // Text(widget.emailController.text.toString(),),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.list_rounded,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Are You ?",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Container(
                          height: 33,
                          padding: EdgeInsets.only(
                              left: 8, right: 2), // Apply padding here
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selectedare_youOption,
                            icon: Icon(Icons.arrow_drop_down),
                            underline: SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            onChanged: (value) {
                              setState(() {
                                selectedare_youOption = value!;
                              });
                            },
                            items: are_youOption.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.list_rounded,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Service Type",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Container(
                          height: 33,
                          padding: EdgeInsets.only(
                              left: 8, right: 2), // Apply padding here
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selectedservice_type,
                            icon: Icon(Icons.arrow_drop_down),
                            underline: SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            onChanged: (value) {
                              setState(() {
                                selectedservice_type = value!;
                              });
                            },
                            items: service_typeoptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.shopping_bag_rounded,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Job Type",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Container(
                          height: 33,
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 2,
                          ), // Apply padding here
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selectedJobTypeOption,
                            icon: Icon(Icons.arrow_drop_down),
                            underline: SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            // iconEnabledColor: themeColor,
                            onChanged: (value) {
                              setState(() {
                                selectedJobTypeOption = value!;
                              });
                            },
                            items: JobtypeOptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

// Visibility widget to conditionally show/hide the text fields
                  Visibility(
                    visible: selectedJobTypeOption == 'External',
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _visitfeesController,
                          decoration: InputDecoration(
                            labelText: 'Visit fees',
                            prefixIcon:
                                Icon(Icons.monetization_on, color: themeColor),
                            suffixIcon:
                                Icon(Icons.currency_rupee, color: themeColor),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          controller: _ownclinicController,
                          decoration: InputDecoration(
                            labelText: 'Clinic fees',
                            prefixIcon: Icon(Icons.money, color: themeColor),
                            suffixIcon:
                                Icon(Icons.currency_rupee, color: themeColor),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _doctornameController,
                    labelText: "Doctor Name",
                    icon: Icons.person,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _lastnameController,
                    labelText: "Last Name",
                    icon: Icons.place,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _father_nameController,
                    labelText: "Father's Name",
                    icon: Icons.person_outline,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    // controller: _mobileController,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                      border: OutlineInputBorder(),
                      prefix: Text('+91 '),
                    ),
                    readOnly: true,
                    initialValue: widget.mobileController.text.toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile Number is required';
                      } else if (value.length != 10) {
                        return 'Mobile Number must be 10 digits';
                      }
                      return null;
                    },

                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    // controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                    readOnly: true,

                    initialValue: widget.emailController.text.toString(),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }

                      if (!RegExp(
                              r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }

                      return null; // Return null if the email is valid
                    },
                  ),
SizedBox(height: 16),
                  DateTimeField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: "Date of birth",
                      border: OutlineInputBorder()
                    ),
                    format: format,
                    onShowPicker: (context, currentValue) async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2101),
                        initialDatePickerMode: DatePickerMode.day,
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light(),
                            child: child!,
                          );
                        },
                      );

                      // You can modify the selectedDate to only include the date part
                      if (selectedDate != null) {
                        selectedDate = DateTime(selectedDate.year,
                            selectedDate.month, selectedDate.day);
                      }

                      return selectedDate;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Date is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  TextFormField(
                    controller: _StateController,
                    decoration: InputDecoration(
                      labelText: 'State',
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'State is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _districtController,
                    decoration: InputDecoration(
                      labelText: 'District',
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'District is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _blockController,
                    decoration: InputDecoration(
                      labelText: 'Block',
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Block is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _addressController,
                    labelText: "Address",
                    icon: Icons.place,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _LocationController,
                    decoration: InputDecoration(
                      labelText: "Location",
                      border: OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () {
                          
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return MapScreen(
                                onLocationSelected: (location) {
                                  // Update the _LocationController with the selected location
                                  _LocationController.text = location;
                                  Navigator.pop(
                                      context); // Close the bottom sheet
                                },
                              );
                            },
                          );
                        },
                        child:
                            Icon(Icons.location_searching, color: themeColor),
                      ),
                    ),
                    readOnly: true,
                    // keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Location is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _PreferedJobStateblockController,
                    decoration: InputDecoration(
                      labelText: 'Job location state',
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Job location state is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _preferred_job_locationController,
                    labelText:
                        "Preffered Job Location",
                    icon: Icons.location_on,
                  ),
                  SizedBox(height: 16),

                  _buildTextField(
                    controller: _any_experienceController,
                    labelText: "Any Experience",
                    icon: Icons.work,
                    keyboardType: TextInputType.number,
                    
                  ),
                  SizedBox(height: 16),

                  _buildTextField(
                    controller: _category_of_breedController,
                    labelText: "Category of Breed",
                    icon: Icons.pets,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.list_rounded,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Courses",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Container(
                          height: 33,
                          padding: EdgeInsets.only(
                              left: 8, right: 2), // Apply padding here
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selectedCoursesOption,
                            icon: Icon(Icons.arrow_drop_down),
                            underline: SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            onChanged: (value) {
                              setState(() {
                                selectedCoursesOption = value!;
                              });
                            },
                            items: courcesOption.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.directions_bike,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Have Bike",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Container(
                          height: 33,
                          padding: EdgeInsets.only(
                              left: 8, right: 2), // Apply padding here
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selectedhave_bike,
                            icon: Icon(Icons.arrow_drop_down),
                            underline: SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            onChanged: (value) {
                              setState(() {
                                selectedhave_bike = value!;
                              });
                            },
                            items: have_bikeoptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.area_chart,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Area of Service Under: $_selectedValue km',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  Slider(
                    value: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                        // Store the value here or call a function to handle storage
                        // storeSelectedValue(_selectedValue);
                      });
                    },
                    min: 1.0,
                    max: 15.0,
                    divisions: 15,
                    label: _selectedValue.round().toString(),
                    activeColor: Colors.orange,
                  ),

                  _buildFileUploadField(),

                  SizedBox(height: 8),
                  _buildFileUploadField2(),

                  SizedBox(height: 8),
                  _buildFileUploadField3(),
                  SizedBox(height: 8),
                  _buildFileUploadField4(),
                  SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // print(_doctornameController.text.toString());
                          // print(_father_nameController.text.toString());
                          // print(_dateController.text.toString());
                          // print(_mobileController.text.toString());
                          // print(_emailController.text.toString());
                          // print(_addressController.text.toString());
                          // print(_any_experienceController.text.toString());
                          // print(_category_of_breedController.text.toString());
                          // print(_preferred_job_locationController.text.toString());
                          // print(selectedJobTypeOption);
                          // print(selectedCoursesOption);
                          // print(_selectedFile,);
                          // print(_ownclinicController.text.toString(),);
                          login(
                              _doctornameController.text.toString(),
                              _father_nameController.text.toString(),
                              _dateController.text.toString(),
                              // _mobileController.text.toString(),
                              widget.mobileController.text.toString(),
                              // _emailController.text.toString(),
                              widget.emailController.text.toString(),
                              _addressController.text.toString(),
                              _any_experienceController.text.toString(),
                              _category_of_breedController.text.toString(),
                              _preferred_job_locationController.text.toString(),
                              selectedJobTypeOption,
                              selectedCoursesOption,
                              _LocationController.text.toString(),
                              _longitudeController.text,
                              _latitudeController.text,
                              
                              // _selectedFile,
                              _visitfeesController.text.toString(),
                              _ownclinicController.text.toString(),
                              _StateController.text.toString(),
                              _blockController.text.toString(),
                              _PreferedJobStateblockController.text.toString(),
                              _districtController.text.toString(),
                              _lastnameController.text.toString(),
                              selectedare_youOption,
                              selectedservice_type,
                              selectedhave_bike,
                              _selectedValue.toString(),
                              _selectedFile.toString(),
                              _selectedFileaadhar.toString(),
                              _selectedFilepassport.toString(),
                              _selectedFilesign.toString());
                        } else {
                          showRequiredFieldsError();
                        }

                        // if (_formKey.currentState!.validate()) {
                        // generateAndSendOTP(context);
                        //
                        // } else {
                        // showRequiredFieldsError();
                        // }
                      },
                      child: Text('Register',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ) // Your registration form widgets go here,
          ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: labelText,
                  border: OutlineInputBorder(),
                ),
                keyboardType: keyboardType,
                      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        // Add more validation rules if needed
        return null;
      },
              );
    // return TextFormField(
    //   controller: controller,
    //   decoration: InputDecoration(
    //     labelText: labelText,
    //     prefixIcon: icon != null
    //         ? Icon(icon, color: Theme.of(context).primaryColor)
    //         : null,
    //   ),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter $labelText';
      //   }
      //   // Add more validation rules if needed
      //   return null;
      // },
    //   keyboardType: keyboardType,
    // );
  }

  Widget _buildDateTimeField({
    required TextEditingController controller,
    required String labelText,
    IconData? icon,
  }) {
    return DateTimeField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: icon != null
            ? Icon(icon, color: Theme.of(context).primaryColor)
            : null,
      ),
      format: format,
      onShowPicker: (context, currentValue) async {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2101),
        );
      },
    );
  }

  // Widget _buildFileUploadField() {
  //   return ListTile(
  //       title: Row(
  //         children: [
  //           Icon(Icons.file_copy, color: Theme.of(context).primaryColor),
  //           SizedBox(width: 8),
  //           Text(AppLocalizations.of(context)!.uploadfile),
  //         ],
  //       ),

  Widget _buildFileUploadField() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Icon(Icons.file_copy, color: Colors.orange),
          SizedBox(width: 5),
          Text("Registration Certificate"),
        ],
      ),
      subtitle: _selectedFile != null ? Text(_selectedFile!.path) : null,
      trailing: MaterialButton(onPressed: _pickFile,
      child: Text("Choose File"),
      color: Colors.orange,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14)
      ),
      ),
      // trailing: Container(
      //   child: ElevatedButton(
      //     onPressed: _pickFile,
      //     child: Text("Choose File"),
      //   ),
      // ),
    );
  }

  Widget _buildFileUploadField2() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Icon(Icons.file_copy, color: Colors.orange),
          SizedBox(width: 5),
          Text("Aadhar Card"),
        ],
      ),
      subtitle:
          _selectedFileaadhar != null ? Text(_selectedFileaadhar!.path) : null,
      trailing: MaterialButton(onPressed: _pickFileaadhar_card,
      child: Text("Choose File"),
      color: Colors.orange,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14)
      )
      ),
      // trailing: Container(
      //   child: ElevatedButton(
      //     onPressed: _pickFileaadhar_card,
      //     child: Text("Choose File"),
      //   ),
      // ),
    );
  }

  Widget _buildFileUploadField3() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Icon(Icons.file_copy, color: Colors.orange),
          SizedBox(width: 5),
          Text("Passport Size Photo"),
        ],
      ),
      subtitle: _selectedFilepassport != null
          ? Text(_selectedFilepassport!.path)
          : null,
      trailing: MaterialButton(onPressed: _pickFilepassport_size,
      child: Text("Choose File"),
      color: Colors.orange,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14)
      )
      ),
      // trailing: Container(
      //   child: ElevatedButton(
      //     onPressed: _pickFilepassport_size,
      //     child: Text("Choose File"),
      //   ),
      // ),
    );
  }

  Widget _buildFileUploadField4() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Icon(Icons.file_copy, color: Colors.orange),
          SizedBox(width: 5),
          Text("Signature"),
        ],
      ),
      subtitle:
          _selectedFilesign != null ? Text(_selectedFilesign!.path) : null,
      trailing: MaterialButton(onPressed: _pickFilesignature,
      child: Text("Choose File"),
      color: Colors.orange,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14)
      )
      ),
      // trailing: Container(
      //   child: ElevatedButton(
      //     onPressed: _pickFilesignature,
      //     child: Text("Choose File"),
      //   ),
      // ),
    );
  }
}
