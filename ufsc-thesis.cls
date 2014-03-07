% vim:et:sw=2
%% ufsc-thesis.cls, v0.2 mateusduboli
%%
%% v0.1 Documento Inicial. - mateusduboli
%% v0.2 Formatação dos títulos dos capítulos e seções. - mateuduboli
% Define versão necessária do LaTeX
\NeedsTeXFormat{LaTeX2e}

% Prove acesso a classe 'ufsc-thesis'
\ProvidesClass{ufsc-thesis}[2014/02/24 v0.1 ufsc-thesis]

\DeclareOption*{%
 \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax

% Carrega como base a classe 'abntex2'
\LoadClass[%
  a5paper, % Tamanho do papel
  twoside, % Impressão nos dois lados da folha
  chapter=TITLE, % Título de capítulos em caixa alta
  section=TITLE  % Título de seções em caixa alta
]{abntex2}

% Manipulação de Strings
\RequirePackage{xstring}

% Tamanho das fontes
\RequirePackage{anyfontsize}

% TODO Colocar times caso o usuário queira, fonte matemática zuada
% Fonte 'Times New Roman'
\RequirePackage{mathptmx}

% Padrão das referências
\RequirePackage[num]{abntex2cite}

% Identação do primeiro paragráfo
\RequirePackage{indentfirst}

% Número da última página
\RequirePackage{lastpage}

\RequirePackage{ifthen}
\newcommand{\ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}

% Tamanho da fonte padrão do 'ABNTEX'
\renewcommand{\normalsize}{\fontsize{10.5pt}{12pt}}

% Comandos de dados - programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

\newcounter{ufscthesis@assuntos}
\providecommand{\listaassuntos}{}
\providecommand{\imprimirassuntos}{%
  \setcounter{ufscthesis@assuntos}{1}
  \@for\assunto:={\listaassuntos}\do{%
    \arabic{ufscthesis@assuntos}.\assunto. %
    \addtocounter{ufscthesis@assuntos}{1}
  }
}
\newcommand{\assuntos}[1]{\renewcommand{\listaassuntos}{#1}}

\providecommand{\imprimircentro}{}
\newcommand{\centro}[1]{\renewcommand{\imprimircentro}{#1}}


% Margens
\setlrmarginsandblock{2.5cm}{1.5cm}{*}
\setulmarginsandblock{2cm}{1.5cm}{*}
\checkandfixthelayout%

% Fontes dos títulos e seções
\renewcommand{\ABNTEXchapterfont}{\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}
\renewcommand{\ABNTEXsectionfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsectionfont}{\bfseries}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}
\renewcommand*{\printchapternum}{%
  % O abnTeX utiliza essa variável indicar se deve ou não expor o número do titulo.
  \setboolean{abntex@innonumchapter}{false}
}
% Espaçamento depois do título
\setlength{\afterchapskip}{0.38cm}
% Espaçamento depois dos paragráfos
\setlength{\parskip}{0.0cm}
% Espaçamento da primeira linha do parágrafo
\setlength{\parindent}{1.0cm}
% Comando para inverter sobrenome e nome
\newcommand{\ufscthesis@inverter}[1]{%
  \StrBehind{#1}{{}},
  \StrBefore{#1}{{}}
}
% Ficha catalográfica
\newcounter{ufscthesis@indiceficha}

\newcommand{\imprimirfichacatalografica}{%
  \setcounter{ufscthesis@indiceficha}{1}
  \begin{fichacatalografica}
  \vspace*{\fill}
  \fbox{%
    \ttfamily%
    \begin{minipage}[b][][t]{\textwidth}
      \indent\ufscthesis@inverter{\imprimirautor} \newline%
      \indent~\imprimirtitulo~:~/ \imprimirautor ; orientador, \imprimirorientador%
      \ifnotempty{\imprimircoorientador}{~; co-orientador, \imprimircoorientador}.~-~\imprimirlocal~\the\year. \newline%
      \indent~\pageref{LastPage} p. \newline \newline%
      \indent- \imprimirinstituicao, \imprimircentro. \imprimirprograma. \newline \newline%
      \indent Inclui Refer\^{e}ncias \newline \newline%
      \indent \imprimirassuntos
      \Roman{ufscthesis@indiceficha}. \ufscthesis@inverter{\imprimirorientador}. \stepcounter{ufscthesis@indiceficha}
      \ifnotempty{\imprimircoorientador}{\Roman{ufscthesis@indiceficha}. \ufscthesis@inverter{\imprimircoorientador}.\stepcounter{ufscthesis@indiceficha}}
      \Roman{ufscthesis@indiceficha}. \imprimirinstituicao. \imprimirprograma.
      \Roman{ufscthesis@indiceficha}. \imprimirtitulo.
    \end{minipage}
  }
  \end{fichacatalografica}
}

% Comandos auxiliares
% \newcommand{\showfont}{%
%   encoding: \f@encoding{},
%   family: \f@family{},
%   series: \f@series{},
%   shape: \f@shape{},
%   size: \f@size{}
% }

\endinput
