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

% ==================== FONT CONFIGURATION ====================
\RequirePackage{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newcommand{\inter}{Inter}
\newcommand{\sfpro}{SF Pro}
\newcommand{\firamath}{Fira Math}
\newcommand{\firacode}{Fira Code}

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
\RequirePackage{amssymb}
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
\pgfplotsset{compat=1.18}
\usetikzlibrary{intersections}
\usepgfplotslibrary{fillbetween}

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
% Hyperref should be loaded last (with few exceptions)
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

% ==================== NOMENCLATURE SUPPORT ====================
% Environment for nomenclature table
\newenvironment{nomenclaturetable}[1][lXr]{%
    \section*{Nomenclature}
    \phantomsection
    \addcontentsline{toc}{section}{Nomenclature}
    \renewcommand{\arraystretch}{1.3}
    \setlength{\extrarowheight}{2pt}
    \begin{tabularx}{\textwidth}{#1}
        \toprule
        \textbf{Symbol} & \textbf{Definition} & \textbf{Unit} \\
        \midrule
}{%
        \bottomrule
    \end{tabularx}
}

% Command to add nomenclature entry
\newcommand{\nomenclature}[3]{%
    #1 & #2 & #3 \\
}

% ==================== TITLE PAGE ====================
% Custom title page command
\newcommand{\makereporttitle}[5]{%
    \begin{titlepage}
        \centering
        \vspace*{2cm}

        % Title
        {\huge\bfseries #1\par}
        \vspace{1.5cm}

        % Author
        {\Large #2\par}
        \vspace{0.5cm}

        % ID/Course
        {\large #3\par}
        \vspace{2cm}

        % Abstract
        \begin{abstract}
            \noindent #4
        \end{abstract}

        \vfill

        % Date
        {\large #5\par}
    \end{titlepage}
}

% ==================== PAGE NUMBERING SCHEME ====================
% Commands for the standard numbering scheme
\newcounter{frontmatterpage}

\newcommand{\startfrontmatter}{%
    \pagenumbering{roman}
}

\newcommand{\startmainmatter}{%
    \setcounter{frontmatterpage}{\value{page}}
    \pagenumbering{arabic}
    \setcounter{page}{1}
}

\newcommand{\startbackmatter}{%
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{\value{frontmatterpage}}
}

% ==================== APPENDIX CONFIGURATION ====================
% Better appendix formatting
\newcommand{\startappendices}{%
    \appendix
    \renewcommand{\thesection}{Appendix~\Alph{section}}
    \titleformat{\section}
        {\normalfont\Large\bfseries}
        {\thesection:}
        {0.5em}
        {}
}

% ==================== FIGURE HELPERS ====================
% Command for standard figure with citation support
\newcommand{\insertfigure}[4][ht]{%
    \begin{figure}[#1]
        \centering
        \includegraphics[width=#2\linewidth]{#3}
        \caption{#4}
        \label{fig:#3}
    \end{figure}
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
