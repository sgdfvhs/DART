//GIL, José Luis, André, Maycon, Debora e Kayque - Equipe Tech Solutions
import 'dart:io';

void main() {
  bool ver = true;
  var nomes = [];
  var idades = [];
  while (ver) {
    print(" 1-Cadastro \n 2-Listar \n 3- Excluir \n 0-Sair ");
    int menu = int.parse(stdin.readLineSync()!);
    if (menu != 0 && menu != 1 && menu != 2 && menu != 3) {
      print("1-Cadastro \n 2-Listar \n 3- Excluir \n 0-Sair");
      menu = int.parse(stdin.readLineSync()!);
    } else if (menu == 0) {
      print("Saindo..");
      ver = false;
    } else if (menu == 1) {
      print("Nome:");
      String nome = stdin.readLineSync()!;
      while (nomes.contains(nome) ||
          nomes.contains(nome.toLowerCase()) ||
          nomes.contains(nome.toUpperCase()) ||
          nome.isEmpty) {
        if (nomes.contains(nome) ||
            nomes.contains(nome.toLowerCase()) ||
            nomes.contains(nome.toUpperCase())) {
          print("Contato existente \nDigite novamente:");
        } else {
          print("Digite um nome valido:");
        }
        nome = stdin.readLineSync()!;
      }
      nomes.add(nome);
      print("Idade:");
      int idade = int.parse(stdin.readLineSync()!);
      while (idade < 0 || idade > 125) {
        print("Digite uma idade valida");
        idade = int.parse(stdin.readLineSync()!);
      }
      idades.add(idade);
      print("Cadastro Realizado");
    } else if (menu == 2) {
      int i = 0;
      int qnt = nomes.length;
      if (qnt == 0) {
        print("Lista Vazia");
      } else {
        for (i = 0; i < qnt; i++) {
          print("_" * 5);
          print("Nome: ${nomes[i]}");
          print("Idade:${idades[i]}");
        }
      }
    } else if (menu == 3) {
      int i = 0;
      int qnt = nomes.length;
      bool excluido = false;
      if (qnt == 0) {
        print("Sem Contatos Na Lista");
      } else {
        for (i = 0; i < qnt; i++) {
          print("_" * 5);
          print("Nome: ${nomes[i]}");
          print("Idade:${idades[i]}");
        }
        print("quem deseja remover:");
        String rev = stdin.readLineSync()!;
        for (i = 0; i < qnt; i++) {
          if (rev == nomes[i] ||
              rev.toLowerCase() == nomes[i] ||
              rev.toUpperCase() == nomes[i]) {
            nomes.removeAt(i);
            idades.removeAt(i);
            print("Contato Excluido");
            excluido = true;
            break;
          }
        }
        if (excluido == false) {
          print("Contato Invalido");
        }
      }
    }
  }
}
