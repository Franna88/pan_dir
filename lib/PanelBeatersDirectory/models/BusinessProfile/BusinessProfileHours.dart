class Businessprofilehours {
  String mOpen;
  String mClosed;
  String tOpen;
  String tClosed;
  String wOpen;
  String wClosed;
  String thOpen;
  String thClosed;
  String fOpen;
  String fClosed;
  String saOpen;
  String saClosed;
  String suOpen;
  String suClosed;
  String pOpen;
  String pClosed;
  Businessprofilehours(
      this.mOpen,
      this.mClosed,
      this.tOpen,
      this.tClosed,
      this.wOpen,
      this.wClosed,
      this.thOpen,
      this.thClosed,
      this.fOpen,
      this.fClosed,
      this.saOpen,
      this.saClosed,
      this.suOpen,
      this.suClosed,
      this.pOpen,
      this.pClosed);

  // Add a factory constructor for easier instantiation from a map
  factory Businessprofilehours.fromMap(Map<String, dynamic> data) {
    return Businessprofilehours(
      data['mOpen'],
      data['mClosed'],
      data['tOpen'],
      data['tClosed'],
      data['wOpen'],
      data['wClosed'],
      data['thOpen'],
      data['thClosed'],
      data['fOpen'],
      data['fClosed'],
      data['saOpen'],
      data['saClosed'],
      data['suOpen'],
      data['suClosed'],
      data['pOpen'],
      data['pClosed'],
    );
  }
}
