\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dippg}[2019/03/06 DIPPG - author Salles R. (PPCIC)]

%Class of the document and font size
\LoadClass[11pt,a4paper]{report}

%Margins and A4 paper
\RequirePackage[a4paper, left=3cm, right=3cm, top=3cm, bottom=3cm]{geometry}

%Arial font
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

%Line spacing
\RequirePackage{setspace}
\setstretch{1.5}

%First line indentation in paragraphs
\setlength\parindent{1.25cm}

%% Load additional packages and commands. 
\RequirePackage[utf8]{inputenc} %for encoding
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{indentfirst}
\RequirePackage{sectsty}
\RequirePackage{wrapfig}
\RequirePackage{fancyhdr} %for page styling
\RequirePackage{ragged2e} %for text alignment
\RequirePackage{datagidx} %for the acronym database
\RequirePackage[dvipsnames,svgnames,table]{xcolor} %for colored table cells
\RequirePackage{booktabs} %for styling tables with rules
\RequirePackage{multirow} % for combining cells across rows
\RequirePackage{multicol} % for combining cells across columns
\RequirePackage{algorithmic} %for pseudo-algorithms
\RequirePackage[english,ruled,linesnumbered,vlined,titlenumbered]{algorithm2e} %for pseudo-algorithms
\RequirePackage{pdfpages} %for inserting pdf pages
\RequirePackage{listings} %for chunks of code (listings)
\RequirePackage{pifont} %for symbols
\RequirePackage{microtype} %for words outside of margins

%Continuous numbering of elements
\RequirePackage{chngcntr} 
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{algocf}{chapter}
\counterwithout{equation}{chapter}
\AtBeginDocument{\counterwithout{lstlisting}{chapter}}

%Captions style
\RequirePackage[labelsep=endash]{caption} %endash as label separator
\RequirePackage{subcaption}
\captionsetup{font={stretch=1}} %single spacing in captions

%Algorithm caption style
\SetAlCapSty{}
\SetAlgoCaptionSeparator{ \textendash }
\SetAlCapSkip{1em}
\makeatletter
\newenvironment{Ualgorithm}[1][htpb]{\def\@algocf@post@ruled{\kern\interspacealgoruled\hrule  height\algoheightrule\kern3pt\relax}%
	\def\@algocf@capt@ruled{above}%
	\setlength\algotitleheightrule{0pt}%
	\SetAlgoCaptionLayout{centerline}%
	\begin{algorithm}[#1]}
	{\end{algorithm}}
\makeatother

% Page Numbers
\pagestyle{fancy}
\fancyhf{}
\fancyheadoffset{0cm}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}
\fancyhead[R]{\thepage}
\fancypagestyle{plain}{
	\fancyhf{}
	\fancyhead[R]{\thepage}
}

%Chapter/section font
\RequirePackage{titlesec}
\chapterfont{\Large \centering}
\sectionfont{\normalsize \bfseries \flushleft}

%Chapter/section formating
\titleformat{\chapter}[hang] 
{\normalfont\Large\bfseries\centering}{\thechapter-\ }{1pt}{}
\titleformat{\section}[hang] 
{\normalfont\normalsize\bfseries\flushleft}{\thesection-\ }{1pt}{}

%Space before/after chapter/section
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}%40pt
\titlespacing{\section}{0pt}{2\baselineskip}{2\baselineskip}
\titlespacing{\subsection}{0pt}{2\baselineskip}{2\baselineskip}
\titlespacing{\subsubsection}{0pt}{2\baselineskip}{2\baselineskip}

%Table of contents formating
\RequirePackage{tocloft} %for pre-textual lists formating
\renewcommand{\cfttoctitlefont}{\hfill\bfseries\Large} 
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\contentsname}{\MakeUppercase{Contents}}
\cftsetindents{chapter}{0pt}{3em}
\cftsetindents{section}{0pt}{3em}
\cftsetindents{subsection}{0pt}{3em}

%List of figures formating
\renewcommand{\cftloftitlefont}{\hfill\bfseries\Large}
\newlength{\mylenfig}
\renewcommand{\cftfigpresnum}{\figurename\enspace}
\renewcommand{\cftfigaftersnum}{\enspace\textendash}
\settowidth{\mylenfig}{\cftfigpresnum\cftfigaftersnum}
\addtolength{\cftfignumwidth}{\mylenfig}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\listfigurename}{\MakeUppercase{List of figures}}

