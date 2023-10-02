import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Usuario {
  final String nome;
  final String cargo;
  final String imagemUrl;
  final int tarefasCumpridas;
  final int tarefasPendentes;

  Usuario({
    required this.nome,
    required this.cargo,
    required this.imagemUrl,
    required this.tarefasCumpridas,
    required this.tarefasPendentes,
  });
}

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final List<Usuario> usuarios = [
  Usuario(
    nome: 'João Silva',
    cargo: 'Desenvolvedor',
    imagemUrl: 'https://exemplo.com/imagem1.png',
    tarefasCumpridas: 5,
    tarefasPendentes: 3,
  ),
  Usuario(
    nome: 'Maria Oliveira',
    cargo: 'Analista',
    imagemUrl: 'https://exemplo.com/imagem2.png',
    tarefasCumpridas: 8,
    tarefasPendentes: 2,
  ),
  Usuario(
    nome: 'Carlos Santos',
    cargo: 'Gerente',
    imagemUrl: 'https://exemplo.com/imagem3.png',
    tarefasCumpridas: 10,
    tarefasPendentes: 1,
  ),
  Usuario(
    nome: 'Ana Pereira',
    cargo: 'Designer',
    imagemUrl: 'https://exemplo.com/imagem4.png',
    tarefasCumpridas: 7,
    tarefasPendentes: 1,
  ),
  Usuario(
    nome: 'Roberto Souza',
    cargo: 'Desenvolvedor',
    imagemUrl: 'https://exemplo.com/imagem5.png',
    tarefasCumpridas: 6,
    tarefasPendentes: 0,
  ),
  Usuario(
    nome: 'Clara Costa',
    cargo: 'Analista',
    imagemUrl: 'https://exemplo.com/imagem6.png',
    tarefasCumpridas: 9,
    tarefasPendentes: 3,
  ),
  Usuario(
    nome: 'Paulo Rocha',
    cargo: 'Gerente',
    imagemUrl: 'https://exemplo.com/imagem7.png',
    tarefasCumpridas: 5,
    tarefasPendentes: 2,
  ),
  Usuario(
    nome: 'Fernanda Lima',
    cargo: 'Designer',
    imagemUrl: 'https://exemplo.com/imagem8.png',
    tarefasCumpridas: 4,
    tarefasPendentes: 1,
  ),
  Usuario(
    nome: 'Gabriel Martins',
    cargo: 'Desenvolvedor',
    imagemUrl: 'https://exemplo.com/imagem9.png',
    tarefasCumpridas: 3,
    tarefasPendentes: 2,
  ),
  Usuario(
    nome: 'Juliana Carvalho',
    cargo: 'Analista',
    imagemUrl: 'https://exemplo.com/imagem10.png',
    tarefasCumpridas: 8,
    tarefasPendentes: 0,
  ),
];

    // Adicione outros usuários conforme necessário
  
  int mesSelecionado = 0;
  int optionselect = 0;
  @override
  Widget build(BuildContext context) {
    List<String> meses = [
      'Funcionarios',
      'Tarefas',
      'Entradas',
      'Saidas',
    ];
    List<String> options = [
      'Tudo',
      'Concluidas',
      'Pendentes',
    ];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                  children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.h),
                        color: Colors.grey[100]),
                    child: Center(child: Text("H.A restaurante")),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/search.svg"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 25.h,
                          width: 25.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.h),
                              color: Colors.grey[100]),
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset("assets/sino.svg")),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: SizedBox(
                height: 25.h,
                child: Row(
                  children: List.generate(meses.length, (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            mesSelecionado = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: mesSelecionado == index
                                    ? Colors.black
                                    : const Color.fromARGB(255, 241, 241, 241),
                              ),
                            ),
                          ),
                          child: Text(
                            meses[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              color: mesSelecionado == index
                                  ? Colors.black
                                  : Colors.grey[400],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Funcionarios",
                        style: GoogleFonts.lato(
                            color: Colors.black, fontSize: 20.sp),
                      ),
                      Text("sabado dia 12",
                          style: GoogleFonts.lato(
                              color: Colors.grey[500], fontSize: 13.sp))
                    ],
                  ),
                  Container(
                    height: 35.h,
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.h),
                        color: Color(0xFFE2EBFA)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.h),
                          child: SvgPicture.asset(
                            "assets/plus.svg",
                            color: Color(0xFF0B61FB),
                          ),
                        ),
                        Text(
                          "Novo Funcionario",
                          style: GoogleFonts.lato(
                              color: Color(0xFF0B61FB),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  final usuario = usuarios[index];
                  return SizedBox(
                    height: 70.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: 40.h, width: 40.h, child: const CircleAvatar()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    usuario.nome,
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        usuario.cargo,
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Colors.grey[600]),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      
                                      Container(
                                        height: 15.h,
                                        
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.h),
                                            color: Colors.grey[100]),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                          child: Text("Concluidas: ${usuario.tarefasCumpridas}", textAlign: TextAlign.center, style: TextStyle(fontSize: 9.sp),)
                                        )
                                      ),
                                      
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                                        child: Container(
                                          height: 15.h,
                                        
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.h),
                                              color: Colors.grey[100]),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                            child: Text("Pendentes: ${usuario.tarefasPendentes}", textAlign: TextAlign.center, style: TextStyle(fontSize: 9.sp),)
                                          )
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                             ],
                        ),
                      SvgPicture.asset("assets/vertical.svg", color: Colors.grey[500], width: 20.h, height: 20.h,)
                     
                      ],
                    ),
                  );
                },
              ),
            ),
                  ],
                ),
          )),
    );
  }
}
