class QuizDataModel {
  List<Questions>? questions;

  QuizDataModel({questions});

  QuizDataModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }
}

class Questions {
  String? question;
  Answers? answers;
  String? questionImageUrl;
  String? correctAnswer;
  int? score;

  Questions({
    question,
    answers,
    questionImageUrl,
    correctAnswer,
    score,
  });

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answers =
        json['answers'] != null ? Answers.fromJson(json['answers']) : null;
    questionImageUrl = json['questionImageUrl'];
    correctAnswer = json['correctAnswer'];
    score = json['score'];
  }
}

class AnswersItem {
  String? dataKey;
  String? value;
  AnswersItem({this.dataKey, this.value});
}

class Answers {
  AnswersItem? a;
  AnswersItem? b;
  AnswersItem? c;
  AnswersItem? d;

  Answers({a, b, c, d});
  Answers.fromJson(Map<String, dynamic> json) {
    a = AnswersItem(dataKey: 'A', value: json['A']);
    b = AnswersItem(dataKey: 'B', value: json['B']);
    c = AnswersItem(dataKey: 'C', value: json['C']);
    d = AnswersItem(dataKey: 'D', value: json['D']);
  }
}
