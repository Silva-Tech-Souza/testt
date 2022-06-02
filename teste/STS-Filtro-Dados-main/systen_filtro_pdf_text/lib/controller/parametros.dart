class FeedbackTest {
  String contratante,
      grau_parentesco,
      cpf,
      rg,
      cel,
      endereco,
      falecido,
      data_obito,
      causa_morte,
      nome_aqv;

  FeedbackTest(
    this.contratante,
    this.grau_parentesco,
    this.cpf,
    this.rg,
    this.cel,
    this.endereco,
    this.falecido,
    this.data_obito,
    this.causa_morte,
    this.nome_aqv,
  );

  String toParams() =>
      "?contratante=$contratante&grau_parentesco=$grau_parentesco&cpf=$cpf&rg=$rg&cel=$cel&endereco=$endereco&falecido=$falecido&data_obito=$data_obito&causa_morte=$causa_morte&nome_aqv=$nome_aqv";
}

class FeedbackPerfilSTS {
  String contratante,
      nome_arquivo,
      grau_parentesco,
      cpf,
      rg,
      cel,
      endereco,
      falecido,
      data_obito,
      causa_morte;

  FeedbackPerfilSTS(
    this.nome_arquivo,
    this.contratante,
    this.grau_parentesco,
    this.cpf,
    this.rg,
    this.cel,
    this.endereco,
    this.falecido,
    this.data_obito,
    this.causa_morte,
  );

  String toParams() =>
      "?nome_arquivo=$nome_arquivo&contratante=$contratante&grau_parentesco=$grau_parentesco&cpf=$cpf&rg=$rg&cel=$cel&endereco=$endereco&falecido=$falecido&data_obito=$data_obito&causa_morte=$causa_morte";
}
