% vim:et:sw=2
%% ufsc-thesis.cls, v0.2 mateusduboli
%%
%% v0.1 Documento Inicial. - mateusduboli
%% v0.2 Formatação dos títulos dos capítulos e seções. - mateuduboli
%% v0.3 Adicionado comando para ficha catalográfica. - mateusduboli
%% v0.4 Corrigido o erro de uso de \data. - dudektria

% Define versão necessária do LaTeX
\NeedsTeXFormat{LaTeX2e}

% Prove acesso a classe 'ufsc-thesis'
\ProvidesClass{ufsc-inep-thesis}[2014/12/01 v01 ufsc-inep-thesis]

\DeclareOption*{%
 \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax

% Carrega como base a classe 'abntex2'
\LoadClass[%
  a5paper, % Tamanho do papel
  twoside, % Impressão nos dois lados da folha
  english,
%  sumario=tradicional,
 %  sumario=abnt-6027-2012,
  chapter=TITLE, % Título de capítulos em caixa alta
  section=TITLE  % Título de seções em caixa alta
]{abntex2}


\RequirePackage{caption}


% Manipulação de Strings
\RequirePackage{xstring}

% Tamanho das fontes
\RequirePackage{anyfontsize}

% Fonte 'Times New Roman'
\RequirePackage{mathptmx}

% Identação do primeiro paragráfo
\RequirePackage{indentfirst}

% Número da última página
\RequirePackage{lastpage}

\RequirePackage{ifthen}
\newcommand{\ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}

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


% Tamanho da fonte padrão do 'ABNTEX'
\renewcommand{\normalsize}{\fontsize{10.5pt}{12pt}}



\renewcommand{\familydefault}{cmr}
% The three default family font variables and the \familydefault variable should not be confused with their respective switch:

%\normalfont
%\rmfamily
%\sffamily
%\ttfamily


\renewcommand{\ABNTEXpartfont}{\usefont{T1}{cmr}{bx}{n}}
\renewcommand{\ABNTEXpartfontsize}{\fontsize{10.5pt}{12pt}}
\renewcommand{\ABNTEXchapterfont}{\usefont{T1}{cmr}{bx}{n}}
\renewcommand{\ABNTEXchapterfontsize}{\fontsize{10.5pt}{12pt}}
\renewcommand{\ABNTEXsectionfont}{\usefont{T1}{cmr}{m}{n}}
\renewcommand{\ABNTEXsectionfontsize}{\fontsize{10.5pt}{12pt}}
\renewcommand{\ABNTEXsubsectionfont}{\usefont{T1}{cmr}{bx}{n}}
\renewcommand{\ABNTEXsubsectionfontsize}{\fontsize{10.5pt}{12pt}}
\renewcommand{\ABNTEXsubsubsectionfont}{\usefont{T1}{cmr}{bx}{n}}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\fontsize{10.5pt}{12pt}}


\cftsetindents{part}{0em}{\cftlastnumwidth}
  \cftsetindents{chapter}{0em}{\cftlastnumwidth}
  \cftsetindents{section}{0em}{\cftlastnumwidth}
  \cftsetindents{subsection}{0em}{\cftlastnumwidth}
  \cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
  \cftsetindents{paragraph}{0em}{\cftlastnumwidth}
  \cftsetindents{subparagraph}{0em}{\cftlastnumwidth}
  %
  \renewcommand{\tocprintchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}
  %
  \renewcommand{\tocinnonumchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}%
    \cftinserthook{toc}{A}}
  %
  \renewcommand{\tocprintchapternonum}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}}
  %
  \renewcommand{\tocpartapendices}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  %
  \renewcommand{\tocpartanexos}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  %
  \setlength{\cftbeforechapterskip}{1em}
  %
  % Fontes das entradas do sumario
  %

  \renewcommand{\cftpartfont}{\ABNTEXpartfont}
  %
  \renewcommand{\cftchapterfont}{\ABNTEXchapterfont}
  \renewcommand{\cftchapterpagefont}{\cftchapterfont}
  %
  \renewcommand{\cftsectionfont}{\ABNTEXsectionfont}
  \renewcommand{\cftsectionpagefont}{\cftsectionfont}
  %
  \renewcommand{\cftsubsectionfont}{\ABNTEXsubsectionfont}
  \renewcommand{\cftsubsectionpagefont}{\cftsubsectionfont}
  %
  \renewcommand{\cftsubsubsectionfont}{\ABNTEXsubsubsectionfont}
  \renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}
  %
  \renewcommand{\cftparagraphfont}{\normalsize}
  \renewcommand{\cftparagraphpagefont}{\cftparagraphfont}

 

