import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScoreBoard(),
    );
  }
}

class Score {
  final String userId;
  final int score;
  final DateTime dateTime;

  Score({required this.userId, required this.score, required this.dateTime});

  factory Score.fromDocument(DocumentSnapshot doc) {
    return Score(
      userId: doc['userId'],
      score: doc['score'],
      dateTime: (doc['dateTime'] as Timestamp).toDate(),
    );
  }
}

class QuizManager {
  final int totalQuestions = 20;
  int currentQuestion = 0;
  int correctAnswers = 0;

  void incrementCurrentQuestion() {
    currentQuestion++;
  }

  void incrementCorrectAnswers() {
    correctAnswers++;
  }

  double calculateScore() {
    return (correctAnswers / totalQuestions) * 100;
  }
}

class ScoreBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scoreboard')),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('scores').orderBy('score', descending: true).limit(10).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                final score = Score.fromDocument(snapshot.data.docs[index]);
                final dateFormat = DateFormat('MMMM d, yyyy');
                final formattedDate = dateFormat.format(score.dateTime);

                return ListTile(
                  title: Text('${score.score}%'),
                  subtitle: Text('User ID: ${score.userId}\nDate: $formattedDate'),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  DateFormat(String s) {}
}

void _navigateToScoreBoard() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScoreBoard()),
  );
}