import "package:flutter/material.dart";

class TextLearnView extends StatelessWidget {
  TextLearnView({Key? key, this.userName}) : super(key: key);

  final String? userName; // ? null olabilir demek
  final String name = 'Suleyman';

  final ProjectKeys keys = ProjectKeys();
  // TextLearn ile build method getiriyo
  //onun sayesinde kendi ekran kodlarını yazmaya bşlıyorsun
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // const eğer welcome birden fazla olsun diye çarpcaksan const sil

      body: Center(
          // ortaya koymak için center
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Welcome $name günün nasıl geçiyor ? ${name.length}', // const yapma böyle çarpı kullanıcaksan ve $ kullanma   (rreturn scaffoldu)
          maxLines: 2,
          overflow: TextOverflow.ellipsis,

          textAlign: TextAlign.start, //
          style: const TextStyle(
              // component yapabilirsini
              wordSpacing: 2, // kelime arası boşluk koydurmaa
              decoration:
                  TextDecoration.underline, // yazının altını çizmek için
              fontStyle: FontStyle.italic,
              letterSpacing: 2, // harfler arasında oluşutmrak için

              color: Colors.purple,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        Text(
          'Welcome $name ${name.length}', // const yapma böyle çarpı kullanıcaksan ve $ kullanma   (rreturn scaffoldu)
          maxLines: 2,
          overflow: TextOverflow.ellipsis,

          textAlign: TextAlign.right, //

          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: ProjectColors.welcomecolor),

          //style: ProjectStyles.welcomeStyle, //alttakine ali veli olayı yaptık
        ),
        /*  Burası sol en üstte yazdırıyo yazdığını
            return const Scaffold(
              body: Text('Veli'),  
              );
            */
        Text(keys.welcome),
        // Alttakini yapma:
        // Text('merhaba' ) diyerek yazma
      ])),
    );
  }
}

class ProjectStyles {
  // STYLE VERMEM GEREKİRSE BÖYLE VERMEM GEREKİYOR
  // bunun headline5(small) a göre farkı 5 farkı değiştirememen gibi
  static TextStyle welcomeStyle = TextStyle(
      // component yapabilirsini
      wordSpacing: 2, // kelime arası boşluk koydurmaa
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      letterSpacing: 2, // harfler arasında oluşutmrak için

      color: Colors.orange,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomecolor = Colors.yellow;
}

class ProjectKeys {
  final String welcome = "Merhaba";
}
