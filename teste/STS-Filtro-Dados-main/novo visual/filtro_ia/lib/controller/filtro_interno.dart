class ArrumerErros {
  Future<String> palavraContratante(String erros) async {
    try {
      String txt = erros.toString();
      List<String> contratanteTxt = [];

      try {
        try {
          contratanteTxt = txt.toString().split("Contratante:");
          contratanteTxt =
              contratanteTxt[1].toString().split("Grau de Parentesco:");
          contratanteTxt[0] =
              contratanteTxt[0].toString().replaceAll("\n", " ");
          if (contratanteTxt[0].length >= 65) {
            contratanteTxt = txt.toString().split("Contratante:");
            contratanteTxt[0] = contratanteTxt[1].toString().substring(0, 65);
            contratanteTxt[0] =
                contratanteTxt[0].toString().replaceAll("\n", " ");
          }
          try {
            contratanteTxt = contratanteTxt[0].toString().split("Nome");
            contratanteTxt[0] =
                contratanteTxt[0].toString().replaceAll("\n", " ");
          } catch (v) {}
        } catch (j) {
          try {
            contratanteTxt = txt.toString().split("Contratante:");
            contratanteTxt = contratanteTxt[1].toString().split("Nome Social:");
            contratanteTxt[0] =
                contratanteTxt[0].toString().replaceAll("\n", " ");
            if (contratanteTxt[0].length >= 65) {
              contratanteTxt = txt.toString().split("Contratante:");
              contratanteTxt[0] =
                  contratanteTxt[0].toString().replaceAll("\n", " ");
              contratanteTxt[0] = contratanteTxt[1].toString().substring(0, 65);
            }
            try {
              contratanteTxt = contratanteTxt[0].toString().split("Nome");
              contratanteTxt[0] =
                  contratanteTxt[0].toString().replaceAll("\n", " ");
            } catch (v) {}
          } catch (f) {
            contratanteTxt = txt.toString().split("Contratante:");
            contratanteTxt[0] =
                contratanteTxt[0].toString().replaceAll("\n", " ");
            contratanteTxt[0] = contratanteTxt[1].toString().substring(0, 65);
          }
          try {
            contratanteTxt = contratanteTxt[0].toString().split("Nome");
            contratanteTxt[0] =
                contratanteTxt[0].toString().replaceAll("\n", " ");
          } catch (v) {}
        }
      } catch (e) {
        contratanteTxt[0] = "erro";
      }

      if (contratanteTxt[0].length > 65) {
        contratanteTxt = txt.toString().split("Contratante:");
        contratanteTxt[0] = contratanteTxt[1].toString().substring(0, 65);
      }
      if (contratanteTxt[0] == null) {
        contratanteTxt = txt.toString().split("Contratante:");
        contratanteTxt[0] = contratanteTxt[1].toString().substring(0, 65);
      }
      erros = contratanteTxt[0].toString();
      return erros;
    } catch (r) {
      return "erro";
    }
  }

  Future<String> palavraCel(String erros) async {
    try {
      String txt = erros.toString();
      List<String> celLista = [];

      try {
        celLista = txt.toString().split("Cel.:");
        try {
          celLista = txt.toString().split("Cel.:");
          celLista = celLista[1].toString().split("Nome da Mãe:");
          celLista[0] = celLista[0].toString().replaceAll("\n", "");
          if (celLista[0].length > 17) {
            celLista = txt.toString().split("Cel.:");
            celLista[0] = celLista[0].toString().replaceAll("\n", "");
            celLista[0] = celLista[1].toString().substring(0, 17);
          }
        } catch (e) {
          try {
            celLista = txt.toString().split("Cel.:");
            celLista = celLista[1].toString().split("Endereço:");
            celLista[0] = celLista[0].toString().replaceAll("\n", "");
            if (celLista[0].length > 17) {
              celLista = txt.toString().split("Cel.:");
              celLista[0] = celLista[0].toString().replaceAll("\n", "");
              celLista[0] = celLista[1].toString().substring(0, 17);
            }
          } catch (j) {
            try {
              celLista = txt.toString().split("Cel.:");
              celLista = celLista[1].toString().split("Nome da Mãe");
              celLista[0] = celLista[0].toString().replaceAll("\n", "");
              if (celLista[0].length > 17) {
                celLista = txt.toString().split("Cel.:");
                celLista[0] = celLista[0].toString().replaceAll("\n", "");
                celLista[0] = celLista[1].toString().substring(0, 17);
              }
            } catch (k) {
              try {
                celLista = txt.toString().split("Cel.:");
                celLista = celLista[1].toString().split("Local da Remoção:");
                if (celLista[0].length > 17) {
                  celLista = txt.toString().split("Cel.:");

                  celLista[0] = celLista[1].toString().substring(0, 17);
                }
              } catch (l) {
                celLista = txt.toString().split("Cel.:");
                celLista = celLista[1].toString().split("Falecido:");
                if (celLista[0].length > 17) {
                  celLista = txt.toString().split("Cel.:");

                  celLista[0] = celLista[1].toString().substring(0, 17);
                }
              }
            }
          }
        }
      } catch (e) {
        celLista[0] = "erro";
      }
      if (celLista[0].toString() == "null") {
        celLista = txt.toString().split("Cel.:");
        celLista[0] = celLista[1].toString().substring(0, 17);
      }
      if (celLista[0].length > 17) {
        celLista = txt.toString().split("Cel.:");
        celLista[0] = celLista[1].toString().substring(0, 17);
      }
      erros = celLista[0].toString().replaceAll(":", "");
      return erros;
    } catch (r) {
      return "erros";
    }
  }

  Future<String> palavraGral(String erros) async {
    try {
      String txt = erros.toString();
      List<String> graulTxtx = [];

      try {
        try {
          graulTxtx = txt.toString().split("Grau de Parentesco:");
          graulTxtx = graulTxtx[1].toString().split("Nome Social:");
          graulTxtx[0] = graulTxtx[0].toString().replaceAll(" ", "");
          graulTxtx[0] = graulTxtx[0].toString().replaceAll("\n", "");
          if (graulTxtx[0].length > 20) {
            graulTxtx = txt.toString().split("Grau de Parentesco:");
            graulTxtx[0] = graulTxtx[1].toString().substring(0, 20);
          }
        } catch (e) {
          try {
            graulTxtx = txt.toString().split("Grau de Parentesco:");
            graulTxtx = graulTxtx[1].toString().split("BROMELIA ");
            graulTxtx[0] = graulTxtx[0].toString().replaceAll(" ", "");
            graulTxtx[0] = graulTxtx[0].toString().replaceAll("\n", "");
            if (graulTxtx[0].length > 20) {
              graulTxtx = txt.toString().split("Grau de Parentesco:");
              graulTxtx[0] = graulTxtx[1].toString().substring(0, 20);
            }
          } catch (j) {
            try {
              graulTxtx = txt.toString().split("Grau de Parentesco:");
              graulTxtx = graulTxtx[1].toString().split("Falecido:");
              graulTxtx[0] = graulTxtx[0].toString().replaceAll(" ", "");
              graulTxtx[0] = graulTxtx[0].toString().replaceAll("\n", "");
              if (graulTxtx[0].length > 20) {
                graulTxtx = txt.toString().split("Grau de Parentesco:");
                graulTxtx[0] = graulTxtx[1].toString().substring(0, 20);
              }
            } catch (f) {
              try {
                graulTxtx = txt.toString().split("Grau de Parentesco:");
                graulTxtx = graulTxtx[1].toString().split("Cel");
                graulTxtx[0] = graulTxtx[0].toString().replaceAll(" ", "");
                graulTxtx[0] = graulTxtx[0].toString().replaceAll("\n", "");
                if (graulTxtx[0].length > 20) {
                  graulTxtx = txt.toString().split("Grau de Parentesco:");
                  graulTxtx[0] = graulTxtx[1].toString().substring(0, 20);
                }
              } catch (m) {
                try {
                  graulTxtx = txt.toString().split("Grau de Parentesco:");
                  graulTxtx = graulTxtx[1].toString().split("1");
                  graulTxtx[0] = graulTxtx[0].toString().replaceAll(" ", "");
                  graulTxtx[0] = graulTxtx[0].toString().replaceAll("\n", "");

                  graulTxtx[0] = graulTxtx[0].toString().replaceAll("ep", "");
                  if (graulTxtx[0].length > 20) {
                    graulTxtx = txt.toString().split("Grau de Parentesco:");
                    graulTxtx[0] = graulTxtx[1].toString().substring(0, 20);
                  }
                } catch (n) {
                  try {
                    graulTxtx = txt.toString().split("Grau de Parentesco:");
                    graulTxtx = graulTxtx[1].toString().split("RG:");
                    graulTxtx[0] = graulTxtx[0].toString().replaceAll(" ", "");
                    graulTxtx[0] = graulTxtx[0].toString().replaceAll("\n", "");
                    if (graulTxtx[0].length > 20) {
                      graulTxtx = txt.toString().split("Grau de Parentesco:");
                      graulTxtx[0] = graulTxtx[1].toString().substring(0, 20);
                    }
                  } catch (o) {
                    try {
                      graulTxtx = txt.toString().split("Grau de Parentesco:");
                      graulTxtx = graulTxtx[1].toString().split("BROMELIA ");
                      graulTxtx[0] =
                          graulTxtx[0].toString().replaceAll(" ", "");
                      graulTxtx[0] =
                          graulTxtx[0].toString().replaceAll("\n", "");
                      if (graulTxtx[0].length > 20) {
                        graulTxtx = txt.toString().split("Grau de Parentesco:");
                        graulTxtx[0] = graulTxtx[1].toString().substring(0, 20);
                      }
                    } catch (l) {
                      try {
                        graulTxtx = txt.toString().split("Grau de Parentesco:");
                        graulTxtx = graulTxtx[1].toString().split("ITENS");
                        graulTxtx[0] =
                            graulTxtx[0].toString().replaceAll(" ", "");
                        graulTxtx[0] =
                            graulTxtx[0].toString().replaceAll("\n", "");
                        if (graulTxtx[0].length > 20) {
                          graulTxtx =
                              txt.toString().split("Grau de Parentesco:");
                          graulTxtx[0] =
                              graulTxtx[1].toString().substring(0, 20);
                        }
                      } catch (e) {
                        try {
                          graulTxtx =
                              txt.toString().split("Grau de Parentesco:");
                          graulTxtx = graulTxtx[1].toString().split("(DOIS)");
                          graulTxtx[0] =
                              graulTxtx[0].toString().replaceAll(" ", "");
                          graulTxtx[0] =
                              graulTxtx[0].toString().replaceAll("\n", "");
                          if (graulTxtx[0].length > 20 ||
                              graulTxtx[0].length < 2) {
                            graulTxtx =
                                txt.toString().split("Grau de Parentesco:");
                            graulTxtx[0] =
                                graulTxtx[1].toString().substring(0, 20);
                          }
                        } catch (y) {
                          graulTxtx =
                              txt.toString().split("Grau de Parentesco:");

                          graulTxtx = graulTxtx[1].toString().split(")");
                          graulTxtx[1] =
                              graulTxtx[1].toString().replaceAll(" ", "");
                          graulTxtx[1] =
                              graulTxtx[1].toString().replaceAll("\n", " ");
                          graulTxtx[0] = graulTxtx[0] + ")";
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      } catch (e) {
        graulTxtx[0] = "erro";
      }
      if (graulTxtx[0] == null) {
        graulTxtx = txt.toString().split("Grau de Parentesco:");
        graulTxtx[1] = graulTxtx[1].toString().replaceAll(" ", "");
        graulTxtx[1] = graulTxtx[1].toString().replaceAll("\n", " ");
        graulTxtx[0] = graulTxtx[1].toString().substring(0, 20);
      }
      if (graulTxtx[0].length > 20) {
        graulTxtx = txt.toString().split("Grau de Parentesco:");
        graulTxtx[1] = graulTxtx[1].toString().replaceAll(" ", "");
        graulTxtx[1] = graulTxtx[1].toString().replaceAll("\n", " ");
        graulTxtx[0] = graulTxtx[1].toString().substring(0, 20);
      }
      graulTxtx[1] = graulTxtx[1].toString().replaceAll(" ", "");
      graulTxtx[1] = graulTxtx[1].toString().replaceAll("\n", " ");
      erros = graulTxtx[0].toString();
      return erros;
    } catch (e) {
      return "erros";
    }
  }

  Future<String> palavraCPF(String erros) async {
    try {
      String txt = erros.toString();
      List<String> cpfLista = [];

      try {
        try {
          cpfLista = txt.toString().split("CPF:");
          cpfLista = cpfLista[1].toString().split("RG:");
          cpfLista[0] = cpfLista[0].toString().replaceAll(".", "");
          cpfLista[0] = cpfLista[0].toString().replaceAll("-", "");
          cpfLista[0] = cpfLista[0].toString().replaceAll(" ", "");
          if (cpfLista[0].length > 19) {
            cpfLista = txt.toString().split("CPF:");
            cpfLista[1] = cpfLista[1].toString().replaceAll(" ", "");
            cpfLista[1] = cpfLista[1].toString().replaceAll("\n", "");
            cpfLista[0] = cpfLista[1].toString().substring(0, 15);
          }
        } catch (e) {
          try {
            cpfLista = txt.toString().split("CPF:");
            cpfLista = cpfLista[1].toString().split("Nome da Mãe:");
            cpfLista[0] = cpfLista[0].toString().replaceAll(".", "");
            cpfLista[0] = cpfLista[0].toString().replaceAll("-", "");
            cpfLista[0] = cpfLista[0].toString().replaceAll(" ", "");
            if (cpfLista[0].length > 19) {
              cpfLista = txt.toString().split("CPF:");
              cpfLista[1] = cpfLista[1].toString().replaceAll(" ", "");
              cpfLista[1] = cpfLista[1].toString().replaceAll("\n", "");
              cpfLista[0] = cpfLista[1].toString().substring(0, 15);
            }
          } catch (j) {
            cpfLista = txt.toString().split("CPF:");
            cpfLista = cpfLista[1].toString().split("Grau de Parentesco:");
            cpfLista[0] = cpfLista[0].toString().replaceAll(".", "");
            cpfLista[0] = cpfLista[0].toString().replaceAll(".", "");
            cpfLista[0] = cpfLista[0].toString().replaceAll(" ", "");
            if (cpfLista[0].length > 19) {
              cpfLista = txt.toString().split("CPF:");
              cpfLista[1] = cpfLista[1].toString().replaceAll(" ", "");
              cpfLista[1] = cpfLista[1].toString().replaceAll("\n", "");
              cpfLista[0] = cpfLista[1].toString().substring(0, 15);
            }
          }
        }
      } catch (e) {
        cpfLista[0] = "erro";
      }
      if (cpfLista[0].length > 19) {
        cpfLista = txt.toString().split("CPF:");
        cpfLista[1] = cpfLista[1].toString().replaceAll(" ", "");
        cpfLista[1] = cpfLista[1].toString().replaceAll("\n", "");
        cpfLista[0] = cpfLista[1].toString().substring(0, 15);
      }
      if (cpfLista[0] == null) {
        cpfLista = txt.toString().split("CPF:");
        cpfLista[1] = cpfLista[1].toString().replaceAll(" ", "");
        cpfLista[0] = cpfLista[1].toString().substring(0, 15);
      }
      erros = cpfLista[0].toString();
      return erros;
    } catch (e) {
      return "erros";
    }
  }

  Future<String> palavraRG(String erros) async {
    try {
      String txt = erros.toString();
      List<String> rgLista = [];

      try {
        try {
          rgLista = txt.toString().split("RG:");
          rgLista = rgLista[1].toString().split("S");
          rgLista[0] = rgLista[0].toString().replaceAll(".", "");
          rgLista[0] = rgLista[0].toString().replaceAll(" ", "");
          rgLista[0] = rgLista[0].toString().replaceAll("-", "");
          if (rgLista[0].length > 12 || rgLista[0].length < 7) {
            rgLista = txt.toString().split("RG:");
            rgLista[1] = rgLista[1].toString().replaceAll(".", "");
            rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
            rgLista[1] = rgLista[1].toString().replaceAll("-", "");
            rgLista[0] = rgLista[1].toString().substring(0, 12);
          }
        } catch (e) {
          try {
            rgLista = txt.toString().split("RG:");
            rgLista = rgLista[1].toString().split("Cel.:");
            rgLista[0] = rgLista[0].toString().replaceAll(".", "");
            rgLista[0] = rgLista[0].toString().replaceAll(" ", "");
            rgLista[0] = rgLista[0].toString().replaceAll("-", "");
            if (rgLista[0].length > 12 || rgLista[0].length < 7) {
              rgLista = txt.toString().split("RG:");
              rgLista[1] = rgLista[1].toString().replaceAll(".", "");
              rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
              rgLista[1] = rgLista[1].toString().replaceAll("-", "");
              rgLista[0] = rgLista[1].toString().substring(0, 12);
            }
          } catch (p) {
            try {
              rgLista = txt.toString().split("RG:");
              rgLista = rgLista[1].toString().split("Nome da Mãe:");
              rgLista[0] = rgLista[0].toString().replaceAll(".", "");
              rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
              rgLista[0] = rgLista[0].toString().replaceAll("-", "");
              if (rgLista[0].length > 12 || rgLista[0].length < 7) {
                rgLista = txt.toString().split("RG:");
                rgLista[1] = rgLista[1].toString().replaceAll(".", "");
                rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
                rgLista[1] = rgLista[1].toString().replaceAll("-", "");
                rgLista[0] = rgLista[1].toString().substring(0, 12);
              }
            } catch (l) {
              rgLista = txt.toString().split("RG:");
              rgLista[0] = rgLista[0].toString().replaceAll(".", "");
              rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
              rgLista[0] = rgLista[0].toString().replaceAll("-", "");
              rgLista[0] = rgLista[1].toString().substring(0, 11);
              if (rgLista[0].length > 12 || rgLista[0].length < 7) {
                rgLista = txt.toString().split("RG:");
                rgLista[1] = rgLista[1].toString().replaceAll(".", "");
                rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
                rgLista[1] = rgLista[1].toString().replaceAll("-", "");
                rgLista[0] = rgLista[1].toString().substring(0, 12);
              }
            }
          }
        }
        if (rgLista[0] == null || rgLista[0].toString() == "erros") {
          rgLista = txt.toString().split("RG:");
          rgLista[1] = rgLista[1].toString().replaceAll(".", "");
          rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
          rgLista[1] = rgLista[1].toString().replaceAll("-", "");
          rgLista[0] = rgLista[1].toString().substring(0, 12);
        }
        if (rgLista[0].length > 12 || rgLista[0].length < 7) {
          rgLista = txt.toString().split("RG:");
          rgLista[1] = rgLista[1].toString().replaceAll(".", "");
          rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
          rgLista[1] = rgLista[1].toString().replaceAll("-", "");
          rgLista[0] = rgLista[1].toString().substring(0, 12);
        }
      } catch (e) {
        rgLista[0] = "erro";
      }
      if (rgLista[0] == null || rgLista[0].toString() == "erros") {
        rgLista = txt.toString().split("RG:");
        rgLista[1] = rgLista[1].toString().replaceAll(".", "");
        rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
        rgLista[1] = rgLista[1].toString().replaceAll("-", "");
        rgLista[0] = rgLista[1].toString().substring(0, 12);
      }
      if (rgLista[0].length > 11 || rgLista[0].length < 7) {
        rgLista = txt.toString().split("RG:");
        rgLista[1] = rgLista[1].toString().replaceAll(".", "");
        rgLista[1] = rgLista[1].toString().replaceAll(" ", "");
        rgLista[1] = rgLista[1].toString().replaceAll("-", "");
        rgLista[0] = rgLista[1].toString().substring(0, 12);
      }
      erros = rgLista[0].toString();
      return erros;
    } catch (e) {
      return "erros";
    }
  }

  Future<String> palavrasEND(String erros) async {
    try {
      String txt = erros.toString();
      List<String> endLista = [];

      try {
        try {
          endLista = txt.toString().split("Endereço:");
          endLista = endLista[1].toString().split("CEP:");
          endLista[0] = endLista[0].toString() +
              "CEP: " +
              endLista[1].toString().substring(0, 10);

          if (endLista[0].length > 115 || endLista[0].length < 10) {
            endLista = txt.toString().split("Endereço:");
            endLista[0] = endLista[1].toString().substring(0, 115);
          }
        } catch (e) {
          endLista = txt.toString().split("Endereço:");
          endLista = endLista[1].toString().split("Data do Sepultamento:");
          if (endLista[0].length > 115 || endLista[0].length < 10) {
            endLista = txt.toString().split("Endereço:");
            endLista[0] = endLista[1].toString().substring(0, 115);
          }
        }
      } catch (e) {
        try {
          endLista = txt.toString().split("Endereço:");
          endLista = endLista[1].toString().split("Nome Social");
          if (endLista[0].length > 115 || endLista[0].length < 10) {
            endLista = txt.toString().split("Endereço:");
            endLista[0] = endLista[1].toString().substring(0, 115);
          }
        } catch (e) {
          try {
            endLista = txt.toString().split("Endereço:");
            endLista = endLista[1].toString().split("Falecido");
            if (endLista[0].length > 115 || endLista[0].length < 10) {
              endLista = txt.toString().split("Endereço:");
              endLista[0] = endLista[1].toString().substring(0, 115);
            }
          } catch (e) {
            endLista = endLista[1].toString().toString().split("Endereço:");
            endLista[0] = endLista[1].toString().substring(0, 115);
            if (endLista[0].length > 115 || endLista[0].length < 10) {
              endLista = txt.toString().split("Endereço:");
              endLista[0] = endLista[1].toString().substring(0, 115);
            }
          }
        }
      }
      if (endLista[0].length > 115 || endLista[0].length < 10) {
        endLista = txt.toString().split("Endereço:");
        endLista[0] = endLista[1].toString().substring(0, 115);
      }
      if (endLista[0] == null) {
        endLista = txt.toString().split("Endereço:");
        endLista[0] = endLista[1].toString().substring(0, 115);
      }
      erros = endLista[0].toString();
      return erros;
    } catch (e) {
      return "erros";
    }
  }

  Future<String> palavrasdata(String erros) async {
    try {
      List<String> dataOb = [];
      try {
        try {
          dataOb = erros.toString().split("Data de óbito:");
          dataOb = dataOb[1].split("Horário");
          if (dataOb[0].length > 112) {
            dataOb = erros.toString().split("Data de óbito:");
            dataOb[1] = dataOb[1].toString().replaceAll(" ", "");
            dataOb[1] = dataOb[1].toString().replaceAll("\n", " ");
            dataOb[0] = dataOb[1].toString().substring(0, 12);
          }
        } catch (e) {
          try {
            dataOb = erros.toString().split("Data de óbito:");
            dataOb = dataOb[1].toString().split("N°");
            if (dataOb[0].length > 12) {
              dataOb = erros.toString().split("Data de óbito:");
              dataOb[1] = dataOb[1].toString().replaceAll(" ", "");
              dataOb[1] = dataOb[1].toString().replaceAll("\n", " ");
              dataOb[0] = dataOb[1].toString().substring(0, 12);
            }
          } catch (r) {
            dataOb = erros.toString().split("Data de óbito");
            dataOb[1] = dataOb[1].toString().replaceAll(" ", "");
            dataOb[1] = dataOb[1].toString().replaceAll("\n", " ");
            dataOb[0] = dataOb[1].toString().substring(0, 12);
          }
        }
      } catch (e) {
        dataOb[0] = "erro";
      }

      if (dataOb[0].length > 12) {
        dataOb = erros.toString().split("Data de óbito:");
        dataOb[0] = dataOb[1].toString().substring(0, 12);
      }
      dataOb[1] = dataOb[1].toString().replaceAll(" ", "");
      dataOb[1] = dataOb[1].toString().replaceAll("\n", " ");
      dataOb[0] = dataOb[0].toString().substring(0, 2) +
          "/" +
          dataOb[0].toString().substring(3, 5) +
          "/" +
          dataOb[0].toString().substring(6, 10);
      if (dataOb[0] == null) {
        dataOb = erros.toString().split("Data de óbito:");
        dataOb[0] = dataOb[1].toString().substring(0, 12);
      }
      erros = dataOb[0].toString();
      return erros;
    } catch (e) {
      return "erros";
    }
  }

  Future<String> palavracausa(String erros) async {
    try {
      String txt = erros.toString();
      List<String> causaMtLista = [];

      try {
        try {
          causaMtLista = txt.toString().split("Causa da Morte:");
          causaMtLista = causaMtLista[1].toString().split("Local da Remoção:");
          if (causaMtLista[0].length > 150) {
            causaMtLista = txt.toString().split("Causa da Morte:");
            causaMtLista[0] = causaMtLista[1].toString().substring(0, 150);
          }
        } catch (e) {
          causaMtLista = txt.toString().split("Causa da Morte:");
          causaMtLista = causaMtLista[1].toString().split("Horario");
          if (causaMtLista[0].length > 150) {
            causaMtLista = txt.toString().split("Causa da Morte:");
            causaMtLista[0] = causaMtLista[1].toString().substring(0, 150);
          }
        }
        causaMtLista[0] = causaMtLista[0].toString().replaceAll("\n", "");
      } catch (e) {
        causaMtLista[0] = "erro";
      }
      if (causaMtLista[0].length > 180) {
        causaMtLista = txt.toString().split("Falecido:");

        causaMtLista[0] = causaMtLista[1].toString().substring(0, 180);
      }
      erros = causaMtLista[0].toString();
      return erros;
    } catch (e) {
      return "erros";
    }
  }

  Future<String> palavraFalecido(String erros) async {
    try {
      String txt = erros.toString();
      List<String> falecidoLista = [];
      try {
        try {
          falecidoLista = txt.toString().split("Falecido:");
          falecidoLista = falecidoLista[1].toString().split("Sexo");
          if (falecidoLista[0].length > 67 || falecidoLista[0].length < 8) {
            falecidoLista = txt.toString().split("Falecido:");
            falecidoLista[1] = falecidoLista[1].toString().replaceAll("\n", "");
            falecidoLista[0] = falecidoLista[1].toString().substring(0, 67);
          }
        } catch (e) {
          try {
            falecidoLista = txt.toString().split("Falecido:");
            falecidoLista = falecidoLista[1].toString().split("N°");
            if (falecidoLista[0].length > 67 || falecidoLista[0].length < 8) {
              falecidoLista = txt.toString().split("Falecido:");
              falecidoLista[1] =
                  falecidoLista[1].toString().replaceAll("\n", "");
              falecidoLista[0] = falecidoLista[1].toString().substring(0, 67);
            }
          } catch (v) {
            try {
              falecidoLista = txt.toString().split("Falecido:");
              falecidoLista = falecidoLista[1].toString().split("RG:");
              if (falecidoLista[0].length > 67 || falecidoLista[0].length < 8) {
                falecidoLista = txt.toString().split("Falecido:");
                falecidoLista[1] =
                    falecidoLista[1].toString().replaceAll("\n", "");
                falecidoLista[0] = falecidoLista[1].toString().substring(0, 67);
              }
            } catch (r) {
              falecidoLista = txt.toString().split("Falecido:");
              falecidoLista = falecidoLista[1].toString().split("Contratante:");
              if (falecidoLista[0].length > 67 || falecidoLista[0].length < 8) {
                falecidoLista = txt.toString().split("Falecido:");
                falecidoLista[1] =
                    falecidoLista[1].toString().replaceAll("\n", "");
                falecidoLista[0] = falecidoLista[1].toString().substring(0, 67);
              }
            }
          }
        }
        if (falecidoLista[0] == null) {
          falecidoLista = txt.toString().split("Falecido:");
          falecidoLista[0] = falecidoLista[1].toString().substring(0, 66);
        }
      } catch (e) {
        falecidoLista[0] = "erros";
      }
      if (falecidoLista[0] == null) {
        falecidoLista = txt.toString().split("Falecido:");
        falecidoLista[0] = falecidoLista[1].toString().substring(0, 66);
      }
      if (falecidoLista[0] == null || falecidoLista[0].toString() == "erros") {
        falecidoLista = txt.toString().split("Falecido:");
        falecidoLista[0] = falecidoLista[1].toString().substring(0, 66);
      }
      erros = falecidoLista[0].toString();
      return erros;
    } catch (e) {
      return "erros";
    }
  }
}
