%%%%
%%% pLaTeX2e Class File for Robotics Society of Japan
%%%   by ULS & Company (2000) E-mail: teppei@uls.co.jp
%%% Copyright 2000 - The Robotics Society of Japan
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jrsj}
%% based on [1999/05/18 v1.1q Standard pLaTeX class]
%%[1999/12/13 v1.0 prerelease for Journal of the Robotics Society of Japan]
  [2000/05/22 v1.1 for Journal of the Robotics Society of Japan]

\newdimen\@JQ
 \@JQ=0.7392507pt
\newdimen\@Q
 \@Q=0.71144pt
\newdimen\@EM
 \@EM=.03125em

\def\jrsj@warning{\ClassWarningNoLine{jrsj}}

\newif\if@NTT
\@ifundefined{kanjiskip}{\@NTTtrue
 \let\kanjiskip\jintercharskip
 \let\xkanjiskip\jasciikanjiskip
% \def\bf{\protect\pdg\protect\pbf}
 }{\@NTTfalse\let\jmathkanjiskip\xkanjiskip}
\@ifundefined{burasage}{}{\burasage`，=1\burasage`．=1}
\@ifundefined{inhibitglue}{\let\inhibitglue\relax}{}

\newif\if@paper \@papertrue
\DeclareOption{paper}{\@papertrue}
\DeclareOption{article}{\@paperfalse}
\newif\if@english \@englishfalse
\DeclareOption{english}{\@englishtrue}

\newif\if@Proof \@Prooffalse
\DeclareOption{Proof}{\@Prooftrue}
\newif\if@cameraready \@camerareadyfalse
\DeclareOption{cameraready}{\@camerareadytrue}

%% for 2.1.4 and non pLaTeX2e compatibility
\@ifundefined{hour}{}{%
 \hour\time \divide\hour by 60\relax
 \@tempcnta\hour \multiply\@tempcnta 60\relax
 \minute\time \advance\minute-\@tempcnta
}

\newcounter{@paper}
\newcommand{\@ptsize}{}
\newif\if@restonecol

\newif\if@enablejfam \@enablejfamtrue
\DeclareOption{a4paper}{\setcounter{@paper}{1}%
  \setlength\paperheight {274.5mm}%% 297
  \setlength\paperwidth  {210mm}}
\renewcommand{\@ptsize}{0}
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1mm}%
  \@bannertoken{%
     \jobname\space:\space\number\year/\number\month/\number\day
      (\number\hour:\number\minute)}
  \maketombowbox}
\DeclareOption{tombo}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{.1mm}%
  \maketombowbox}
\DeclareOption{mentuke}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{\z@}%
  \maketombowbox}
