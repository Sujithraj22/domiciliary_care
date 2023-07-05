import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:u20x_native/util/constants.dart';
import 'package:u20x_native/views/dc/visiting_screen.dart';

import '../../api/api.dart';
import '../../model/care_worker_visit_type.dart';

class VisitTypesScreen extends StatefulWidget {
  final String? variable1;
  const VisitTypesScreen({super.key, this.variable1});

  @override
  State<VisitTypesScreen> createState() => _VisitTypesScreenState();
}

class _VisitTypesScreenState extends State<VisitTypesScreen> {
  late CareWorkerVisitType careWorkerVisitType;
  late final Future<List<CareWorkerVisitType>> _careWorkerVisitType;
  bool isChecked = false;
  bool isArrow = true;

  @override
  void initState() {
    super.initState();
    _careWorkerVisitType = fetchVisitType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDCBackColor,
      appBar: AppBar(
        backgroundColor: kDC1Color,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Visit types'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<CareWorkerVisitType>>(
          future: _careWorkerVisitType,
          builder: (BuildContext context,
              AsyncSnapshot<List<CareWorkerVisitType>> mCareWorkerVisitType) {
            switch (mCareWorkerVisitType.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(
                    color: kDC2Color,
                  ),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                if (mCareWorkerVisitType.hasError) {
                  return Center(
                      child: Text('Error: ${mCareWorkerVisitType.error}'));
                } else {
                  //return Text('${mCareWorkerVisitType.data![1].visitName}');
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Which type of visit is this?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      ListView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: mCareWorkerVisitType.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              final result = {
                                'variable1':
                                    mCareWorkerVisitType.data![index].visitName,
                                'variable2':
                                    mCareWorkerVisitType.data![index].visitId,
                                'variable3': mCareWorkerVisitType
                                    .data![index].requiredTask,
                              };
                              isChecked = true;
                              Navigator.pop(context, result);

                              print(result['variable1']);
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: kDCWhiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFd8dbe0),
                                          offset: Offset(1, 1),
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                        )
                                      ],
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "${mCareWorkerVisitType.data![index].visitName}",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                              SizedBox(
                                                // width: 100,
                                                height: 75,
                                                //MediaQuery.of(context).size.width,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: true,
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    itemCount:
                                                        mCareWorkerVisitType
                                                            .data![index]
                                                            .requiredTask!
                                                            .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int subIndex) {
                                                      if (mCareWorkerVisitType
                                                              .data![index]
                                                              .requiredTask !=
                                                          null) {
                                                        return Wrap(
                                                          direction:
                                                              Axis.vertical,
                                                          children: [
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    1
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .prescriptionBottleMedical),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    2
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .person),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    3
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .utensils),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    4
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .mugSaucer),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    5
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .bath),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    6
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .toilet),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    7
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .bed),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    8
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .peopleGroup),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    9
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        Icons
                                                                            .local_laundry_service_rounded),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    10
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .cartShopping),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    11
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .broom),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    12
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .screwdriverWrench),
                                                                  )
                                                                : SizedBox(),
                                                            mCareWorkerVisitType
                                                                        .data![
                                                                            index]
                                                                        .requiredTask![
                                                                            subIndex]
                                                                        .taskId! ==
                                                                    13
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .ban),
                                                                  )
                                                                : SizedBox(),
                                                          ],
                                                        );
                                                      }
                                                    }),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: mCareWorkerVisitType.data![index].visitName == widget.variable1
                                                ? Visibility(
                                                    visible: true,
                                                    child: Icon(
                                                      Icons.check_circle,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    ),
                                                  )
                                                : Visibility(
                                                    visible: true,
                                                    child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      size: 30,
                                                      color: kDC3Color,
                                                    ),
                                                  ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
            }
          }),
    );
  }
}
