
% Define versão necessária do LaTeX
\NeedsTeXFormat{LaTeX2e}

% Prove acesso a classe 'abntex2-ufsc'
\ProvidesClass{abntex2-ufsc}[2016/11/15 abntex2-ufsc]
\RequirePackage{ifthen}

%
% Opções de diagramação de sumários
% sumario=tradicional    : Sumário tradicional do LaTeX/Memoir
% sumario=abnt-6027-2012 : Sumário conforme recomendação da ABNT NBR 6027:2012
% sumario=UFSC : Sumário customizado

%\newboolean{ABNTEXsumario-tradicional}     %true=titles of chapter/appendix in uppercase
%\newboolean{ABNTEXsumario-abnt-6027-2012} 
\newboolean{ABNTEXsumario-UFSC} 

%\setboolean{ABNTEXsumario-tradicional}{false}
%\setboolean{ABNTEXsumario-abnt-6027-2012}{true}
\setboolean{ABNTEXsumario-UFSC}{false}

\DeclareOption{sumario=tradicional}{%
	%	\setboolean{ABNTEXsumario-tradicional}{true}%
	%	\setboolean{ABNTEXsumario-abnt-6027-2012}{false}
	\setboolean{ABNTEXsumario-UFSC}{false}}

\DeclareOption{sumario=abnt-6027-2012}{%
	%	\setboolean{ABNTEXsumario-abnt-6027-2012}{true}
	%	\setboolean{ABNTEXsumario-tradicional}{false}
	\setboolean{ABNTEXsumario-UFSC}{false}}

\DeclareOption{sumario=UFSC}{%
	%	\setboolean{ABNTEXsumario-abnt-6027-2012}{false}
	%	\setboolean{ABNTEXsumario-tradicional}{false}
	\setboolean{ABNTEXsumario-UFSC}{true}}

%
% Repassa todos os parametros a classe abntex2, 
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{abntex2}%
}

\ProcessOptions\relax
\LoadClass{abntex2}

% sumario=abnt-6027-2012 : Sumário conforme recomendação da ABNT NBR 6027:2012, que
%    soh pode ser usado com memoir v3.6k ou superior
%   \settocpreprocessor \changes{v3.6k}{2012/09/18}{Added}
\ifdefined\settocpreprocessor
\else
\setboolean{ABNTEXsumario-tradicional}{true}
\setboolean{ABNTEXsumario-abnt-6027-2012}{false}
\setboolean{ABNTEXsumario-UFSC}{false}
\fi


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

\RequirePackage{lmodern}			% Usa a fonte Latin Modern			
\RequirePackage[T1]{fontenc}		% Selecao de codigos de fonte.
\RequirePackage[utf8]{inputenc}		% Codificacao do documento (conversão automática dos acentos)
\RequirePackage{color}				% Controle das cores
\RequirePackage{graphicx}			% Inclusão de gráficos
\RequirePackage{microtype} 			% para melhorias de justificação

\RequirePackage{pdfpages}
\RequirePackage{fancyvrb}
\RequirePackage{rotating}
\RequirePackage{amsmath}		
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{pdflscape}
\RequirePackage{epstopdf}
\RequirePackage{multirow}
\RequirePackage{listings}
\RequirePackage{url} % Para incluir links
\RequirePackage{nomencl} % Pacote necessário para a lista de siglas.
\RequirePackage{mathcomp}
\RequirePackage{booktabs} % Para Tabelas
\RequirePackage{subfig}  % permite ter subfiguras
\RequirePackage{float}
\RequirePackage{siunitx} % A comprehensive (SI) units package
\RequirePackage{datetime}
\RequirePackage{rotating} % gives you the possibility to rotate any object of an arbitrary angle. 
\RequirePackage{pdflscape} % Rotação de páginas no documento pdf.
\RequirePackage{mdframed} % Customize the look of the frame

% ---
% Pacotes adicionais, usados apenas no âmbito do Modelo Canônico do abnteX2
% ---
\RequirePackage{lipsum}				% para geração de dummy text
% ---

