%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal de Santa Catarina             
% Biblioteca Universitária                     
%---------------------------------------------------------------------------
% Definicao do arquivo de classe UFSCThesis - Modelo de Tese para a BU-UFSC
%---------------------------------------------------------------------------
% Versão 20100631 - Baseada na classe ABNTex versão 0.8-2
%                                                           
% (c)2010 Roberto Simoni (roberto.emc@gmail.com)
%         Carlos R Rocha (cticarlo@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
% This file may be distributed and/or modified              
%
% 1. under the LaTeX Project Public License and/or          
% 2. under the GNU Public License.                          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\NeedsTeXFormat{LaTeX2e}   % Identifica a versão de LaTeX em uso
\ProvidesClass{ufscThesis} % Informa o tipo de documentclasse que ele é

%---------------------------------------------------------------------------
% Passa as opções não interessantes para a classe base ABNTex
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abnt}}
\ProcessOptions

%---------------------------------------------------------------------------
% Carrega classe ABNTex, com padrão de página A5, fonte 10pt, frente e verso
\LoadClass[cleardoublepage=plain,a5paper,10pt,twoside,capchap,capsec,openright,abntfigtabnum,espacosimples]{abnt}

%---------------------------------------------------------------------------
% Definicao da geometria da página
\RequirePackage[a5paper,inner=2.5cm,outer=1.5cm,top=2.0cm,bottom=1.5cm,head=0.7cm,foot=0.7cm]{geometry}
% Se o cabecalho e o rodape estao dentro das margens, acrescentar as opcoes includehead e includefoot

%---------------------------------------------------------------------------
% Definicao de espacamento simples
\RequirePackage{setspace}

%---------------------------------------------------------------------------
% Pacote de definicoes da tese padrao UFSC
\RequirePackage{ufscThesis/BUUFSCthesis}

