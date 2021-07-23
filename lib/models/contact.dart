class ContactModel {
  String primaryid;
  String secondaryid;
  String name;
  String picuri;
  DateTime lastchatdate;
  int unreadmsg;
  bool msgsent;
  bool msgreceived;
  bool msgread;
  bool ismuted;
  String lastmsg;
  bool sentbycontact;

  ContactModel({
    required this.primaryid,
    this.secondaryid = 'null',
    required this.name,
    this.picuri = 'null',
    required this.lastchatdate,
    this.msgsent = false,
    this.msgreceived = false,
    this.msgread = false,
    this.unreadmsg = 0,
    this.ismuted = false,
    required this.lastmsg,
    required this.sentbycontact,
  });
}
