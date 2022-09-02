import 'package:flutter/material.dart';
import 'package:review_app/pages/app_bar/app_bar.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 182, 1, 202),
      appBar: getHomeAppBar(),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF2C0469),
                    Color.fromARGB(255, 182, 1, 202)
                  ])),
              child: Container(
                width: double.infinity,
                height: 400.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",
                        ),
                        radius: 65.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Maísa Lira",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Color.fromARGB(255, 253, 252, 255),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Color.fromARGB(255, 255, 255, 255),
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "QUESTÕES RESPONDIDAS",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 166, 105, 226),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "00",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 166, 105, 226),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "ACERTOS",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 166, 105, 226),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "00",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 166, 105, 226)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 5.0,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Bio: Sou alagoana e tenho 19 anos.  Sou aluna do quarto ano de informática no ensino técnico do IFAL.",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color:
                                              Color.fromARGB(255, 146, 81, 221),
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
