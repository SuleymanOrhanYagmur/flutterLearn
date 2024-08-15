mixin StudentValidatorMixin {
  String? validateFirstName (String? value)  {
    
    if(value == null || value.isEmpty) {

      return "İsim Boş Olamaz";
    }

    
    else if(value.length<2  ){
      return "İsim en az 2 karakter olmalıdır";
    }

        
  } 


  String? validateLastName (String? value)  {
    
    if(value == null || value.isEmpty) {

      return "Soyisim Boş Olamaz";
    }

    
    else if(value.length<2  ){
      return "Soyİsim en az 2 karakter olmalıdır";
    }

        
  } 

  String? validateGradeName (String? value)  {
    var grade = int.parse(value!);
    if(grade == null) {

      return "İsim Boş Olamaz";
    }

    
    else if(grade <0 || grade >100  ){
      return "Not 0-100 arasında olmalıdır";
    }

        
  } 


}