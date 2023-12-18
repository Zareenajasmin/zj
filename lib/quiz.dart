import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // List of questions and their respective answers
  List<Map<String, dynamic>> questions = [
    {
      'question': '1.How many houseplants do you own??',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '2.Do you have a preferred method for composting plant waste?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '3.Have you cultivated plants specifically to improve local biodiversity?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '4.Are you committed to adopting plant-friendly habits to benefit the environment?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '5.Have you ever participated in a tree-planting initiative?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '6.What steps do you take to ensure your plants are environmentally sustainable?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '7.Have you ever grown your own fruits or vegetables?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '8.Do you actively seek out and support local nurseries or plant sales?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '9.Have you researched or utilized natural pest control methods for your plants?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '10.How often do you practice propagation with your plants?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '11.Have you volunteered in a community garden or botanical garden?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '12.Do you use rainwater or other eco-friendly methods for watering your plants?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '13.Are you familiar with the native plants in your region and their importance?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '14.Have you engaged in seed-saving or participated in seed-swapping events?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '15.Do you avoid purchasing plants from unsustainable or environmentally harmful sources?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '16.Have you contributed to or supported initiatives for preserving endangered plant species?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '17.Are you involved in educating others about the benefits of plants for the environment?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': 'Have you taken steps to create a wildlife-friendly garden or habitat for pollinators?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': 'Do you participate in or support initiatives to reforest or restore natural habitats?',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },
    {
      'question': '',
      'options': ['Yes', 'No'],
      'correctAnswer': 'Yes', // Adjust the correct answer based on your scoring logic
    },

    // Add more questions in a similar format
    // ...
  ];

  int currentQuestionIndex = 0;
  int userScore = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      // Check if the selected answer is correct and update the score
      if (questions[currentQuestionIndex]['correctAnswer'] == selectedAnswer) {
        userScore++;
      }

      // Move to the next question or show suggestions if the quiz is completed
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Navigate to the suggestions screen or perform any action here
        // For demonstration, navigating back to the previous screen
        Navigator.pop(context, userScore);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eco Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Displaying options using Radio buttons
            ...(questions[currentQuestionIndex]['options'] as List<String>)
                .map((option) {
              return RadioListTile(
                title: Text(option),
                value: option,
                groupValue: null, // Set the selected value here
                onChanged: (String? selectedAnswer) {
                  answerQuestion(selectedAnswer!);
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