\RequirePackage{tablefootnote}
\RequirePackage{longtable}
\RequirePackage{tocloft}

% --- 
% CONFIGURAÇÕES DE PACOTES
% --- 
\sisetup{detect-all}
\sisetup{scientific-notation = fixed, fixed-exponent = 0, round-mode = places,round-precision = 2,output-decimal-marker = {,} }
\DeclareSIUnit \VA {VA} %apparent power

% Definição de cores
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

\definecolor{figcolor}{rgb}{0,0,0}  % black
\definecolor{tabcolor}{rgb}{0,0,0}  % black
\definecolor{eqncolor}{rgb}{0,0,0}  % black
\definecolor{seccolor}{rgb}{0,0,0}  % black
\definecolor{abscolor}{rgb}{0,0,0}  % black
\definecolor{linkcolor}{rgb}{0,0,0}  % black
\definecolor{citecolor}{rgb}{0,0,0}  % black
\definecolor{titlecolor}{rgb}{0,0,0}  % black
\definecolor{biocolor}{rgb}{0,0,0}  % black

	

\lstset{ %
	aboveskip=3mm,
	belowskip=3mm,
	backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}
	basicstyle={\small\ttfamily},    % the size of the fonts that are used for the code
	breakatwhitespace=true,          % sets if automatic breaks should only happen at whitespace
	breaklines=true,                 % sets automatic line breaking
	captionpos=t,                    % sets the caption-position to bottom
	commentstyle=\color{mygreen},    % comment style
	columns=flexible,
	deletekeywords={...},            % if you want to delete keywords from the given language
	escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
	extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
	frame=tb,                        % adds a frame around the code
	keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
	keywordstyle=\color{blue},       % keyword style
	language=Matlab,                 % the language of the code
	morekeywords={*,...},            % if you want to add more keywords to the set
	numbers=none,                    % where to put the line-numbers; possible values are (none, left, right)
	numbersep=5pt,                   % how far the line-numbers are from the code
	numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
	rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
	showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
	showstringspaces=false,          % underline spaces within strings only
	showtabs=false,                  % show tabs within strings adding particular underscores
	stepnumber=2,                    % the step between two line-numbers. If it's 1, each line will be numbered
	stringstyle=\color{mymauve},     % string literal style
	tabsize=3,                       % sets default tabsize to 3 spaces
	texcl=true,						 % Permite o uso de acentuação no código
	title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}

