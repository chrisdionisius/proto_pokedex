class Reply {
  String id, uid, answer, date, name;

  Reply(this.id, this.uid, this.answer, this.date, this.name);

  Reply.fromJson(Map<String, dynamic> parsedJson, String id) {
    this.id = parsedJson['id'];
    this.uid = parsedJson['uid'];
    this.answer = parsedJson['answer'];
    this.date = parsedJson['date'];
    this.name = parsedJson['email'].split('@')[0];
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'answer': answer,
      'uid': uid,
      'date': date,
      'email': name,
    };
  }
}
