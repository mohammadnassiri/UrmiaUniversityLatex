\ProvidesClass{IEEEtran}[2018/05/17 V1 by Mohammad Nassiri]
\typeout{-- https://github.com/mohammadnassiri/}
\typeout{Adapted from Latex Template of Amirkabir University of Technology}
\NeedsTeXFormat{LaTeX2e}

\LoadClass [
a4paper, % type of the paper...
12pt, % set the size of the main font in the document...
openright % chapters start on odd pages
] {book} % for longer reports containing several chapters, small books, thesis

% some constant variables...
\input {TeX/constants}

% this is for prime in mathematic formulas...
\newcommand* {\everymodeprime} {
	\ensuremath {\prime}
}

% this part is for code styling inside document...
\usepackage {fancyvrb}
\DefineVerbatimEnvironment {code} {Verbatim} {fontsize = \small}
\DefineVerbatimEnvironment {example} {Verbatim} {fontsize = \small}

% make the meta information for the pdf file...
\usepackage [
	pdfauthor = {\projectauthor},
	pdftitle = {\projectname},
	pdfsubject = {},
	pdfkeywords = {},
	breaklinks = true
] {hyperref}

% mathematic package...
\usepackage {amsmath}

% define color for table...
\usepackage [table] {xcolor}
\definecolor {gray} {rgb} {.4, .4, .4}

% to import images...
\usepackage {graphicx}

% \usepackage {etoolbox}

% make all the images centre in horizontal alignment...
\makeatletter
\g@addto@macro\@floatboxreset\centering
\makeatother

% package for changing headings style...
\usepackage {fancyhdr}

% setting the margins of page...
\usepackage [
	top = 3.5cm,
	right = 2.5cm,
	bottom = 2.5cm,
	left = 3.5cm,
	includefoot
] {geometry}            

% multiline comments...
\usepackage {comment}

% force figure placement in text...
\usepackage {float}

% add multi-row property to tables...
\usepackage {multirow}

% remove ugly borders around clickable hyperlinks...
\hypersetup {hidelinks}

% add references in table of contents...

% pushes the footnote to the bottom of the page...
\usepackage [bottom] {footmisc}

% customize

% add dot for chpaters in toc
\usepackage{tocloft}
\setcounter{tocdepth}{4}
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} % for parts
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % for chapters
% add - after sec and subsec in toc also figures and tables
\renewcommand{\cftsecaftersnum}{-}
\renewcommand{\cftsubsecaftersnum}{-}
\renewcommand{\cftsubsubsecaftersnum}{-}
\renewcommand{\cftfigaftersnum}{ - }
\renewcommand{\cfttabaftersnum}{ - }
\setlength{\cftsecnumwidth}{2.5em}
\setlength{\cftsubsecnumwidth}{3.5em}
\setlength{\cftsubsubsecnumwidth}{4em}
\setlength{\cftfignumwidth}{3em}
\setlength{\cfttabnumwidth}{3em}
% add - after section numbering and remove the space
\usepackage{titlesec}
\titlelabel{\thetitle-}
% font of titles
\titleformat{\chapter}[display]{\normalfont\bfseries}{\thechapter}{14pt}{}{\Huge}
\titleformat{\section}{\normalfont\Large\bfseries}{\thetitle-}{13pt}{\hspace{-0.8em}}
\titleformat{\subsection}{\normalfont\Large\bfseries}{\thesubsection-}{12pt}{\hspace{-0.7em}}
\titleformat{\subsubsection}{\normalfont\Large\bfseries}{\thesubsubsection-}{10pt}{\hspace{-0.6em}}
% set 4 level of numbering
\setcounter{secnumdepth}{4}
%caption fonts
\usepackage[font={small,bf}]{caption}
\captionsetup{labelfont=bf}

%end of customize

% For writing algorithm and code blocks
\usepackage{algorithm}
\usepackage{algorithmic}
\usepackage{listings}
\lstset{
	basicstyle=\small,
	numberstyle=\small, 
	breaklines=true,
	keywordstyle=\bfseries\color{green!40!black},
	commentstyle=\itshape\color{purple!40!black},
	identifierstyle=\color{blue},
	stringstyle=\color{orange},
	frame=Trbl,
	numbers=left,
	stepnumber=1,
	tabsize=2,
}

% import the xepersian package...
\usepackage[Kashida]{xepersian}

% custom styles
\SepMark{-}

% remove chapter 1 text and number in toc
\makeatletter
\def\@makechapterhead#1{%
  \vspace*{10\p@}%
  {\parindent \z@ \if@RTL\raggedleft\else\raggedright\fi \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
       % \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 10\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}{#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi} 
\makeatother



% root directory for images...
\graphicspath {{images/}}

% make the normal pages header...
\fancyhead{}
\fancypagestyle{plain}{} 
\setlength\headheight{26pt} 
\rhead{\raisebox{-0.3\height}{\includegraphics[width=1cm]{logohdr}}  \quad \projectname}
\lhead{\projectauthor}

\makeatletter
\def\headrule{{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\vskip 2pt% 2pt between lines
\hrule\@height\headrulewidth\@width\headwidth\@height.5pt
\vskip 2pt% 2pt between lines
\hrule\@height 3pt\@width\headwidth% lower line with .5pt line width
\vskip-\headrulewidth
\vskip-1.5pt}}
\makeatother
\definecolor{hrulcolor}{RGB}{98,36,35}
\futurelet\TMPheadrule\def\headrule{{\color{hrulcolor}\TMPheadrule}}
\pagestyle {fancy}
% page number at the left side of header...
%\lhead {\thepage}
% chapter title at the right side of header...
%\rhead {\leftmark}

% override the references section title name...
\renewcommand\bibname {منابع و مأخذ}
\renewcommand{\listfigurename}{فهرست اشکال}

% set the default font family and font size...
% Install Lotus fonts in the fonts directory
\settextfont {IRXLotus}
\setdigitfont {IRXLotus}
\setlatintextfont [Scale=0.8]{Times New Roman}

% input symbols used in the thesis...
\input {TeX/symbols}
% some helper functions...
\input {TeX/functions}

% define line height...
\linespread {1.5}

% restart footnote in each page
\usepackage{perpage} %the perpage package
\MakePerPage{footnote} %the perpage package command
% Remove counter "footnote" from the reset counter list
% of counter "chapter".
\usepackage{remreset}
\makeatletter
\@removefromreset{footnote}{chapter}
\makeatother

% customize caption style
\captionsetup[figure]{labelformat=parens}
 
 % customize cite style
\usepackage{etoolbox}
\makeatletter
\patchcmd{\@citex}{,\penalty\@m\ }{و}{}{}
\makeatother

% PREVENTS CITES IN CAPTIONS FROM MISNUMBERING YOUR REFERENCES
\usepackage{notoccite}

% customize lstlisting caption title
\renewcommand\lstlistingname{کد}
\renewcommand\lstlistlistingname{کد}
\captionsetup[lstlisting]{labelformat=parens}

% define a no break page environment for captionof
\newenvironment{absolutelynopagebreak}
{\par\nobreak\vfil\penalty0\vfilneg
	\vtop\bgroup}
{\par\xdef\tpd{\the\prevdepth}\egroup
	\prevdepth=\tpd}

