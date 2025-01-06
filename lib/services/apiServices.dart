import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pashusevak/Utils/utils.dart';
import 'package:pashusevak/models/DosageFormModel.dart';
import 'package:pashusevak/models/appointmentList.dart';
import 'package:pashusevak/models/availabilityDataModel.dart';
import 'package:pashusevak/models/bannerList.dart';
import 'package:pashusevak/models/cattleListModel.dart';
import 'package:pashusevak/models/diagnosisModel.dart';
import 'package:pashusevak/models/dosage.dart';
import 'package:pashusevak/models/getBreedOfCattle.dart';
import 'package:pashusevak/models/loggedUserModel.dart';
import 'package:pashusevak/models/medicationList.dart';
import 'package:pashusevak/models/periodList.dart';
import 'package:pashusevak/models/symptomsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiServices {
  Future<double> getWalletBalance(String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_balance";

    try {
      var request = await http.get(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
        'Cookie': 'sid=$sid',
      });

      if (request.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(request.body);
        double balance = responseBody['message']['balance'];
        print('Balance: $balance');
        return balance;
      } else {
        print('Failed to load balance. Status code: ${request.statusCode}');
        print('request Body: ${request.body}');
        throw Exception('Failed to load balance');
      }
    } catch (ex) {
      print('Error during API call: $ex');
      throw Exception('Error during API call');
    }
  }

  Future<List<GetBreedOfCattle>> getBreedOfCattle(String sid) async {
    String url =
        "http://43.205.23.114/api/method/oymom.api.get_breed_of_cattle";

    var request = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    });

    if (request.statusCode == 200) {
      List<dynamic> body = jsonDecode(request.body)['message'];

      List<GetBreedOfCattle> banners =
          body.map((dynamic item) => GetBreedOfCattle.fromJson(item)).toList();
      print("message array: $banners");
      return banners;
    } else {
      throw Exception('Failed to load images');
    }
  }

  Future<List<PeriodList>> getPeriodList(String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_period";

    var request = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    });

    if(request.statusCode == 200){
      List<dynamic> body = jsonDecode(request.body)['message'];
      print("body get: $body");

      List<PeriodList> banners =
          body.map((dynamic item) => PeriodList.fromJson(item)).toList();
      print("med list data: $banners");
      return banners;
    }
    else{
      throw Exception("Failed to load medication data");
    }
  }

  Future<void> uploadDocsFromDoctor (File? _selectedFile) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.upload__single_file";

    var request =  http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.files.add(
      await http.MultipartFile.fromPath('file', _selectedFile!.path)
    );

    var response = await request.send();

    if(response.statusCode == 200){
      Utils().toastMessage("Upload successful");
    }
    else{
      print("something went wrong");
    }
  }

  Future<List<DiagnosisModel>> getDiagnosis(String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.diagnosis_name";

    var request = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    });

    if(request.statusCode == 200){
      List<dynamic> body = jsonDecode(request.body)['message'];
      print("body get: $body");

      List<DiagnosisModel> banners =
          body.map((dynamic item) => DiagnosisModel.fromJson(item)).toList();
      print("med list data: $banners");
      return banners;
    }
    else{
      throw Exception("Failed to load medication data");
    }
  }

  Future<List<SymptomsModel>> getSymptoms (String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.symptoms_name";

    var request = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    });

    if(request.statusCode == 200){
      List<dynamic> body = jsonDecode(request.body)['message'];
      print("body get: $body");

      List<SymptomsModel> banners =
          body.map((dynamic item) => SymptomsModel.fromJson(item)).toList();
      print("med list data: $banners");
      return banners;
    }
    else{
      throw Exception("Failed to load medication data");
    }
  }

  Future<List<DosageFormModel>> getDosageForm (String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_dosage_form";

    var request = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    });

    if(request.statusCode == 200){
      List<dynamic> body = jsonDecode(request.body)['message'];
      print("body get: $body");

      List<DosageFormModel> banners =
          body.map((dynamic item) => DosageFormModel.fromJson(item)).toList();
      print("med list data: $banners");
      return banners;
    }
    else{
      throw Exception("Failed to load medication data");
    }
  }

  Future<List<DosageList>> getDosageList(String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_dosage";

    var request = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    });

    if(request.statusCode == 200){
      List<dynamic> body = jsonDecode(request.body)['message'];
      print("body get: $body");

      List<DosageList> banners =
          body.map((dynamic item) => DosageList.fromJson(item)).toList();
      print("med list data: $banners");
      return banners;
    }
    else{
      throw Exception("Failed to load medication data");
    }
  }

  Future<List<MedicationList>> getMedicationList(String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_medication";

    var request = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    });

    if(request.statusCode == 200){
      List<dynamic> body = jsonDecode(request.body)['message'];
      print("body get: $body");

      List<MedicationList> banners =
          body.map((dynamic item) => MedicationList.fromJson(item)).toList();
      print("med list data: $banners");
      return banners;
    }
    else{
      throw Exception("Failed to load medication data");
    }
  }

  // Future<DoctorLoggedModel> getDoctorDetails (String sid) async {
  //   var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_logged_user_details";

  //   var request = await http.get(Uri.parse(apiUrl),
  //   headers: {
  //     'Content-Type': 'application/json',
  //     'Cookie': 'sid=$sid',
  //   }
  //   );

  //   if(request.statusCode == 200){
  //     final userData = jsonDecode(request.body);
      
  //     final LoggedUserData = DoctorLoggedModel.fromJson(userData['message']);
  //     print("userData: $LoggedUserData");
  //     return LoggedUserData;
  //   }
  //   else{
  //     throw Exception("Failed To Load Data");
  //   }
  // }

  Future<LoggedUserModel> getUserDetails(String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_logged_user_details";

    var request = await http.get(Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    }
    );

    if(request.statusCode == 200){
      final userData = jsonDecode(request.body);
      
      final LoggedUserData = LoggedUserModel.fromJson(userData['message']);
      print("userData: $LoggedUserData");
      return LoggedUserData;
    }
    else{
      throw Exception("Failed To Load Data");
    }
  }


  Future<HealthcareSchedule> fetchHealthcareSchedule(String doctorId, String sid, DateTime date) async {
  final response = await http.get(
    Uri.parse('http://43.205.23.114/api/method/oymom.api.get_availability_data?doctor=$doctorId&date=$date'),
    headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    },
  );

  if (response.statusCode == 200) {
    try {
      final decodedJson = jsonDecode(response.body);

      print('JSON Response: $decodedJson');

      if (decodedJson['message'] != null && decodedJson['message']['slot_details'] != null) {
        return HealthcareSchedule.fromJson(decodedJson['message']['slot_details'][0]);
      } else {
        throw Exception('Unexpected JSON structure');
      }
    } catch (e) {
      // Log the error if JSON parsing fails
      print('Error parsing JSON: $e');
      throw Exception('Failed to parse healthcare schedule');
    }
  } else {
    // Log the status code and reason if the request fails
    print('Failed to load schedule. Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}');
    throw Exception('Failed to load healthcare schedule');
  }
}

  Future<void> createAppointment (String doctor, String date, String farmerEmail, String serviceUnit, String appointmentTime, String sid) async {
    var apiUrl = Uri.parse("http://43.205.23.114/api/method/oymom.api.make_appointment");

    try{
      final response = await http.post(apiUrl,
      headers: {
      'Cookie': 'sid=$sid',
    },
      body: {
        'doctor' : doctor,
        'appointment_date' : date,
        'farmer' : farmerEmail,
        'service_unit' : serviceUnit,
        'appointment_time' : appointmentTime
      },
      );

      if(response.statusCode == 200){
        print("Appointment created");
      }
      else{
        print("something went wrong ${response.statusCode}, Reason: ${response.reasonPhrase}");
      }
    }
    catch(e){
      print('Error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> nameOfAppointment (String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.appointment_list";

    var request = await http.get(Uri.parse(apiUrl),
      headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    },
    );

    if(request.statusCode == 200){
      Map<String, dynamic> jsonResponse = json.decode(request.body);
      List<Map<String, dynamic>> appointments = List<Map<String, dynamic>>.from(jsonResponse['message']);
      return appointments;
    }
    else{
      throw Exception("Failed to load data");
    }
  }

  Future<List<CattleListModel>> cattleListItems (String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_classified";

    var request = await http.get(Uri.parse(apiUrl),
      headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    },
    );

    if(request.statusCode == 200){
      final responseBody = json.decode(request.body);
      final List<dynamic> appointmentsJson = responseBody['message'];

      print("cattle list: $appointmentsJson");

      return appointmentsJson
          .map((json) => CattleListModel.fromJson(json))
          .toList();
    }
    else{
      throw Exception("Failed to load data");
    }
  }

  Future<void> rejectAppointment (String sid, String appointmentName) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.reject_appointment";

    var request = await http.post(Uri.parse(apiUrl),
      headers: {
      'Cookie': 'sid=$sid',
    },
    body: {
      "appointment" : appointmentName
    }
    );

    if(request.statusCode == 200){
      Utils().toastMessage("Appointment Rejected Successfully");
    }
    else {
      print("Something went wrong ${request.statusCode} ${request.reasonPhrase}");
    }
  }

  Future<void> createEncounter (String sid, String appointment, String medication, String dosage, period, dosageForm, comment, String symptomsName, String? symptomsName2,String diagnosis_name, String? diagnosis_name2,  ) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.create_encounter";

    var request = await http.post(Uri.parse(apiUrl),
      headers: {
      'Cookie': 'sid=$sid',
    },
    body: {
      "appointment_name": appointment,
      "medication" : medication,
      "dosage" : dosage,
      "period" : period,
      "dosage_form" : dosageForm,
      "comment" : comment,
      "symptoms_name" : symptomsName,
      "symptoms_name" : symptomsName2,
      "diagnosis_name" : diagnosis_name,
      "diagnosis_name" : diagnosis_name2,
    }
    );

    if(request.statusCode == 200){
      print("Encounter Created successfully");
    }
    else {
      print("Something went wrong ${request.statusCode} ${request.reasonPhrase}");
    }
  }

  