%List of tables formating
\renewcommand{\cftlottitlefont}{\hfill\bfseries\Large} 
\newlength{\mylentab}
\renewcommand{\cfttabpresnum}{\tablename\enspace}
\renewcommand{\cfttabaftersnum}{\enspace\textendash}
\settowidth{\mylentab}{\cfttabpresnum\cfttabaftersnum}
\addtolength{\cfttabnumwidth}{\mylentab}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\listtablename}{\MakeUppercase{List of tables}}

%Adding algorithms to package tocloft
\makeatletter
\begingroup
\let\newcounter\@gobble
\let\setcounter\@gobbletwo
\globaldefs\@ne
\let\c@loadepth\@ne
\newlistof{algorithms}{loa}{\listalgorithmcfname}
\endgroup
\let\l@algocf\l@algorithms
\makeatother

%List of algorithms formating
\renewcommand{\cftloatitlefont}{\hfill\bfseries\Large}
\newlength{\mylenalg}
\renewcommand{\cftalgorithmspresnum}{Algorithm\enspace}
\renewcommand{\cftalgorithmsaftersnum}{\enspace\textendash}
\settowidth{\mylenalg}{\cftalgorithmspresnum\cftalgorithmsaftersnum}
\setlength{\cftalgorithmsnumwidth}{2em}
\addtolength{\cftalgorithmsnumwidth}{\mylenalg}
\renewcommand{\cftafterloatitle}{\hfill}
\renewcommand{\listalgorithmcfname}{\MakeUppercase{List of Algorithms}}

%Adding listings to package tocloft
\makeatletter
\begingroup\let\newcounter\@gobble\let\setcounter\@gobbletwo
\globaldefs\@ne \let\c@loldepth\@ne
\newlistof{listings}{lol}{\lstlistlistingname}
\endgroup
\let\l@lstlisting\l@listings
\AtBeginDocument{\addtocontents{lol}{\protect\addvspace{10\p@}}}
\makeatother
\renewcommand{\lstlistoflistings}{\listoflistings}

%List of listings formating
\renewcommand{\cftloltitlefont}{\hfill\bfseries\Large}
\newlength{\mylenlst}
\renewcommand{\cftlistingspresnum}{Listing\enspace}
\renewcommand{\cftlistingsaftersnum}{\enspace\textendash}
\settowidth{\mylenlst}{\cftlistingspresnum\cftlistingsaftersnum}
\setlength{\cftlistingsnumwidth}{2em}
\addtolength{\cftlistingsnumwidth}{\mylenlst}
\renewcommand{\cftafterloltitle}{\hfill}
\renewcommand*{\lstlistlistingname}{\MakeUppercase{List of Listings}}

%List of abbreviations formating
\newgidx{acronym}{\MakeUppercase{List of Abbreviations}}
\DTLgidxSetDefaultDB{acronym}

%References formating (ABNT NBR 6023:2002 and citations in ABNT NBR 10520:2002)
\RequirePackage[backend=biber,block=space,style=abnt,language=american,uniquelist=false]{biblatex}
\renewcommand*{\bibfont}{\justifying}
\appto{\bibsetup}{\sloppy}
\newcommand{\bibfile}{\addbibresource}
\renewcommand\bibname{References}

