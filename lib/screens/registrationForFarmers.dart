import 'dart:convert';
import 'dart:io';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/Map.dart';
import 'package:pashusevak/widgets/loginScreen.dart';
import 'package:http/http.dart' as http;

class OtpManager {
  static String generatedOTP = '';
}

class RegistrationForFarmer extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController mobileController;

  RegistrationForFarmer({
    required this.emailController,
    required this.mobileController,
    Key? key,
  }) : super(key: key);

  @override
  _RegistrationForFarmerPageState createState() =>
      _RegistrationForFarmerPageState();
  bool areYouADairyFarmer = false;
}

class _RegistrationForFarmerPageState extends State<RegistrationForFarmer> {
  final TextEditingController _farmer_nameController = TextEditingController();
  final TextEditingController _father_nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _panchayatController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _dailyMilkProductionController =
      TextEditingController();
  final TextEditingController _LocationController = TextEditingController();
  final TextEditingController _howManyCattleController =
      TextEditingController();
  final TextEditingController _breedOfCattleController =
      TextEditingController();
  final TextEditingController _categoryOfBreedController =
      TextEditingController();
  final TextEditingController _current_dairy_locationController =
      TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  File? _selectedFile;

  @override
  Future<void> registor(
    farmerName,
    fatherName,
    date,
    mobile,
    email,
    panchayat,
    state,
    block,
    breedOfCattle,
    categaryOfBreed,
    dailyMilkProduction,
    location,
    howManyCattle,
    areYouADairyFarmer,
    vaccination,
    longitude,
    latitude,
    district,
    address,
    pinCode,
    lastName,
    gender,
    currentdairylocation,
    accountCategory,
    anyLoan,
    anyLoanRequired,
    isYourFarmInsured,
    String proofOfIdentity,
  ) async {
    try {
      Response response = await post(
        Uri.parse('http://43.205.23.114/api/method/oymom.api.farmer_register'),
        body: {
          'farmer_name': farmerName,
          'father_name': fatherName,
          'date_of_birth': date,
          'mobile': mobile,
          'email': email,
          'panchayat': panchayat,
          'state': state,
          'block': block,
          'breed_of_cattle': breedOfCattle,
          'categary_of_breed': categaryOfBreed,
          'daily_milk_production': dailyMilkProduction,
          'location': location,
          'how_many_cattle': howManyCattle,
          'vaccination': vaccination,
          'are_you_a_dairy_farmer': areYouADairyFarmer,
          'longitude': longitude,
          'latitude': latitude,
          'district': district,
          'address': address,
          'pin_code': pinCode,
          'last_name': lastName,
          'gender': gender,
          'current_dairy_location': currentdairylocation,
          'account_category': accountCategory,
          'any_loan': anyLoan,
          'any_loan_required': anyLoanRequired,
          'is_your_farm_insured': isYourFarmInsured,
          'proof_of_identity': proofOfIdentity,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final message = jsonResponse['message']?['message'];
        showSuccessMessage(message);
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FrontPage();
        }));
        var data = jsonDecode(response.body.toString());
        print(
          "----------------------------------------------------------$data----------------------------------------------",
        );

        if (data['email'] == widget.emailController.text.toString()) {
          // Handle success, if needed
        } else {
          // Handle failure, if needed
        }
        if (_selectedFile != null) {
          await uploadFile(_selectedFile!);
        }
      } else {
        showErrorMessage();
        print(response.statusCode);
        print(response);
        print(
          "----------------------------------------------------------${jsonDecode(response.body.toString())}----------------------------------------------",
        );

        print('failed');
      }
    } catch (e) {
      print(e.toString());
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

  void initState() {
    super.initState();
    _fetchBreedOptions();
    // _requestPermission(Permission.location);
    getCurrentLocation();
  }

  Future<void> _fetchBreedOptions() async {
    final apiUrl =
        'http://43.205.23.114/api/method/oymom.api.get_vaccination_list';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['message'];
        final List<String> options =
            data.map((item) => item['vaccine_type'].toString()).toList();

        setState(() {
          vaccinationOptions = options;
        });
      } else {
        print(
            'Failed to fetch breed options. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  void showSuccessMessage(String massege) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massege),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("something went wrong probably email already exist"),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showRequiredFieldsError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Enter All Fields correctly"),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Future<void> _requestPermission(Permission permission) async {
  //   PermissionStatus status = await permission.request();
  //   if (status.isGranted) {
  //     print(status);
  //     print('${permission.toString()} permission granted');
  //   } else {
  //     print(status);
  //     print('${permission.toString()} permission denied');
  //   }
  // }

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
        String mainAddress = "$name";
        mainAddresses.add(mainAddress);
      }
      print(mainAddresses.toString());
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

  final format = DateFormat("yyyy-MM-dd");

  List<String> vaccinationOptions = [];
  List<String> account_categoryoptions = ['FREE', 'T-SAVING', 'PREMIUM'];
  List<String> any_loanoptions = ['Yes', 'No'];
  List<String> any_loan_requiredoptions = ['Yes', 'No'];
  List<String> is_your_farm_insured_options = ['Yes', 'No'];
  String selectedVaccinationOption = 'Attenuated vaccines';
  String selectedaccount_category = 'FREE';
  String selected_any_loan = 'No';
  String selected_any_loan_required = 'No';
  String selected_is_your_farm_insured = 'No';

  List<String> GenderOptions = [
    'Male',
    'Female',
    'Other',
    'Transgender',
    'Genderqueer',
    'Non-Conforming',
    'Prefer not to say'
  ];
  String selectedGenderOption = 'Male';

  bool areYouADairyFarmer = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onLocationSelected(String location) {
    _LocationController.text = location;
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                'You are not registerd yet. Do you really want to exit ?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'No',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
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
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).primaryColor;
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: Scaffold(
          appBar: AppBar(
            title: Text(
              "Farmer Registration",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.orange,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFileUploadField(),
                    SizedBox(
                      height: 16,
                    ),

                    TextFormField(
                      controller: _farmer_nameController,
                      decoration: InputDecoration(
                          labelText: "Farmer Name",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Farmer Name is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                          labelText: 'Last Name', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Last Name is required';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.male, color: Colors.orange),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Gender",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Spacer(),
                        Container(
                          height: 33,
                          padding: const EdgeInsets.only(left: 8, right: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selectedGenderOption,
                            icon: const Icon(Icons.arrow_drop_down),
                            underline: const SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            iconEnabledColor: Colors.orange,
                            onChanged: (value) {
                              setState(() {
                                selectedGenderOption = value!;
                              });
                            },
                            items: GenderOptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DateTimeField(
                      controller: _dateController,
                      decoration: InputDecoration(
                          labelText: "Date of birth",
                          border: OutlineInputBorder()),
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
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _father_nameController,
                      decoration: InputDecoration(
                          labelText: "Father Name",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Father Name is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    TextFormField(
                      // controller: _emailController,
                      decoration: InputDecoration(
                          labelText: "Email", border: OutlineInputBorder()),
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
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      // controller: _mobileController,
                      decoration: InputDecoration(
                        labelText: "Mobile Number",
                        border: OutlineInputBorder(),
                        prefix: const Text('+91 '),
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

                    // Text(widget.mobileController.text.toString(),),
                    // Text(widget.emailController.text.toString(),),
                    SizedBox(
                      height: 16,
                    ),

                    TextFormField(
                      controller: _LocationController,
                      decoration: InputDecoration(
                        labelText: "Location",
                        border: OutlineInputBorder(),
                        // suffixIcon: InkWell(
                        //   onTap: () {
                        //     // _requestPermission(Permission.location);
                        //     // Show the map screen when the suffix icon is tapped
                        //     showModalBottomSheet(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return MapScreen(
                        //           onLocationSelected: (location) {
                        //             // Update the _LocationController with the selected location
                        //             _LocationController.text = location;
                        //             Navigator.pop(
                        //                 context); // Close the bottom sheet
                        //           },
                        //         );
                        //       },
                        //     );
                        //   },
                        //   child:
                        //       Icon(Icons.location_searching, color: themeColor),
                        // ),
                      ),
                      keyboardType: TextInputType.text,
                      // readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Location is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    TextFormField(
                      controller: _stateController,
                      decoration: InputDecoration(
                          labelText: "State", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'State is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _districtController,
                      decoration: InputDecoration(
                          labelText: 'District', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'District is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _pinCodeController,
                      decoration: InputDecoration(
                          labelText: 'Pin Code', border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pin Code is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _blockController,
                      decoration: InputDecoration(
                          labelText: "Block", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Block is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _panchayatController,
                      decoration: InputDecoration(
                          labelText: "Panchayat", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Panchayat is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                          labelText: 'Address', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Address is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    TextFormField(
                      controller: _current_dairy_locationController,
                      decoration: InputDecoration(
                          labelText: "Current Dairy Location",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Current Dairy Location is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _dailyMilkProductionController,
                      decoration: InputDecoration(
                          labelText: "Daily Milk Production",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Daily Milk Production is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _howManyCattleController,
                      decoration: InputDecoration(
                          labelText: "How many cattles",
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Number of Cattle is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _breedOfCattleController,
                      decoration: InputDecoration(
                          labelText: 'Breed of Cattle',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Breed of Cattle is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _categoryOfBreedController,
                      decoration: InputDecoration(
                          labelText: 'Category of Breed',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Category of Breed is required';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 8),

                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          "Vaccination",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        // const Spacer(),
                        Container(
                          height: 33,
                          padding: const EdgeInsets.only(left: 8, right: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selectedVaccinationOption,
                            icon: const Icon(Icons.arrow_drop_down),
                            underline: const SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            iconEnabledColor: Colors.orange,
                            onChanged: (value) {
                              setState(() {
                                selectedVaccinationOption = value!;
                              });
                            },
                            items: vaccinationOptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.medication, color: Colors.orange),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "any loan",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Spacer(),
                        Container(
                          height: 33,
                          padding: const EdgeInsets.only(left: 8, right: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selected_any_loan,
                            icon: const Icon(Icons.arrow_drop_down),
                            underline: const SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            iconEnabledColor: Colors.orange,
                            onChanged: (value) {
                              setState(() {
                                selected_any_loan = value!;
                              });
                            },
                            items: any_loanoptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.medication, color: Colors.orange),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "any loan required",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Spacer(),
                        Container(
                          height: 33,
                          padding: const EdgeInsets.only(left: 8, right: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selected_any_loan_required,
                            icon: const Icon(Icons.arrow_drop_down),
                            underline: const SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            iconEnabledColor: Colors.orange,
                            onChanged: (value) {
                              setState(() {
                                selected_any_loan_required = value!;
                              });
                            },
                            items: any_loan_requiredoptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.medication, color: Colors.orange),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "is your farm insured",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Spacer(),
                        Container(
                          height: 33,
                          padding: const EdgeInsets.only(left: 8, right: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selected_is_your_farm_insured,
                            icon: const Icon(Icons.arrow_drop_down),
                            underline: const SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            iconEnabledColor: Colors.orange,
                            onChanged: (value) {
                              setState(() {
                                selected_is_your_farm_insured = value!;
                              });
                            },
                            items: is_your_farm_insured_options.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 18),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.medication, color: Colors.orange),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "account category",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Spacer(),
                        Container(
                          height: 33,
                          padding: const EdgeInsets.only(left: 8, right: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: selectedaccount_category,
                            icon: const Icon(Icons.arrow_drop_down),
                            underline: const SizedBox(),
                            dropdownColor: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(15),
                            iconSize: 30,
                            iconEnabledColor: Colors.orange,
                            onChanged: (value) {
                              setState(() {
                                selectedaccount_category = value!;
                              });
                            },
                            items: account_categoryoptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.medication, color: Colors.orange),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Are you a dairy farmer?',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Spacer(),
                        Switch(
                          value: areYouADairyFarmer,
                          onChanged: (value) {
                            setState(() {
                              areYouADairyFarmer = value;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          String areYouADairyFarmerValue =
                              areYouADairyFarmer ? '1' : '0';
                          print(
                              '----------------------$areYouADairyFarmerValue');
                          if (_formKey.currentState!.validate()) {
                            print(
                                '----------------------${areYouADairyFarmerValue}');
                            registor(
                                _farmer_nameController.text.toString(),
                                _father_nameController.text.toString(),
                                _dateController.text.toString(),
                                widget.mobileController.text.toString(),
                                // _mobileController.text.toString(),
                                // _emailController.text.toString(),
                                widget.emailController.text.toString(),
                                _panchayatController.text.toString(),
                                _stateController.text.toString(),
                                _blockController.text.toString(),
                                _breedOfCattleController.text.toString(),
                                _categoryOfBreedController.text.toString(),
                                _dailyMilkProductionController.text.toString(),
                                _LocationController.text.toString(),
                                _howManyCattleController.text.toString(),
                                areYouADairyFarmerValue,
                                selectedVaccinationOption.toString(),
                                _longitudeController.text.toString(),
                                _latitudeController.text.toString(),
                                _districtController.text.toString(),
                                _addressController.text.toString(),
                                _pinCodeController.text.toString(),
                                _lastNameController.text.toString(),
                                selectedGenderOption.toString(),
                                _current_dairy_locationController.text
                                    .toString(),
                                selectedaccount_category.toString(),
                                selected_any_loan.toString(),
                                selected_any_loan_required.toString(),
                                selected_is_your_farm_insured.toString(),
                                _selectedFile.toString());
                          } else {
                            showRequiredFieldsError();
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ), // Your registration form widgets go here,
      ),
    );
  }

  Widget _buildFileUploadField() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(left: 11, right: 6),
        child: Row(
          children: [
            Icon(Icons.file_copy, color: Colors.orange),
            const SizedBox(width: 8),
            const Text(
              "proof of identity",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
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
}