Future<void> CattleListing(
  String sellingProductCategory,
  String typeOfCattle,
  String cattleBreed,
  double age,
  int noOfHeat,
  String isOnHeat,
  String heatPeriod,
  String isOnPregnant,
  String? pregnantPeriod,
  double nowMilkPerDay,
  double milkCapacityPerDay,
  List<File>? classifiedAttachments,
) async {
  var url = Uri.parse("http://43.205.23.114/api/method/oymom.api.make_classified");

  try {
    // Create a MultipartRequest
    var request = http.MultipartRequest('POST', url);

    // Add the form data (as a JSON object)
    Map<String, dynamic> formData = {
  "forms": {
    "selling_product_category": sellingProductCategory,
    "type_of_cattel": typeOfCattle,
    "cattel_breed": cattleBreed,
    "age": age.toString(),  // Convert to String
    "no_of_heat": noOfHeat.toString(),  // Convert to String
    "is_on_heat": isOnHeat,
    "heat_period": heatPeriod,
    "is_on_pregnant": isOnPregnant,
    "pregnant_period": pregnantPeriod,
    "now_milk_per_day": nowMilkPerDay.toString(),  // Convert to String
    "milk_capacity_per_day": milkCapacityPerDay.toString(),  // Convert to String
    "classifed_attachments": classifiedAttachments!.map((file) => "/files/${file.path.split('/').last}").toList(),
  }
};


request.fields["forms"] = jsonEncode(formData);
 // Corrected: Sending as JSON object

    // Add the files to the request
    if (classifiedAttachments.isNotEmpty) {
      for (int i = 0; i < classifiedAttachments.length; i++) {
        File imageFile = classifiedAttachments[i];
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile(
          'classifed_attachments[$i]', stream, length,
          filename: imageFile.path.split("/").last);
        request.files.add(multipartFile);
      }
    }

    request.headers['Content-Type'] = 'multipart/form-data';

    // Send the request and get the response
    var response = await request.send();

    // Check if the request was successful
    var responseBody = await response.stream.bytesToString();
    print("Response status: ${response.statusCode}");
    print("Response body after submission: $responseBody");

    // Decode the JSON response
    var jsonResponse = jsonDecode(responseBody);
    

    // Check if the request was successful
    if (response.statusCode == 200) {
      if (jsonResponse['message']['status'] == 'failed') {
        String errorMessage = jsonResponse['message']['message'];
        print("getting this: $errorMessage");
        print("getting status: ${jsonResponse['message']['status']}");
        print("request fields: ${request.fields}");
        Utils().toastMessage("Error: $errorMessage");
      } else {
        Utils().toastMessage("Cattle Registered Successfully");
      }
    } else {
      Utils().toastMessage("Something went wrong, try again");
    }
  } catch (e) {
    print('Error: $e');
  }
}