%define vcentered colum types
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\newcommand\Tstrut{\rule{0pt}{2.6ex}} % = `top' strut
\newcommand\Bstrut{\rule[-0.9ex]{0pt}{0pt}} % = `bottom' strut
\newcommand{\specialcell}[2][c]{%
	\begin{tabular}[#1]{@{}c@{}}#2\end{tabular}}

%dcover command - cover formating
\newcommand\dcover{
	\begin{titlepage}		
		\newgeometry{left=3cm, right=3cm, top=3cm, bottom=3cm}
		\center		
		\begin{flushleft}
			\includegraphics[scale=0.8]{logocefet.jpg}\\[3cm]
		\end{flushleft}		
		\begin{minipage}{\textwidth}
			\begin{center}
				{\normalsize \MakeUppercase{\dtitle}}\\[2cm]
				{\normalsize \dauthor}
			\end{center}
		\end{minipage}\\[2cm]		
		\begin{flushright}
			\begin{minipage}{0.5\textwidth}
				\normalsize
				\singlespacing
				\ddoc~submitted to the Postgraduate Program in \dmajor~of the Federal Center for Technological Education of Rio de Janeiro, CEFET/RJ, as partial fulfillment of the requirements for the degree of \ddegree.
			\end{minipage}\\[2cm]
		\end{flushright}		
		\begin{flushright}
			\begin{minipage}{0.5\textwidth}
				\normalsize
				\singlespacing
				Advisor: \dadvisor\\
				Co-advisor: \dcoadvisor
			\end{minipage}\\
		\end{flushright}
		\vfill	
		Rio de Janeiro,\\
		\ddate		
	\end{titlepage}
}

%dsignatures command - signatures page formating
\newcommand\dsignatures{
	\thispagestyle{empty}	
	\newcommand{\HRule}{\rule{1\linewidth}{0.5mm}}
	\center	
	\begin{minipage}{1\textwidth}
		\begin{center}
			{\normalsize \MakeUppercase{\dtitle}}\\[0.7cm]
		\end{center}
	\end{minipage}\\[1.5cm]	
	\begin{minipage}{1\textwidth}
		\normalsize
		\singlespacing
		\ddoc~submitted to the Postgraduate Program in \dmajor~of the Federal Center for Technological Education of Rio de Janeiro, CEFET/RJ, as partial fulfillment of the requirements for the degree of \ddegree.
	\end{minipage}\\[1.5cm]	
	\begin{minipage}{1\textwidth}
		\begin{center}
			\dauthor
		\end{center} 
	\end{minipage}\\[2cm]	
	\begin{minipage}{1\textwidth}
		\begin{flushleft}
			Examining jury:
		\end{flushleft}
	\end{minipage}\\[1cm]	
	\center	
	\djury	
	\vfill	
	Rio de Janeiro,\\
	\ddate
	\pagebreak
}

%dlibrary command - include library page
\newcommand{\dlibrary}[1]{
	\includepdf{#1} 
}

%ddedicatory command - dedication formating
\newcommand{\ddedicatory}[1]{
	\chapter*{DEDICATION}
	\vfill
	\begin{flushright}
		\begin{minipage}{0.6\textwidth}
			#1
		\end{minipage}\\[1.5cm]
	\end{flushright}
	\pagebreak
}

%dacknowledgment command - acknowledgments formating
\newcommand{\dacknowledgment}[1]{	
	\chapter*{ACKNOWLEDGMENTS}
	\begin{minipage}{1\textwidth}
		#1
	\end{minipage}\\[1.5cm]
	\pagebreak
}

%dresumo command - resumo formating
\newcommand{\dresumo}[2]{
	\chapter*{RESUMO}
	\begin{center}
		\normalsize \bfseries \dtitlept \\[0.5cm]% Title of your document
	\end{center}
	
	\begin{singlespacing}
		\justifying
		
		#1
		\newline
		\newline	
		Palavras-chave:
		#2
		
	\end{singlespacing}
	\pagebreak
}

%dabstract command - abstract formating
\newcommand{\dabstract}[2]{
	\chapter*{ABSTRACT}
	
	\begin{center}
		\large \bfseries \dtitle \\[0.5cm]% Title of your document
	\end{center}
	
	\begin{singlespacing}
		\justifying
		
		#1
		\newline
		\newline
		Keywords:
		#2
		
	\end{singlespacing}
	\pagebreak
}

%dtables command - pre-textual lists of contents
\newcommand{\dtables}{	
	\renewcommand{\cftdot}{}
	\listoffigures
	\pagebreak
	
	\listoftables
	\pagebreak
	
	\listofalgorithms
	\pagebreak
	
	\lstlistoflistings
	\pagebreak
	
	\printterms[database=acronym,columns=1,location=hide,style=align]
	\label{lastpretextualpage}
	\pagebreak
	
	\tableofcontents
	\pagebreak
}

\endinput