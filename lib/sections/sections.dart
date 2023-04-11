import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:domiciliary_care/models/workreport.dart';
import 'package:domiciliary_care/screens/patientreport.dart';



//************TimingWidget***********
class TimingWidget extends StatelessWidget {
  const TimingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WorkReport worker = WorkReport();


    return Container(
      padding: EdgeInsets.all(6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_circle_right_outlined),
              Text(worker.clockInTime,
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ],
          ),
          Row(
            children: [
              Icon(Icons.arrow_circle_left_outlined),
              Text(worker.clockOutTime, style: TextStyle(fontSize: 18)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.schedule_outlined),
              Text(worker.totaltime, style: TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}

//**********CareWorkersWidget*************
class CareWorkersWidget extends StatelessWidget {
  const CareWorkersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    WorkReport worker = WorkReport();
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Text(worker.careWorker,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          Text(
            worker.careWorkerName,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}


//*********WorkerIconWidget*************
class WorkerIconWidget extends StatelessWidget {
  const WorkerIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            // margin: EdgeInsets.all(10),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.prescriptionBottleMedical,
                  size: 26),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.person,
                  size: 26),
            ),
          ),
          WorkCard(),
        ],
      ),
    );
  }
}


//************WorkCard************
class WorkCard extends StatelessWidget {
  const WorkCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(FontAwesomeIcons.utensils,
            size: 26),
      ),
    );
  }
}