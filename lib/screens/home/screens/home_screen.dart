import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int mesSelecionado = 0;
  @override
  Widget build(BuildContext context) {
    List<String> meses = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 10, right: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/logo.svg', // Substitua pelo caminho correto do seu ícone
                          height: 30.0,
                          width: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'AdminEase',
                            style: GoogleFonts.pangolin(
                              // Ou qualquer outra fonte que preferir.
                              textStyle: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                     Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12.withOpacity(0.1)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 10),
                            child: Text(
                              'Criar',
                              style: GoogleFonts.roboto(
                                // Ou qualquer outra fonte que preferir.
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                              Icons.add_outlined,
                              color: Colors.black54,
                            
                             // Adicione a ação desejada
                          ),
                        ],
                      ),
                    ),
                  
                ],
        ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Container(
                height: 30.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: meses.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        mesSelecionado = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      alignment: Alignment.center,
                      child: Text(
                        meses[index],
                        style: TextStyle(
                          color:
                              mesSelecionado == index ? Colors.blue : Colors.grey,
                              fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: meses.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      mesSelecionado = index;
                    });
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [Text("Cef 04"), Text("12:04")],
                                  ),
                                )
                              ],
                            ),
                            Icon(Icons.menu_outlined)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          alignment: Alignment.center,
                          child: Text(
                            meses[index],
                            style: TextStyle(
                              color: mesSelecionado == index
                                  ? Colors.blue
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 17),
                        child: Text(
                            "buhbu byub byub bhu buhbhui b bhiuhb hubuhibhubh biuhb iub hubhub hub uhb hubuib hub hbhub h "),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 23, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.message_outlined),
                            Icon(Icons.favorite_outline),
                            Icon(Icons.save_outlined),
                            Icon(Icons.share_outlined)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 7),
        child: Text("👋 Olá!"),
      ),
      subtitle: Text(
        "Gustavo",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w700),
      ),
      trailing: Container(
        width: 48.0,
        height: 48.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/7153/7153150.png"),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 18.0,
              height: 18.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff1C6BA4),
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
