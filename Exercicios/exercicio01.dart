import 'dart:io';

void main() {
  print("Digite o nome do aluno:");
  String nome = stdin.readLineSync()!;

  print("Digite o ciclo que o aluno está na faculdade:");
  String ciclo = stdin.readLineSync()!;

  print("Digite a nota da prova (0-10):");
  double notaProva = double.parse(stdin.readLineSync()!);

  print("Digite a nota da lista e atividades (0-10):");
  double notaListaAtividades = double.parse(stdin.readLineSync()!);

  print("Digite a nota do projeto final (0-10):");
  double notaProjetoFinal = double.parse(stdin.readLineSync()!);

  double media = (notaProva * 0.3) + (notaListaAtividades * 0.2) + (notaProjetoFinal * 0.5);

  if (media >= 6.0) {
    print("$nome, do ciclo $ciclo, foi aprovado com média $media.");
  } else {
    print("$nome, do ciclo $ciclo, foi reprovado com média $media.");
  }
}
