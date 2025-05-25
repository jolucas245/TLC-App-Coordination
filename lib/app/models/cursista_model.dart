class CursistaModel {
  final String nomeCompleto;
  final String dataNascimento;
  final String telefone;
  final String enderecoResidencial;
  final String cidade;
  final String nomeMae;
  final String nomePai;
  final String telefonePais;
  final String enderecoPais;
  final String problemaSaude;
  final String batizado;
  final String primeiraComunhao;
  final String crismado;
  final String tamanhoCamiseta;
  final String instagram;
  final String carimboDataHora;

  CursistaModel({
    required this.nomeCompleto,
    required this.dataNascimento,
    required this.telefone,
    required this.enderecoResidencial,
    required this.cidade,
    required this.nomeMae,
    required this.nomePai,
    required this.telefonePais,
    required this.enderecoPais,
    required this.problemaSaude,
    required this.batizado,
    required this.primeiraComunhao,
    required this.crismado,
    required this.tamanhoCamiseta,
    required this.instagram,
    required this.carimboDataHora,
  });

  factory CursistaModel.fromMap(Map<String, dynamic> map) {
    return CursistaModel(
      nomeCompleto: map['Nome completo sem abreviações:'] ?? '',
      dataNascimento: map['Data de nascimento:'] ?? '',
      telefone: map['Número de telefone:'] ?? '',
      enderecoResidencial: map['Endereço residencial completo:'] ?? '',
      cidade: map['Cidade:'] ?? '',
      nomeMae: map['Nome da mãe completo:'] ?? '',
      nomePai: map['Nome do pai completo:'] ?? '',
      telefonePais: map['Telefone da mãe e do pai, respectivamente: (Ex: Mãe: Pai:)'] ?? '',
      enderecoPais: map['Endereço dos pais: Se forem separados, descreva-o.'] ?? '',
      problemaSaude: map['Tem algum problema de saúde: Se sim, exemplifique.'] ?? '',
      batizado: map['Batizado:'] ?? '',
      primeiraComunhao: map['Primeira Comunhão:'] ?? '',
      crismado: map['Crismado:'] ?? '',
      tamanhoCamiseta: map['Tamanho da camiseta: (Ex: P, M, G)'] ?? '',
      instagram: map['Perfil do Instagram:'] ?? '',
      carimboDataHora: map['Carimbo de data/hora'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nomeCompleto': nomeCompleto,
      'dataNascimento': dataNascimento,
      'telefone': telefone,
      'enderecoResidencial': enderecoResidencial,
      'cidade': cidade,
      'nomeMae': nomeMae,
      'nomePai': nomePai,
      'telefonePais': telefonePais,
      'enderecoPais': enderecoPais,
      'problemaSaude': problemaSaude,
      'batizado': batizado,
      'primeiraComunhao': primeiraComunhao,
      'crismado': crismado,
      'tamanhoCamiseta': tamanhoCamiseta,
      'instagram': instagram,
      'carimboDataHora': carimboDataHora,
    };
  }

  @override
  String toString() {
    return '''
      CursistaModel(
        carimboDataHora: $carimboDataHora,
        nomeCompleto: $nomeCompleto,
        dataNascimento: $dataNascimento,
        telefone: $telefone,
        enderecoResidencial: $enderecoResidencial,
        cidade: $cidade,
        nomeMae: $nomeMae,
        nomePai: $nomePai,
        telefonePais: $telefonePais,
        enderecoPais: $enderecoPais,
        problemaSaude: $problemaSaude,
        batizado: $batizado,
        primeiraComunhao: $primeiraComunhao,
        crismado: $crismado,
        tamanhoCamiseta: $tamanhoCamiseta,
        instagram: $instagram
      )''';
    }

}
