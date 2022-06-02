class ArrumerPalavra {
  Future<String> palavraArrumada(String result) async {
    result = result;
    result = result.toString().replaceAll("~", "");
    result = result.toString().replaceAll("", " ");
    result = result.toString().replaceAll("!", "");
    result = result.toString().replaceAll("\n\n", "");
    result = result.toString().replaceAll("=", "");
    result = result.toString().replaceAll("?", " ");
    result = result.toString().replaceAll(";", "");
    result = result.toString().replaceAll("::", "");
    result = result.toString().replaceAll("*", "");
    result = result.toString().replaceAll("%", "");
    result = result.toString().replaceAll("&", "");
    result = result.toString().replaceAll("	", "");
    result = result.toString().replaceAll(">", "");
    result = result.toString().replaceAll("<", "");
    result = result.toString().replaceAll("-------", "");
//grau parentesco
    result.toString().replaceAll("Grau de ParenteSco:", " Grau de Parentesco:");
    result = result
        .toString()
        .replaceAll("Grau de parentesco:", " Grau de Parentesco:");
    result = result
        .toString()
        .replaceAll("grau de parentesco:", " Grau de Parentesco:");
    result = result
        .toString()
        .replaceAll("grau de parentesco:", " Grau de Parentesco:");
    result = result
        .toString()
        .replaceAll("Grau de arentesco:", " Grau de Parentesco:");
    result = result
        .toString()
        .replaceAll("Grau de Pa ntesco:", "Grau de Parentesco:");
    result = result
        .toString()
        .replaceAll("G·au de Parentesco:", " Grau de Parentesco:");
    result = result
        .toString()
        .replaceAll("Grau de ParentescO:", " Grau de Parentesco:");
    //sssps
    result = result.toString().replaceAll("ssp", " SSP-SP");
    result = result.toString().replaceAll("-X", " SSP-SP");
    result = result.toString().replaceAll("XSSP-SP ", " SSP-SP");
    result = result.toString().replaceAll("SSP3P", " SSP-SP");
    result = result.toString().replaceAll(",FSP", " SSP-SP");
    result = result.toString().replaceAll("sp,p", " SSP-SP");
    result = result.toString().replaceAll("55P5P", " SSP-SP");
    result = result.toString().replaceAll("SSPSP ", " SSP-SP");
    result = result.toString().replaceAll("SSP-SP/SP ", " SSP-SP");
    result = result.toString().replaceAll("-SSP ", " SSP-SP");
    result = result.toString().replaceAll("s P EP", " SSP-SP");
    result = result.toString().replaceAll("S5PS ", " SSP-SP");
    result = result.toString().replaceAll("ss SI)", " SSP-SP");
    result = result.toString().replaceAll("SSP/SP", " SSP-SP");
//cel
    result = result.toString().replaceAll("Cel.:", " Cel.:");
    result = result.toString().replaceAll("Cel:", " Cel.:");
    result = result.toString().replaceAll("Cel.:", " Cel.:");
    result = result.toString().replaceAll("cel:", " Cel.:");
    result = result.toString().replaceAll("cel.:", " Cel.:");
    result = result.toString().replaceAll("Cel :", " Cel.:");
    result = result.toString().replaceAll("cel :", " Cel.:");
    result = result.toString().replaceAll("cel.:", " Cel.:");
    result = result.toString().replaceAll("Gel.:", " Cel.:");
    result = result.toString().replaceAll("cel:", " Cel:.");
    result = result.toString().replaceAll("C:el. ", " Cel.:");
    result = result.toString().replaceAll("CEL:", " Cel.:");
    result = result.toString().replaceAll("cel. ", " Cel.:");
    result = result.toString().replaceAll("Cel. ", " Cel.:");
    result = result.toString().replaceAll("cel ", " Cel.:");
    result = result.toString().replaceAll("CEL ", " Cel.:");
    result = result.toString().replaceAll("Gel:", " Cel.:");
    result = result.toString().replaceAll("Gel.", " Cel.:");

    result =
        result.toString().replaceAll("Data de iffixto:", " Data de óbito:");

    result = result.toString().replaceAll("Coma:alta:", "Contratante:");
    result = result.toString().replaceAll("Contratante:", "Contratante:");
    result = result.toString().replaceAll("contratante:", "Contratante:");
    result = result.toString().replaceAll("contratante ", "Contratante:");
    result = result.toString().replaceAll("Contratante ", "Contratante:");
    result = result.toString().replaceAll("NOme da Mãe:", "Nome da Mãe:");
    result = result.toString().replaceAll("V_2", "");
    result = result.toString().replaceAll("Causa Morte", "Causa da Morte");
    result = result.toString().replaceAll("Causa Morte:", "Causa da Morte:");

    result = result.toString().replaceAll(" CPI::", " CPF:");
    result = result.toString().replaceAll("cep", " CEP");
    result = result.toString().replaceAll("ceP", " CEP");
    result = result.toString().replaceAll("Cf:P", " CEP");
    result = result.toString().replaceAll("CE-P", " CEP");
    result = result.toString().replaceAll("Cep", " CEP");

    result = result.toString().replaceAll(" CPI:", " CPF:");
    result = result.toString().replaceAll("CPP:", " CPF:");
    result = result.toString().replaceAll("CPP", " CPF:");
    result = result.toString().replaceAll("CFF", " CPF:");
    result = result.toString().replaceAll("CFF ", " CPF:");
    result = result.toString().replaceAll("cpf:", " CPF:");
    result = result.toString().replaceAll("CPF:", " CPF:");

    result = result.toString().replaceAll("rg:", " RG:");
    result = result.toString().replaceAll("RG1", " RG:");
    result = result.toString().replaceAll("1::; G: ", " RG:");
    result = result.toString().replaceAll("RG2", " RG:");
    result = result.toString().replaceAll("RG3", " RG:");
    result = result.toString().replaceAll("RG4", " RG:");
    result = result.toString().replaceAll("SSP,P  ", "SSP-SP");
    result = result.toString().replaceAll("RG6", " RG:");
    result = result.toString().replaceAll("RG5", " RG:");
    result = result.toString().replaceAll("RG6", " RG:");
    result = result.toString().replaceAll("RG7", " RG:");
    result = result.toString().replaceAll("RG8", " RG:");
    result = result.toString().replaceAll("RG9", " RG:");
    result = result.toString().replaceAll("Irmão(6) ", "Irmão(A)");
    result = result.toString().replaceAll("RG8", " RG:");
    result = result.toString().replaceAll("Cd.: ", "Cel:");
    result = result.toString().replaceAll("RG9", " RG:");
    result = result.toString().replaceAll("AG1", " RG:");
    result = result.toString().replaceAll("AG2", " RG:");
    result = result.toString().replaceAll("AG3", " RG:");
    result = result.toString().replaceAll("AG4", " RG:");
    result = result.toString().replaceAll("AG5", " RG:");
    result = result.toString().replaceAll("AG6", " RG:");
    result = result.toString().replaceAll("AG7", " RG:");
    result = result.toString().replaceAll("AG8", " RG:");
    result = result.toString().replaceAll("AG9", " RG:");
    result = result.toString().replaceAll("AG:1", " RG:");
    result = result.toString().replaceAll("AG:2", " RG:");
    result = result.toString().replaceAll("AG:3", " RG:");
    result = result.toString().replaceAll("AG:4", " RG:");
    result = result.toString().replaceAll("AG:5", " RG:");
    result = result.toString().replaceAll("AG:6", " RG:");
    result = result.toString().replaceAll("AG:7", " RG:");
    result = result.toString().replaceAll("AG:8", " RG:");
    result = result.toString().replaceAll("HG", " RG:");
    result = result.toString().replaceAll("HG:", " RG:");
    result = result.toString().replaceAll("hg", " RG:");
    result = result.toString().replaceAll("hg:", " RG: ");
    result = result.toString().replaceAll("AG:9", " RG:");
    result = result.toString().replaceAll("RC,:", " RG:");
    result = result.toString().replaceAll("RC1", " RG:");
    result = result.toString().replaceAll("RC2", " RG:");
    result = result.toString().replaceAll("RC3", " RG:");
    result = result.toString().replaceAll("-lG:", " RG:");
    result = result.toString().replaceAll("RC4", " RG:");
    result = result.toString().replaceAll("RC5", " RG:");
    result = result.toString().replaceAll("RC6", " RG:");
    result = result.toString().replaceAll("RC7", " RG:");
    result = result.toString().replaceAll("RC8", " RG:");
    result = result.toString().replaceAll("RC9", " RG:");
    result = result.toString().replaceAll("RC:", " RG:");
    result = result.toString().replaceAll("RCi: ", " RG:");
    result = result.toString().replaceAll("RG;", " RG:");
    result = result.toString().replaceAll("RG.", " RG:");
    result = result.toString().replaceAll("RC8", " RG:");
    result = result.toString().replaceAll("RC9", " RG:");
    result = result.toString().replaceAll("R13•", " RG:");
    result = result.toString().replaceAll("R13", " RG:");
    result = result.toString().replaceAll("RG::", " RG:");
    result = result.toString().replaceAll("FG: ", " RG:");
    result = result.toString().replaceAll("RG ", " RG:");
    result = result.toString().replaceAll("RG.", " RG:");

    result = result.toString().replaceAll("Endereço:, • -", "");
    result = result.toString().replaceAll("Endereço:, - -", "");
    result = result.toString().replaceAll("Endereço:. - -", "");
    result = result.toString().replaceAll("Endereço:. • -", "");
    result = result.toString().replaceAll("Endereço: , • -", "");
    result = result.toString().replaceAll("Endereço: , - -", "");
    result = result.toString().replaceAll("Endereço: . - -", "");
    result = result.toString().replaceAll("Endereço: . • -", "");
    result = result.toString().replaceAll("endereço:", " Endereço:");
    result = result.toString().replaceAll("endereco:", " Endereço:");
    result = result.toString().replaceAll("endereço ", " Endereço:");
    result = result.toString().replaceAll("Endereco:", " Endereço:");
    result = result.toString().replaceAll("Endereco ", " Endereço:");
    result = result.toString().replaceAll(" Endereco ", " Endereço:");
    result = result.toString().replaceAll(" endereco ", " Endereço:");
    result = result.toString().replaceAll("Endere\;o:", " Endereço:");

    result = result.toString().replaceAll("Mascuino", " Masculino");

    result =
        result.toString().replaceAll("causa da morte:", " Causa da Morte:");
    result =
        result.toString().replaceAll("Causa eia Morte:", " Causa da Morte:");
    result = result.toString().replaceAll("nome da mãe", " Nome da Mãe");
    result = result.toString().replaceAll("Nome da Mae", " Nome da Mãe");
    result = result.toString().replaceAll("Nome da mãe", " Nome da Mãe");
    result = result.toString().replaceAll("Nome da mae", " Nome da Mãe");
    result = result.toString().replaceAll("nome da mae", " Nome da Mãe");
    result = result.toString().replaceAll("falecido:", " Falecido: ");
    result = result.toString().replaceAll("contratante:", "Contratante:");
    result = result.toString().replaceAll("Contratante ", "Contratante:");
    result = result.toString().replaceAll("Fiho(a)", " Filho(a)");
    result = result.toString().replaceAll("Fil .ota)", "Filho(a)");
    result = result.toString().replaceAll("FilhJ(a)", "Filho(a)");
    result = result.toString().replaceAll("Pilho(a)", "Filho(a)");
    result = result.toString().replaceAll("Filhota)", "Filho(a)");
    result = result.toString().replaceAll("Filho a)", "Filho(a)");
    result = result.toString().replaceAll("Netoia)", "Neto");
    result = result.toString().replaceAll("Filrio(a)", "Filho(a)");
    result = result.toString().replaceAll("F lhe (a", "Filho(a)");
    result = result.toString().replaceAll("Fi r ota)", "Filho(a)");
    result = result.toString().replaceAll("CFF:", " CPF:");

    result = result.toString().replaceAll("CPI::", " CPF:");

    result = result.toString().replaceAll("Ger ro", "Genrro");
    result = result.toString().replaceAll("Faleciclo:", " Falecido: ");
    result = result.toString().replaceAll("ial: do:", " Falecido: ");
    result = result.toString().replaceAll("Falecido ", " Falecido: ");
    result = result.toString().replaceAll("Faleome ciial: do:", " Falecido: ");
    result = result.toString().replaceAll("Falecido:", " Falecido: ");
    result = result.toString().replaceAll("Falecido.", " Falecido: ");

    result =
        result.toString().replaceAll("Local de Remoção:", " Local da Remoção:");
    result = result.toString().replaceAll("Local do Sepultamento:", "");

    result = result.toString().replaceAll("Cata de óbito:", " Data de óbito:");
    result = result.toString().replaceAll("Data de óbito ", " Data de óbito:");
    result = result.toString().replaceAll("Data de Óbito:", " Data de óbito:");
    result = result.toString().replaceAll("Data de Óbito ", " Data de óbito:");
    result = result.toString().replaceAll("Data de obito ", " Data de óbito:");
    result = result.toString().replaceAll("Data de Obito:", " Data de óbito:");
    result = result.toString().replaceAll("Data de Obito ", " Data de óbito:");
    result = result.toString().replaceAll("Dúvidasfinformaçoe", "");
    result = result.toString().replaceAll("NOTA DE CONTRATAÇÃO DE FUNERAL", "");
    result = result.toString().replaceAll("Dúvidasfinformaçoe", "");
    result = result.toString().replaceAll("Tipo de Contratação:", "");
    result = result.toString().replaceAll("Emissão:", "");
    result = result.toString().replaceAll("Agincia:", "");
    result = result.toString().replaceAll("Peso:", "");

    result = result.toString().replaceAll("Irmàotà)", "Irmão(a)");
    result = result.toString().replaceAll("Co-npanhe ro", "Companheiro");
    result = result.toString().replaceAll("Cornpanneirote", "Companheiro");
    result = result.toString().replaceAll("Companhei ro", "Companheiro");
    result = result.toString().replaceAll("Idade:", "");
    result = result.toString().replaceAll("anos", "");
    result = result.toString().replaceAll("sexo", "Sexo");
    result = result.toString().replaceAll("Altura:", "");
    result = result.toString().replaceAll("cidade", " CIDADE");
    result = result.toString().replaceAll("Cidade", " CIDADE");
    result = result.toString().replaceAll("CIDADI", " CIDADE");
    result = result.toString().replaceAll("CICADE", " CIDADE");
    result = result.toString().replaceAll("SSP-SP-SP", " SSP-SP");
    result = result.toString().replaceAll("SSP", " SSP-SP");
    result = result
        .toString()
        .replaceAll("Serviço Funerário do Município de São Paulo", "");
    result =
        result.toString().replaceAll("Local de Remoção:", " Local da Remoção:");
    result =
        result.toString().replaceAll("Local de Remoção ", " Local da Remoção:");
    result =
        result.toString().replaceAll("Local do Remoção", " Local da Remoção:");
    result = result.toString().replaceAll("Nome", " Nome");

    /*  result = result.toString().replaceAll("faecido ", " Falecido: ");
    result = result.toString().replaceAll(" Falecido ", " Falecido: ");
    result = result.toString().replaceAll("Falecido", " Falecido: ");
    result = result.toString().replaceAll("Faecido:", " Falecido: ");
    result = result.toString().replaceAll("faecido:", " Falecido: ");
    result = result.toString().replaceAll("Falecido::", " Falecido: ");
    result = result.toString().replaceAll("falecido:", " Falecido: ");
    result = result.toString().replaceAll(" Endereço", " Endereço:");
    result = result.toString().replaceAll(" Endereço::", " Endereço: ");*/
    result = result.toString().replaceAll("~", "");
    result = result.toString().replaceAll("", " ");
    result = result.toString().replaceAll("!", "");
    result = result.toString().replaceAll("\n\n", "");
    result = result.toString().replaceAll("=", "");
    result = result.toString().replaceAll("?", " ");
    result = result.toString().replaceAll(";", "");

    result = result.toString().replaceAll("*", "");
    result = result.toString().replaceAll("%", "");
    result = result.toString().replaceAll("&", "");
    result = result.toString().replaceAll("	", "");
    result = result.toString().replaceAll(">", "");
    result = result.toString().replaceAll("<", "");
    result = result.toString().replaceAll(",-", "");
    result = result.toString().replaceAll("-------", "");
    result = result.toString().replaceAll("RG.", "RG:");
    result = result.toString().replaceAll("RG: :", "RG:");
    result = result.toString().replaceAll("Falecido.", " Falecido:");
    result = result.toString().replaceAll("Faecido", " Falecido:");
    result = result.toString().replaceAll("Faecido::", " Falecido:");
    result = result.toString().replaceAll("Falecido", " Falecido:");
    result = result.toString().replaceAll("Falecido::", " Falecido:");
    result = result.toString().replaceAll("Contratante::", "Contratante:");
    result = result.toString().replaceAll(" Endereço", " Endereço:");
    result = result.toString().replaceAll(" Endereço::", " Endereço: ");
    return result.toString();
  }
}