%By default, listings does not support multi-byte encoding for source code. The extendedchar option only works for 8-bits encodings such as latin1.
%
%To handle UTF-8, you should tell listings how to interpret the special characters by defining them like so
\lstset{literate=	
	{á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
	{Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
	{à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
	{À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
	{ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
	{Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
	{â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
	{Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1	 
	{œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
	{ű}{{\H{u}}}1 {Ű}{{\H{U}}}1 {ő}{{\H{o}}}1 {Ő}{{\H{O}}}1
	{ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
	{€}{{\EUR}}1 {£}{{\pounds}}1 {ã}{{\~a}}1 {õ}{{\~o}}1 {Ã}{{\~A}}1 {Õ}{{\~O}}1	
}

% --- 
% 
% --- 


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
\newtheorem{exercicio}{Exerc\'icio}[section]
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
\renewcommand{\normalsize}{\fontsize{10.5pt}{11pt}}


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


% Comando que simula a finalizacao de uma parte no bookmark e
% adiciona espaco de \part no sumario
\renewcommand{\phantompart}{%
	\bookmarksetup{startatroot}%
	\phantomsection%
	\ifthenelse{\boolean{ABNTEXsumario-UFSC}}{%
		\addtocontents{toc}{\vspace{\cftbeforechapterskip}}}{%
		\addtocontents{toc}{\vspace{\cftbeforepartskip}}}%
}
% -----
	

\renewcommand{\chapnumfont}{\chaptitlefont}
\renewcommand{\parttitlefont}{\ABNTEXpartfont\ABNTEXpartfontsize}
\renewcommand{\partnumfont}{\ABNTEXpartfont\ABNTEXpartfontsize}
\renewcommand{\partnamefont}{\ABNTEXpartfont\ABNTEXpartfontsize}


\DeclareCaptionFont{small}{\fontsize{9.5pt}{10.5pt}}

% No caso de Sumario (TOC) UFSC
%
\ifthenelse{\boolean{ABNTEXsumario-UFSC}}{%		
		
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
		
	%
	% Ajusta entrada Referencias
	%
	\renewcommand{\bibsection}{%
		\chapter*{\bibname}
		\bibmark
		\ifnobibintoc\else
		\phantomsection
		\addcontentsline{toc}{chapter}{\uppercase{\bibname}}
		\fi
		\prebibhook
	}  
}{}

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
	(encoding: \f@encoding{},
	family: \f@family{},
	series: \f@series{},
	shape: \f@shape{},
	size: \f@size{},
	baseline: \f@baselineskip{})
	%tfsize: \tf@size{},
	%sfsize: \sf@size{},
	%sssize: \ssf@size{}
}

% Comandos auxiliares
\newcommand{\justshowfont}{%
	(\f@encoding{},
	\f@family{},
	\f@series{},
	\f@shape{},
	\f@size{},
	\f@baselineskip{})
	%tfsize: \tf@size{},
	%sfsize: \sf@size{},
	%sssize: \ssf@size{}
}


% ---
% Numeracao continua das figuras

%Numeração dos floats por capítulo
\counterwithin{figure}{chapter} 
\counterwithin{table}{chapter}


% Macros for Cross-reference
\newcommand{\figref}[1]{Figura~\ref{#1}}   % Cross-reference of figures
\newcommand{\tabref}[1]{Tabela~\ref{#1}}    % Cross-reference of tables
\newcommand{\eqnref}[1]{\eqref{#1}}      % Cross-reference of equations
\newcommand{\secref}[1]{Seção~\ref{#1}}  % Cross-reference of equations
\newcommand{\defref}[1]{Definição~\ref{#1}} % 

	
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Estilo de capítulos
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% % Custom settings
\makeatletter
\newcommand\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}

\makechapterstyle{VZ14}{
	%	\thispagestyle{empty}
\setlength\beforechapskip{50pt}
\setlength\midchapskip{20pt}
\setlength\afterchapskip{20pt}
	\renewcommand\chapternamenum{}
	\renewcommand\printchaptername{}
	\renewcommand\chapnamefont{\Huge\scshape}
	\renewcommand\printchapternum{%
		\chapnamefont\null\thickhrulefill\quad
		\@chapapp\space\thechapter\quad\thickhrulefill}
	\renewcommand\printchapternonum{%
		\par\thickhrulefill\par\vskip\midchapskip
		\hrule\vskip\midchapskip
	}
	\renewcommand\chaptitlefont{\huge\scshape\centering}
	\renewcommand\afterchapternum{%
		\par\nobreak\vskip\midchapskip\hrule\vskip\midchapskip}
	\renewcommand\afterchaptertitle{%
		\par\vskip\midchapskip\hrule\nobreak\vskip\afterchapskip}
}
	
\makeatother

% Veja outros estilos em:
% http://repositorios.cpai.unb.br/ctan/info/latex-samples/MemoirChapStyles/MemoirChapStyles.pdf



\renewenvironment{resumo}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
 %  \renewcommand{\abstractnamefont}{\chaptitlefont}
 %  \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
  \pretextualchapter{#1}
  }{\PRIVATEclearpageifneeded}

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Configura layout
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% -----
% Declaracoes de cabecalhos 
% -----
% Cabecalho padrao
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}

% Cabecalho do inicio do capitulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}
% ---

% ------------------------------------------------------------------------
%% criar um novo estilo incluindo logos da UFSC e do INEP
% ------------------------------------------------------------------------
\makepagestyle{abntheadingsLogo} %  
\makeevenhead{abntheadingsLogo}{\ABNTEXfontereduzida\thepage}{\ABNTEXfontereduzida\textit\leftmark}{\includegraphics[width=20pt]{Logo/inep.pdf}}
\makeoddhead{abntheadingsLogo}{\includegraphics[width=15pt]{Logo/ufsc.pdf}}{\ABNTEXfontereduzida\textit\rightmark}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadingsLogo}{\textwidth}{\normalrulethickness}

\makeevenfoot{abntheadingsLogo}{}{}{\ABNTEXfontereduzida\textsc \imprimirautor}
\makeoddfoot{abntheadingsLogo}{\ABNTEXfontereduzida\textsc \imprimirautor}{}{}


% ---
% Configura layout para elementos textuais
\renewcommand{\textual}{%
	\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
		\pagestyle{plain}%
		}{%else  
		\pagestyle{abntheadings}% Estilo original do Abntex2
		% \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
		\aliaspagestyle{chapter}{empty} % Remove a numeração das páginas no início dos capítulos.
	}  
	\nouppercaseheads%
	\bookmarksetup{startatroot}% 
}

% ---
% Configura layout para elementos textuais
\newcommand{\textualINEPUFSC}{%
	\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
		\pagestyle{plain}%
		}{%else  
		%   \pagestyle{abntheadings}% Estilo original do Abntex2
		\pagestyle{abntheadingsLogo}%
		% \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
		\aliaspagestyle{chapter}{empty} % Remove a numeração das páginas no início dos capítulos.
	}  
	\nouppercaseheads%
	\bookmarksetup{startatroot}% 
}


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao APENDICES e ANEXOS
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ---
% Imprime uma pagina de divisao no estilo parte
\renewcommand{\partpage}{%
  \cleardoublepage
 %\phantomsection
 % \addcontentsline{toc}{part}{\appendixtocname}%
  \appendixpage*
}


% -- 
% Solution from http://tex.stackexchange.com/questions/25105/unable-to-link-to-inserted-pages-with-pdfpages

\newcounter{includepdfpage}
\newcounter{currentpagecounter}
\newcommand{\addlabelstoallincludedpages}[1]{
	\refstepcounter{includepdfpage}
	\stepcounter{currentpagecounter}
	\label{#1.\thecurrentpagecounter}}
\newcommand{\modifiedincludepdf}[4]{
	\setcounter{currentpagecounter}{0}
	\includepdf[pages=#1,pagecommand=\addlabelstoallincludedpages{#2},scale=#4]{#3}}
	
		
% ---
% Impressão da Capa
 \newcommand{\imprimircapaUFSC}{%
	 \begin{EnvCapaUFSC}%    
	\vspace*{5cm}		
		 \parbox{307pt}{\center\ArialTreze \MakeUppercase{\imprimirtitulo}}	
	 \vfill	
	 \vspace*{3cm}				
		\ArialCatorze\imprimirautor			
	 \vfill
	 \vspace*{5.8cm} % Precisa ser ajustado dependendo do tamanho do titulo
	 \end{EnvCapaUFSC}
 }
% ---
		
		
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


\renewcommand{\lstlistingname}{Código--fonte }% Listing -> Codigo fonte
\renewcommand{\lstlistlistingname}{Lista de códigos--fonte}% List of Listings -> Lista de códigos-fonte

% http://tex.stackexchange.com/questions/228936/setting-entries-of-list-of-listings-in-latex-package-listings
\newlength\mylen

\begingroup
\makeatletter
\let\newcounter\@gobble\let\setcounter\@gobbletwo
\globaldefs\@ne \let\c@loldepth\@ne
\newlistof{listings}{lol}{\lstlistlistingname}
\newlistof{lstlistoflistings}{lol}{\lstlistlistingname}
\newlistentry{lstlisting}{lol}{0}
\makeatother
\endgroup

\renewcommand\cftlstlistingpresnum{\lstlistingname~}
\settowidth\mylen{\cftlstlistingpresnum\cftlstlistingaftersnum}
\addtolength\cftlstlistingnumwidth{\mylen} %
\renewcommand\cftlstlistingaftersnum{\hfill\textendash\hfill}



