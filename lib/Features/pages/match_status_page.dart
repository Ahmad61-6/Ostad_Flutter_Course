import 'package:flutter/material.dart';

class MatchStatusPage extends StatefulWidget {
  final String team_1,
      team_2,
      team_1_score,
      team_2_score,
      runningTime,
      totalTime;
  const MatchStatusPage(
      {Key? key,
      required this.team_1,
      required this.team_2,
      required this.team_1_score,
      required this.team_2_score,
      required this.runningTime,
      required this.totalTime})
      : super(key: key);

  @override
  State<MatchStatusPage> createState() => _MatchStatusPageState();
}

class _MatchStatusPageState extends State<MatchStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "${widget.team_1}vs${widget.team_2}",
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          color: Colors.white,
          elevation: 20,
          child: SizedBox(
            height: 160,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${widget.team_1} vs ${widget.team_2}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.black54),
                  ),
                  Text(
                    "${widget.team_1_score} : ${widget.team_2_score}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "Time : ${widget.runningTime}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Total Time : ${widget.totalTime}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
