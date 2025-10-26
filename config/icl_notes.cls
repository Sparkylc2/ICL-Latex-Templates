\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icl_notes}[Custom ICL Notes Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{article}

% ==================== CORE PACKAGES ====================
\RequirePackage{blindtext}
% Geometry - page layout
\RequirePackage[top=2.54cm,bottom=2.54cm,left=2.54cm,right=2.54cm]{geometry}

% Graphics
\RequirePackage{graphicx}
\RequirePackage[percent]{overpic}  % For overlaying text on images
\RequirePackage{relsize}
\RequirePackage{datetime2}
\RequirePackage{fancyhdr}
\RequirePackage{rotating}


% ==================== TABLE PACKAGES ====================
% Enhanced table support
\RequirePackage{array}       % Enhanced column specifications
\RequirePackage{booktabs}    % Professional looking tables
\RequirePackage{tabularx}    % Tables with adjustable width columns
\RequirePackage{longtable}   % Multi-page tables
\RequirePackage{multirow}    % Multi-row cells
\RequirePackage{hhline}      % Better horizontal lines

% ==================== MATH PACKAGES ====================
% Mathematical typesetting
\RequirePackage{bigints}     % For large integral signs
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{mathtools}   % Enhanced math

% ==================== ADDITIONAL PACKAGES ====================
\RequirePackage{svg}
\RequirePackage{calc}
\RequirePackage{ifpdf}
\RequirePackage{markdown}


% ==================== FONT CONFIGURATION ====================
\RequirePackage{fontspec}
\RequirePackage{lete-sans-math}
\RequirePackage[math-style=TeX]{unicode-math}
\setmainfont{SF Pro Display Light}
% \setmathfont{Lete Sans Math}






% ==================== SECTIONING & TOC ====================
\RequirePackage{titlesec}     % Section formatting
\RequirePackage[toc,page]{appendix}  % Appendix handling
\RequirePackage{subcaption}  % Subfigures and subcaptions
\RequirePackage{float}       % Improved float placement
\RequirePackage{placeins}    % Control float placement with \FloatBarrier

% ==================== GRAPHICS & PLOTS ====================
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\usetikzlibrary{intersections}
\usepgfplotslibrary{fillbetween}
\pgfplotsset{compat=newest}
\RequirePackage{tikz}
\RequirePackage{tikz-3dplot}

% ==================== COLORS ====================
\RequirePackage{xcolor}
\definecolor{cred}{RGB}{255, 191, 191}
\definecolor{cblue}{RGB}{191, 223, 255}
\definecolor{cgreen}{RGB}{191, 255, 191}
\definecolor{cyellow}{RGB}{255, 223, 191}

% ==================== CAPTIONS ====================
\RequirePackage[labelfont=bf]{caption}

% ==================== TOC CONFIGURATION ====================



% ==================== ANIMATION SUPPORT ====================
\RequirePackage{animate}
\RequirePackage{ocgx2}
\RequirePackage{overpic}

% ==================== REFERENCES ====================
\RequirePackage{hyperref}
\RequirePackage{calc}


% ==================== CUSTOM PACKAGES ====================
\RequirePackage{icl_tables}
\RequirePackage{icl_plotting}
\RequirePackage{icl_math}


% ==================== FIGURE HELPERS ====================
\newcommand{\insertfigure}[6]{%
	\begin{figure}[#1]%
		\centering%
		\includegraphics[width=#2\linewidth]{figures/#3}%
		\caption[#4]{\textbf{#5}}%
		\label{fig:#6}%
	\end{figure}%
}

\newcommand{\figref}[1]{%
	\hyperref[fig:#1]{Figure~\ref{fig:#1}}%
}

\newcommand{\figrefname}[2]{%
	\hyperref[fig:#1]{#2~\ref{fig:#1}}%
}

% ==================== TABLE HELPERS ====================
\newenvironment{notetable}[2][ht]{%
	\begin{table}[#1]
		\centering
		\caption{#2}
		}{%
	\end{table}
}

\newcommand{\tableref}[1]{%
	\hyperref[table:#1]{Table~\ref{table:#1}}%
}

\newcommand{\tablerefname}[2]{%
	\hyperref[table:#1]{#2~\ref{table:#1}}%
}
