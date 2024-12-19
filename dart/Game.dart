import 'dart:io';
import 'dart:math';

void main() {
  print(".." * 5);
  print("Bem vindo ao Mil Tentativas");
  print(".." * 5);
  bool ingame = true;
  print("1-Jogar \n 2-Sair");
  int jogo = int.parse(stdin.readLineSync()!);
  Random random = Random();
  int aleatorio = random.nextInt(1000) + 1;
  while (ingame) {
    if (jogo != 1 && jogo != 2) {
      print("opção invalida");
      print("1-Jogar\n2-Sair");
      jogo = int.parse(stdin.readLineSync()!);
    } else if (jogo == 1) {
      print("Selecione o modo de jogo \n 1- Um player \n 2-Dois players");
      int modo = int.parse(stdin.readLineSync()!);
      if (modo != 1 && modo != 2) {
        print("opção invalida");
      } else if (modo == 1) {
        print("numero aleatorio escolhido");
        print("Escolha um numero entre 1 e 1000");
        int numero = int.parse(stdin.readLineSync()!);
        int tentativas = 0;
        while (numero != aleatorio) {
          if (numero < 1 || numero > 1000) {
            print("numero  invalido \n escolha um numero");
          } else {
            if (numero > aleatorio) {
              if ((numero - aleatorio) <= 50) {
                tentativas = tentativas + 1;
                print("Errado! \n Tente um numero Proximo");
              } else {
                tentativas = tentativas + 1;
                print("Errado! \n Tente um numero Menor");
                print(aleatorio);
              }
            } else if (numero < aleatorio) {
              if ((aleatorio - numero) <= 50) {
                tentativas = tentativas + 1;
                print("Errado! \n Tente um numero Proximo");
              } else {
                tentativas = tentativas + 1;
                print("Errado! \n Tente um numero Maior");
                print(aleatorio);
              }
            }
          }
          numero = int.parse(stdin.readLineSync()!);
        }
        print("Voce Ganhou!");
        print("Total de Tentativas:$tentativas");
        ingame = false;
      } else {
        print("Player 1: Escolha um numero(O numero sera oculto depois)");
        int aletP1 = int.parse(stdin.readLineSync()!);
        while (aletP1 < 1 || aletP1 > 1000) {
          print("Invalido \n Escolha um numero de 1 a 1000");
          aletP1 = int.parse(stdin.readLineSync()!);
        }
        print('\x1B[2J\x1B[0;0H');
        print("Numero escolhido");
        print("Player 2: Tente adivinhar o numero");
        int numP2 = int.parse(stdin.readLineSync()!);
        int tentativas = 0;
        while (numP2 != aletP1) {
          if (numP2 < 1 || numP2 > 1000) {
            print("Numero invalido \n Escolha outro");
            numP2 = int.parse(stdin.readLineSync()!);
          } else if (numP2 > aletP1) {
            if ((numP2 - aletP1) <= 50) {
              print("Errado \n Tente um numero Proximo");
              tentativas = tentativas + 1;
            } else {
              print("Errado \n Tente um numero Menor");
              tentativas = tentativas + 1;
            }
            numP2 = int.parse(stdin.readLineSync()!);
          } else if (numP2 < aletP1) {
            if ((aletP1 - numP2) <= 50) {
              print("Errado \n Tente um numero Proximo");
              tentativas = tentativas + 1;
            } else {
              print("Errado \n Tente um numero Maior");
              tentativas = tentativas + 1;
            }
            numP2 = int.parse(stdin.readLineSync()!);
          }
        }
        print("Voce Ganhou!");
        print("Total de Tentativas:$tentativas");
        ingame = false;
      }
    } else if (jogo == 2) {
      print("Game Over...");
      ingame = false;
    }
  }
}