\DeclareOption{tate}{%
  \AtBeginDocument{\tate\message{《縦組モード》}%
                   \adjustbaseline}%
}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}
\DeclareOption{disablejfam}{\@enablejfamfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\ExecuteOptions{a4paper,10pt,twoside,twocolumn,final}
\ProcessOptions\relax

%%\input{jsize1\@ptsize.clo}
%%\ProvidesFile{jsize10.clo}
%%  [1999/05/18 v1.1q Standard pLaTeX file (size option)]

\if@NTT\else
 \if@cameraready
  \input{jrsj-cameraready}
 \else
  \DeclareFontShape{JY1}{mc}{m}{n}{%      paper        article
    <5>     sfixed * [5.1748] min5  %  7Q tiny         tiny
    <6>     sfixed * [5.9141] min6  %  8Q 
    <7>     sfixed * [7.3926] min7  % 10Q scriptsize   scriptsize
    <8>     sfixed * [8.1318] min8  % 11Q footnotesize footnotesize
    <9>     sfixed * [8.8711] min9  % 12Q small        small
    <10>    sfixed * [9.6104] min10 % 13Q normalsize   normalsize
    <10.95> sfixed * [11.089] min10 % 15Q large        large
    <12>    sfixed * [13.307] min10 % 18Q Large        Large
    <14.4>  sfixed * [14.785] min10 % 20Q
    <17.28> sfixed * [17.742] min10 % 24Q LARGE        LARGE
    <20.74> sfixed * [20.699] min10 % 28Q huge         huge
    <24.88> sfixed * [23.656] min10 % 32Q Huge         Huge
    <->                       min10 % other size
  }{}
  \DeclareFontShape{JY1}{mc}{bx}{n}{%
    <5>     sfixed * [5.1748] goth5
    <6>     sfixed * [5.9141] goth6
    <7>     sfixed * [7.3926] goth7
    <8>     sfixed * [8.1318] goth8
    <9>     sfixed * [8.8711] goth9
    <10>    sfixed * [9.6104] goth10
    <10.95> sfixed * [11.089] goth10
    <12>    sfixed * [13.307] goth10
    <14.4>  sfixed * [14.785] goth10
    <17.28> sfixed * [17.742] goth10
    <20.74> sfixed * [20.699] goth10
    <24.88> sfixed * [23.656] goth10
    <->                       goth10
  }{}
  \DeclareFontShape{JY1}{gt}{m}{n}{%
    <5>     sfixed * [5.1748] goth5
    <6>     sfixed * [5.9141] goth6
    <7>     sfixed * [7.3926] goth7
    <8>     sfixed * [8.1318] goth8
    <9>     sfixed * [8.8711] goth9
    <10>    sfixed * [9.6104] goth10
    <10.95> sfixed * [11.089] goth10
    <12>    sfixed * [13.307] goth10
    <14.4>  sfixed * [14.785] goth10
    <17.28> sfixed * [17.742] goth10
    <20.74> sfixed * [20.699] goth10
    <24.88> sfixed * [23.656] goth10
    <->                       goth10
  }{}
  \DeclareFontShape{JY1}{gt}{bx}{n}{%
    <5>     sfixed * [5.1748] goth5
    <6>     sfixed * [5.9141] goth6
    <7>     sfixed * [7.3926] goth7
    <8>     sfixed * [8.1318] goth8
    <9>     sfixed * [8.8711] goth9
    <10>    sfixed * [9.6104] goth10
    <10.95> sfixed * [11.089] goth10
    <12>    sfixed * [13.307] goth10
    <14.4>  sfixed * [14.785] goth10
    <17.28> sfixed * [17.742] goth10
    <20.74> sfixed * [20.699] goth10
    <24.88> sfixed * [23.656] goth10
    <->                       goth10
  }{}
 \fi
 %% JY1 it
 \DeclareFontShape{JY1}{mc}{m}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JY1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
 \DeclareFontShape{JY1}{gt}{m}{it}{<->ssub*gt/m/n}{}
 \DeclareFontShape{JY1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
 %%
 \DeclareFontShape{JY1}{mc}{b}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JY1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JY1}{gt}{b}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JY1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JY1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
 %% JT1 it
 \DeclareFontShape{JT1}{mc}{m}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JT1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
 \DeclareFontShape{JT1}{gt}{m}{it}{<->ssub*gt/m/n}{}
 \DeclareFontShape{JT1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
 %%
 \DeclareFontShape{JT1}{mc}{b}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JT1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JT1}{gt}{b}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JT1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JT1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
 %% sc
 \DeclareFontShape{JY1}{mc}{m}{sc}{<->ssub*mc/m/n}{}
 \DeclareFontShape{JT1}{mc}{m}{sc}{<->ssub*mc/m/n}{}
\fi

\if@paper
 \renewcommand{\normalsize}{%
     \@setfontsize\normalsize\@xpt{18.5H}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}

 \newcommand{\small}{%
   \@setfontsize\small\@ixpt{18.5H}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
	       \topsep 0\p@ \@plus2\p@ \@minus0\p@
	       \parsep 0\p@ \@plus\p@ \@minus0\p@
	       \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}

 \small
 \setbox0\hbox{\char\euc"A1A1}%
 \setlength\Cht{\ht0}
 \setlength\Cdp{\dp0}
 \setlength\Cwd{\wd0}
 \setlength\Cvs{\baselineskip}
 \setlength\Chs{\wd0}

 \newcommand{\footnotesize}{%
   \@setfontsize\footnotesize\@viiipt{14H}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
	       \topsep 0\p@ \@plus\p@ \@minus0\p@
	       \parsep 0\p@ \@plus\p@ \@minus0\p@
	       \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
\else
 \renewcommand{\normalsize}{%
     \@setfontsize\normalsize\@xpt{20H}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
 \normalsize
 \setbox0\hbox{\char\euc"A1A1}%
 \setlength\Cht{\ht0}
 \setlength\Cdp{\dp0}
 \setlength\Cwd{\wd0}
 \setlength\Cvs{\baselineskip}
 \setlength\Chs{\wd0}
 \newcommand{\small}{%
   \@setfontsize\small\@ixpt{14H}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
	       \topsep 0\p@ \@plus2\p@ \@minus0\p@
	       \parsep 0\p@ \@plus\p@ \@minus0\p@
	       \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
 \newcommand{\footnotesize}{%
   \@setfontsize\footnotesize\@viiipt{13H}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
	       \topsep 0\p@ \@plus\p@ \@minus0\p@
	       \parsep 0\p@ \@plus\p@ \@minus0\p@
	       \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
\fi

\newcommand{\scriptsize}{\@setfontsize\scriptsize\@viipt{13H}}
\newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
\newcommand{\large}{\@setfontsize\large\@xipt{22H}}
\newcommand{\Large}{\@setfontsize\Large\@xiipt{21}}
\newcommand{\LARGE}{\@setfontsize\LARGE\@xviipt{32H}}
\newcommand{\huge}{\@setfontsize\huge\@xxpt{28}}
\newcommand{\Huge}{\@setfontsize\Huge\@xxvpt{33}}

\setlength\headheight{11H}% 10 <-->11
\setlength\headsep{4.5mm}% 4mm <--> 4.5mm
\setlength\topskip{1\Cht}
\if@paper
 \setlength\footskip{11mm}% 10.5 <--> 11
\else
 \setlength\footskip{12mm}
\fi
\setlength\maxdepth{.5\topskip}

\if@paper
 \textwidth174mm
\else
 \textwidth175.5mm
\fi
\@settopoint\textwidth

\if@paper
 \textheight50\Cvs
 \advance \textheight \topskip
 \advance \textheight .25mm %% limit .0475mm
\else
 \textheight46\Cvs
 \advance \textheight \topskip
 \advance \textheight .25mm %% limit .0402mm
\fi
\@settopoint\textheight

\setlength\marginparsep{10\p@}
\setlength\marginparpush{5\p@}

\iftombow
% \hoffset\z@
% \voffset\z@
 \topmargin\paperheight
 \advance \topmargin -\textheight
 \advance \topmargin -\headheight
 \advance \topmargin -\headsep
 \advance \topmargin -\footskip
 \divide \topmargin \tw@
 \if@paper
  \advance \topmargin 1.5mm %% adjustment
 \else
  \advance \topmargin 1.5mm %% adjustment
 \fi
 \advance \topmargin -1in
 \@settopoint\topmargin
 \oddsidemargin\paperwidth
 \advance \oddsidemargin -\textwidth
 \divide \oddsidemargin \tw@
 \advance \oddsidemargin -1in
 \@settopoint\oddsidemargin
 \evensidemargin\oddsidemargin
 \@settopoint\evensidemargin
\else
 \topmargin\z@
 \@settopoint\topmargin
 \oddsidemargin\z@
 \@settopoint\oddsidemargin
 \evensidemargin\z@
 \@settopoint\evensidemargin
\fi

\setlength\marginparwidth{2in}
\@settopoint\marginparwidth

\setlength\footnotesep{2.275mm}% 13H

\setlength{\skip\footins}{1\Cvs plus .9\Cvs \@minus .3\Cvs}
\setlength\floatsep    {1\Cvs \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{1.25\Cvs \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {1.25\Cvs \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {1\Cvs \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{1.25\Cvs \@plus 2\p@ \@minus 4\p@}

\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
  \parsep 0\p@ \@plus2\p@ \@minus0\p@
  \topsep 0\p@ \@plus2\p@ \@minus0\p@
  \itemsep0\p@ \@plus2\p@ \@minus0\p@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep  0\p@ \@plus2\p@ \@minus0\p@
   \parsep  0\p@ \@plus\p@  \@minus0\p@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep 0\p@  \@plus\p@ \@minus0\p@
   \parsep\z@
   \partopsep 0\p@ \@plus\z@ \@minus0\p@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

\if@paper
 \setlength\columnsep{6mm}
\else
 \setlength\columnsep{6.5mm}
\fi

\setlength\columnseprule{0\p@}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand{\baselinestretch}{}
\setlength\parskip{0\p@}
\setlength\parindent{1\Cwd}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\setcounter{topnumber}{6}
\setcounter{bottomnumber}{5}
\setcounter{totalnumber}{11}
\setcounter{dbltopnumber}{5}
\renewcommand{\topfraction}{.95}
\renewcommand{\bottomfraction}{.95}
\renewcommand{\textfraction}{.05}
\renewcommand{\floatpagefraction}{.05}
\renewcommand{\dbltopfraction}{.95}
\renewcommand{\dblfloatpagefraction}{.05}

\if@Proof
 \def\@Rtop{\rlap{\smash{\rule[-\headsep]{0.05mm}{10mm}%
  \rule[-\headsep]{10mm}{0.05mm}}}}
 \def\@Ltop{\llap{\smash{\rule[-\headsep]{10mm}{0.05mm}%
  \rule[-\headsep]{0.05mm}{10mm}}}}
 \def\@Rbot{\rlap{\smash{\raisebox{1\footskip}
  {\rule[-10mm]{0.05mm}{10mm}\rule{10mm}{0.05mm}}}}}
 \def\@Lbot{\llap{\smash{\raisebox{1\footskip}
  {\rule{10mm}{0.05mm}\rule[-10mm]{0.05mm}{10mm}}}}}
\else
 \let\@Rtop\relax\let\@Ltop\relax\let\@Rbot\relax\let\@Lbot\relax
\fi

\def\head@adj{\if@paper\else\hskip.75mm\fi}

\def\ps@plain{\let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plain
   \let\@oddhead\@empty
   \def\@oddfoot{\reset@font\hfil\thepage\hfil}%
   \let\@evenhead\@empty
   \let\@evenfoot\@oddfoot}
\let\ps@jpl@in\ps@plain

\def\ps@jrsj{\let\@mkboth\@gobbletwo
 \def\@oddhead{\@Ltop\head@adj\scriptsize
  \hfil\head@title\hfil\llap{\@volpage}\head@adj\@Rtop}%
 \def\@evenhead{\@Ltop\head@adj\scriptsize
  \rlap{\@volpage}\hfil\head@authors\hfil\head@adj\@Rtop}%
 \def\@evenfoot{\@Lbot\head@adj\scriptsize
  \rlap{JRSJ Vol.\,\@Vol\ No.\,\@No}\hfil
  ---\thepage ---\hfil
  \llap{\evenfoot@MM,\ \@Year}\head@adj\@Rbot}%
 \def\@oddfoot{\@Lbot\head@adj\scriptsize
  \rlap{日本ロボット学会誌\@Vol 巻\@No 号}\hfil
  ---\thepage ---\hfil
  \llap{\@Year 年\oddfoot@MM 月}\head@adj\@Rbot}%
}

%% first page
\def\ps@JRSJ{\let\@mkboth\@gobbletwo
 \def\@oddhead{\@Ltop\head@adj\scriptsize
  \hfil 日本ロボット学会誌\hskip1zw Vol.\,\@Vol\hskip1zw No.\,\@No,\ 
  \volpage@range,\ \@Year\hfil
  \llap{\@volpage}\head@adj\@Rtop}%
 \def\@evenhead{\@Ltop\head@adj\scriptsize
  \rlap{\@volpage}\hfil
  日本ロボット学会誌\hskip1zw Vol.\,\@Vol\hskip1zw No.\,\@No,\ 
  \volpage@range,\ \@Year\hfil
  \head@adj\@Rtop}%
 \def\@evenfoot{\@Lbot\head@adj\scriptsize
  \rlap{JRSJ Vol.\,\@Vol\ No.\,\@No}\hfil
  ---\thepage ---\hfil
  \llap{\evenfoot@MM,\ \@Year}\head@adj\@Rbot}%
 \def\@oddfoot{\@Lbot\head@adj\scriptsize
  \rlap{日本ロボット学会誌\@Vol 巻\@No 号}\hfil
  ---\thepage ---\hfil
  \llap{\@Year 年\oddfoot@MM 月}\head@adj\@Rbot}%
}

\def\volpage#1{\gdef\@volpageoffset{#1}}
\def\@volpageoffset{1}
\def\@volpage{%
 \@tempcnta\c@page
 \advance \@tempcnta \@volpageoffset\relax
 \advance \@tempcnta \m@ne
 \the\@tempcnta
}

\def\volpage@range{%
 \@ifundefined{r@jrsj@lastpage}{\def\last@volpage{1}\def\get@lp{1}}%
  {\edef\exp@lp{\csname r@jrsj@lastpage\endcsname}%
   \edef\get@lp{\expandafter\@cdr\exp@lp\@nil}%
   \def\last@volpage{%
    \@tempcnta\get@lp\relax
    \advance \@tempcnta \@volpageoffset\relax
    \advance \@tempcnta \m@ne
    \the\@tempcnta
   }%
  }%
  \ifnum\get@lp=\c@page
   p.\@volpage
  \else
   pp.\@volpage\kern0pt 〜\kern0pt\last@volpage
  \fi
}

\def\Year#1{\gdef\@Year{#1}}
\def\@Year{}
\def\Vol#1{\gdef\@Vol{#1}}
\def\@Vol{}
\def\No#1{\gdef\@No{#1}%
 \def\@tempa{xx}%
 \ifx\@No\@tempa
  \gdef\evenfoot@MM{xx}\gdef\oddfoot@MM{xx}%
 \else
  \ifx\@No\empty
   \gdef\evenfoot@MM{xx}\gdef\oddfoot@MM{xx}%
  \else
   \gdef\evenfoot@MM{%
    {\ifcase#1 xx.%
      \or Jan.%%\or Feb.%
      \or Mar.\or Apr.\or May%%\or Jun.%
      \or July%%\or Aug.%
      \or Sept.\or Oct.\or Nov.%%\or Dec.%
      \or xxx.%
     \fi
    }}%
   \gdef\oddfoot@MM{%
    {\ifcase#1 xx%
      \or 1%%\or 2%
      \or 3\or 4\or 5%%\or 6%
      \or 7%%\or 8%
      \or 9\or 10\or 11%%\or 12%
      \or xx%
     \fi
    }}%
  \fi
 \fi
}
\def\@No{}
\def\evenfoot@MM{}\def\oddfoot@MM{}
\Year{200x}\Vol{xx}\No{xx}

\def\typeofpaper#1{\gdef\@typeofpaper{#1}}
\gdef\@typeofpaper{}
\def\typeofarticle#1{\gdef\@typeofarticle{#1}}
\def\@typeofarticle{}

\def\title{\@ifnextchar[% ]
 {\d@title}{\s@title}}
\def\d@title[#1]#2{%
 \gdef\head@title{%
  \if@english\def\\{\unskip\space\ignorespaces}\else
   \def\\{\unskip\ignorespaces}\fi
  #1}\calc@head{#1}\gdef\@title{\inhibitglue #2}}
\def\s@title#1{%
 \gdef\head@title{%
  \if@english\def\\{\unskip\space\ignorespaces}\else
   \def\\{\unskip\ignorespaces}\fi
  #1}\calc@head{#1}\gdef\@title{\inhibitglue #1}}
\def\@title{}
\def\head@title{}
\def\subtitle#1{\gdef\@subtitle{\inhibitglue #1}}
\def\@subtitle{}

\def\calc@head#1{%
 \bgroup
  \if@english\def\\{\unskip\space\ignorespaces}\else
   \def\\{\unskip\ignorespaces}\fi
  \setbox\@tempboxa\hbox{\@volpageoffset\hskip2mm #1\hskip2mm\@volpageoffset}%
  \ifdim \wd\@tempboxa<\textwidth\else %% >
   \jrsj@warning{header is too long. make it shorter}%
  \fi
 \egroup
}

%\if@english\else
 \def\etitle#1{\gdef\@etitle{#1}}
 \def\@etitle{}
 \def\esubtitle#1{\gdef\@esubtitle{#1}}
 \def\@esubtitle{}
%\fi

\if@paper
 \newbox\@abstractbox
 \def\abstract{%
  \global\setbox\@abstractbox\hbox\bgroup
   \begin{minipage}[t]{151.25mm}% 11Qx55w
   \footnotesize\baselineskip4mm
   \parindent=1zw\ignorespaces}
 \def\endabstract{%
   \end{minipage}
  \egroup
 \ignorespaces}

 \newbox\@keywordsbox
 \def\keywords{%
  \global\setbox\@keywordsbox\hbox\bgroup
   \begin{minipage}[t]{151.25mm}% 11Qx55w
  \footnotesize\baselineskip4mm
  \@hangfrom{{\bfseries\itshape Key Words\/}:\space}%
  \ignorespaces}
 \def\endkeywords{%
   \end{minipage}
  \egroup\ignorespaces}
\else
 \def\keyword#1{\gdef\@keyword{\footnotetext[0]{% \raggedright
   キーワード\hbox to 1zw{\hss ：\hss}#1}}}
 \def\@keyword{}
\fi

\newtoks\@authorlist
\newcount\@authorcnt
\newcount\@alcnt
\newcount\@totalnumber
\newdimen\authornamesep
\authornamesep1zw

\def\authorlist#1{%
 \if@english
  \let\authorentry\E@ae
 \else
  \let\authorentry\J@ae
 \fi
 \@authorlist={#1}\the\@authorlist
}

\def\E@ae#1#2#3{%
 \@tempcnta\z@
  \advance \@authorcnt \@ne
   \get@al{#3}%
   \def\al@none{0}%
   \fmt@Ean{#2}%
   \expandafter\xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
    \@authorname\nobreak\plural@affi{#3}}%
   \expandafter\xdef\csname head@Ean\number\@authorcnt\endcsname{#2}%
   \global\@totalnumber=\@authorcnt
}

\def\J@ae#1#2#3{%
 \@tempcnta\z@
  \advance \@authorcnt \@ne
   \get@al{#3}%
   \def\al@none{0}%
   \fmt@Jan{#1}%
   \expandafter\xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
    \@authorname\kern\z@\plural@affi{#3}}%
   \fmt@Ean{#2}%
   \expandafter\xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
    \@authorname\nobreak\plural@affi{#3}}%
   \fmt@Lheader{#1}%
   \expandafter\xdef\csname Lhead@Jan\number\@authorcnt\endcsname{%
    \@authorname}%
   \fmt@Sheader{#1}%
   \expandafter\xdef\csname Shead@Jan\number\@authorcnt\endcsname{%
    \@authorname}%
   \global\@totalnumber=\@authorcnt
}

\newdimen\@headnamesep
\if@english
 \@headnamesep5mm
\else
 \@headnamesep2.5mm
\fi

\def\fmt@Lheader#1{%
 \setbox\@tempboxb\hbox{\spaceskip=100mm #1}%
 \ifdim \wd\@tempboxb < 100mm %% >
  \def\@authorname{#1}%
 \else
  \setbox\@tempboxb\hbox{#1}%% <
  \ifdim \wd\@tempboxb > 6zw
   \def\@tempb##1 ##2\@nil{##1\hskip\@headnamesep ##2}%
  \else
   \def\@tempb##1 ##2\@nil{%
    \protect\kintou{3zw}{##1\hfil}\hskip1zw
    \protect\kintou{3zw}{\hfil ##2}}%
  \fi
   \def\@tempname{#1}%
   \edef\@authorname{\expandafter\@tempb\@tempname \@nil}%
 \fi
}

\def\fmt@Sheader#1{%
 \setbox\@tempboxb\hbox{\spaceskip=100mm #1}%
 \ifdim \wd\@tempboxb < 100mm %% >
  \def\@authorname{#1}%
 \else
  \def\@tempb##1 ##2\@nil{##1\hskip\@headnamesep ##2}%
  \def\@tempname{#1}%
  \edef\@authorname{\expandafter\@tempb\@tempname \@nil}%
 \fi
}

\def\get@al#1{%
 \@for\get@label:=#1\do{%
  \@ifundefined{al@\get@label}%
   {\def\@noaffi{none}\def\@tempaffi{#1}%
    \ifx\@noaffi\@tempaffi\else
     \global\advance \@alcnt \@ne\fi
    \expandafter\xdef\csname al@\get@label\endcsname{\the\@alcnt}%
    \advance \@tempcnta \@ne
    \expandafter\xdef\csname al@\romannumeral\@tempcnta\endcsname{%
     \get@label}%
   }%
   {\advance \@tempcnta \@ne
    \expandafter\xdef\csname al@\romannumeral\@tempcnta\endcsname{%
     \get@label}%
   }%
 }%
}

\def\fmt@Jan#1{%
 \setbox\@tempboxb\hbox{\spaceskip=100mm #1}%
 \ifdim \wd\@tempboxb < 100mm %% >
  \jrsj@warning{Author's name "#1" doesn't have a space}%
  \def\@authorname{#1}%
 \else
  \setbox\@tempboxb\hbox{#1}%% <
  \ifdim \wd\@tempboxb > 6zw
   \def\@tempb##1 ##2\@nil{##1\hskip\authornamesep ##2}%
  \else
   \def\@tempb##1 ##2\@nil{%
    \protect\kintou{3zw}{##1\hfil}\hskip1zw
    \protect\kintou{3zw}{\hfil ##2}}%
  \fi
   \def\@tempname{#1}%
   \edef\@authorname{\expandafter\@tempb\@tempname \@nil}%
 \fi
}

\def\fmt@Ean#1{%
 \def\@authorname{#1}%
}

\def\noaffiskip{}
\def\paffiskip{}

\def\plural@affi#1{%
 \@ifundefined{al@#1}%
   {\expandafter\ifnum\expandafter\csname al@\al@i\endcsname\expandafter %%<
      >\csname al@\al@ii\endcsname
     $^{\noexpand\@fnsymbol{\csname al@\al@ii\endcsname}}$% ,%%
     $^{\noexpand\@fnsymbol{\csname al@\al@i\endcsname}}$%
    \else
     $^{\noexpand\@fnsymbol{\csname al@\al@i\endcsname}}$% ,%%
     $^{\noexpand\@fnsymbol{\csname al@\al@ii\endcsname}}$%
    \fi
   }%
   {\expandafter\ifnum\csname al@#1\endcsname=\z@\noexpand\noaffiskip\else
    $^{\noexpand\@fnsymbol{\csname al@#1\endcsname}}$\noexpand\paffiskip\fi
   }%
}

\newcount\@spcnt
\def\tmp@Janskip#1{%
 \@spcnt\z@
 \loop %% <
  \ifnum\@totalnumber>\@spcnt
  \advance \@spcnt \@ne
  \expandafter\def\csname sp\number\@spcnt\endcsname{#1}%
 \repeat
 \@spcnt\z@
}

\def\get@integer#1{%
 \@tempcntb\@totalnumber
 \loop %% <
  \ifnum\@tempcntb>#1\relax
   \advance \@tempcntb -#1\relax
 \repeat
}

\def\tmp@Jal{}

\def\@outputJauthorlist{%
 \@authorcnt\z@
 \tmp@Janskip{\hskip1zw}%
 \ifnum\@totalnumber<5\relax %% 1,2,3,4
  \expandafter\def\csname sp\number\@totalnumber\endcsname{}%
  \loop\ifnum \@authorcnt < \@totalnumber %% >
   \advance \@authorcnt \@ne
   \advance \@spcnt \@ne
   \xdef\tmp@Jal{\tmp@Jal
    \csname @Jauthorname\number\@authorcnt\endcsname
    \csname sp\number\@spcnt\endcsname}%
  \repeat
  \setbox0\hbox{\parbox{\textwidth}{%
   \centering \tmp@Jal
  }}%
 \else
  \get@integer{4}%
  \tmp@Janskip{\hskip1zw\mbox{}&}%
  \ifnum\@tempcntb=4\relax %% 8,12,16,20,...,4x
   \expandafter\def\csname sp4\endcsname{\cr}%
   \expandafter\def\csname sp8\endcsname{\cr}%
   \expandafter\def\csname sp12\endcsname{\cr}%
   \expandafter\def\csname sp16\endcsname{\cr}%
   \expandafter\def\csname sp\number\@totalnumber\endcsname{}%
   \loop
    \ifnum \@authorcnt < \@totalnumber %% >
     \advance \@authorcnt \@ne
     \advance \@spcnt \@ne
     \xdef\tmp@Jal{\tmp@Jal
      \csname @Jauthorname\number\@authorcnt\endcsname
      \csname sp\number\@spcnt\endcsname}%
   \repeat
   \setbox0\hbox{\parbox{\textwidth}{%
    \tabskip\z@ plus \fill
    \halign{\tabskip\z@
     ##\unskip\hfil&##\unskip\hfil&##\unskip\hfil&##\unskip\hfil\cr
     \tmp@Jal\cr
    }%
   }}%
  \else
   \get@integer{3}%
   \tmp@Janskip{\hskip1zw\mbox{}&}%
   \ifnum\@tempcntb=3\relax %% 6,9,(12),15,18,21,...,3x
    \expandafter\def\csname sp3\endcsname{\cr}%
    \expandafter\def\csname sp6\endcsname{\cr}%
    \expandafter\def\csname sp9\endcsname{\cr}%
    \expandafter\def\csname sp12\endcsname{\cr}%
    \expandafter\def\csname sp15\endcsname{\cr}%
    \expandafter\def\csname sp18\endcsname{\cr}%
    \expandafter\def\csname sp\number\@totalnumber\endcsname{}%
    \loop
     \ifnum \@authorcnt < \@totalnumber %% >
      \advance \@authorcnt \@ne
      \advance \@spcnt \@ne
      \xdef\tmp@Jal{\tmp@Jal
       \csname @Jauthorname\number\@authorcnt\endcsname
       \csname sp\number\@spcnt\endcsname}%
    \repeat
    \setbox0\hbox{\parbox{\textwidth}{%
     \tabskip\z@ plus \fill
     \halign{\tabskip\z@
      ##\unskip\hfil&##\unskip\hfil&##\unskip\hfil\cr
      \tmp@Jal\cr
     }%
    }}%
   \else
    \ifnum\@totalnumber=5\relax %% 5
     \tmp@Janskip{\hskip1zw}%
     \expandafter\def\csname sp3\endcsname{\par}%
      \loop\ifnum \@authorcnt < \@totalnumber %% >
       \advance \@authorcnt \@ne
       \advance \@spcnt \@ne
       \xdef\tmp@Jal{\tmp@Jal
        \csname @Jauthorname\number\@authorcnt\endcsname
	\csname sp\number\@spcnt\endcsname}%
      \repeat
      \setbox0\hbox{\parbox{\textwidth}{%
       \centering \tmp@Jal
      }}%
    \else
     \ifnum\@totalnumber=7\relax %% 7
      \tmp@Janskip{\hskip1zw}%
      \expandafter\def\csname sp4\endcsname{\par}%
       \loop\ifnum \@authorcnt < \@totalnumber %% >
	\advance \@authorcnt \@ne
	\advance \@spcnt \@ne
	\xdef\tmp@Jal{\tmp@Jal
         \csname @Jauthorname\number\@authorcnt\endcsname
	 \csname sp\number\@spcnt\endcsname}%
       \repeat
       \setbox0\hbox{\parbox{\textwidth}{%
	\centering \tmp@Jal
       }}%
     \else
      \ifnum\@totalnumber=10\relax %% 10
       \tmp@Janskip{\hskip1zw}%
       \expandafter\def\csname sp4\endcsname{\par}%
       \expandafter\def\csname sp7\endcsname{\par}%
	\loop\ifnum \@authorcnt < \@totalnumber %% >
	 \advance \@authorcnt \@ne
	 \advance \@spcnt \@ne
	 \xdef\tmp@Jal{\tmp@Jal
          \csname @Jauthorname\number\@authorcnt\endcsname
	  \csname sp\number\@spcnt\endcsname}%
	\repeat
	\setbox0\hbox{\parbox{\textwidth}{%
	 \centering \tmp@Jal
	}}%
      \else
       \ifnum\@totalnumber=11\relax %% 11
	\tmp@Janskip{\hskip1zw}%
	\expandafter\def\csname sp4\endcsname{\par}%
	\expandafter\def\csname sp8\endcsname{\par}%
	 \loop\ifnum \@authorcnt < \@totalnumber %% >
	  \advance \@authorcnt \@ne
	  \advance \@spcnt \@ne
	  \xdef\tmp@Jal{\tmp@Jal
           \csname @Jauthorname\number\@authorcnt\endcsname
	   \csname sp\number\@spcnt\endcsname}%
	 \repeat
	 \setbox0\hbox{\parbox{\textwidth}{%
	  \centering \tmp@Jal
	 }}%
       \else
	\ifnum\@totalnumber=13\relax %% 13
	 \tmp@Janskip{\hskip1zw}%
	 \expandafter\def\csname sp4\endcsname{\par}%
	 \expandafter\def\csname sp7\endcsname{\par}%
	 \expandafter\def\csname sp10\endcsname{\par}%
	  \loop\ifnum \@authorcnt < \@totalnumber %% >
	   \advance \@authorcnt \@ne
	   \advance \@spcnt \@ne
	   \xdef\tmp@Jal{\tmp@Jal
	    \csname @Jauthorname\number\@authorcnt\endcsname
	    \csname sp\number\@spcnt\endcsname}%
	  \repeat
	  \setbox0\hbox{\parbox{\textwidth}{%
	   \centering \tmp@Jal
	  }}%
        \else % 17,19,22,23,...
	 \tmp@Janskip{\hskip1zw}%
	 \expandafter\def\csname sp4\endcsname{\par}%
	 \expandafter\def\csname sp8\endcsname{\par}%
	 \expandafter\def\csname sp12\endcsname{\par}%
	 \expandafter\def\csname sp16\endcsname{\par}%
	  \loop\ifnum \@authorcnt < \@totalnumber %% >
	   \advance \@authorcnt \@ne
	   \advance \@spcnt \@ne
	   \xdef\tmp@Jal{\tmp@Jal
	    \csname @Jauthorname\number\@authorcnt\endcsname
	    \csname sp\number\@spcnt\endcsname}%
	  \repeat
	  \setbox0\hbox{\parbox{\textwidth}{%
	   \centering \tmp@Jal
	  }}%
        \fi
       \fi
      \fi
     \fi
    \fi
   \fi
  \fi
 \fi
%%%
  \@tempdimb\ht0
  \advance \@tempdimb \dp0
  \divide \@tempdimb \baselineskip
  \@tempcntb=\@tempdimb
}

\def\@outputAauthorlist{%% article type
 \@authorcnt\z@
 \tmp@Janskip{\hskip1zw}%
 \def\tmp@Jal{}%
 \ifnum\@totalnumber<6\relax %% 1,2,3,4,5
  \expandafter\def\csname sp\number\@totalnumber\endcsname{}%
  \loop\ifnum \@authorcnt < \@totalnumber %% >
   \advance \@authorcnt \@ne
   \advance \@spcnt \@ne
   \xdef\tmp@Jal{\tmp@Jal
    \csname @Jauthorname\number\@authorcnt\endcsname
    \csname sp\number\@spcnt\endcsname}%
  \repeat
  \tmp@Jal
 \else
  \get@integer{4}%
  \tmp@Janskip{\hskip1zw\mbox{}&}%
  \ifnum\@tempcntb=4\relax %% 8,12,16,20,...,4x
   \expandafter\def\csname sp4\endcsname{\cr}%
   \expandafter\def\csname sp8\endcsname{\cr}%
   \expandafter\def\csname sp12\endcsname{\cr}%
   \expandafter\def\csname sp16\endcsname{\cr}%
   \loop
    \ifnum \@authorcnt < \@totalnumber %% >
     \advance \@authorcnt \@ne
     \advance \@spcnt \@ne
     \xdef\tmp@Jal{\tmp@Jal
      \csname @Jauthorname\number\@authorcnt\endcsname
      \csname sp\number\@spcnt\endcsname}%
   \repeat
   \tabcolsep\z@
   \def\arraystretch{0.8}%
   \begin{tabular}{@{}llll@{}}
    \tmp@Jal
    \noalign{\vskip-.5mm}
   \end{tabular}%
  \else
   \get@integer{3}%
   \tmp@Janskip{\hskip1zw\mbox{}&}%
   \ifnum\@tempcntb=3\relax %% 6,9,(12),15,18,21,...,3x
    \expandafter\def\csname sp3\endcsname{\cr}%
    \expandafter\def\csname sp6\endcsname{\cr}%
    \expandafter\def\csname sp9\endcsname{\cr}%
    \expandafter\def\csname sp12\endcsname{\cr}%
    \expandafter\def\csname sp15\endcsname{\cr}%
    \expandafter\def\csname sp18\endcsname{\cr}%
    \loop
     \ifnum \@authorcnt < \@totalnumber %% >
      \advance \@authorcnt \@ne
      \advance \@spcnt \@ne
      \xdef\tmp@Jal{\tmp@Jal
       \csname @Jauthorname\number\@authorcnt\endcsname
       \csname sp\number\@spcnt\endcsname}%
    \repeat
    \tabcolsep\z@
    \def\arraystretch{0.8}%
    \begin{tabular}{@{}lll@{}}
     \tmp@Jal
     \noalign{\vskip-.5mm}
    \end{tabular}%
   \else
    \ifnum\@totalnumber=5\relax %% 5
     \tmp@Janskip{\hskip1zw}%
     \expandafter\def\csname sp3\endcsname{\par}%
      \loop\ifnum \@authorcnt < \@totalnumber %% >
       \advance \@authorcnt \@ne
       \advance \@spcnt \@ne
       \xdef\tmp@Jal{\tmp@Jal
        \csname @Jauthorname\number\@authorcnt\endcsname
	\csname sp\number\@spcnt\endcsname}%
      \repeat
      \tmp@Jal
    \else
     \ifnum\@totalnumber=7\relax %% 7
      \tmp@Janskip{\hskip1zw}%
      \expandafter\def\csname sp4\endcsname{\par}%
       \loop\ifnum \@authorcnt < \@totalnumber %% >
	\advance \@authorcnt \@ne
	\advance \@spcnt \@ne
	\xdef\tmp@Jal{\tmp@Jal
         \csname @Jauthorname\number\@authorcnt\endcsname
	 \csname sp\number\@spcnt\endcsname}%
       \repeat
       \tmp@Jal
     \else
      \ifnum\@totalnumber=10\relax %% 10
       \tmp@Janskip{\hskip1zw}%
       \expandafter\def\csname sp4\endcsname{\par}%
       \expandafter\def\csname sp7\endcsname{\par}%
	\loop\ifnum \@authorcnt < \@totalnumber %% >
	 \advance \@authorcnt \@ne
	 \advance \@spcnt \@ne
	 \xdef\tmp@Jal{\tmp@Jal
          \csname @Jauthorname\number\@authorcnt\endcsname
	  \csname sp\number\@spcnt\endcsname}%
	\repeat
        \tmp@Jal
      \else
       \ifnum\@totalnumber=11\relax %% 11
	\tmp@Janskip{\hskip1zw}%
	\expandafter\def\csname sp4\endcsname{\par}%
	\expandafter\def\csname sp8\endcsname{\par}%
	 \loop\ifnum \@authorcnt < \@totalnumber %% >
	  \advance \@authorcnt \@ne
	  \advance \@spcnt \@ne
	  \xdef\tmp@Jal{\tmp@Jal
           \csname @Jauthorname\number\@authorcnt\endcsname
	   \csname sp\number\@spcnt\endcsname}%
	 \repeat
         \tmp@Jal
       \else
	\ifnum\@totalnumber=13\relax %% 13
	 \tmp@Janskip{\hskip1zw}%
	 \expandafter\def\csname sp4\endcsname{\par}%
	 \expandafter\def\csname sp7\endcsname{\par}%
	 \expandafter\def\csname sp10\endcsname{\par}%
	  \loop\ifnum \@authorcnt < \@totalnumber %% >
	   \advance \@authorcnt \@ne
	   \advance \@spcnt \@ne
	   \xdef\tmp@Jal{\tmp@Jal
	    \csname @Jauthorname\number\@authorcnt\endcsname
	    \csname sp\number\@spcnt\endcsname}%
	  \repeat
          \tmp@Jal
        \else % 17,19,22,23,...
	 \tmp@Janskip{\hskip1zw}%
	 \expandafter\def\csname sp4\endcsname{\par}%
	 \expandafter\def\csname sp8\endcsname{\par}%
	 \expandafter\def\csname sp12\endcsname{\par}%
	 \expandafter\def\csname sp16\endcsname{\par}%
	  \loop\ifnum \@authorcnt < \@totalnumber %% >
	   \advance \@authorcnt \@ne
	   \advance \@spcnt \@ne
	   \xdef\tmp@Jal{\tmp@Jal
	    \csname @Jauthorname\number\@authorcnt\endcsname
	    \csname sp\number\@spcnt\endcsname}%
	  \repeat
          \tmp@Jal
        \fi
       \fi
      \fi
     \fi
    \fi
   \fi
  \fi
 \fi
}

\newif\if@bkal \@bkalfalse
\def\breakauthorline#1{%
 \global\@bkaltrue
 \@for\@breakauthor:=#1\do{%
  \expandafter\gdef\csname @breakauthorline\@breakauthor\endcsname{\\}
 }%
  \@authorcnt\z@
  \loop\ifnum \@authorcnt<\@totalnumber %% >
   \advance \@authorcnt \@ne
    \@ifundefined{@breakauthorline\number\@authorcnt}%
    {\expandafter\gdef\csname @breakauthorline\number\@authorcnt\endcsname
     {\relax}}{\relax}%
  \repeat
}

\newcount\totalnumberm@ne

\def\@outputEauthorlist{%
 \let\noaffiskip\relax
 \let\paffiskip\relax
 \@authorcnt\z@
 \totalnumberm@ne\@totalnumber \advance \totalnumberm@ne -\@ne
  \loop\ifnum \@authorcnt < \@totalnumber %% >
   \advance \@authorcnt \@ne 
    \ifnum \@authorcnt < \totalnumberm@ne %% >
     \mbox{\csname @Eauthorname\number\@authorcnt\endcsname,} 
      \csname @breakauthorline\number\@authorcnt\endcsname
    \else
     \ifnum \@authorcnt = \@totalnumber
      \mbox{\csname @Eauthorname\number\@authorcnt\endcsname}% 
     \else
      \mbox{\csname @Eauthorname\number\@authorcnt\endcsname}\ 
%%     \ifnum \@totalnumber=\tw@\ \else , \fi
        \csname @breakauthorline\number\@authorcnt\endcsname
      {\itshape and\/} \ignorespaces 
     \fi
    \fi
  \repeat
}

\newcount\chk@alcnt
\if@paper
 \def\affiliate[#1]#2#3{%
  \advance \chk@alcnt \@ne
  \@ifundefined{al@#1}%
   {\expandafter\def\csname al@#1\endcsname{1}%
    \jrsj@warning{Check the "#1" label, it does not correspond to
      ^^J\space\space any labels in \string\authorentry\space command}%
   }{}%
  \protected@xdef\@jaffiliate{\@jaffiliate
    \protect\footnotetext[\csname al@#1\endcsname]{#2}}%
  \protected@xdef\@eaffiliate{\@eaffiliate
    \protect\footnotetext[\csname al@#1\endcsname]{#3}}%
 }
\else
 \def\affiliate[#1]#2#3#4#5{%
  \advance \chk@alcnt \@ne
  \@ifundefined{al@#1}%
   {\expandafter\def\csname al@#1\endcsname{1}%
    \jrsj@warning{Check the "#1" label, it does not correspond to
      ^^J\space\space any labels in \string\authorentry\space command}%
   }{}%
  \protected@xdef\@jaffiliate{\@jaffiliate
    \mbox{$^{\protect\@fnsymbol{\csname al@#1\endcsname}}$\kern\z@ #2}%
     \hskip1zw}%
  \protected@xdef\@eaffiliate{\@eaffiliate
    \mbox{$^{\protect\@fnsymbol{\csname al@#1\endcsname}}$\kern\z@ #3}%
     \hskip1zw}%
  \protected@xdef\@jaffiaddress{\@jaffiaddress
    \protect\footnotetext[\csname al@#1\endcsname]{#4}}%
  \protected@xdef\@eaffiaddress{\@eaffiaddress
    \protect\footnotetext[\csname al@#1\endcsname]{#5}}%
 }
 \def\@jaffiaddress{}
 \def\@eaffiaddress{}
\fi
\def\@jaffiliate{}
\def\@eaffiliate{}

\def\@outputhead@Ean{%
 \@authorcnt\z@
  \loop\ifnum \@authorcnt<\@totalnumber %% >
   \advance \@authorcnt \@ne
   \xdef\tmp@hd{\tmp@hd
    \csname head@Ean\number\@authorcnt\endcsname\hskip\@headnamesep}%
  \repeat
}

\def\@outputhead@Jan#1{%
 \@authorcnt\z@
  \loop\ifnum \@authorcnt<\@totalnumber %% >
   \advance \@authorcnt \@ne
   \xdef\tmp@hd{\tmp@hd
    \csname #1head@Jan\number\@authorcnt\endcsname\hskip2zw}%
  \repeat
}
\def\tmp@hd{}

\def\maketitle{\par
 \if@english
  \@outputhead@Ean
  \setbox0\hbox{\tmp@hd\unskip}%
  \ifdim\wd0>160mm
   \let\tmp@hd\@empty
   \@headnamesep2.5mm
   \@outputhead@Ean
   \setbox0\hbox{\tmp@hd\unskip}%
   \ifdim\wd0>160mm
    \edef\head@authors{\csname head@Ean1\endcsname\ et.\ al.}%
   \else
    \def\head@authors{\tmp@hd\unskip}%
   \fi
  \else
   \def\head@authors{\tmp@hd\unskip}%
  \fi
 \else
  \@outputhead@Jan{L}%
  \setbox0\hbox{\tmp@hd\unskip}%
  \ifdim\wd0>160mm
   \let\tmp@hd\@empty
   \@outputhead@Jan{S}%
   \setbox0\hbox{\tmp@hd\unskip}%
   \ifdim\wd0>160mm
    \let\tmp@hd\@empty
    \@headnamesep\z@
    \@outputhead@Jan{S}%
    \setbox0\hbox{\tmp@hd\unskip}%
    \ifdim\wd0>160mm
     \edef\head@authors{\csname Shead@Jan1\endcsname\hskip1zw ほか}%%
    \else
     \def\head@authors{\tmp@hd\unskip}%
    \fi
   \else
    \def\head@authors{\tmp@hd\unskip}%
   \fi
  \else
   \def\head@authors{\tmp@hd\unskip}%
  \fi
 \fi
 \ifnum\chk@alcnt < \@alcnt %% >
  \jrsj@warning{some informations of \string\affiliate\space is not assigned}%
 \fi
 \begingroup
  \ifnum\chk@alcnt=\@ne
   \def\@fnsymbol##1{\ifcase##1\or *\else\fi}%
  \else
   \def\@fnsymbol##1{\ifcase##1\or
    *1\or *2\or *3\or *4\or *5\or
    *6\or *7\or *8\or *9\or *10\or
    *11\or *12\else\@ctrerr\fi}%
  \fi
%%
  \parindent\z@
  \if@paper
   \let\@maketitle\p@maketitle
  \else
   \let\@maketitle\a@maketitle
  \fi
  \twocolumn[\@maketitle]%
  \thispagestyle{JRSJ}%
  \@received
  \if@paper
   \if@english
   \else
    \@jaffiliate
   \fi
   \@eaffiliate
  \else
   \@keyword
   \if@english
   \else
    \@jaffiaddress
   \fi
   \@eaffiaddress
  \fi
 \endgroup
  \setcounter{footnote}{0}%
  \global\let\maketitle\relax
  \global\let\@title\@empty
  \global\let\title\relax
%%
%%  \let\breakauthorline\relax
  \@authorcnt\z@
  \loop\ifnum \the\@authorcnt<\@totalnumber %% >
   \advance \@authorcnt \@ne
    \expandafter\let\csname @Jauthorname\number\@authorcnt\endcsname\relax
    \expandafter\let\csname @Eauthorname\number\@authorcnt\endcsname\relax
  \repeat
}

\def\calc@ht#1{%
 \setbox0\hbox{\parbox{\textwidth}{\centering #1}}%
 \@tempdimb\ht0
 \advance \@tempdimb \dp0
 \divide \@tempdimb \baselineskip
 \@tempcntb=\@tempdimb
}

\def\calc@eauthorbox#1{%
 \if@bkal
  \setbox0\hbox{\parbox{\textwidth}{\centering #1}}%
  \@tempdimb\ht0
  \advance \@tempdimb \dp0
  \divide \@tempdimb \baselineskip
  \@tempcntb=\@tempdimb
 \else
  \@tempcntb\z@
  \setbox0\hbox{#1}%
  \@tempdimb\wd0
  \loop
   \ifdim\@tempdimb>\textwidth
   \advance \@tempdimb -\textwidth
   \advance \@tempcntb \@ne
  \repeat
   \ifnum\@tempcntb=\z@
   \else
    \advance \@tempdimb -\textwidth
    \advance \@tempcntb \@ne
    \multiply \@tempcntb \tw@
    \divide \@tempdimb \@tempcntb
    \setbox0\vbox{\hsize\textwidth
     \hyphenpenalty\@M
     \everypar{\hskip\z@ plus -1fil}%
     \leftskip-.5\@tempdimb plus .5fil minus -.3\@tempdimb
     \rightskip-.5\@tempdimb plus -.5fil minus .3\@tempdimb %%
     #1}%
   \fi
  \@tempdimb\ht0
  \advance \@tempdimb \dp0
  \divide \@tempdimb \baselineskip
  \@tempcntb=\@tempdimb
 \fi
}

\def\p@maketitle{%
 \setbox\@tempboxa\vbox{\hsize\textwidth
  \vbox to 2\Cvs{% 
   \type@deco
   \vss
  }\par
  \nointerlineskip
  \vskip.5\baselineskip
%%% title
  \bgroup
   \title@font
   \calc@ht{\title@font\@title
    \ifx\@subtitle\@empty\else \\[3mm]{\subtitle@font\@subtitle\endgraf}\fi}% 
   \@tempcnta=3\relax
   \advance \@tempcnta \@tempcntb
   \vbox to \@tempcnta\Cvs{%
    \vss
    \leavevmode\box0
    \vss
   }\par
   \nointerlineskip
  \egroup
%%% jauthor
  \bgroup
   \if@english
   \else
    \jauthor@font
    \@outputJauthorlist
    \@tempcnta=3\relax
    \advance \@tempcnta \@tempcntb
    \vbox to \@tempcnta\Cvs{%
     \vss
     \centering
     \leavevmode\box0
     \vss
    }\par
    \nointerlineskip
   \fi
  \egroup
%%% etitle
  \bgroup
   \if@english
   \else
    \etitle@font
    \calc@ht{\etitle@font\@etitle
     \ifx\@esubtitle\@empty\else \\[1mm]
      {\esubtitle@font\@esubtitle\endgraf}\fi}% 
    \@tempcnta=3\relax
    \advance \@tempcnta \@tempcntb
    \vbox to \@tempcnta\Cvs{%
     \vss
     \leavevmode\box0
     \vss
    }\par
    \nointerlineskip
   \fi
  \egroup
%%% eauthor
  \if@english
   \vskip.5\baselineskip
  \fi
  \bgroup
   \eauthor@font
   \calc@eauthorbox{\@outputEauthorlist}%
   \@tempcnta=2\relax
   \advance \@tempcnta \@tempcntb
   \vbox to \@tempcnta\Cvs{% \hsize\textwidth
    \vss
    \centering
    \leavevmode\box0
    \vss
   }\par
   \nointerlineskip
   \onelineskip
%  \vskip2.5mm
  \egroup
%%% abstract and key words
  \centering
  \leavevmode
  \box\@abstractbox\par
  \nointerlineskip
  \vskip5.5mm
  \leavevmode
  \box\@keywordsbox\par
 }%
%%%% output head of paper type
  \@tempdima\ht\@tempboxa
  \advance \@tempdima \dp\@tempboxa
  \divide \@tempdima \Cvs
  \@tempcnta=\@tempdima
  \advance \@tempcnta \tw@
  {\newpage\null
   \boxmaxdepth\z@
   \lineskiplimit\z@
   \lineskip\z@
   \vbox to \@tempcnta\Cvs{%
    \box\@tempboxa
   \vss}%
  }\par
 \vskip\@t@h@a
}

\def\type@deco{%
 \bgroup
  \Large\bfseries
  \setbox\@tempboxb\hbox{\if@paper\@typeofpaper\else\@typeofarticle\fi}%
  \ifdim\wd\@tempboxb<2.5zw %% >
   \def\tmp@type{%
    \if@paper
     \hskip3mm\kintou{3zw}{\@typeofpaper}\hskip3mm
    \else
     \hskip1.5mm\kintou{3zw}{\@typeofarticle}\hskip1.5mm
    \fi
   }%
  \else
   \def\tmp@type{\hskip1.5mm
    \if@paper\@typeofpaper\else\@typeofarticle\fi
    \hskip1.5mm}%
  \fi
  \setbox\@tempboxb\hbox{%
   \fboxrule.1mm\fboxsep.3mm
   \fbox{\fboxrule.4mm\fboxsep\z@
    \fbox{\hbox{\tmp@type\rule[-1.2mm]{0mm}{5.75mm}}}}%
  }%
  \@tempdimb\textwidth
  \advance \@tempdimb -\wd\@tempboxb
  \leavevmode\box\@tempboxb
  \if@paper
   \rlap{\rule[1.8mm]{\@tempdimb}{0.1mm}}\rule[1.2mm]{\@tempdimb}{0.1mm}%
  \else
   \IfFileExists{rsjarrow.eps}%
    {\hbox to \@tempdimb{\xleaders\hbox{%
      \scalebox{.25}{\includegraphics{rsjarrow.eps}}}\hfil}}%
    {\raise.75mm\hbox to \@tempdimb{%
      \xleaders\hbox{\scriptsize\normalfont ←}\hfil}}%
  \fi
 \egroup
}

\if@paper
 \def\title@font{\LARGE\bfseries}
 \def\subtitle@font{\fontsize{14.4}{24H}\selectfont\bfseries}
 \def\jauthor@font{\large\normalfont}
 %\if@english\else
  \def\etitle@font{\large\bfseries}
  \def\esubtitle@font{\normalsize\bfseries}
 %\fi
 \def\eauthor@font{\normalfont\fontsize{10}{21H}\selectfont}
\else
 \def\title@font{\LARGE\bfseries}
 \def\subtitle@font{\fontsize{14.4}{22H}\selectfont\bfseries}
 \def\jauthor@font{\large\normalfont\baselineskip18H}
 %\if@english\else
  \def\etitle@font{\small}
  \def\esubtitle@font{\footnotesize}
 %\fi
 \def\eauthor@font{\footnotesize\normalfont}
\fi

\def\si@font{\large}
\def\specialissue#1{\gdef\@specialissue{#1}}
\def\@specialissue{}

\def\fmt@ana[#1]#2#3{%
 \bgroup
  \setbox\@tempboxb\hbox{{#2}\hskip3mm{#3}}%
  \ifdim\wd\@tempboxb<\textwidth %% >
   \leavevmode\box\@tempboxb\par
  \else
   \if#1j\relax
    {#2\par}%
    \vskip.5mm
    {#3\par}
   \else
    {#2\par}%
    \vskip.25mm
    {#3\par}
   \fi
  \fi
 \egroup
}

\def\a@maketitle{%
 \setbox\@tempboxa\vbox{\hsize\textwidth
  \vbox to 2\Cvs{%
   \type@deco
   \vss 
  }\par
  \nointerlineskip
  \vskip-.5mm
  \bgroup
   \leftskip12mm
   \ifx\@specialissue\@empty\else
    {\si@font \inhibitglue 〈\@specialissue 〉\inhibitglue\par}%
    \nointerlineskip
    \vskip2mm
   \fi
   {\title@font \@title\par}%
   \nointerlineskip
   \vskip2.25mm
   \ifx\@subtitle\@empty\else
    {\subtitle@font \@subtitle\par}%
    \nointerlineskip
    \vskip2mm
   \fi
   \if@english\else
    {\etitle@font \@etitle\par}%
    \nointerlineskip
    \ifx\@esubtitle\@empty\else
     \vskip1mm
     {\esubtitle@font \@esubtitle\par}%
     \nointerlineskip
    \fi
    \vskip2mm
   \fi
  \egroup
   \vss
  \bgroup
   \parindent\z@
   \raggedleft
   \ifnum\@totalnumber<4\relax %% >  \spaceskip いるか?
    \if@english
     \fmt@ana[e]{\jauthor@font \@outputEauthorlist\unskip}
		{\scriptsize \@eaffiliate\unskip}%
    \else
     \fmt@ana[j]{\jauthor@font \@outputAauthorlist\unskip}%
		{\scriptsize \@jaffiliate\unskip}%
     \nointerlineskip
     \vskip1.5mm
     \fmt@ana[e]{\eauthor@font \@outputEauthorlist\unskip}
		{\fontsize{6}{7}\selectfont \@eaffiliate\unskip}%
    \fi
   \else
    \if@english
     {\jauthor@font \@outputEauthorlist\unskip\par}%
     \vskip.25mm
     {\scriptsize \@eaffiliate\unskip\par}%
    \else
     {\jauthor@font \@outputAauthorlist\unskip\par}%
     \vskip.5mm
     {\scriptsize \@jaffiliate\unskip\par}%
     \vskip.5mm
     {\eauthor@font \@outputEauthorlist\unskip\par}%
     \vskip.25mm
     {\fontsize{6}{7}\selectfont \@eaffiliate\unskip\par}%
    \fi
   \fi
   \nointerlineskip
   \vskip1.75mm
  \egroup
   \IfFileExists{rsjarrow.eps}%
    {\hbox to \textwidth{\xleaders\hbox{%
      \scalebox{.25}{\includegraphics{rsjarrow.eps}}}\hfil}}%
    {\hbox to \textwidth{\xleaders\hbox{\scriptsize\mcfamily ←}\hfil}}%
 }%
%%%% output head of article type
  \@tempdima\ht\@tempboxa
  \advance \@tempdima \dp\@tempboxa
  \divide \@tempdima \Cvs
  \@tempcnta=\@tempdima
  \advance \@tempcnta \tw@
  \ifnum\@tempcnta<10\relax
   \@tempcnta10\relax\fi
  {\newpage\null
   \boxmaxdepth\z@
   \lineskiplimit\z@
   \lineskip\z@
   \vbox to \@tempcnta\Cvs{%
    \unvbox\@tempboxa
    \vskip5mm
   }%
  }\par
 \vskip\@t@h@a
}

\def\titleheightadj#1{\gdef\@t@h@a{#1}}
\def\@t@h@a{}
\titleheightadj{0mm}

\def\received#1{%
 \def\@received{%
  \footnotetext[0]{原稿受付\hskip1zw #1}%
 }
}
\def\@received{}

\setcounter{secnumdepth}{3}

%% \newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]

%% \renewcommand{\thepart}{\@Roman\c@part}
\renewcommand{\thesection}{\@arabic\c@section}
\renewcommand{\thesubsection}{\thesection.\,\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{\thesubsection.\,\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{\thesubsubsection.\,\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{\theparagraph.\,\@arabic\c@subparagraph}

\def\@afterheading{%
 \global\@nobreaktrue
 \everypar{%
  \if@nobreak
   \global\@nobreakfalse
   \clubpenalty \z@
    \if@afterindent
    \else
     {\setbox\z@=\lastbox}%
    \fi
  \else
   \clubpenalty\@clubpenalty
   \everypar{}%
  \fi}%
}

%% from ipsjpaper.sty
\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
   \par \@tempskipa #4\relax
   \@afterindenttrue
   \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
   \if@nobreak
    \everypar{}%
   \else
    \addpenalty\@secpenalty
     \ifnum #2=\@ne
       \vskip-\prevdepth \prevdepth\z@ \vskip\Cvs
       \advance\@tempskipa-\Cvs \vspace*{\@tempskipa}%
     \else
      \addvspace\@tempskipa
     \fi
   \fi
 \@ifstar{\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

%% \@sect{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}[ARG1]{ARG2}
\def\@sect#1#2#3#4#5#6[#7]#8{%
 \ifnum #2>\c@secnumdepth
  \let\@svsec\@empty
 \else
  \refstepcounter{#1}%
  \protected@edef\@svsec{\@seccntformat{#1}\relax}%
 \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa<\z@ % >
   \def\@svsechd{%
    #6{\hskip #3\relax
     \@svsec\inhibitglue #8}%
   }%
  \else
   \begingroup
    #6{%
     \ifnum#2=\@ne
      \noindent
      \sec@fmt{\inhibitglue #8}%
     \else
      \@hangfrom{\hskip #3\relax\@svsec}%
       \interlinepenalty\@M\inhibitglue #8\@@par
     \fi
    }%
   \endgroup
  \fi
  \@xsect{#5}}

\def\@seccntformat#1{\csname the#1\endcsname
 \csname dotafter@#1\endcsname\hskip1zw}
\def\dotafter@section{.}

\newcount\@tmpfncnt
\def\sec@fmt#1{%
 \@tmpfncnt\c@footnote
 \setbox\@tempboxa\hbox{\@svsec\shortstack{#1}}%
 \c@footnote\@tmpfncnt
 \if@english
  \ifdim \wd\@tempboxa<\hsize % >
   \hfil \parbox{\wd\@tempboxa}{\@hangfrom{\@svsec}#1}\@@par
  \else
   \@hangfrom{\@svsec}\interlinepenalty\@M #1\@@par
  \fi
 \else
  \ifdim \wd\@tempboxa<\hsize % >
   \setbox\@tempboxb\hbox{#1}% 
   \c@footnote\@tmpfncnt
   \ifdim\wd\@tempboxb<6.5zw % >
    \def\@makefnmark{\hbox to \z@{\@textsuperscript{\normalfont
     \@thefnmark}\hss}}%
    \hfil
    \@svsec\kintou{7zw}{#1\hfil}%
   \else
    \hfil \parbox{\wd\@tempboxa}{\@hangfrom{\@svsec}#1}\@@par
   \fi
  \else
   \@hangfrom{\@svsec}\interlinepenalty\@M #1\@@par
  \fi
 \fi
}

%% \@ssect{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}{ARG} ==
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa<\z@ % >
   \def\@svsechd{#4{\hskip #1\relax\inhibitglue #5}}%
  \else
   \begingroup
    #4{% <
     \ifdim \@tempskipa>\z@
      \let\@svsec\@empty
      \noindent
      \sec@fmt{\inhibitglue #5}%
     \else
      \@hangfrom{\hskip #1}%
       \interlinepenalty\@M\inhibitglue #5\@@par
     \fi
    }%
   \endgroup
  \fi
  \@xsect{#3}}

\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa<\z@ % >
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \else
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \fi
  \ignorespaces}

\if@paper
 \def\sec@font{\normalsize\bfseries}
 \def\subsec@font{\small\bfseries}
 \def\subsubsec@font{\small}
 \def\para@font{\small\bfseries}
 \def\subpara@font{\small\bfseries}
\else
 \DeclareFixedFont{\KFsec}{JY1}{gt}{m}{n}{14\@JQ}
 \def\sec@font{\normalsize\bfseries\KFsec}
 \def\subsec@font{\normalsize\bfseries}
 \def\subsubsec@font{\normalsize}
 \def\para@font{\normalsize\bfseries}
 \def\subpara@font{\normalsize\bfseries}
\fi

\newcommand{\section}{\@startsection{section}{1}{\z@}%
   {.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
   {.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
   {\reset@font\sec@font}}
\newcommand{\subsection}{\@startsection{subsection}{2}{1zw}%
   {\z@ \@plus.3\Cdp \@minus.1\Cdp}%
   {\z@ \@plus.3\Cdp \@minus.1\Cdp}%
   {\reset@font\subsec@font}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{1zw}%
   {\z@ \@plus.3\Cdp \@minus.1\Cdp}%
   {\z@ \@plus.3\Cdp \@minus.1\Cdp}%
   {\reset@font\subsubsec@font}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{1zw}%
   {\z@ \@plus.3\Cdp \@minus.1\Cdp}%
   {\z@ \@plus.3\Cdp \@minus.1\Cdp}%
   {\reset@font\para@font}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{1zw}%
   {\z@ \@plus.3\Cdp \@minus.1\Cdp}%
   {\z@ \@plus.3\Cdp \@minus.1\Cdp}%
   {\reset@font\subpara@font}}

\newcommand{\appendix}{\par
 \setcounter{section}{0}%
 \setcounter{subsection}{0}%
 \renewcommand{\thesection}{\appendixname‾\@Alph\c@section}
 \renewcommand{\thesubsection}{\thesection.\,\@arabic\c@subsection}
 \renewcommand{\thesubsubsection}{\thesubsection.\,\@arabic\c@subsubsection}
 \setcounter{equation}{0}%
 \renewcommand{\theequation}{\@Alph\c@section.\@arabic\c@equation}
% \setcounter{figure}{0}%
% \setcounter{table}{0}%
% \renewcommand{\thefigure}{\@arabic\c@figure}
% \renewcommand{\thetable}{\@arabic\c@table}
}

\if@twocolumn
  \setlength\leftmargini {2zw}
\else
  \setlength\leftmargini {2zw}
\fi
\setlength\leftmarginii  {2zw}
\setlength\leftmarginiii {2zw}
\setlength\leftmarginiv  {2zw}
\if@twocolumn
  \setlength\leftmarginv {1zw}
  \setlength\leftmarginvi{1zw}
\else
  \setlength\leftmarginv {1zw}
  \setlength\leftmarginvi{1zw}
\fi
\setlength  \labelsep  {.5zw}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
\newcommand{\labelenumi}{\inhibitglue （\theenumi ）\inhibitglue}
\newcommand{\labelenumii}{\inhibitglue （\theenumii ）\inhibitglue}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

\renewenvironment{enumerate}
  {\ifnum \@enumdepth >\thr@@\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
    \topsep\z@\partopsep\z@\parsep\z@\itemsep\z@
     \labelwidth1.5zw
     \labelsep.5zw
     \ifnum \@enumdepth=\@ne \leftmargin1zw\relax
      \else\leftmargin\leftskip\fi
     \advance\leftmargin 1zw
     \listparindent1zw
     \usecounter{\@enumctr}%
     \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

\newcommand{\labelitemi}{%
 \if@english \textbullet\else
  \leavevmode\raise.1zh\hbox to 1zw{\hss\textbullet\hss}\fi}
\newcommand{\labelitemii}{{\normalfont\bfseries
 \if@english \textendash\else
  \leavevmode\raise.1zh\hbox to 1zw{\hss \textendash\hss}\fi}}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}

\renewenvironment{itemize}
  {\ifnum \@itemdepth >\thr@@\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{%
    \topsep\z@\partopsep\z@\parsep\z@\itemsep\z@
    \labelwidth1zw
    \labelsep\z@
    \leftmargin2zw
    \listparindent1zw
    \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@
     \topsep\z@\partopsep\z@\parsep\z@
   \fi
           \let\makelabel\descriptionlabel}}{\endlist}
\newcommand{\descriptionlabel}[1]{%
   \hspace\labelsep\normalfont\bfseries #1}

\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@ \itemindent -2zw
           \listparindent\itemindent
           \rightmargin\leftmargin \advance\leftmargin 2zw}%
           \item\relax}{\endlist}
\newenvironment{quotation}
  {\list{}{\listparindent 2zw
           \itemindent\listparindent
           \rightmargin\z@
           \topsep\z@\partopsep\z@\parsep\z@\itemsep\z@
           }%
           \item\relax}{\endlist}
\newenvironment{quote}
  {\list{}{\rightmargin\leftmargin
           \topsep\z@\partopsep\z@\parsep\z@\itemsep\z@
           }%
           \item\relax}{\endlist}

\newdimen\verbatimleftmargin
  \verbatimleftmargin\z@
\newdimen\verbatimbaselineskip
  \verbatimbaselineskip\Cvs
\if@paper
 \def\verbatimsize{\small}
\else
 \def\verbatimsize{\normalsize}
\fi

\def\@verbatim{%
 \topsep\z@\partopsep\z@\parsep\z@\itemsep\z@
 \trivlist \item\relax
  \if@minipage\else
   \vskip\baselineskip
   \vskip-\verbatimbaselineskip
  \fi
  \leftskip\@totalleftmargin
  \if@minipage\else
   \advance \leftskip by \verbatimleftmargin
  \fi
  \rightskip\z@skip
  \parindent\z@\parfillskip\@flushglue\parskip\z@skip
  \@@par
  \@tempswafalse
  \def\par{%
    \if@tempswa
      \leavevmode \null \@@par\penalty\interlinepenalty
    \else
      \@tempswatrue
      \ifhmode\@@par\penalty\interlinepenalty\fi
    \fi}%
  \let\do\@makeother \dospecials
  \obeylines 
   \verbatimsize \baselineskip\verbatimbaselineskip
   \ttfamily \@noligs
  \everypar \expandafter{\the\everypar \unpenalty}%
}

\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
%% \def\ext@figure{lof}
\def\fnum@figure{\figurename\thefigure}
\newenvironment{figure}
               {\floatenv\capwidth\hsize
                \abovecaptionskip3pt\belowcaptionskip\z@\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\floatenv\capwidth.66\textwidth
                \abovecaptionskip3pt\belowcaptionskip\z@\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
%% \def\ext@table{lot}
\def\fnum@table{\tablename\thetable}
\newenvironment{table}
               {\floatenv\capwidth\hsize
                \abovecaptionskip\z@\belowcaptionskip5pt\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\floatenv\capwidth.66\textwidth
                \abovecaptionskip\z@\belowcaptionskip5pt\@dblfloat{table}}
               {\end@dblfloat}

\def\@floatboxreset{%
  \reset@font
  \footnotesize\tabcolsep.5zw
  \if@paper\else
   \if@english
    \def\arraystretch{1.077}%% 14/13
   \else
    \def\arraystretch{1.23}%% 16/13
   \fi
  \fi
  \@setminipage
}

\def\floatenv{\let\center\Center
 \def\verbatimsize{\footnotesize}%
}

\def\Center{\topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
  \trivlist \centering\item\relax}
\def\endCenter{\endtrivlist}

\long\def\@caption#1[#2]#3{\par
%% \addcontentsline{\csname ext@#1\endcsname}{#1}%
%%  {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
 \begingroup
  \@parboxrestore
  \if@minipage
   \@setminipage
  \fi
   \if@paper\footnotesize\else\small\fi
   \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
 \endgroup}

\newlength\abovecaptionskip
\newlength\belowcaptionskip

\newdimen\capwidth
\newbox\@tempboxb
\long\def\@makecaption#1#2{%
 \vskip\abovecaptionskip
 \setbox\@tempboxa\hbox{{\bfseries #1}\hskip1zw\shortstack[l]{#2}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
 \setbox\@tempboxb\hbox{\bfseries #1\hskip1zw}%
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\hangindent\wd\@tempboxb 
    {\bfseries #1}\hskip1zw\inhibitglue #2}%
  \else
   \hfil\parbox[t]{\wd\@tempboxa}{\hangindent\wd\@tempboxb 
    {\bfseries #1}\hskip1zw\inhibitglue #2}%
  \fi
 \else
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\hangindent\wd\@tempboxb 
    {\bfseries #1}\hskip1zw\inhibitglue #2}%
  \else
   \hbox to \hsize{\hss\box\@tempboxa\hss}%
  \fi
 \fi
 \vspace{\belowcaptionskip}%
}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{.5zw}
\setlength\arrayrulewidth{.12mm}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{1zw}% \labelsep
\skip\@mpfootins = \skip\footins

\setlength\fboxsep{.5mm}
\setlength\fboxrule{.12mm}
\renewcommand{\theequation}{\@arabic\c@equation}

%% for 2.1.4 compatibility
\@ifundefined{reDeclareMathAlphabet}{%
 \def\reDeclareMathAlphabet#1#2#3{%
  \DeclareRobustCommand{#1}[1]{%
    \ifmmode
      \ifx\math@bgroup\@empty % 2.09 compatibility
        #2\relax#3\relax##1\relax
      \else % native mode
        \ifx\math@bgroup\relax % oldstyle
          #2\relax\@fontswitch\relax{#3}##1\relax
        \else
          #2{#3{##1}}%
        \fi
      \fi
    \else
      #2{##1}%
    \fi
  }%
 }%
 \@onlypreamble\reDeclareMathAlphabet
 }{}

\if@NTT\else
 \if@enablejfam
   \DeclareSymbolFont{mincho}{JY1}{mc}{m}{n}
   \DeclareSymbolFontAlphabet{\mathmc}{mincho}
   \SetSymbolFont{mincho}{bold}{JY1}{gt}{m}{n}
   \DeclareMathAlphabet{\mathgt}{JY1}{gt}{m}{n}
   \reDeclareMathAlphabet{\mathrm}{\@mathrm}{\@mathmc}
   \reDeclareMathAlphabet{\mathbf}{\@mathbf}{\@mathgt}
   \jfam\symmincho
 \else
   \DeclareRobustCommand{\mathmc}{%
     \@latex@error{Command \noexpand\mathmc invalid with\space
	`disablejfam' class option.}\@eha
   }
   \DeclareRobustCommand{\mathgt}{%
     \@latex@error{Command \noexpand\mathgt invalid with\space
	`disablejfam' class option.}\@eha
   }
 \fi
\fi

\if@NTT\else
 \DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
 \DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\fi
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}

\newenvironment{thebibliography}[1]
 {\section*{\normalsize\refname}%
   \scriptsize\baselineskip14H
   \list{% \@biblabel{\@arabic\c@enumiv}
         \ifnum #1>99\relax
          \setbox0\hbox{#1}\else
           \setbox0\hbox{99}\fi
         \hbox to 3zw{\hss
          [\hbox to \wd0{\hss \@arabic\c@enumiv\hss}]\hskip.5zw}%
        }%
        {\labelwidth3zw
         \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
         \leftmargin3zw
         \labelsep\z@
         \listparindent1zw
         \itemindent\z@
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}
   }%
   \sloppy
   \clubpenalty-100\relax
   \@clubpenalty\clubpenalty
   \widowpenalty-100\relax
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\let\@openbib@code\@empty

\def\@biblabel#1{[#1]}

%% from "citesort.sty", with a little customized
\newcount\@minsofar
\newcount\@min
\newcount\@cite@temp
\def\@citex[#1]#2{%
\if@filesw \immediate \write \@auxout {\string \citation {#2}}\fi
\@tempcntb\m@ne \let\@h@ld\relax \def\@citea{}%
\@min\m@ne%
\@cite{%
  \@for \@citeb:=#2\do {\@ifundefined {b@\@citeb}%
    {\@h@ld\@citea\@tempcntb\m@ne{\bfseries ?}%
    \@warning {Citation `\@citeb ' on page \thepage \space undefined}}%
{\@minsofar\z@ \@for \@scan@cites:=#2\do {%
  \@ifundefined{b@\@scan@cites}%
    {\@cite@temp\m@ne}
    {\@cite@temp\number\csname b@\@scan@cites \endcsname \relax}%
\ifnum\@cite@temp > \@min% select the next one to list
    \ifnum\@minsofar = \z@
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\else
    \ifnum\@cite@temp < \@minsofar
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\fi\fi\fi}\@tempcnta\@min
  \ifnum\@minsofar > \z@ % some more
    \advance\@tempcnta\@ne
    \@min\@minsofar
    \ifnum\@tempcnta=\@minsofar %   Number follows previous--hold on to it
      \ifx\@h@ld\relax
       \edef \@h@ld{\@citea\csname b@\@scan@copy\endcsname}%
      \else
       \edef\@h@ld{% [
        \ifmmode{]\mbox{〜}[}\else]〜[% ]
         \fi
         \csname b@\@scan@copy\endcsname}%
      \fi
    \else \@h@ld\@citea\csname b@\@scan@copy\endcsname
          \let\@h@ld\relax
  \fi % no more
\fi}%
\def\@citea{]\,\penalty\@highpenalty[}}\@h@ld}{#1}}
%% end of citesort.sty

%% from "cite.sty", with a little modified
\def\@cite#1#2{\leavevmode\unskip
  \ifnum\lastpenalty=\z@\penalty\@highpenalty\fi% highpenalty before
  \,[{\multiply\@highpenalty 3 #1%             % triple-highpenalties within
      \if@tempswa,\penalty\@highpenalty\ #2\fi % and before note.
    }]\spacefactor\@m}
%% end of cite.sty


\def\biography{\par
 \global\@tempswatrue
%% from latex.ltx 
 \def\smash{%
  \relax % \relax, in case this comes first in \halign
  \ifmmode
    \expandafter\mathpalette\expandafter\mathsm@sh
  \else
    \expandafter\makesm@sh
  \fi}
 \def\makesm@sh##1{%
  \setbox\z@\hbox{\color@begingroup##1\color@endgroup}\finsm@sh}
 \def\mathsm@sh##1##2{%
  \setbox\z@\hbox{$\m@th##1{##2}$}\finsm@sh}
 \def\finsm@sh{\ht\z@\z@ \dp\z@\z@ \box\z@}
}
\def\endbiography{\par}

\if@paper
 \long\def\profile#1#2#3{\par
  \footnotesize\baselineskip15H
  \parindent\z@
  \unitlength1mm
  \if@tempswa
   \vskip3mm
   \hrule height2.1mm depth-2mm
   \nopagebreak[4]
   \vskip2mm
   \nopagebreak[4]
  \else
   \vspace{4mm}
   \vspace*{-6mm}
  \fi
  \setbox\@tempboxa\hbox{%
   \begin{minipage}[t]{\columnwidth}
    \smash{\rlap{%
     \begin{picture}(20,24)
      \put(0,-25){\framebox(20,24){\null}}
     \end{picture}}}%
    \hangindent22mm\hangafter-7\relax
    {\small\gtfamily\rule[-2mm]{0mm}{4mm}#2\inhibitglue}\hfil\break % 1.0a
     #3\csname #1@mbrship\endcsname
   \end{minipage}%
  }%
  \@tempdima\ht\@tempboxa
  \advance \@tempdima \dp\@tempboxa
  \ifdim \@tempdima < 24.5mm %% >
   \vbox{\rule[-28mm]{0mm}{24mm}%
    \box\@tempboxa
   }\par
  \else
   \smash{\rlap{%
    \begin{picture}(20,24)
     \put(0,-25){\framebox(20,24){\null}}
    \end{picture}%
   }}%
   \hangindent22mm\hangafter-7\relax
   {\small\gtfamily\rule[-2mm]{0mm}{4mm}#2\inhibitglue}\hfil\break % 1.0a
   #3\csname #1@mbrship\endcsname\par
  \fi
  \@tempswafalse
 }
\else
 \long\def\profile#1#2#3{%
  \small\baselineskip15H
  \parindent\z@
  \unitlength1mm
  \if@tempswa
   \vskip3mm
   \hrule height2.1mm depth-2mm
   \nopagebreak[4]
   \vskip2mm
   \nopagebreak[4]
  \else
   \vspace{4mm}
   \vspace*{-6mm}
  \fi
  \setbox\@tempboxa\hbox{%
   \begin{minipage}[t]{\columnwidth}
    \smash{\rlap{%
     \begin{picture}(20,25)
      \put(0,-26){\framebox(20,25){\null}}
     \end{picture}%
    }}%
    \hangindent24mm\hangafter-7\relax
    {\normalsize\gtfamily\rule[-2mm]{0mm}{4mm}#2}\hfil\break % 1.0a
    #3\csname #1@mbrship\endcsname
   \end{minipage}%
  }%
  \@tempdima=\ht\@tempboxa
  \advance \@tempdima \dp\@tempboxa
  \ifdim\@tempdima<25.5mm
   \vbox{\rule[-29mm]{0mm}{25mm}%
    \box\@tempboxa
   }\par
  \else
   \smash{\rlap{%
    \begin{picture}(20,25)
     \put(0,-26){\framebox(20,25){\null}}
    \end{picture}%
   }}%
   \hangindent24mm\hangafter-7\relax
   {\normalsize\gtfamily\rule[-2mm]{0mm}{4mm}#2}\hfil\break % 1.0a
   #3\csname #1@mbrship\endcsname\par
  \fi
  \@tempswafalse
 }
\fi

\def\m@mbrship{\unskip\nobreak\hfil\penalty50
 \hskip1zw\hbox{}\nobreak\hfil 
 \inhibitglue （日本ロボット学会正会員）\inhibitglue
 \parfillskip\z@ \finalhyphendemerits\z@\par
}

\def\s@mbrship{\unskip\nobreak\hfil\penalty50
 \hskip1zw\hbox{}\nobreak\hfil 
 \inhibitglue （日本ロボット学会学生会員）\inhibitglue
 \parfillskip\z@ \finalhyphendemerits\z@\par
}

% \let\n@mbrship\relax

\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width \columnwidth
  \kern 2.6\p@}

\def\thefootnote{\fnsymbol{footnote}}

\def\@fnsymbol#1{\ensuremath{\ifcase#1\or {\dagger}\or {\dagger}{\dagger}\or 
   {\dagger}{\dagger}{\dagger}\or \ddagger\or {\ddagger}{\ddagger}\or 
   {\ddagger}{\ddagger}{\ddagger}\or *\or **\or ***\else\@ctrerr\fi}}

\def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}

\newcommand\@makefntext[1]{%
 \if@paper\scriptsize\let\footnotesize\scriptsize\fi
 \everypar={\hangafter1\hangindent2zw}%
 \parindent2zw
 \noindent\hbox to 2zw{\hss\@makefnmark}#1}

\@addtoreset{footnote}{page}

\def\eqnarray{%
   \stepcounter{equation}%
   \def\@currentlabel{\p@equation\theequation}%
   \global\@eqnswtrue
   \m@th
   \global\@eqcnt\z@
   \tabskip\@centering
   \let\\\@eqncr
   $$\everycr{}\halign to\displaywidth\bgroup
       \hskip\@centering$\displaystyle\tabskip\z@skip{##}$\@eqnsel
      &\global\@eqcnt\@ne\hskip .8\arraycolsep \hfil${##}$\hfil %% \tw@
      &\global\@eqcnt\tw@ \hskip .8\arraycolsep                 %% 
         $\displaystyle{##}$\hfil\tabskip\@centering
      &\global\@eqcnt\thr@@ \hb@xt@\z@\bgroup\hss##\egroup
         \tabskip\z@skip
      \cr
}

\if@NTT
 \def\@eqnnum{{\normalfont\normalcolor
  \hskip-.5zw （\theequation ）\hskip.5zw}}
\else
 \def\@eqnnum{{\normalfont\normalcolor
  \inhibitglue （\theequation ）\inhibitglue\hskip1zw}}
\fi

\newif\if西暦 \西暦false
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\newcount\heisei \heisei\year \advance\heisei-1988\relax
\def\today{{%
  \iftdir
    \if西暦
      \kansuji\number\year 年
      \kansuji\number\month 月
      \kansuji\number\day 日
    \else
      平成\ifnum\heisei=1 元年\else\kansuji\number\heisei 年\fi
      \kansuji\number\month 月
      \kansuji\number\day 日
    \fi
  \else
    \if西暦
      \number\year‾年
      \number\month‾月
      \number\day‾日
    \else
      平成\ifnum\heisei=1 元年\else\number\heisei‾年\fi
      \number\month‾月
      \number\day‾日
    \fi
  \fi}}

\if@english
 \newcommand{\figurename}{Fig.\,}
 \newcommand{\tablename}{Table‾}
 \newcommand{\refname}{References}
 \newcommand{\appendixname}{Appendix}
\else
 \if@paper
  \newcommand{\figurename}{Fig.\,}
  \newcommand{\tablename}{Table‾}
 \else
  \newcommand{\figurename}{図}
  \newcommand{\tablename}{表}
 \fi
 \newcommand{\refname}{参　考　文　献}
 \newcommand{\appendixname}{付録}
\fi

\def\@begintheorem#1#2{%
 \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \labelsep1zw
 \trivlist
  \item[\hskip\labelsep{\bfseries #1\if@english\ \fi #2}]}
\def\@opargbegintheorem#1#2#3{%
 \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \labelsep1zw
 \trivlist
  \item[\hskip\labelsep{\bfseries #1\if@english\ \fi#2（#3）\inhibitglue}]}
\def\@endtheorem{\endtrivlist}

\def\acknowledgements{\par
 \if@english
  {\bfseries Acknowledgements}\hskip1em
 \else
  {\bfseries 謝辞}\hskip1zw
 \fi
 \ignorespaces}

\def\endacknowledgements{\par}

\def\onelineskip{\par\vspace{1\baselineskip}\par}
\def\halflineskip{\par\vspace{.5\baselineskip}\par}

\def\ddash{\hbox to 2zw{---\hss ---}}
\def\FRAC#1#2{\leavevmode\kern-.1em
  \raise.5ex\hbox{\the\scriptfont0 #1}\kern-.1em
  /\kern-.15em\lower.25ex\hbox{\the\scriptfont0 #2}}
\def\RN#1{\uppercase\expandafter{\romannumeral#1}}

\def\MARU#1{\raisebox{0.1zh}{{%
 \leavevmode\ooalign{\hfil\lower.168ex\hbox{#1}\hfil\crcr\mathhexbox20D}}}}

\def\kintou#1#2{%
 \leavevmode\hbox to #1{%
  \kanjiskip\z@ plus 1fill minus 1fill\xkanjiskip\kanjiskip #2}}

\def\ruby#1#2{\leavevmode \setbox0=\hbox{#1}\setbox1=\hbox{\tiny #2}%% <
 \ifdim\wd0>\wd1 \dimen0=\wd0 \else \dimen0=\wd1 \fi
 \hbox{\kanjiskip=\fill
 \vbox{\hbox to \dimen0{\tiny \hfil#2\hfil}%
  \nointerlineskip \hbox to \dimen0{\hfil#1\hfil}}}}

\def\QED{{\unskip\nobreak\hfil\penalty50
 \hskip1zw\hbox{}\nobreak\hfil \hbox{$\Box$\hskip1zw}
 \parfillskip\z@ \finalhyphendemerits\z@\par}}

\if@NTT\else
 \postbreakpenalty`（=10000
 \prebreakpenalty`）=10000
 \postbreakpenalty`［=10000
 \prebreakpenalty`］=10000
 \postbreakpenalty`〈=10000
 \prebreakpenalty`〉=10000
 \prebreakpenalty`"=10000
 \prebreakpenalty`℃=10000
 \prebreakpenalty`　=10000
 \prebreakpenalty`・=10000
 \prebreakpenalty`〜=10000
 \prebreakpenalty`ー=10000
 \prebreakpenalty`？=10000
 \prebreakpenalty`！=10000
 \postbreakpenalty"5C=10000
\fi

\def\sloppy{\tolerance9999\hbadness9999\hfuzz.5\p@ \vfuzz.5\p@}

\hbadness4000
\vbadness10001
\tolerance4000\pretolerance\m@ne
\clubpenalty\z@
\widowpenalty\z@
\displaywidowpenalty\z@
\interdisplaylinepenalty\z@ %%  100
\predisplaypenalty\z@       %% 1000

\AtBeginDocument{%
 \if@paper
  \small
 \fi
 \@ifundefined{maketag@@@}{}
  {%% \let\@mathmargin\mathindent %% (fleqn)
   \def\maketag@@@#1{\hbox{\m@th\normalfont #1\hskip1zw}}%
   \def\tagform@#1{%
    \maketag@@@{（\ignorespaces#1\unskip\@@italiccorr ）\inhibitglue}}%1.0a
%%   \multlinegap2zw %% (fleqn)
  }%
}

\AtEndDocument{%
 \label{jrsj@lastpage}%
}

\pagestyle{jrsj}
\pagenumbering{arabic}
% \raggedbottom
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\if@twoside
  \@mparswitchtrue
\else
  \@mparswitchfalse
\fi

\endinput
