class Message{
 final String message;
 final String id;
 final bool isAdmin;
  Message(this.message, this.id,this.isAdmin);

 factory Message.fromJson(jsonData){
 return Message(jsonData['message'],jsonData['id'],jsonData['isAdmin']);
}
}