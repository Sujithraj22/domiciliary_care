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
        builder: (context, snapshot) {
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
                        worker.iconLists[index]["dateOfWork"] ==
                                'Wednesday 27 Mar'
                            ? SizedBox()
                            : Container(
                                color: Colors.grey[300],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  //date of work
                                  child: Text(
                                      worker.iconLists[index]["dateOfWork"]
                                          .toString(),
                                      //worker.samplePosts[index].title.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                      )),
                                )),
                        IntrinsicHeight(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                worker.iconLists[index]['clockOutTime']
                                            .toString() ==
                                        '-'
                                    ?
                                    //clockin clockout section
                                    TimingWidget(
                                        clockInTime: worker.iconLists[index]
                                                ['clockInTime']
                                            .toString(),
                                        clockOutTime: worker.iconLists[index]
                                                ['cloc7kOutTime']
                                            .toString(),
                                        totalTime: 'Ongoing',
                                      )
                                    : TimingWidget(
                                        clockInTime: worker.iconLists[index]
                                                ['clockInTime']
                                            .toString(),
                                        clockOutTime: worker.iconLists[index]
                                                ['clockOutTime']
                                            .toString(),
                                        totalTime: worker.iconLists[index]
                                                ['totalTime']
                                            .toString(),
                                      ),
                                worker.iconLists[index]['isSaved'] == true
                                    ? VerticalDivider(
                                        thickness: 2, color: Colors.green)
                                    : VerticalDivider(
                                        thickness: 2, color: Colors.grey),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CareWorkersWidget(
                                          careWorkerName: worker
                                              .iconLists[index]
                                                  ['careWorkerName']
                                              .toString(),
                                          careWorker: worker.iconLists[index]
                                                  ['careWorker']
                                              .toString(),
                                        ),

                                        Wrap(
                                          //direction: Axis.vertical,

                                          //@formatter:off
                                                children: [
                                                  worker.iconLists[index]['isMedication'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.prescriptionBottleMedical)  : SizedBox() ,
                                                  worker.iconLists[index]['isBodyMap'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.person)  : SizedBox() ,
                                                  worker.iconLists[index]['isFood'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.utensils)  : SizedBox() ,
                                                  worker.iconLists[index]['isDrinks'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.mugSaucer)  : SizedBox() ,
                                                  worker.iconLists[index]['isPersonalCare'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.bath)  : SizedBox() ,
                                                  worker.iconLists[index]['isToiletAssistance'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.toilet)  : SizedBox() ,
                                                  worker.iconLists[index]['isRepositioning'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.bed)  : SizedBox() ,
                                                  worker.iconLists[index]['isCompanionshipRespitCare'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.peopleGroup)  : SizedBox() ,
                                                  worker.iconLists[index]['isLaundry'] == true? WorkerIconWidget(iconData: Icons.local_laundry_service_rounded)  : SizedBox() ,
                                                  worker.iconLists[index]['isGroceries'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.cartShopping)  : SizedBox() ,
                                                  worker.iconLists[index]['isHousework'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.broom)  : SizedBox() ,
                                                  worker.iconLists[index]['isHouseholdChores'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.screwdriverWrench)  : SizedBox() ,
                                                  worker.iconLists[index]['isUnableToDeliverCare'] == true? WorkerIconWidget(iconData: FontAwesomeIcons.ban)  : SizedBox(),



                                              ],)//worker.samplePosts[index].id.toString()),
                                        //@formatter:on
                                      ],
                                    ),
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
        });
  }
}
