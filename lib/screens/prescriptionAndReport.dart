import 'package:flutter/material.dart';
import 'package:pashusevak/Utils/localization.dart';
import 'package:pashusevak/models/DosageFormModel.dart';
import 'package:pashusevak/models/diagnosisModel.dart';
import 'package:pashusevak/models/dosage.dart';
import 'package:pashusevak/models/medicationList.dart';
import 'package:pashusevak/models/periodList.dart';
import 'package:pashusevak/models/symptomsModel.dart';
import 'package:pashusevak/screens/doctorHome.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:pashusevak/widgets/completed.dart';

class PrescriptionAndReport extends StatefulWidget {
  final String sid;
  const PrescriptionAndReport({super.key, required this.sid});

  @override
  State<PrescriptionAndReport> createState() => _PrescriptionAndReportState();
}

class _PrescriptionAndReportState extends State<PrescriptionAndReport> {


  String? appointmentList;
  TextEditingController comment = TextEditingController();
  String? medication;
  String? dosage;
  String? period;
  String? dosageFrom;
  String? symptoms1;
  String? symptoms2;
  String? diagnosis1;
  String? diagnosis2;

  @override
  Widget build(BuildContext context) {
    print("sid in prescription page: ${widget.sid}");
    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.of(context)!
                      .translate('prescription')!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Appointment Name",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),
              FutureBuilder(
  future: NetworkApiServices().nameOfAppointment(widget.sid),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(child: Text('No appointments available'));
    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      List<Map<String, dynamic>> appointments = snapshot.data!;

      if (appointmentList == null && appointments.isNotEmpty) {
            appointmentList = appointments[0]['name'];
          }

      return Container(
        height: MediaQuery.sizeOf(context).height * 0.055,
        padding: EdgeInsets.only(left: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.5),
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: DropdownButton<String>(
          alignment: Alignment.center,
          isExpanded: true,
          value: appointmentList,
          onChanged: (String? newValue) {
            setState(() {
              appointmentList = newValue;
            });
          },
          items: appointments.map<DropdownMenuItem<String>>((appointment) {
            return DropdownMenuItem<String>(
              value: appointment['name'],
              child: Center(
                child: Text(
                  appointment['name'],
                  style: TextStyle(fontSize: 12),
                ),
              ),
            );
          }).toList(),
        ),
      );
    } else {
      return Center(child: Text('No data available'));
    }
  },
),

              SizedBox(
                height: 17.5,
              ),

              Center(
                  child: Text(
                Localization.of(context)!
                      .translate('prescriptionDetails')!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              )),
              SizedBox(
                height: 6.5,
              ),

              Text(
                "Medication",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),
              FutureBuilder(
                future: NetworkApiServices().getMedicationList(widget.sid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No breeds available'));
                  }
                  else if(snapshot.hasData){
                    List<MedicationList> data = snapshot.data!;
                    print("MED List: $data");

                    return Container(
                  height: MediaQuery.sizeOf(context).height * 0.055,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: medication,
                    onChanged: (String? newValue) {
                      setState(() {
                        medication = newValue ?? medication;
                      });
                    },
                    items: data.map((breed) {
                            return DropdownMenuItem<String>(
                              value: breed.name,
                              child: Center(
                                child: Text(
                                  breed.name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );

                  }
                  else {
                    return Center(child: Text('No data available'));
                  }
                },),
              SizedBox(
                height: 6.5,
              ),

              Text(
                "Dosage",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),
              FutureBuilder(
                future: NetworkApiServices().getDosageList(widget.sid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No breeds available'));
                  }
                  else if(snapshot.hasData){
                    List<DosageList> data = snapshot.data!;
                    return Container(
                  height: MediaQuery.sizeOf(context).height * 0.055,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: dosage,
                    onChanged: (String? newValue) {
                      setState(() {
                        dosage = newValue ?? dosage;
                      });
                    },
                    items: data.map((breed) {
                            return DropdownMenuItem<String>(
                              value: breed.name,
                              child: Center(
                                child: Text(
                                  breed.name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );

                  }
                  else {
                    return Center(child: Text('No data available'));
                  }
                  
                },),
              SizedBox(
                height: 6.5,
              ),

              Text(
                "Period",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),
              FutureBuilder(
                future: NetworkApiServices().getPeriodList(widget.sid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No breeds available'));
                  }
                  else if(snapshot.hasData){
                    List<PeriodList> data = snapshot.data!;
                    return Container(
                  height: MediaQuery.sizeOf(context).height * 0.055,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: period,
                    onChanged: (String? newValue) {
                      setState(() {
                        period = newValue ?? period;
                      });
                    },
                    items: data.map((breed) {
                            return DropdownMenuItem<String>(
                              value: breed.name,
                              child: Center(
                                child: Text(
                                  breed.name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );

                  }
                  else {
                    return Center(child: Text('No data available'));
                  }
                  
                },),

              SizedBox(
                height: 6.5,
              ),

              Text(
                "Dosage From",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),
              FutureBuilder(
                future: NetworkApiServices().getDosageForm(widget.sid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No breeds available'));
                  }
                  else if(snapshot.hasData){
                    List<DosageFormModel> data = snapshot.data!;
                    return Container(
                  height: MediaQuery.sizeOf(context).height * 0.055,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: dosageFrom,
                    onChanged: (String? newValue) {
                      setState(() {
                        dosageFrom = newValue ?? dosageFrom;
                      });
                    },
                    items: data.map((breed) {
                            return DropdownMenuItem<String>(
                              value: breed.name,
                              child: Center(
                                child: Text(
                                  breed.name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );

                  }
                  else {
                    return Center(child: Text('No data available'));
                  }
                  
                },),
              SizedBox(
                height: 6.5,
              ),

              Text(
                "Comment",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),

              TextFormField(
                controller: comment,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                ),
              ),

              SizedBox(
                height: 17.5,
              ),

              Center(
                  child: Text(
                Localization.of(context)!
                      .translate('prescriptionSymptoms')!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              )),

              SizedBox(
                height: 6.5,
              ),

              Text(
                "Symptoms 1",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),
              FutureBuilder(
                future: NetworkApiServices().getSymptoms(widget.sid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No breeds available'));
                  }
                  else if(snapshot.hasData){
                    List<SymptomsModel> data = snapshot.data!;
                    return Container(
                  height: MediaQuery.sizeOf(context).height * 0.055,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: symptoms1,
                    onChanged: (String? newValue) {
                      setState(() {
                        symptoms1 = newValue ?? symptoms1;
                      });
                    },
                    items: data.map((breed) {
                            return DropdownMenuItem<String>(
                              value: breed.name,
                              child: Center(
                                child: Text(
                                  breed.name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );

                  }
                  else {
                    return Center(child: Text('No data available'));
                  }
                  
                },),


              SizedBox(
                height: 6.5,
              ),

              Text(
                "Symptoms 2",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),
              FutureBuilder(
                future: NetworkApiServices().getSymptoms(widget.sid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No breeds available'));
                  }
                  else if(snapshot.hasData){
                    List<SymptomsModel> data = snapshot.data!;
                    return Container(
                  height: MediaQuery.sizeOf(context).height * 0.055,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: symptoms2,
                    onChanged: (String? newValue) {
                      setState(() {
                        symptoms2 = newValue ?? symptoms2;
                      });
                    },
                    items: data.map((breed) {
                            return DropdownMenuItem<String>(
                              value: breed.name,
                              child: Center(
                                child: Text(
                                  breed.name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );

                  }
                  else {
                    return Center(child: Text('No data available'));
                  }
                  
                },),

              SizedBox(
                height: 17.5,
              ),

              Center(
                  child: Text(
                Localization.of(context)!
                      .translate('prescriptionDiagnosis')!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              )),

              SizedBox(
                height: 6.5,
              ),

              Text(
                "Diagnosis 1",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),
              FutureBuilder(
                future: NetworkApiServices().getDiagnosis(widget.sid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No breeds available'));
                  }
                  else if(snapshot.hasData){
                    List<DiagnosisModel> data = snapshot.data!;
                    return Container(
                  height: MediaQuery.sizeOf(context).height * 0.055,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: diagnosis1,
                    onChanged: (String? newValue) {
                      setState(() {
                        diagnosis1 = newValue ?? diagnosis1;
                      });
                    },
                    items: data.map((breed) {
                            return DropdownMenuItem<String>(
                              value: breed.name,
                              child: Center(
                                child: Text(
                                  breed.name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );

                  }
                  else {
                    return Center(child: Text('No data available'));
                  }
                  
                },),

              SizedBox(
                height: 6.5,
              ),

              Text(
                "Diagnosis 2",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
              ),
              FutureBuilder(
                future: NetworkApiServices().getDiagnosis(widget.sid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No breeds available'));
                  }
                  else if(snapshot.hasData){
                    List<DiagnosisModel> data = snapshot.data!;
                    return Container(
                  height: MediaQuery.sizeOf(context).height * 0.055,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: diagnosis2,
                    onChanged: (String? newValue) {
                      setState(() {
                        diagnosis2 = newValue ?? diagnosis2;
                      });
                    },
                    items: data.map((breed) {
                            return DropdownMenuItem<String>(
                              value: breed.name,
                              child: Center(
                                child: Text(
                                  breed.name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );

                  }
                  else {
                    return Center(child: Text('No data available'));
                  }
                  
                },),

              SizedBox(
                height: 17,
              ),

              MaterialButton(onPressed: (){
                NetworkApiServices().createEncounter(widget.sid, appointmentList!, medication ?? "", dosage ?? "", period ?? "", dosageFrom ?? "", comment.text, symptoms1 ?? "", symptoms2 ?? "", diagnosis1 ?? "", diagnosis2 ?? "").then((value){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CompletedAnyTask(message: "Prescription Created")));
                });
              },
              child: Text("Submit"),
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              color: Colors.orange,
              textColor: Colors.white,
              )

              // TextFormField(
              //     decoration: InputDecoration(
              //         hintText: "Ointment",
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.black,
              //             width: 1.25,
              //           ),
              //         ),),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