\DeclareCaptionFont{small}{\fontsize{9.5pt}{10.5pt}}

\captionsetup[table]{
 %  name=Tabela,
 %  listformat=empty,
 %  justification=justified,
 %  labelsep=colon,
%   position=above,
%   skip=\onelineskip,
 %  width=\linewidth,
   labelfont={normalsize},
   textfont={small},
   font={normalsize}
}

\captionsetup[figure]{
    %  name=Tabela,
	%  listformat=empty,
	%  justification=justified,
	%  labelsep=colon,
	%   position=above,
	%   skip=\onelineskip,
	%  width=\linewidth,
	labelfont={normalsize},
	textfont={small},
	font={normalsize}
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

% Comandos auxiliares
 \newcommand{\showfont}{%
   encoding: \f@encoding{},
   family: \f@family{},
   series: \f@series{},
   shape: \f@shape{},
   size: \f@size{},
baseline: \f@baselineskip{}
%tfsize: \tf@size{},
%sfsize: \sf@size{},
%sssize: \ssf@size{}
 }

% Comandos auxiliares
 \newcommand{\justshowfont}{%
    \f@encoding{},
    \f@family{},
    \f@series{},
    \f@shape{},
    \f@size{},
 \f@baselineskip{}
%tfsize: \tf@size{},
%sfsize: \sf@size{},
%sssize: \ssf@size{}
 }


% ---
% Numeracao continua das figuras

%Numeração dos floats por capítulo
\counterwithin{figure}{chapter} 
\counterwithin{table}{chapter}

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% IMPRESSOES PADROES DE CAPA E FOLHA DE ROSTO
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------



% ---
% Impressão da Capa
\renewcommand{\imprimircapa}{%
	\begin{capa}%
		\center
		
		\ABNTEXchapterfont\bfseries\large{UNIVERSIDADE FEDERAL DE SANTA CATARINA\\PROGRAMA DE P\'OS--GRADUA\c C\~AO EM ENGENHARIA EL\'ETRICA}
		
		\vfill
		
		\ABNTEXchapterfont\large\imprimirautor
		
		\vfill
		\ABNTEXchapterfont\bfseries\Large\MakeUppercase{\imprimirtitulo}
		\vfill
		
		\large\imprimirlocal
		
		\large\imprimirdata
		
		\vspace*{1cm}
	\end{capa}
}
% ---




% ---
% Folha de rosto
%   usar \imprimirfolhaderosto* casodeseje imprimir algo no verso da
%   página no caso de estar no modo twoside. Util para imprimir a Ficha
%   Bibliografica. Porem, se estiver no modo oneside, a versao sem estrela
%   é identica.
%\renewenvironment{folhaderosto}[1][\folhaderostoname]{\clearpage\PRIVATEbookmarkthis{#1}}{\cleardoublepage}
%\renewenvironment{folhaderosto*}[1][\folhaderostoname]{\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}%

% ---
% Conteudo padrao da Folha de Rosto
\makeatletter
\renewcommand{\folhaderostocontent}{
	\begin{center}
		
		%\vspace*{1cm}
		{\ABNTEXchapterfont\large\imprimirautor}
		
		\vspace*{\fill}\vspace*{\fill}
		\begin{center}
			\ABNTEXchapterfont\bfseries\Large\imprimirtitulo
		\end{center}
		\vspace*{\fill}
		
		\abntex@ifnotempty{\imprimirpreambulo}{%
			\hspace{.45\textwidth}
			\begin{minipage}{5,5cm}				
				\SingleSpacing
			\fontsize{9.5}{10.5} \selectfont	\imprimirpreambulo\\
										
			\fontsize{9.5}{10.5} \selectfont{\textbf{\imprimirorientadorRotulo}~\imprimirorientador\par}
				\abntex@ifnotempty{\imprimircoorientador}{%
					{\textbf{\imprimircoorientadorRotulo}~\imprimircoorientador}%
				}%				
			\end{minipage}%
			\vspace*{\fill}
		}%
		
%		{\abntex@ifnotempty{\imprimirinstituicao}{\imprimirinstituicao\vspace*{\fill}}}
		
%		{\large\imprimirorientadorRotulo~\imprimirorientador\par}
%		\abntex@ifnotempty{\imprimircoorientador}{%
%			{\large\imprimircoorientadorRotulo~\imprimircoorientador}%
%		}%
		\vspace*{\fill}
		
		{\large\imprimirlocal}
		\par
		{\large\imprimirdata}
		\vspace*{1cm}
		
	\end{center}
}
\makeatother




