% Define versão necessária do LaTeX
\NeedsTeXFormat{LaTeX2e}

% Prove acesso a classe 'ufsc-thesis'
\ProvidesClass{ufsc-thesis}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions\

% Carrega como base a classe 'abntex2'
\LoadClass[a5paper, twoside]{abntex2}

% Tamanho das fontes
\RequirePackage{anyfontsize}

% Fonte 'Times New Roman'
\RequirePackage{times}

% Padrão das referências
\RequirePackage[num]{abntex2cite}

% Codificação padrão
\RequirePackage[utf8]{inputenc}

% Identação do primeiro paragráfo
\RequirePackage{indentfirst}

% Tamanho da fonte padrão do 'ABNTEX'
\renewcommand{\normalsize}{\fontsize{10.5pt}{12pt}\sffamily}

% Margens
\setlrmarginsandblock{2.5cm}{1.5cm}{*}
\setulmarginsandblock{2cm}{1.5cm}{*}
\checkandfixthelayout\

% Rodapé
\renewcommand{\footnotesize}{\fontsize{9.5pt}{11.5pt}\fontfamily{phv}}

% Citação
\newcommand{\citacaosize}{\fontsize{9.5pt}{11.5pt}\selectfont}
\renewcommand{\ABNTEXcitacaorecuo}{4.0cm}
% \renewenvironment*{citacao}{%
%    \list{}%
%    \citacaosize%
%    \addtolength{\leftskip}{\ABNTEXcitacaorecuo}%
%    \item[]%
%    \begin{SingleSpace}%
%  }{%
%    \end{SingleSpace}%
%    \endlist}

% Fontes dos títulos e seções
% \makechapterstyle{a5-ufsc}{%
% 	\renewcommand{\chapnamefont}{\normalsize}
% 	\renewcommand{\chapnumfont}{\normalsize}
% 	\renewcommand{\chaptitlefont}{\normalsize}
% 	\renewcommand{\printchapternum}{\chapnumfont\thechapter}
% 	\renewcommand{\chapternamenum}{ }
% 	\renewcommand{\printchaptername}{ }
% 	\renewcommand{\afterchapternum}{. }
% }
% \chapterstyle{a5-ufsc}
% \renewcommand{\ABNTEXsubsectionfontsize}{\ABNTEXsubsubsectionfontsize}
% \renewcommand{\ABNTEXsectionfontsize}{\ABNTEXsubsectionfontsize}
% \renewcommand{\ABNTEXchapterfontsize}{\ABNTEXsectionfontsize}
%
% % Parágrafos
% \setlength{\parindent}{1.0cm}
% \setlength{\parskip}{0.0cm}
% \setlength{\afterchapskip}{1cm}
%
\endinput

% Comandos auxiliares
\newcommand{\showfont}{encoding: \f@encoding{},
  family: \f@family{},
  series: \f@series{},
  shape: \f@shape{},
  size: \f@size{}
}
