class User {
  static const String PassionWriting = 'Writing';
  static const String PassionSinging = 'Singing';
  static const String PassionTraveling = 'Travelling';
  static const String PassionCooking = 'Cooking';
  String firstName = '';
  String lastName = '';
  Map passions = {
    PassionWriting: false,
    PassionSinging: false,
    PassionTraveling: true,
    PassionCooking: true,
  };
  bool monthlyNewsletter = false;
  bool yearlyNewsletter = false;
  bool weeklyNewsletter = true;
  save() {
    print('saving user using a web service');
  }
}
