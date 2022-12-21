
class QuestionSet {
   final String question;
   final String answer;

   QuestionSet ({required this.question, required this.answer});

   Map<String,dynamic> toJson() => {
      'id': question,
      'question': question,
      'answer' : answer,
   };

   static QuestionSet fromJson(Map<String, dynamic> json) => QuestionSet(
      question:json['question'],
      answer:json['answer'],
   );
}

