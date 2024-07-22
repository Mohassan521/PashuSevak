class BannerList {
  List<Message>? message;

  BannerList({this.message});

  BannerList.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.message != null) {
  //     data['message'] = this.message!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Message {
  final int sequence;
  final String banner;

  Message({required this.sequence, required this.banner});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sequence: json['sequence'],
      banner: json['banner'],
    );
  }
}
