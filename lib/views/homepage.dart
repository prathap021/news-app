import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/models/apple_model.dart';
import 'package:news_app/models/business_model.dart';
import 'package:news_app/models/tesla_model.dart';
import 'package:news_app/services/applse_services.dart';
import 'package:news_app/services/business_services.dart';
import 'package:news_app/services/tesla_services.dart';

import '../widget/apple_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TeslaRemote teslaRemote = TeslaRemote();
  AppleServices appleServices = AppleServices();
  BusinessServices businessServices = BusinessServices();
  @override
  void initState() {
    super.initState();
    fetchalldata();
  }

  fetchalldata() async {
    await teslaRemote.fetchtesla();
    await appleServices.fetchapple();
    await businessServices.fetchbusiness();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: RichText(
                text: TextSpan(
                  text: 'Apple News',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: FutureBuilder<AppleModel>(
                  future: appleServices.fetchapple(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(snapshot
                                                    .data!
                                                    .articles![index]
                                                    .urlToImage!)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        height: 170,
                                        width: 120,
                                      ),
                                    ),
                                  ),
                                  Text("price")
                                ],
                              ));
                    }
                    ;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: RichText(
                text: TextSpan(
                  text: 'Tesla News',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: FutureBuilder<TeslaModel>(
                  future: teslaRemote.fetchtesla(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(snapshot
                                                  .data!
                                                  .articles![index]
                                                  .urlToImage!)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      height: 170,
                                      width: 120,
                                    ),
                                  ),
                                  Text("price")
                                ],
                              ));
                    }
                    ;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: RichText(
                text: TextSpan(
                  text: 'Business News',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  child: FutureBuilder<BusinessModel>(
                      future: businessServices.fetchbusiness(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      bottom: 10, top: 10, left: 10, right: 10),
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(snapshot.data!
                                              .articles![index].urlToImage!
                                              .toString())),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                );
                              });
                        }
                      }),
                ))
          ],
        ),
      )),
    );
  }
}