%---------------------------------------------------------------------------
% Definicoes de fontes usadas no documento
%\RequirePackage{amsmath, amssymb, amsfonts, amsthm}
%\RequirePackage{fix-cm}
%\renewcommand{\normalsize}{\fontsize{10.5pt}{12.5pt}\selectfont}
%---------------------------------------------------------------------------
\newlength{\espacosumario}
\setlength{\espacosumario}{3.3em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Substituicao e criacao de comandos relacionados ao ABNTex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------------------------------------------------------------------------
% Executa o comando #2 se o argumento #1 não estiver vazio, senão executa #3
\newcommand{\UFSCifnotempty}[3]{\ifthenelse{\not\equal{#1}{}}{#2}{#3}}

%---------------------------------------------------------------------------
% Formatação de capitulos
\renewcommand{\ABNTchaptersize}{\normalsize} % Fonte de capítulo

\ifthenelse{\boolean{ABNTcapchap}}
  {\renewcommand{\ABNTchapterfont}{\bfseries}}
  {\renewcommand{\ABNTchapterfont}{\bfseries}}
\renewcommand{\ABNTtocchapterfont}{\ABNTchapterfont}

\providecommand{\nometoc}{}

% \@chapter : 
\def\@chapter[#1]#2%
      {\ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\theHchapter}{\chaptertype\thechapter}}{}
       \ifnum \c@secnumdepth >\m@ne
         \refstepcounter{chapter}%
         \ABNTchaptermark{#1}% This command MUST came before addcontentsline
         \typeout{\@chapapp\space\thechapter.}%
         % gambiarra usada para definir maiusculas para capitulos comuns e normal para anexos e apêndices
         \ifthenelse{\boolean{ABNTcapchap}}
               {\renewcommand{\nometoc}{\MakeUppercase{#1}}}
               {\renewcommand{\nometoc}{#1}}
         \ifthenelse{\boolean{ABNTaftertoc}}
           {\ABNTaddcontentsline{toc}{chapter}%
                   {\protect\numberline{\thechapter}\nometoc}}
           {}
       \else
         \ABNTchaptermark{#1}% This command MUST came before addcontentsline
         \ifthenelse{\boolean{ABNTaftertoc}}%
           {\ABNTaddcontentsline{toc}{chapter}{\nometoc}}%
           {}%
       \fi       
       \if@twocolumn
         \@topnewpage[\@makechapterhead{#2}]%
       \else
         \@makechapterhead{#2}%
         \@afterheading
       \fi\par}


% Formato de cabecalho de capitulo
\def\@makechapterhead#1{%
  {%
%  \noindent\rule{\textwidth}{1.7pt}\\\par
  \normalfont\ABNTchaptersize\ABNTchapterfont%
  \espaco{simples}%
  \vspace*{0pt}%
  \noindent%
  \parbox[b]{\textwidth}{%
    \parbox[t]{1em}{\thechapter}%
    \parbox[t]{\textwidth-4ex-1ex}%
      {\interlinepenalty\@M\raggedright%
        \ifthenelse{\boolean{ABNTcapchap}}%
          {\MakeUppercase{#1}}%
          {#1}
      }%
    \vspace*{0cm}
    }\\[2pt]%
  \vspace{0pt}%
  }%
}

% Defining how is typeset the \chapter*
\def\@makeschapterhead#1{%
  \vspace*{0pt}\par
  {\centering\normalfont\ABNTchaptersize\ABNTchapterfont%
   \ifthenelse{\boolean{ABNTcapchap}}%
     {\MakeUppercase{#1}}%
     {#1}
    \par}%
  \vspace{21pt}%
  \par%
}

\renewcommand{\@makecaption}[2]{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 -- #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1 -- #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


%---------------------------------------------------------------------------
% Formatação de seções
% Font which section titles will be printed
\renewcommand{\ABNTsectionfont}{}

\def\ABNTstartsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\ABNTssect{#1}{#4}{#5}{#6}}% #3 replaced by #1 here
    {\@dblarg{\ABNTsect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\renewcommand{\@seccntformat}[1]{%
  \csname the#1\endcsname\hspace{0.25ex}
}

\def\ABNTsect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax \@svsec}%
          \interlinepenalty \@M 
          \ifthenelse{\boolean{ABNTcapsec}\and\equal{#2}{1}}
             {\MakeUppercase{#8}}{#8}\@@par}%
    \endgroup
    \@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#7}}
    \ABNTaddcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec \ifthenelse{\boolean{ABNTcapsec}}
             {\MakeUppercase{#8}}{#8}}%
      \@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#7}}
      \ABNTaddcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

%---------------------------------------------------------------------------
% Número de níveis de subseções
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{4}

%---------------------------------------------------------------------------
% Formatação das seções e seus componentes
\renewcommand\section{\ABNTstartsection{section}{1}{\z@}%
                           {-4ex}%
                           {4ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsectionfont\normalsize}}
\renewcommand\subsection{\ABNTstartsection{subsection}{2}{\z@}%
                           {-4ex}%
                           {4ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsectionfont\normalsize\bfseries}}
\renewcommand\subsubsection{\ABNTstartsection{subsubsection}{3}{\z@}%
                           {-4ex}%
                           {4ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsectionfont\normalsize}}

\renewcommand\paragraph{\ABNTstartsection{paragraph}{4}{\z@}%
                           {-4ex}%
                           {4ex}%
                           {\espaco{simples}\normalfont%
                            \ABNTsectionfont\normalsize\itshape}}

%---------------------------------------------------------------------------
% Formatação do sumário
\renewcommand\@dotsep{2}

\def\@dottedchaptocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{\bfseries.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor {#5}}%
     \par}%
  \fi}

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor {#5}}%
     \par}%
  \fi}

\renewcommand*\l@chapter[2]{
    \@dottedchaptocline{1}{0pt}{\espacosumario}%{1.2em}
	{\normalsize\ABNTtocchapterfont{#1}}
	{#2}}
	

\renewcommand*\l@section[2]{
    \@dottedtocline{1}{0pt}{\espacosumario}%{2em}
	{\normalsize\ABNTsectionfont
	 \ifthenelse{\boolean{ABNTcapchap}}%
	    {\MakeUppercase{#1}}%
	    {#1}}
	{#2}}

\renewcommand*\l@subsection[2]{
    \@dottedtocline{1}{0pt}{\espacosumario}%{2.8em}
	{\normalsize\ABNTsectionfont\bfseries{#1}}
	{#2}}

\renewcommand*\l@subsubsection[2]{
    \@dottedtocline{1}{0pt}{\espacosumario}
	{\normalsize\ABNTsectionfont{#1}}
	{#2}}

\renewcommand*\l@paragraph[2]{
    \@dottedtocline{1}{0pt}{\espacosumario}
	{\normalsize\ABNTsectionfont\itshape{#1}}
	{#2}}

\renewcommand*\l@subparagraph[2]{
    \@dottedtocline{1}{0pt}{\espacosumario}
	{\normalsize\ABNTsectionfont\itshape{#1}}
	{#2}}

%---------------------------------------------------------------------------
% Lista de figuras, tabelas, símbolos, siglas
\newcommand{\filltocentry}[1]{%
 {\hspace{0em}\normalfont\dotfill}\nobreak
 \hb@xt@\@pnumwidth{\hfil\normalfont #1}{}\par}

\renewcommand*{\l@figure}[2]{
       \vskip -1em
       \leftskip -1.5em
       \rightskip 1.6em
       \parfillskip -\rightskip
       \parindent 0em
       \@tempdima 1.5em
       \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
       {\figurename~\normalfont #1}\nobreak \filltocentry{#2}}

\renewcommand*{\l@table}[2]{
       \vskip -1em
       \leftskip -1.5em
       \rightskip 1.6em
       \parfillskip -\rightskip
       \parindent 0em
       \@tempdima 1.5em
       \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
       {\tablename~\normalfont #1}\nobreak \filltocentry{#2}}

\newcommand{\listadesimbolos}{
    \pretextualchapter{Lista de S\'imbolos}\@starttoc{lsb}}
\newcommand{\simbolo}[2]{\addcontentsline{lsb}{simb}{\numberline{#1}{#2}}}
\newcommand{\l@simb}[2]{
       \vskip -1em
       \leftskip -1.5em
       \rightskip 1.6em
       \parfillskip -\rightskip
       \parindent 0em
       \@tempdima 3em
       \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
       {\normalfont #1}\nobreak \filltocentry{#2}}


\newcommand{\listadeabreviaturas}{
    \pretextualchapter{Lista de Abreviaturas e Siglas}\@starttoc{las}}
\newcommand{\abreviatura}[2]{\addcontentsline{las}{sig}{\numberline{#1}{#2}}}
\newcommand{\sigla}{\abreviatura}
\newcommand{\l@sig}[2]{
       \vskip -1em
       \leftskip -1.5em
       \rightskip 1.6em
       \parfillskip -\rightskip
       \parindent 0em
       \@tempdima 4.5em
       \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
       {\normalfont #1}\nobreak \filltocentry{#2}}

%---------------------------------------------------------------------------
% Apêndices e Anexos - Pós-Textuais
\addto\captionsbrazil{
\renewcommand{\bibname}{REFERÊNCIAS}
}
\addto\captionsbrazil{
\renewcommand\refname{REFERÊNCIAS}
}

\renewenvironment{thebibliography}[1]%
  {% replacing \chapter*{\ABNTbibliographyname\@mkboth...}
   \raggedright
   \if@openright\cleardoublepage\else\clearpage\fi%
   \thispagestyle{\chaptertitlepagestyle}%
   \global\@topnum\z@%
   \@afterindentfalse%
   \@mkboth{\ABNTbibliographyname}{\ABNTbibliographyname}% end \chapter*{\ABNTbibliographyname...}
   \ifthenelse{\boolean{ABNTincludeintoc}}%
      {\ABNTaddcontentsline{toc}{chapter}{\hspace{\espacosumario}\ABNTbibliographyname}}%
      {}%
    \if@twocolumn%
      \@topnewpage[\@makeschapterhead{\ABNTbibliographyname}]%
    \else%
      \@makeschapterhead{\ABNTbibliographyname}%
      \@afterheading%
    \fi%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth%
         \advance\leftmargin\labelsep%
         \@openbib@code%
         \usecounter{enumiv}%
         \let\p@enumiv\@empty%
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy%
   \espaco{simples}
   \clubpenalty4000%
   \@clubpenalty \clubpenalty%
   \widowpenalty4000%
   \sfcode`\.\@m%
  }% end of \begin{thebibliography}
  {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist%
  }% end of \end{thebibliography}


\renewcommand{\annexname}{ANEXO}
\renewcommand{\appendixname}{AP\^ENDICE} % for completeness ;-)
\renewcommand{\ABNTanapsize}{\normalsize}

\renewcommand{\apendice}{\appendix}
\renewcommand{\anexo}{\annex}

\def\@anapchapter[#1]#2%
      {
       \refstepcounter{chapter}%
       \ifthenelse{\boolean{ABNTAnApName}}
        {
         \begingroup
         \ifthenelse{\equal{#1}{}}
            {\def\thechapter{\anapchaptername{} \Alph{chapter}}}
            {\def\thechapter{\anapchaptername{} \Alph{chapter}{}
                                \ABNTtravessao{} #1}} 
         \ABNTchaptermark{}
         \endgroup
         \if@twocolumn
           \@topnewpage[\@makeanapchapterhead{#2}]%
         \else
           \@makeanapchapterhead{#2}%
           \@afterheading
         \fi
        }
        {
         \ABNTchaptermark{#1}
         \if@twocolumn
            \@topnewpage[\@makechapterhead{#2}]%
         \else
            \@makechapterhead{#2}%
            \@afterheading
         \fi
        }
       \ifnum \c@secnumdepth >\m@ne
         \typeout{\@chapapp\space\thechapter.}%
         \ifthenelse{\boolean{ABNTAnApName}}{
           \ifthenelse{\equal{#1}{}}
              {\ABNTaddcontentsline{toc}{chapter}%
                  {\hspace{\espacosumario}\MakeUppercase{\anapchaptername{}} \thechapter}}
              {\ABNTaddcontentsline{toc}{chapter}%
                  {\hspace{\espacosumario}\MakeUppercase{\anapchaptername{}} \thechapter{} \ABNTtravessao{} #1}}
         }
         {
          \ABNTaddcontentsline{toc}{chapter}%
                   {\hspace{\espacosumario}\protect\numberline{\thechapter}#1}
         }  
       \else
         \ABNTaddcontentsline{toc}{chapter}{\hspace{\espacosumario}#1}
       \fi
       \par
      }


\def\@makeanapchapterhead#1{%
  \thispagestyle{empty} 	% Define o estilo desta página como vazio   
  \normalfont\ABNTchapterfont
  \espaco{simples}
  \mbox{}
  \vfill
  \begin{center}
   \MakeUppercase{\anapchaptername}
   \thechapter{} \ABNTtravessao{} \ABNTaposindicativoanap {#1}
  \end{center}
  \vfill
  \vfill
  \newpage
  \thispagestyle{empty} 	% Define o estilo desta página como vazio   
  \if@openright\cleardoublepage\else\clearpage\fi%
    \if@twocolumn
	\@restonecoltrue\onecolumn
    \else
	\@restonecolfalse\newpage
    \fi
  \normalfont
}

\def\ABNTstartsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\ABNTssect{#1}{#4}{#5}{#6}}% #3 replaced by #1 here
    {\@dblarg{\ABNTsect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\renewcommand{\@seccntformat}[1]{%
  \csname the#1\endcsname\hspace{0.25ex}
}

\def\anapsect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax \@svsec}%
          \interlinepenalty \@M 
          \ifthenelse{\boolean{ABNTcapsec}\and\equal{#2}{1}}
             {\MakeUppercase{#8}}{#8}\@@par}%
    \endgroup
    \@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#7}}
%     \ABNTaddcontentsline{toc}{#1}{%
%       \ifnum #2>\c@secnumdepth \else
%         \protect\numberline{\csname the#1\endcsname}%
%       \fi
%       #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec \ifthenelse{\boolean{ABNTcapsec}}
             {\MakeUppercase{#8}}{#8}}%
      \@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#7}}
%       \ABNTaddcontentsline{toc}{#1}{%
%         \ifnum #2>\c@secnumdepth \else
%           \protect\numberline{\csname the#1\endcsname}%
%         \fi
%         #7}
	}%
  \fi
  \@xsect{#5}}

\renewcommand{\appendix}{
  \setcounter{chapter}{0}
  \resetsubcounters{chapter}
  \gdef\thechapter{\Alph{chapter}}
  \ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\chaptertype}{appen.}}{}
  \gdef\@chapapp{Apendice}
  \renewcommand{\anapchaptername}{\appendixname}
  \global\let\@chapter\@anapchapter
  \global\let\ABNTsect\anapsect}

\let\apendice\appendix

\renewcommand{\annex}{
  \setcounter{chapter}{0}
  \resetsubcounters{chapter}
  \gdef\thechapter{\Alph{chapter}}
  \ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\chaptertype}{annex.}}{}
  \gdef\@chapapp{Anexo}
  \renewcommand{\anapchaptername}{\annexname}
  \global\let\@chapter\@anapchapter
  \global\let\ABNTsect\anapsect}

\let\anexo\annex


%---------------------------------------------------------------------------
% Formatação do parágrafo
\setlength{\parindent}{1cm} % Define indentação de 1cm para o parágrafo
\setlength{\parskip}{0cm}   % Sem espaço entre parágrafos

%---------------------------------------------------------------------------
% Redefinição do estilo ruledheader

\renewcommand{\ps@ruledheader}{%
  \renewcommand{\@oddfoot}{}%
  \renewcommand{\@evenfoot}{}%
  \renewcommand{\@oddhead}%
     {\underline{\makebox[\textwidth]{\raisebox{-.5ex}{}%
       {\rightmarkformat\rightmark}\hfill{\thepageformat\thepage}}}}%
  \renewcommand{\@evenhead}%
     {\underline{\makebox[\textwidth]{\raisebox{-.5ex}{}%
       {\thepageformat\thepage}\hfill{\leftmarkformat\leftmark}}}}%
% Para \chapter* mostrar o cabecalho
  \let\@mkboth\ABNTmarkboth%
% Definindo a maneira como o comando o \chapter marca o cabecalho
  \renewcommand{\chaptermark}[1]{%
    \markboth%
	{##1}{##1}
%        {\ifnum \c@secnumdepth >\m@ne%
%             \thechapter\ \ %
%         \fi%
%         ##1}%
%        {\ifnum \c@secnumdepth >\m@ne%
%             \thechapter\ \ %
%         \fi%
%         ##1}%
  }%
  \renewcommand{\sectionmark}[1]{%
    \markright
	{##1}
%       {%
%       \ifnum \c@secnumdepth >\z@%
%         \thesection\ \ %
%       \fi%
%       ##1}%
  }%   
}% 

%---------------------------------------------------------------------------
% Estilo do texto da folha de rosto
\newenvironment{textodafolhaderosto}%
  {\begin{espacosimples}%
   \small
   \begin{list}{}{%
       \setlength{\listparindent}{0cm}%
       \setlength{\itemindent}{\listparindent}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\leftmargin}{5.5cm}%
       \setlength{\parsep}{0pt}}%
    \item\relax}%
  {\end{list}\end{espacosimples}}

%---------------------------------------------------------------------------
% Estilo da dedicatoria e da epigrafe
\newenvironment{textorecuadopretextual}%
  {\begin{espacosimples}%
   \small
   \begin{list}{}{%
       \setlength{\listparindent}{0cm}%
       \setlength{\itemindent}{\listparindent}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\leftmargin}{5cm}%
       \setlength{\parsep}{0pt}}%
    \item\relax}%
  {\end{list}
   \end{espacosimples}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Substituicao e criacao de elementos de documento do ABNTex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\let\ps@empty\ps@plain

%-------------------------------------------------------------------------------
% Redefinicao da capa do ABNTex
\renewcommand{\capa}
{
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\setcounter{page}\z@	% Reseta o contador de páginas. Parece não ser necessário aqui
\begin{center}
    \begin{espacosimples}
	\ABNTifnotempty{\ABNTinstituicaodata}%
	    {\instituicaoformat{\ABNTinstituicaodata}}\\
	\ABNTifnotempty{\UFSCdepartamentodata}%
	    {\departamentoformat{\UFSCdepartamentodata}}
    \end{espacosimples}
\end{center}
 \vspace{0.1cm}
\begin{center}
    \ABNTifnotempty{\ABNTautordata}%
	{%
	\autorformat\ABNTautordata
	}
\end{center}
\vfill\vfill
\begin{center}
    \begin{espacosimples}
	\ABNTifnotempty{\ABNTtitulodata}%
	    {%
	    \UFSCifnotempty{\subtitulodata}%
		{%
		\tituloformat{\ABNTtitulodata}:~\par
		\tituloformat{\subtitulodata}\par
		}%
		{%
		\tituloformat{\ABNTtitulodata}\par
		}%
	    }%
    \end{espacosimples}
\end{center}
\vfill\vfill\vfill
\begin{center}
    \begin{espacosimples}
    \setlength{\parskip}{.3cm}
    \ABNTifnotempty{\ABNTlocaldata}
	{{\localformat\ABNTlocaldata}\par}
    \ABNTifnotempty{\anodata}
	{\dataformat{\anodata}}
    \end{espacosimples}
\end{center}
\vspace{1cm}
\if@restonecol\twocolumn \else \newpage \fi
\setcounter{page}\z@	% Reseta o contador de páginas. Parece não ser necessário aqui
}% end of \capa

%-------------------------------------------------------------------------------
% Redefinicao da folha de rosto do ABNTex
\renewcommand{\folhaderosto}[1][semficha]%
{%
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\begin{center}
    \ABNTifnotempty{\ABNTautordata}%
	{%
	\autorformat\ABNTautordata
	}
\end{center}
\vspace{1.5cm}
\begin{center}
    \begin{espacosimples}
    \ABNTifnotempty{\ABNTtitulodata}%
	{%
	\UFSCifnotempty{\subtitulodata}%
	    {%
	    \tituloformat{\ABNTtitulodata}:\\ \tituloformat{\subtitulodata}\par
	    }%
	    {%
	    \tituloformat{\ABNTtitulodata}\par
	    }%
	}%
    \end{espacosimples}
\end{center}
\vfill
\begin{textodafolhaderosto}
    {\comentarioformat\UFSCcomentariodata}\par
    \ABNTifnotempty{\ABNTorientadordata}%
	{%
	{\ABNTorientadordata}:\ {\ABNTorientadorname}\protect\\
	}
    \ABNTifnotempty{\ABNTcoorientadordata}
	{%
	{\ABNTcoorientadordata}:\ {\ABNTcoorientadorname}
	}
\end{textodafolhaderosto}
\vfill\vfill
\begin{center}
    \begin{espacosimples}
    \setlength{\parskip}{.3cm}
    \ABNTifnotempty{\ABNTlocaldata}
	{{\localformat\ABNTlocaldata}\par}
    \ABNTifnotempty{\anodata}
	{\dataformat{\anodata}}
    \end{espacosimples}
\end{center}
\vspace{1cm}
\ifthenelse{\equal{#1}{comficha}}
    {\newpage
     \mbox{}
     \vfill
     \conteudofichacatalografica
    }{}
}% end of \folhaderosto

%-------------------------------------------------------------------------------
% Definicao da folha de aprovacao
\newcommand{\folhaaprovacao}%
{%
\if@openright\cleardoublepage\else\clearpage\fi%
\if@twocolumn
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\thispagestyle{empty}%
%\setcounter{page}\z@
 \ABNTifnotempty{\ABNTautordata}%
    {%
    \begin{center}
    \autorformat\ABNTautordata
    \end{center}
    }
\vfill %\vspace{42pt}
\begin{center}
    \begin{espacosimples}
    \ABNTifnotempty{\ABNTtitulodata}%
	{%
	\UFSCifnotempty{\subtitulodata}%
	    {%
	    \tituloformat{\ABNTtitulodata}:~\tituloformat{\subtitulodata}\par
	    }%
	    {%
	    \tituloformat{\ABNTtitulodata}\par
	    }%
	}%
    \end{espacosimples}
\end{center}
\vfill
\begin{espacosimples}
    \textoAprovacaodata\par
\end{espacosimples}
\begin{center}
    \ABNTlocaldata, \diadata\ de \mesdata\ \anodata.\par
\end{center}
\begin{espacosimples}
    \vspace{0.5em}
    \begin{center}
    {\rule{\ABNTsignwidth}{1pt}\par
     \coordenadorname \\ \coordenadortitulo}
    \end{center}
\end{espacosimples}


 {\setlength{\parindent}{0cm} \bfseries Banca Examinadora:\par}  

\ABNTifnotempty{\ABNTorientadordata}
    {
    \ifthenelse{\equal{\orientadorbancadata}{nao}}
	{
	\begin{espacosimples}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{\ABNTsignwidth}{1pt}\par
	     \bancaformat \ABNTorientadorname \\ \ABNTorientadordata\par}
	    \end{center}
	\end{espacosimples}
	}{}
    }
      
    
\ABNTifnotempty{\ABNTcoorientadordata}
    {
    \ifthenelse{\equal{\coorientadorbancadata}{nao}}
	{
	\begin{espacosimples}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{\ABNTsignwidth}{1pt}\par
	     \bancaformat \ABNTcoorientadorname \\ \ABNTcoorientadordata\par}
	    \end{center}
	\end{espacosimples}
	}{}
    }





% \ABNTifnotempty{\ABNTorientadordata}
%     {
%     \ifthenelse{\equal{\orientadorbancadata}{sim}}
% 	{
% 	\begin{espacosimples}
% 	    \vspace{0.5em}
% 	    \begin{center}
% 	    {\rule{\ABNTsignwidth}{1pt}\par
% 	     \bancaformat \ABNTorientadorname \\ \ABNTorientadordata\par}
% 	    \end{center}
% 	\end{espacosimples}
% 	}{}
%     }
\ABNTifnotempty{\ABNTcoorientadordata}
    {
    \ifthenelse{\equal{\coorientadorbancadata}{sim}}
	{
	\begin{espacosimples}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{\ABNTsignwidth}{1pt}\par
	     \bancaformat \ABNTcoorientadorname \\ \ABNTcoorientadordata\par}
	    \end{center}
	\end{espacosimples}
	}{}
    }
    
\ifnum \nrobanca < 4
    {
 \ABNTifnotempty{\bancanameA}
    {
    \begin{espacosimples}
	\vspace{0.9em}
	\begin{center}
	{\rule{\ABNTsignwidth}{1pt}\par
	 \bancaformat \bancanameA \\ \bancadataA\par}
	\end{center}
    \end{espacosimples}
    }   
    
\ABNTifnotempty{\bancanameB}
    {
    \begin{espacosimples}
	\vspace{0.5em}
	\begin{center}
	{\rule{\ABNTsignwidth}{1pt}\par
	 \bancaformat \bancanameB \\ \bancadataB\par}
	\end{center}
    \end{espacosimples}
    }
    
 \ABNTifnotempty{\bancanameC}
    {
    \begin{espacosimples}
	\vspace{0.5em}
	\begin{center}
	{\rule{\ABNTsignwidth}{1pt}\par
	 \bancaformat \bancanameC \\ \bancadataC\par}
	\end{center}
    \end{espacosimples}
    }   
    }
\vfill
% Cria uma nova página de assinaturas
%\ifnum \nrobanca > 4
\else
    {
    \newpage
   
    \ABNTifnotempty{\bancanameA}
    {
    \begin{espacosimples}
	\vspace{0.9em}
	\begin{center}
	{\rule{\ABNTsignwidth}{1pt}\par
	 \bancaformat \bancanameA \\ \bancadataA\par}
	\end{center}
    \end{espacosimples}
    }   
    
    \ABNTifnotempty{\bancanameB}
    {
    \begin{espacosimples}
	\vspace{0.5em}
	\begin{center}
	{\rule{\ABNTsignwidth}{1pt}\par
	 \bancaformat \bancanameB \\ \bancadataB\par}
	\end{center}
    \end{espacosimples}
    }
    
    \ABNTifnotempty{\bancanameC}
	{
	\begin{espacosimples}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{\ABNTsignwidth}{1pt}\par
	    \bancaformat \bancanameC \\ \bancadataC\par}
	    \end{center}
	\end{espacosimples}
	}
    \ABNTifnotempty{\bancanameD}
	{
	\begin{espacosimples}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{\ABNTsignwidth}{1pt}\par
	    \bancaformat \bancanameD \\ \bancadataD\par}
	    \end{center}
	\end{espacosimples}
	}
    \ABNTifnotempty{\bancanameE}
	{
	\begin{espacosimples}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{\ABNTsignwidth}{1pt}\par
	    \bancaformat \bancanameE \\ \bancadataE\par}
	    \end{center}
	\end{espacosimples}
	}
    \ABNTifnotempty{\bancanameF}
	{
	\begin{espacosimples}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{\ABNTsignwidth}{1pt}\par
	    \bancaformat \bancanameF \\ \bancadataF\par}
	    \end{center}
	\end{espacosimples}
	}
    \ABNTifnotempty{\bancanameG}
	{
	\begin{espacosimples}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{\ABNTsignwidth}{1pt}\par
	    \bancaformat \bancanameG \\ \bancadataG\par}
	    \end{center}
	\end{espacosimples}
	}
    \vfill
    }
%\fi
%\if@restonecol\twocolumn \else \newpage \fi
}% end of \aprovacao

%-------------------------------------------------------------------------------
% Definicao da página de dedicatória
\newcommand{\paginadedicatoria}%
{%
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\mbox{}
\vfill
\ABNTifnotempty{\dedicatoriadata}%
    {%
    \begin{textorecuadopretextual}
	{\dedicatoriaformat\dedicatoriadata}\par
    \end{textorecuadopretextual}
    }
    \vspace{1cm}
%\vfill
\mbox{}
}% end of \dedicatoria

%-------------------------------------------------------------------------------
% Definicao da página de de agradecimentos
\newcommand{\paginaagradecimento}%
{%
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\ABNTifnotempty{\agradecimentodata}%
    {   
    \begin{center}
	\tituloformat{\agradecimentoname}
    \end{center}
    \vspace{.2cm}
    \begin{espacosimples}
	\agradecimentodata
    \end{espacosimples}
    }
}% end of \agradecimento

%-------------------------------------------------------------------------------
% Definicao da página da epígrafe
\newcommand{\paginaepigrafe}%
{%
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\mbox{}
\vfill\vfill
\ABNTifnotempty{\epigrafedata}%
    {%
    \begin{textorecuadopretextual}
	{\epigrafeformat\epigrafedata}\par
	{\epigrafeautorformat\epigrafeautordata}\par
    \end{textorecuadopretextual}
%     \ABNTifnotempty{\epigrafeautordata}%
% 	{%
% 	\begin{textorecuadopretextual}
% 	    {\epigrafeautorformat\epigrafeautordata}\par
% 	\end{textorecuadopretextual}
% 	}
    }
     \vspace{1cm}
   
%\vfill\vfill
\mbox{}
}% end of \epigrafe

%-------------------------------------------------------------------------------
% Redefinicao do ambiente resumo ,palavras-chave e keywords ABNTex
\renewcommand{\resumoname}{Resumo}
\renewenvironment{resumo}%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\chaptertype}{resumo.}}{}
   \pretextualchapter{\resumoname}%
   \ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\chaptertype}{}}{}
   \begin{espacosimples}\setlength{\parindent}{0cm}%
  }%
  {\end{espacosimples}
   \vspace{.2cm}

  
   \ABNTifnotempty{\palavrasChavedata}
	{\par\setlength{\parindent}{0cm}{\bfseries Palavras-chave:} \palavrasChavedata}
   \newpage}%resumo

%-------------------------------------------------------------------------------
% Definicao da página do resumo
\newcommand{\paginaresumo}
{
\ABNTifnotempty{\textoResumodata}
    {
    \begin{resumo}
    \textoResumodata
    \end{resumo}
     }
}

%-------------------------------------------------------------------------------
% Redefinicao dos ambientes abstract,resumo,palavras-chave e keywords ABNTex
\renewcommand{\ABNTabstractname}{Abstract}
\renewenvironment{abstract}%
  {%
   \if@openright\cleardoublepage\else\clearpage\fi%
   \ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\chaptertype}{abstract.}}{}
   \pretextualchapter{\ABNTabstractname}%
   \ifthenelse{\boolean{ABNThypertoc}}{\renewcommand{\chaptertype}{}}{}
   \begin{espacosimples}\setlength{\parindent}{0cm}%
  }%
  {\end{espacosimples}
 \vspace{.2cm}
  
   \ABNTifnotempty{\keywordsdata}
	{\par\setlength{\parindent}{0cm}{\bfseries Keywords:} \keywordsdata}
   \newpage}%abstract

%-------------------------------------------------------------------------------
% Definicao da página do abstract
\newcommand{\paginaabstract}
{
\ABNTifnotempty{\textAbstractdata}
     {
     \begin{abstract}
     \textAbstractdata
     \end{abstract}
     }
}

\endinput
