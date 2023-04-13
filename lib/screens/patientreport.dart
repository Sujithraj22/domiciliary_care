

import 'package:domiciliary_care/constants/color.dart';
import 'package:domiciliary_care/models/workreport.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../sections/sections.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  WorkReport worker = WorkReport();
  //List<dynamic> users = [];


  /*void initState(){
    super.initState();
    worker.fetchUsers();

  }*/



  //Date
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: worker.getData(),

      builder: (context,snapshot) {

        if (snapshot.hasData) {
          return Scaffold(
                    appBar: AppBar(
                      backgroundColor: themeColor,
                      title: Center(child: Text(worker.workerName + '\'s report')),
                    ),
                    body: ListView.builder(
                        itemCount: worker.iconLists.length,
                        itemBuilder: (context, index) {
                          //final user = users[index];
                          //final email = user['email'];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                  color: Colors.grey[300],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    //date of work
                                    child: Text(worker.iconLists[index]["dateOfWork"].toString(),//worker.samplePosts[index].title.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),
                                  )),
                              IntrinsicHeight(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      //clockin clockout section
                                      TimingWidget(clockInTime: worker.iconLists[index]['clockInTime'].toString(),
                                      clockOutTime: worker.iconLists[index]['clockOutTime'].toString(),
                                        totalTime:worker.iconLists[index]['totalTime'].toString() ,
                                      ),
                                      VerticalDivider(thickness: 2, color: Colors.grey),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CareWorkersWidget(careWorkerName: worker.iconLists[index]['careWorkerName'].toString(),
                                                careWorker: worker.iconLists[index]['careWorker'].toString(),
                                            ),

                                            Wrap(

                                             //direction: Axis.vertical,


                                              children: [
                                                worker.iconLists[index]['isMedication'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.prescriptionBottleMedical,)  : Container() ,
                                                worker.iconLists[index]['isBodyMap'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.person,)  : Container() ,
                                                worker.iconLists[index]['isFood'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.utensils,)  : Container() ,
                                                worker.iconLists[index]['isDrinks'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.mugSaucer,)  : Container() ,
                                                worker.iconLists[index]['isPersonalCare'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.bath,)  : Container() ,
                                                worker.iconLists[index]['isToiletAssistance'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.toilet,)  : Container() ,
                                                worker.iconLists[index]['isRepositioning'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.bed,)  : Container() ,
                                                worker.iconLists[index]['isCompanionshipRespitCare'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.peopleGroup,)  : Container() ,
                                                worker.iconLists[index]['isLaundry'] == true? WorkerIconWidget(iconData: Icons.local_laundry_service_rounded,)  : Container() ,
                                                worker.iconLists[index]['isGroceries'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.cartShopping,)  : Container() ,
                                                worker.iconLists[index]['isHousework'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.broom,)  : Container() ,
                                                worker.iconLists[index]['isHouseholdChores'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.screwdriverWrench,)  : Container() ,
                                                worker.iconLists[index]['isUnableToDeliverCare'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.ban,)  : Container(),



                                            ],)//worker.samplePosts[index].id.toString()),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );

  }



}


