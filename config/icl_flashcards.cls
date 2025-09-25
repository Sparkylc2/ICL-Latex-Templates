\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icl_flashcards}[2025/09/21 Custom Flashcard Class]


\LoadClass[11pt]{article}


\RequirePackage{geometry}
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage{xparse}
\RequirePackage{adjustbox}
\RequirePackage{tabularx}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}
\setmainfont{SF Pro Display Light}
\setmathfont{Lete Sans Math}

\geometry{margin=0in}
\pagestyle{empty}


\newcounter{cardsperpage}
\setcounter{cardsperpage}{4}


\NewDocumentCommand{\setcardsperpage}{m}{%
    \setcounter{cardsperpage}{#1}%
}

\newlength{\cardheight}
\newlength{\cardwidth}
\newlength{\textpadding}
\newlength{\paddingwidth}
\setlength{\textpadding}{5pt}
\setlength{\paddingwidth}{12pt}

\NewDocumentCommand{\updatecardsize}{}{%
    \setlength{\cardheight}{\textheight / \thecardsperpage -2pt }%
    \setlength{\cardwidth}{\textwidth}%
}

\AtBeginDocument{\updatecardsize}

\newcounter{cardsonpage}
\setcounter{cardsonpage}{0}

\NewDocumentEnvironment{flashcardenv}{m m}{%
    \ifnum\thecardsonpage=\thecardsperpage
        \newpage
        \setcounter{cardsonpage}{0}%
    \fi
    
    \ifnum\thecardsonpage>0
        \noindent\rule{\textwidth}{0.4pt}%
    \fi
    
    \noindent
    \begin{tabularx}{\cardwidth}{X|X}
        \begin{minipage}[t][\cardheight - 2\textpadding][c]{\linewidth - 2\textpadding}
            \vspace{\textpadding}
            \centering
            \adjustbox{width=\linewidth, totalheight=\cardheight - 4\textpadding, keepaspectratio}{%
                \begin{minipage}{\linewidth}
                    \centering
                    #1
                \end{minipage}%
            }
            \vspace{\textpadding}
        \end{minipage}
        &
        \begin{minipage}[t][\cardheight - 2\textpadding][c]{\linewidth - 2\textpadding}
            \vspace{\textpadding}
            \centering
            \adjustbox{width=\linewidth, totalheight=\cardheight - 4\textpadding, keepaspectratio}{%
                \begin{minipage}{\linewidth}
                    \centering
                    #2
                \end{minipage}%
            }
            \vspace{\textpadding}
        \end{minipage}
        \\
    \end{tabularx}
    
    \stepcounter{cardsonpage}%
}{%
}


\NewDocumentCommand{\flashcard}{m m}{%
    \begin{flashcardenv}{#1}{#2}
    \end{flashcardenv}%
}

\endinput
