inep-ufsc-thesis-latex
=================

Padrão para o formato de teses na UFSC-NEP, utilizando o pacote abnTeX2 como base.

#### Normas da UFSC para trabalhos acadêmicos
[Geral](http://portalbu.ufsc.br/normalizacao-de-trabalhos-2/)

[Capa](http://www.bu.ufsc.br/design/Guia_Rapido_Diagramacao_Trabalhos_Academicos.pdf)

[Normas em docx](http://www.bu.ufsc.br/design/TemplateTrabalhoAcademico.docx)


[Ficha de identificação da obra](http://portal.bu.ufsc.br/servicos/ficha-de-identificacao-da-obra/)
[Dados da ficha](http://ficha.bu.ufsc.br/)

#### Site da Biblioteca abnTeX2
[abnTeX2](https://code.google.com/p/abntex2/)

#### Instalação

Para poder utilizar a classe é necessário instalar o pacote abnTeX2 na sua
distribuição LaTeX, as configurações específicas para cada sistema, podem ser
encontradas no link abaixo.

[abnTeX2 Instalação](https://code.google.com/p/abntex2/wiki/Instalacao)

[abntex2 CTAN](http://www.ctan.org/pkg/abntex2)

Depois no diretório do seu projeto faça um clone dos arquivos do repositório.

```bash
git clone https://github.com/AdrianoRuseler/inep-ufsc-thesis-latex
```

Em seguida use a classe fornecida pelo pacote, a ufsc-inep-thesis, como classe do
documento do seu projeto.

```latex
\documentclass{ufsc-thesis}
```

Após isso utilize a classe como se fosse a abnTeX2 e redigir seu documento
normalmente.

#### Uso

A ideia desse projeto é fazer com que você utilize a classe abnTeX2, mas
com costumizações voltadas para as teses da UFSC, fazendo com que o seu uso
seja idêntico ao uso direto da classe abnTeX2.

A documentação dessa classe pode ser encontrada aqui:

[Documentação](http://dl.bintray.com/laurocesar/generic/abntex2-doc-1.9.2.zip)

Também é possível encontrar modelos de documentos que utilizam a classe para
tomar como base.

[Modelos
abnTeX2](http://dl.bintray.com/laurocesar/generic/abntex2-modelos-1.9.2.zip)

#### Contribuições

Fique livre para adicionar ou perguntar sobre quaisquer coisas que estão
faltando ou mesmo que você ache necessário para o uso da classe, esse projeto
não está vinculado a nenhum orgão da UFSC, eu estou fazendo isso porque
precisei para a minha tese e sei que mais pessoas podem estar precisando também.

Também há uma lista de email para quaisquer dúvidas:
[latexufsc@googlegroups.com](mailto:latexufsc@googlegroups.com)

#### Mudanças
  * v0.4 Corrigido o erro de uso de `\data`
  * v0.3 Adicionado comando para ficha catalográfica
  * v0.2 Formatação dos títulos dos capítulos e seções
  * v0.1 Documento Inicial
