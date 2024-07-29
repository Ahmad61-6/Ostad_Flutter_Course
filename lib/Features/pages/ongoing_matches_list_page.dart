import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ostadapp/Features/pages/match_status_page.dart';
import 'package:ostadapp/data/football_match.dart';

class OnGoingMatchesListPage extends StatefulWidget {
  const OnGoingMatchesListPage({super.key});

  @override
  State<OnGoingMatchesListPage> createState() => _OnGoingMatchesListPageState();
}

class _OnGoingMatchesListPageState extends State<OnGoingMatchesListPage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<FootballMatch> footballMatchList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Match List",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: StreamBuilder(
            stream:
                firebaseFirestore.collection('Football Matches').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                footballMatchList.clear();
                for (QueryDocumentSnapshot element in snapshot.data!.docs) {
                  FootballMatch footballMatch = FootballMatch(
                      element.get("team_1"),
                      element.get("team_2"),
                      element.get("team_1_score"),
                      element.get("team_2_score"),
                      element.get("runningTime"),
                      element.get("totalTime"),
                      element.id);
                  footballMatchList.add(footballMatch);
                }
                return ListView.separated(
                  itemCount: footballMatchList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MatchStatusPage(
                                    team_1: footballMatchList[index].team_1,
                                    team_2: footballMatchList[index].team_2,
                                    team_1_score:
                                        footballMatchList[index].team_1_score,
                                    team_2_score:
                                        footballMatchList[index].team_2_score,
                                    runningTime:
                                        footballMatchList[index].runningTime,
                                    totalTime:
                                        footballMatchList[index].totalTime)));
                      },
                      leading: Text(
                        "${footballMatchList[index].team_1} vs"
                        " ${footballMatchList[index].team_2}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 3,
                    );
                  },
                );
              }
              return const SizedBox();
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
