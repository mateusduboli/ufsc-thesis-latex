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
\LoadClass[a5paper, twoside, chapter=TITLE, section=TITLE]{abntex2}

% Tamanho das fontes
\RequirePackage{anyfontsize}

% Fonte 'Times New Roman'
\RequirePackage{mathptmx}

% Padrão das referências
\RequirePackage[num]{abntex2cite}

% Identação do primeiro paragráfo
\RequirePackage{indentfirst}

% Tamanho da fonte padrão do 'ABNTEX'
\renewcommand{\normalsize}{\fontsize{10.5pt}{12pt}}

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

\endinput

% Comandos auxiliares
\newcommand{\showfont}{encoding: \f@encoding{},
  family: \f@family{},
  series: \f@series{},
  shape: \f@shape{},
  size: \f@size{}
}
