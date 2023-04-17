import 'package:flutter/material.dart';

//************TimingWidget***********
class TimingWidget extends StatelessWidget {
  TimingWidget({
    super.key,
    required this.clockInTime,
    required this.clockOutTime,
    required this.totalTime,
  });

  String clockInTime = '-';
  String clockOutTime = '-';
  String totalTime = '-';

  @override
  Widget build(BuildContext context) {
    //WorkReport worker = WorkReport();

    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_circle_right_outlined, size: 16),
              Text(clockInTime,
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ],
          ),
          Row(
            children: [
              Icon(Icons.arrow_circle_left_outlined, size: 16),
              Text(clockOutTime, style: TextStyle(fontSize: 18)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.schedule_outlined, size: 16),
              Text(totalTime, style: TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}

//**********CareWorkersWidget*************
class CareWorkersWidget extends StatelessWidget {
  CareWorkersWidget({
    super.key,
    required this.careWorkerName,
    required this.careWorker,
  });

  String careWorkerName;
  String careWorker;

  @override
  Widget build(BuildContext context) {
    //  WorkReport worker = WorkReport();
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Text(careWorker,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          Text(
            ' ' + careWorkerName,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}

//*********WorkerIconWidget*************
class WorkerIconWidget extends StatelessWidget {
  WorkerIconWidget({
    super.key,
    required this.iconData,
  });

  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(10),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(iconData, size: 26),
      ),
    );
  }
}

//************WorkCard************
