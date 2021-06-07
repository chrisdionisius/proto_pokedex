class Reply {
  String id, uid, answer, date;

  Reply(this.id, this.uid, this.answer, this.date);

  Reply.fromJson(Map<String, dynamic> parsedJson, String id) {
    this.id = parsedJson['id'];
    this.uid = parsedJson['uid'];
    this.answer = parsedJson['answer'];
    this.date = parsedJson['date'];
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'answer': answer,
      'uid': uid,
      'date': date,
    };
  }
}
