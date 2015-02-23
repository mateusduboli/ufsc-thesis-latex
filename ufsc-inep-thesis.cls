
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
%\RequirePackage{etoolbox}
\RequirePackage{layouts}



% Manipulação de Strings
\RequirePackage{xstring}

% Tamanho das fontes
\RequirePackage{anyfontsize}

% Fonte 'Times New Roman'
\RequirePackage{mathptmx}

% Identação do primeiro paragráfo
\RequirePackage{indentfirst}

\RequirePackage{hyperref}


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


\RequirePackage{amsthm}
% ---
\newtheorem{axioma}{Axioma}[chapter]
\newtheorem{postulado}{Postulado}[chapter]
\newtheorem{teorema}{Teorema}[chapter]
\newtheorem{conjectura}{Conjectura}[chapter]
\newtheorem{corolario}{Coral\'ario}[teorema]
\newtheorem{lema}[teorema]{Lema}
\newtheorem{proposicao}{Proposi\c{c}\~ao}[teorema]


\theoremstyle{definition} % Commonly used in definitions, conditions, problems and examples.
\newtheorem{definicao}{Defini\c{c}\~ao}[section]
\newtheorem{exemplo}{Exemplo}[section]
\newtheorem{condicao}{Condi\c{c}\~ao}[section]


\theoremstyle{remark}
\newtheorem*{observacao}{Observa\c{c}\~ao}





% Margens
\setlrmarginsandblock{2.5cm}{1.5cm}{*}
\setulmarginsandblock{2cm}{1.5cm}{*}
\checkandfixthelayout%


% \def\<type>autorefname{<new name>}
\renewcommand{\tableautorefname}{Tabela}
\renewcommand{\figureautorefname}{Figura}
\renewcommand{\chapterautorefname}{Cap\'itulo}
 \renewcommand{\equationautorefname}{Equa\c{c}\~ao}



% Fontes dos títulos e seções 


% Tamanho da fonte padrão do 'ABNTEX'
\renewcommand{\normalsize}{\fontsize{10.5pt}{12pt}}


% http://tug.org/fonts/
\renewcommand{\familydefault}{cmr} % Fonte padrão utilizada no texto
% The three default family font variables and the \familydefault variable should not be confused with their respective switch:
%   http://www.forkosh.com/pstex/latexcommands.htm
% variable	value	activated by

%\encodingdefault	OT1	\normalfont, \textnormal{}
%\familydefault	\rmdefault	\normalfont, \textnormal{}
%\rmdefault	cmr	\rmfamily, \textrm{}
%\ttdefault	cmtt	\ttfamily, \texttt{}
%\sfdefault	cmss	\sffamily, \textsf{}
%\seriesdefault	m	\normalfont, \textnormal{}
%\mddefault	m	\mdseries, \textmd{}
%\bfdefault	bx	\bfseries, \textbf{}
%\shapedefault	n	\normalfont, \textnormal{}
%\updefault	n	\upshape, \textup{}
%\itdefault	it	\itshape, \textit{}
%\scdefault	sc	\scshape, \textsc{}
%\sldefault	sl	\slshape, \textsl{} 


\renewcommand{\rmdefault}{cmr} % Selects a roman (i.e., serifed) font family
% \renewcommand{\sfdefault}{cmss} % Selects a sans serif font family
% \renewcommand{\ttdefault}{cmtt} % Selects a monospaced (“typewriter”) font family


\renewcommand{\ABNTEXpartfont}{\usefont{T1}{cmr}{bx}{n}} % Apendices, anexos...
\renewcommand{\ABNTEXpartfontsize}{\fontsize{15pt}{18pt}}
\renewcommand{\ABNTEXchapterfont}{\usefont{T1}{cmr}{bx}{n}}
\renewcommand{\ABNTEXchapterfontsize}{\fontsize{10.5pt}{12pt}}
\renewcommand{\ABNTEXsectionfont}{\usefont{T1}{cmr}{m}{n}}
\renewcommand{\ABNTEXsectionfontsize}{\fontsize{10.5pt}{12pt}}
\renewcommand{\ABNTEXsubsectionfont}{\usefont{T1}{cmr}{b}{n}}
\renewcommand{\ABNTEXsubsectionfontsize}{\fontsize{10.5pt}{12pt}}
\renewcommand{\ABNTEXsubsubsectionfont}{\usefont{T1}{cmr}{m}{n}}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\fontsize{10.5pt}{12pt}}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\usefont{T1}{cmr}{m}{it}}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\fontsize{10.5pt}{12pt}}



 \renewcommand{\chapnumfont}{\chaptitlefont}
  \renewcommand{\parttitlefont}{\ABNTEXpartfont\ABNTEXpartfontsize}
  \renewcommand{\partnumfont}{\ABNTEXpartfont\ABNTEXpartfontsize}
  \renewcommand{\partnamefont}{\ABNTEXpartfont\ABNTEXpartfontsize}



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
  
 
  \renewcommand*{\l@chapter}[2]{%
  \l@chapapp{\uppercase{#1}}{#2}{\cftchaptername}}
 
	\renewcommand*{\l@section}[2]{%
  	\l@chapapp{\ABNTEXsectionfont\uppercase{#1}}{#2}{\cftsectionname}} 
  

  \renewcommand{\cftpartfont}{\ABNTEXpartfont}
  \renewcommand{\cftpartpagefont}{\cftpartfont}
  %
  %\renewcommand{\cftchapterfont}{\ABNTEXchapterfont}
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
  \renewcommand{\cftparagraphfont}{\ABNTEXsubsubsubsectionfont}
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