//   Future<void> CattleListing(
//   String sellingCategory,
//   String typeOfCattle,
//   String cattleBreed,
//   double age,
//   String isOnHeat,
//   String? heatPeriod,
//   String isOnPregnant,
//   String? pregnantPeriod,
//   double milkPerDay,
//   double milkCapacity,
//   List<String> fileToUpload,
// ) async {
//   final apiUrl = "http://43.205.23.114/api/method/oymom.api.make_classified";

//   var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

//   // Adding files to the request
//   if (fileToUpload != null && fileToUpload.isNotEmpty) {
//     for (int i = 0; i < fileToUpload.length; i++) {
//       File imageFile = fileToUpload[i];
//       var stream = http.ByteStream(imageFile.openRead());
//       var length = await imageFile.length();
//       var multipartFile = http.MultipartFile(
//         "classifed_attachments[$i]",
//         stream,
//         length,
//         filename: imageFile.path.split("/").last,
//       );
//       request.files.add(multipartFile);
//       print('Added file: ${imageFile.path}');
//     }
//   }

//   // Creating the JSON data for 'forms'
//   // Map<String, dynamic> formsData = {
//   //   "selling_product_category": sellingCategory,
//   //   "type_of_cattel": typeOfCattle,
//   //   "cattel_breed": cattleBreed,
//   //   "age": age,
//   //   "is_on_heat": isOnHeat,
//   //   "heat_period": heatPeriod ?? "",
//   //   "is_on_pregnant": isOnPregnant,
//   //   "pregnant_period": pregnantPeriod ?? "",
//   //   "now_milk_per_day": milkPerDay,
//   //   "milk_capacity_per_day": milkCapacity,
//   // };

