\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icl-report}[Custom ICL Report Class]

% pass opts to base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{article}

% ==================== CORE PACKAGES ====================
% The packages essential for basic functionality

% Geometry - page layout
\RequirePackage[top=2.54cm,bottom=2.54cm,left=2.54cm,right=2.54cm]{geometry}

% Language support
\RequirePackage{polyglossia}
\setmainlanguage{english}

% Graphics
\RequirePackage{graphicx}
\RequirePackage[percent]{overpic}  % For overlaying text on images


% ==================== CUSTOM PACKAGES ====================
\RequirePackage{icl_tables}
\RequirePackage{icl_plotting}


% ==================== FONT CONFIGURATION ====================
\RequirePackage{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newcommand{\inter}{Inter}
\newcommand{\sfpro}{SF Pro}
\newcommand{\firamath}{Fira Math}
\newcommand{\firacode}{Fira Code}

\defaultfontfeatures[Inter]{
  Path=fonts/,
  Extension=.ttf,
  FontFace={ul}{n}{Font={*-Thin}},
  FontFace={ul}{it}{Font={*-ThinItalic}},
  FontFace={el}{n}{Font={*-ExtraLight}},
  FontFace={el}{it}{Font={*-ExtraLightItalic}},
  FontFace={l}{n}{Font={*-Light}},
  FontFace={l}{it}{Font={*-LightItalic}},
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  FontFace={mb}{n}{Font={*-Medium}},
  FontFace={mb}{it}{Font={*-MediumItalic}},
  FontFace={sb}{n}{Font={*-SemiBold}},
  FontFace={sb}{it}{Font={*-SemiBoldItalic}},
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
  FontFace={eb}{n}{Font={*-ExtraBold}},
  FontFace={eb}{it}{Font={*-ExtraBoldItalic}},
  FontFace={ub}{n}{Font={*-Black}},
  FontFace={ub}{sl}{Font={*-Black}, FakeSlant=0.15},
}


% Set fonts
\setmainfont{\inter}
\setmathfont{\firamath}

% Command to change fonts
\newcommand{\setreportfonts}[2]{
    \setmainfont{#1}
    \setmathfont{#2}
}

% ==================== MATH PACKAGES ====================
% Mathematical typesetting
\RequirePackage{amsmath}
% \RequirePackage{amssymb}
\RequirePackage{bigints}  % For large integral signs

% ==================== TABLE PACKAGES ====================
% Enhanced table support
\RequirePackage{array}       % Enhanced column specifications
\RequirePackage{booktabs}    % Professional looking tables
\RequirePackage{tabularx}    % Tables with adjustable width columns
\RequirePackage{longtable}   % Multi-page tables

% ==================== GRAPHICS & PLOTS ====================
% TikZ and PGFPlots for diagrams and plots
\RequirePackage{tikz}
\RequirePackage{tikz-3dplot}
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\pgfplotsset{compat=1.19}
\usetikzlibrary{intersections}
\usepgfplotslibrary{fillbetween}

% Externalize the figures to prevent constant recompilation
\usepgfplotslibrary{external}
\tikzexternalize

% Animation support (for PDFs viewed in Adobe Reader)
\RequirePackage[method=widget]{animate}
\RequirePackage{ocgx2}

% ==================== FORMATTING PACKAGES ====================
% Various formatting tools
\RequirePackage{relsize}      % Relative font sizes
\RequirePackage{rotating}     % Rotating text/tables
\RequirePackage{float}       % Improved float placement
\RequirePackage{placeins}    % Control float placement with \FloatBarrier
\RequirePackage{subcaption}  % Subfigures and subcaptions
\RequirePackage{blindtext}
\usepackage{titlesec}   % for \titleformat


% ==================== COLORS ====================
\RequirePackage{xcolor}
% Define standard colors for the report
\definecolor{cred}{RGB}{255, 191, 191}
\definecolor{cblue}{RGB}{191, 223, 255}
\definecolor{cgreen}{RGB}{191, 255, 191}
\definecolor{cyellow}{RGB}{255, 223, 191}

% ==================== SECTIONING & TOC ====================
\RequirePackage{titlesec}     % Section formatting
\RequirePackage[toc,page]{appendix}  % Appendix handling
\RequirePackage{tocbasic}     % Enhanced TOC control

% Configure figure list format
\setuptoc{lof}{totoc}
\renewcommand*{\listoffigures}{
    \phantomsection
    \listoftoc[List of Figures]{lof}
}

\DeclareTOCStyleEntry[
    beforeskip=0.8em,
    dynnumwidth,
    indent=0pt,
    entrynumberformat=\figurenumberformat
]{tocline}{figure}

\newcommand*{\figurenumberformat}[1]{%
    \textbf{Figure~#1}\enspace
    \ignorespaces\unskip\hfil
}

% Configure table list format
\setuptoc{lot}{totoc}
\renewcommand*{\listoftables}{
    \phantomsection
    \listoftoc[List of Tables]{lot}
}

\DeclareTOCStyleEntry[
    beforeskip=0.8em,
    dynnumwidth,
    indent=0pt,
    entrynumberformat=\tablenumberformat
]{tocline}{table}

\newcommand*{\tablenumberformat}[1]{%
    \textbf{Table~#1}\enspace
    \ignorespaces\unskip\hfil
}

% ==================== CAPTIONS ====================
\RequirePackage[labelfont=bf]{caption}  % Bold caption labels

% ==================== REFERENCES ====================
\RequirePackage{hyperref}

% ==================== CUSTOM COMMANDS ====================
% Mathematical notation shortcuts
\newcommand{\avg}[1]{\mkern2mu\overbar{\mkern-2mu #1}}
\newcommand{\diff}{\mathrm{d}}
\newcommand{\pdv}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\abs}[1]{\left| #1 \right|}
\newcommand{\zerodel}{.\kern-\nulldelimiterspace}

% Custom symbols
\newcommand{\umin}{\rotatebox[origin=c]{180}{\(\Lambda\)}}
\newcommand{\umax}{\(\Lambda\)}


\newcommand{\inputbody}[1]{\input{body/#1}}
\newcommand{\inputfigure}[1]{\input{figures/#1}}
\newcommand{\inputtable}[1]{\input{data/tables/#1}}













% ==================== TITLE PAGE ====================
% Custom title page command

\newcommand{\makereporttitle}[4]{
    \begin{titlepage}
        \vspace*{-2cm}
        \centerline{
            \makebox[\textwidth]{
                \includegraphics[width=\paperwidth] {
                    figures/cover_page_header.png
                }
            }
        }
        \vspace{2cm}
        \center{\textbf{\Large{#1}}}
        \vspace{1cm}
        \center{\large{#2}}
        \center{\large{#3}}
        \vspace{1cm}
        \inputbody{abstract.tex}
        \vfill
        \center{#4}
        \vspace*{\fill}
        \centerline{
            \makebox[\textwidth]{
                \includegraphics[width=\paperwidth] {
                    figures/cover_page_footer.png
                }
            }
        }
    \end{titlepage}
}

% ==================== PAGE NUMBERING SCHEME ====================
% Commands for the standard numbering scheme
\newcounter{frontmatterpage}

\newcommand{\startfrontmatter}{%
    \pagenumbering{roman}
}

\newcommand{\startmainmatter}{%
    \newpage
    \setcounter{frontmatterpage}{\value{page}}
    \pagenumbering{arabic}
    \setcounter{page}{1}
}

\newcommand{\startbackmatter}{%
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{\value{frontmatterpage}}
}


% ==================== BIBLIOGPRAPHY CONFIGURATION ====================

\newcommand{\makebibliography}[1]{%
	\bibliographystyle{vancouver}
    \bibliography{bibliography/#1}
    \newpage
}




% ==================== APPENDIX CONFIGURATION ====================

\makeatletter
\newcommand{\createappendix}{%
  \phantomsection
  \addcontentsline{toc}{section}{Appendix}%

  \let\orig@addcontentsline\addcontentsline
  \def\addcontentsline##1##2##3{%
    \ifnum\pdfstrcmp{##1}{toc}=0\relax
    \else
      \orig@addcontentsline{##1}{##2}{##3}%
    \fi}%

  \appendix

  \renewcommand{\thesection}{Appendix~\Alph{section}}%


  \titleformat{\section}{\normalfont\Large\bfseries}{\thesection\hspace{0.05em}\makebox{:}}{0.5em}{}%
  \inputbody{appendix}
}
\makeatother

% ==================== FIGURE HELPERS ====================
% Command for standard figure with citation support
\newcommand{\insertfigure}[6]{%
    \begin{figure}[#1]%
        \centering%
        \includegraphics[width=#2\linewidth]{figures/#3}%
        \caption[#4]{\textbf{#5}}%
        \label{fig:#6}%
    \end{figure}%
}

% ==================== TABLE HELPERS ====================
% Standard table environment with booktabs
\newenvironment{reporttable}[2][ht]{%
    \begin{table}[#1]
        \centering
        \caption{#2}
}{%
    \end{table}
}
