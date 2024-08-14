class Student{
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String _status;// burada sadece getter methodu göstercek sadece okuruz çünkü grade bağlı olduğu için set etmemiz gerekmiyor
  // get okumak öğrencinin first değerini okumak almak okumak
  // set yazmak anlamına geliyor
  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
   


  }

  Student( String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
   


  }
  String get getFirstName {

    return "OGR - " + this.firstName; 
  }

  void setFirstName(String value) {
    
    this.firstName = value;

  }

  String get getStatus {
                 String message = "";
              if(this.grade>= 50) {
                message = "Gecti ";
              }
              else if(this.grade >=40) {
                message = "Bütünlemeye Kaldı";
              }
              else  {
                message= "Kaldı";
              }

    return message;    
     
  }
  
}