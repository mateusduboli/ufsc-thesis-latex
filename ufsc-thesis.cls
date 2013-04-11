% Define versão necessária do LaTeX
\NeedsTeXFormat{LaTeX2e}

% Prove acesso a classe 'ufsc-thesis'
\ProvidesClass{ufsc-thesis}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
%\ProcessOptions

% Carrega como base a classe 'abntex2'
\LoadClass[a5paper, twoside]{abntex2}

% Fonte 'Times New Roman'
\RequirePackage{times}

% Padrão das referências
\RequirePackage[alf]{abntex2cite}

% Codificação padrão
\RequirePackage[utf8]{inputenc}

% Identação do primeiro paragráfo
\RequirePackage{indentfirst}

% Tamanho da fonte padrão do 'ABNTEX'
\renewcommand{\normalsize}{\ABNTEXchapterfont}

% Margens
\setlrmarginsandblock{2.5cm}{1.5cm}{*}
\setulmarginsandblock{2cm}{1.5cm}{*}
\checkandfixthelayout

% Rodapé
\setlength{\parindent}{1.0cm}
\renewcommand{\footnotesize}{\fontsize{8pt}{8.5pt}\fontfamily{phv}}


% Citação
\newcommand{\citacaosize}{\fontsize{9.5pt}{10pt}}
\renewcommand{\ABNTEXcitacaorecuo}{4.0cm}
\renewenvironment*{citacao}{%
   \list{}%
   \citacaosize%
   \addtolength{\leftskip}{\ABNTEXcitacaorecuo}%
   \item[]%
   \begin{SingleSpace}%
 }{%
   \end{SingleSpace}%
   \endlist}

\endinput