//   var formsData = {
//     "selling_product_category": sellingCategory,
//     "type_of_cattel": typeOfCattle,
//     "cattel_breed": cattleBreed,
//     "age": age,
//     "is_on_heat": isOnHeat,
//     "heat_period": heatPeriod ?? "",
//     "is_on_pregnant": isOnPregnant,
//     "pregnant_period": pregnantPeriod ?? "",
//     "now_milk_per_day": milkPerDay,
//     "milk_capacity_per_day": milkCapacity,
//   };

//   request.fields['forms'] = jsonEncode(formsData);
//   if (kDebugMode) {
//     print('Sending forms data: ${jsonEncode(formsData)}');
//   }
//   // print('Sending forms data: ${jsonEncode(formsData)}');

//   try {
//     var response = await request.send();

//     if (response.statusCode == 200) {
//       print('Uploaded file path: $fileToUpload');
//       Utils().toastMessage('Enquiry Created');
//     } else {
//       print('Something went wrong. Status code: ${response.statusCode}');
//       response.stream.transform(utf8.decoder).listen((value) {
//         print('Response: $value');
//       });
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }
//   Future<void> CattleListing(CattleListModel model) async {
//   final apiUrl = "http://43.205.23.114/api/method/oymom.api.make_classified";

//   var uri = Uri.parse(apiUrl);
//   var request = http.MultipartRequest('POST', uri);

//   request.headers['Content-Type'] = 'multipart/form-data';

//   // Add JSON fields
//   request.fields['data'] = json.encode(model.toJson());

//   // Add file attachments
//   for (var file in model.classifiedAttachments) {
//     if (file != null) {
//       var mimeType = lookupMimeType(file.path) ?? 'application/octet-stream';
//       var fileStream = http.ByteStream(file.openRead());
//       var length = await file.length();

//       request.files.add(http.MultipartFile(
//         'file',
//         fileStream,
//         length,
//         filename: file.path.split('/').last,
//         contentType: MediaType.parse(mimeType),
//       ));
//     }
//   }

//   var response = await request.send();

//   if (response.statusCode == 200) {
//     print("Form submitted successfully");
//   } else {
//     print('Failed to submit form: ${response.statusCode}');
//   }
// }

  Future<List<Message>> fetchBanners() async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_banner";
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['message'];

      List<Message> banners =
          body.map((dynamic item) => Message.fromJson(item)).toList();
      print("message array: $banners");
      return banners;
    } else {
      throw Exception('Failed to load images');
    }
  }

  Future<List<AppointmentListModel>> getAppointmentList(String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.appointment_list";

    var request = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Cookie': 'sid=$sid',
    });

    if (request.statusCode == 200) {
      final responseBody = json.decode(request.body);
      final List<dynamic> appointmentsJson = responseBody['message'];
      print("appointments json: $appointmentsJson");
      return appointmentsJson
          .map((json) => AppointmentListModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  Future<void> logout() async {
    final String apiUrl = 'http://43.205.23.114/api/method/logout';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        prefs.clear();
        String? role = prefs.getString("role");
        String? sid = prefs.getString("sid");
        print("role after logout: $role");
        print("sid after logout: $sid");

        print('Logout responce: ${response.body}');
        print('Logout Successful');
      } else {
        print('Logout Error: ${response.statusCode}');
        print('Logout Response: ${response.body}');
      }
    } catch (error) {
      print('Error during logout: $error');
    }
  }
}


