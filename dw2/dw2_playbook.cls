%    ID
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dw2_playbook}[2021/07/02 Dungeon World Playbook Document Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    package declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[letterpaper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{libertinus}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\RequirePackage[T1]{fontenc}

\RequirePackage{dw2_playbook}

\RequirePackage{geometry}
\RequirePackage{array}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{multicol}

% import me last
\RequirePackage[colorlinks=true]{hyperref}
\hypersetup{pageanchor=false}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Suppress overfull/underfull warnings completely
\hbadness=10000
\vbadness=10000
\hfuzz=100pt
\vfuzz=100pt

% Maximum tolerance settings to prevent all overfull warnings
\tolerance=10000
\widowpenalty=10000
\clubpenalty=10000
\displaywidowpenalty=10000
\predisplaypenalty=10000
\postdisplaypenalty=10000
\interlinepenalty=0
\brokenpenalty=10000

% Suppress specific warning types
\pdfsuppresswarningpagegroup=1
\pdfminorversion=7

\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{a4paper}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Dark mode color overrides (must come after package loading)
\ifdefined\DARKMODE
    % Dark Mode Color Scheme
    \definecolor{mainTextColorD}{HTML}{E0E0E0}
    \colorlet{mainTextColor}{mainTextColorD}
    \definecolor{boldTextColorD}{HTML}{FFFFFF}
    \colorlet{boldTextColor}{boldTextColorD}
    \definecolor{mainPageColorD}{HTML}{000000}
    \colorlet{mainPageColor}{mainPageColorD}
    \definecolor{headerTextColorD}{HTML}{FFFFFF}
    \colorlet{headerTextColor}{headerTextColorD}
    \definecolor{headerLightColorD}{HTML}{BBBBBB}
    \colorlet{headerLightColor}{headerLightColorD}
    \definecolor{titleFillD}{HTML}{303030}
    \colorlet{titleFill}{titleFillD}
    \definecolor{headerFillD}{HTML}{505050}
    \colorlet{headerFill}{headerFillD}
    \definecolor{offWhiteD}{HTML}{505050}
    \colorlet{offWhite}{offWhiteD}
    \definecolor{paleD}{HTML}{F3F3F3}
    \colorlet{pale}{paleD}
    \definecolor{paleishD}{HTML}{CACACA}
    \colorlet{paleish}{paleishD}
    \definecolor{shadeD}{HTML}{CCCCCC}
    \colorlet{shade}{shadeD}
    \definecolor{shadeishD}{HTML}{A0A0A0}
    \colorlet{shadeish}{shadeishD}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    page setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand
    {\normalsize}
    {\fontsize{9}{10}\selectfont}
\renewcommand
    {\Huge}
    {\fontsize{32}{0}\selectfont}

\setcounter{secnumdepth}{0}
\geometry{
    letterpaper,
    bindingoffset=0mm,
    bmargin=0mm,
    bottom=0mm,
    footnotesep=0mm,
    footskip=0mm,
    headheight=0mm,
    headsep=0mm,
    hoffset=-0in,
    inner=0mm,
    left=0mm,
    lmargin=0mm,
    marginpar=0mm,
    marginparwidth=0mm,
    outer=0mm,
    right=0mm,
    rmargin=0in,
    tmargin=0mm,
    top=0mm,
    voffset=0.25in,
}

\pagecolor{mainPageColor}
\color{mainTextColor}
\pagestyle{empty}
\pagenumbering{gobble}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\columnsep}{5mm}

\hypersetup{urlcolor=cyan}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    playbook properties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
  {\playbook}
  {Playbook_Name}

\newcommand
    {\setPlaybook}
    [1]
    {\renewcommand{\playbook}{#1}}

\renewcommand
    {\maketitle}
    {
      \fcolorbox{titleFill}{titleFill}{
        \begin{minipage}[t]{\textwidth}
            \medskip
            \hspace{3em}\makebox[\dimexpr\textwidth-8em][s]{%
                \subtext{\underline{\color{headerTextColor}Name}}
                \blank{5}
                \subtext{\underline{\color{headerTextColor}Pronouns}}
                \hugetext{\color{headerTextColor}(\hspace{1cm}/\hspace{1.2cm}),}%
                \hfill\parbox[t]{9.75cm}{
                  \raggedleft\textbf{\color{headerTextColor}\Huge\@title}%
                }%
            }
            \smallskip
        \end{minipage}
      }
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    stat block
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\force}
    {\stat{Forceful}{w}}
\newcommand
    {\sly}
    {\stat{Sly}{s}}
\newcommand
    {\intu}
    {\stat{Intuitive}{e}}
\newcommand
    {\astute}
    {\stat{Astute}{t}}
\newcommand
    {\compel}
    {\stat{Compelling}{f}}

\newcommand
    {\stats}
    {
        \begin{tikzpicture}[baseline=(current bounding box.north)]
          \node [] at (0.08,5.7) {\force};
          \node [] at (0.08,3) {\intu};
          \node [] at (0.08,0.3) {\sly};
          \node [] at (3.7,5.7) {\compel};
          \node [] at (3.7,3) {\astute};
          \node [] at (4.18,0.3) {\supplies};
        \end{tikzpicture}
    }

\newcommand
    {\supplies}
    {
        \def\y{-0.8}
        \begin{tikzpicture}[baseline=(current bounding box.north)]
            \filldraw [color=mainPageColor] (0.5,0) rectangle (0.51,0.01);
            \filldraw [color=headerFill] (0.5,\y) rectangle (2.25,\y-0.75);
            \def\ypos{0}
            \foreach \char in {S,u,p,p,l,i,e,s} {
                \node[rotate=-10] at (1,\ypos-1.2) {\Large\char};
                \pgfmathsetmacro{\ypos}{\ypos-0.35}
                \global\let\ypos\ypos
            }
            \def\xoff{1}
            \foreach \i in {0,1,2,3,4} {
                \pgfmathsetmacro{\y}{\i * -0.6}
                \draw [rounded corners,color=boldTextColor,fill=pale] (1.5,\y-\xoff) rectangle (2,\y-\xoff - 0.5);
            }
        \end{tikzpicture}
    }

\newcommand
    {\stat}
    [2]
    {
        \def\x{0.8}
        \def\y{1.25}
        \def\charcount{0}
        \def\arc{14}
        \def\rad{1}

        \begin{tikzpicture}[baseline=(current bounding box.north)]
            \begin{scope}[shift={(1,1.65)}]
                \def\totalangley{0}
                \@tfor\char:=#1\do{
                  % Simple width adjustment based on common characters
                  \gdef\charwidth{1.0}
                  \if\char i\gdef\charwidth{0.7}\fi
                  \if\char l\gdef\charwidth{0.7}\fi
                  \if\char I\gdef\charwidth{0.9}\fi
                  \if\char j\gdef\charwidth{0.6}\fi
                  \if\char f\gdef\charwidth{0.7}\fi
                  \if\char t\gdef\charwidth{0.9}\fi
                  \if\char u\gdef\charwidth{0.9}\fi
                  \if\char s\gdef\charwidth{0.9}\fi
                  \if\char r\gdef\charwidth{0.8}\fi
                  \if\char e\gdef\charwidth{0.8}\fi
                  \if\char m\gdef\charwidth{1.5}\fi
                  \if\char w\gdef\charwidth{1.3}\fi
                  \if\char o\gdef\charwidth{1.2}\fi
                  \if\char M\gdef\charwidth{1.5}\fi
                  \if\char W\gdef\charwidth{1.4}\fi
                  \if\char S\gdef\charwidth{0.9}\fi
                  \if\char \gdef\charwidth{0.6}\fi % space
                  
                  \pgfmathsetmacro{\adjustedspacing}{\arc * \charwidth}
                  \pgfmathsetmacro{\currentangle}{180 - \totalangley}
                  \node at (\currentangle:\rad) [rotate={\currentangle-90}, anchor=base] {\LARGE\char};
                  \pgfmathsetmacro{\newtotalangley}{\totalangley + \adjustedspacing}
                  \global\let\totalangley\newtotalangley
                }
              \end{scope}

            \node [] at (\x+0.08,\y+0.3) {
              \ifx f#2 \dfour \fi
              \ifx s#2 \dsix \fi
              \ifx e#2 \deight \fi
              \ifx t#2 \dten \fi
              \ifx w#2 \dwhat \fi
            };
            
            \draw [color=shade,fill=mainPageColor,thick,scale=1.25] (\x,\y) circle (5.8mm);

            \node[anchor=west] at (\x + 0.8,2.3) {\defiance{mainTextColor}};
            \node[anchor=west] at (\x + 1.1,1.55) {\defiance{mainTextColor}};
            \node[anchor=west] at (\x + 0.9,0.8) {\defiance{mainTextColor}};
        \end{tikzpicture}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    stat block
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\conditions}
    {
        \begin{tabular}{p{\linewidth}}
            \condition{Angry}{DIS to\\+Astute}\\[0mm]
            \condition{Conspicuous}{DIS to +Sly}\\[0mm]
            \condition{Deprived}{Max.\\Supply -2}\\[0mm]
            \condition{Distracted}{DIS to\\+Intuitive}\\[0mm]
            \condition{Exhausted}{DIS to +Forceful}\\[0mm]
            \condition{Frightened}{DIS to\\+Compelling}\\[0mm]
            \condition{Maimed}{Needs Aid\\to act}\\[0mm]
            \dyingcondition
        \end{tabular}
    }

\newcommand
    {\condition}
    [2]
    {
        \def\xl{0}
        \def\xc{\xl + 2.85}
        \def\xr{\xl + 5.2}
        \def\y{0}
        \def\sidesize{\dimexpr\textwidth/2 - 18mm\relax}
        \hspace{8mm}\begin{tikzpicture}[baseline=(current bounding box.north),scale=0.6]
            \draw [text width=\sidesize + 8mm,text height=4mm,color=boldTextColor] (\xl,\y + 0.15) [align=right] node {\large #1};
            % \draw [color=boldTextColor,fill=mainPageColor,thick] (\xc,\y) circle (6mm);
            \filldraw [color=boldTextColor,fill=pale]
                % bottom
                (\xc,\y-0.65)
                % bottom left
                -- (\xc-0.6,\y-0.185)
                % top left
                -- (\xc-0.40,\y+0.5)
                % top right
                -- (\xc+0.40,\y+0.5)
                % bottom right
                -- (\xc+0.6,\y-0.185)
                -- cycle;
            % \draw [color=shade,fill=mainPageColor] (\xc,\y) circle (5mm);
            \draw [text width=\sidesize+2mm,color=boldTextColor] (\xr, \y + 0.01) node {\raggedright #2};
        \end{tikzpicture}
    }

\newcommand
    {\dyingcondition}
    {
        \def\xl{0}
        \def\xc{\xl + 2.85}
        \def\xr{\xl + 5}
        \def\y{0}
        \def\sidesize{\dimexpr\textwidth/2 - 18mm\relax}
        \hspace{8mm}\begin{tikzpicture}[baseline=(current bounding box.north),scale=0.6]
            \draw [text width=\sidesize + 8mm,text height=4mm,color=boldTextColor] (\xl,\y + 0.15) [align=right] node {\large Dying};
            \draw [] (\xc,\y + 0.15) node {\skull};
            \draw [text width=\sidesize,color=boldTextColor] (\xr, \y + 0.115) node {\raggedright Face Death};
        \end{tikzpicture}
    }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    level & exp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\level}
    {
        \begin{tikzpicture}
            \filldraw [color=headerFill] (0,0) rectangle (\textwidth,0.75);
            \draw [color=headerTextColor] (1.75,0.325) node {\hugetext{Experience}};

            \foreach \i in {0,1,2,3,4} {
                \pgfmathsetmacro{\x}{\textwidth/1cm - 1.15 - \i * 1.1}
                \filldraw [color=black,fill=pale,thick]
                    (\x+0,0.7) -- (\x+0.5,1)
                    -- (\x+0.5,1) -- (\x+1,0.7)
                    -- (\x+1,0.7) -- (\x+1,0.05)
                    -- (\x+1,0.05) -- (\x+0.5,-0.25)
                    -- (\x+0.5,-0.25) -- (\x+0,0.05)
                    -- (\x+0,0.05) -- (\x+0,0.7);
            }
        \end{tikzpicture}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    looks, bonds, background, drives, etc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\looksheader}
    {
        \begin{minipage}[t]{\textwidth}
        \header{Looks}\\[2mm]
        \subtext{Choose one from each, or write your own:}
        \end{minipage}
    }
\newcommand
    {\look}
    [2]
    {
        \begin{minipage}[t]{\textwidth}
            \vspace{1mm}
            \begin{flushleft}
                \bold{#1}: #2
            \end{flushleft}
        \end{minipage}
    }

\newcommand
    {\drivesheader}
    {\header{Drives}\\[2mm]}
\newcommand
    {\drive}
    [2]
    {
      \margincol{0.75cm}{\move{#1}{#2}}\\[2mm]
    }
\newcommand
    {\diyDrive}
    {
      \margincol{0.75cm}
        {
          \begin{tikzpicture}[baseline=(current bounding box.north)]
              \draw [rounded corners,color=mainPageColor] (0,0.1) rectangle (0.5cm,0.5cm);
              \draw [rounded corners,color=boldTextColor] (0,0) rectangle (0.5cm,0.5cm);
              \draw [color=mainTextColor,fill=mainTextColor] (0.6,0.05) rectangle (\textwidth,0.052);
          \end{tikzpicture}
        }
    }

\newcommand
    {\ancestry}
    [1]
    {\titledescl{Ancestry}{#1}}
\newcommand
    {\background}
    [1]
    {\titledescl{Background}{#1}}
\newcommand
    {\culture}
    [1]
    {\titledesc{Culture}{#1}}

\newcommand
    {\bonds}
    {
      \begin{minipage}[t]{\dimexpr\textwidth-0.25cm\relax}
        \header{Bonds}
        \vspace{0mm}
        \margincol[0.005cm]{0.5cm}
        {
          \subtext
          {
            \!You start with one Bond centered around another Player Character; it may be a belief, goal, or even past events involving them.
          }
          \gap
          \blankw
          \gap
          \blankw
          \gap
          \blankw
          \gap
          \blankw
        }
      \end{minipage}
    }

\newcommand
    {\supply}
    [3][u]
    {\singletake[#1]{\bold{#2 supplies} #3}}

\newcommand
    {\featuresheader}
    [1]
    {\header{#1}\\[2mm]}

\newcommand
    {\gearheader}
    {\header{Gear}\\[2mm]}

\newcommand
    {\gear}
    [1]
    {
        \begin{minipage}[t]{\textwidth}
        \vspace{1mm}
        \begin{flushleft}
            \small{#1}
        \end{flushleft}
        \end{minipage}
    }
\newcommand
    {\gearSelectable}
    [1]
    {\select{#1}\\[2mm]}

\newcommand
    {\notes}
    {\header{Notes}\\}

\newcommand
    {\twelveplus}
    {\!\mbox{\dsixtiny{12+}{6}}\!}

\newcommand
    {\tenplus}
    {\!\mbox{\dsixtiny{10+}{5}}\!}

\newcommand
    {\sevennine}
    {\!\mbox{\dsixtiny{7-9}{4}}\!}

\newcommand
    {\sixminus}
    {\!\mbox{\dsixtiny{6-}{1}}\!}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    starting and advanced moves
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\startingMoves}
    {\headerl[r]{Starting Moves}}

\newcommand
    {\advancedMoves}
    {
        \begin{minipage}[t]{\textwidth}
        \header[r]{Advanced Moves}\\
        \end{minipage}
    }

\newcommand
    {\advancedMovesCont}
    {
        \begin{minipage}[t]{\textwidth}
        \header[r]{Advanced Moves (cont.)}\\
        \end{minipage}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    page layouts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\pageOne}
    [8]
    {
      \maketitle
      \margined{
        \hfill \subtext{#1}
        \vspace{3mm}

        \twocol{0.35}{0.635}
        {
            \stats
        }
        {
            \twocol{0.55}{0.45}
            {
                \vspace{0mm}\conditions
            }
            {
                \vspace{3mm}
                \ancestry{#2}\\
                \culture{#3}\\
                \background{#4}
            }
        }
        \vspace{0mm}
          \begin{center}
            \fcolorbox{mainPageColor}{mainPageColor}{#8}
          \end{center}
        \twocol{0.4}{0.59}
          {
              \vspace{2.5mm}
              \drivesheader
              #5
              \gap
              \vspace{6mm}
              \bonds
          }
          {
              \vspace{0mm}
              \level
              \margined{

                  \vspace{2mm}
                  \instruction{When you Level Up, choose one of the following:}
                  \gap

                  #6

                  \vspace{2mm}
                  \instruction{After you've marked 5 above, you can also choose from the following list:}
                  \gap

                  #7
              }
          }
      }
    }

\newcommand
    {\pageTwo}
    [5]
    {
      \margined{
        \twocol{0.35}{0.65}
        {
            \featuresheader{#1}
            \margincol{0.25cm}{\!\subtext{#2}}

            \vspace{3mm}
            \margincol{0.5cm}{#3}

            \vspace{4mm}
            \gearheader

            \blankw
            \gap
            \blankw
            \gap
            \blankw
            \gap
            \blankw
        }
        {
            \startingMoves
            \begin{multicols*}{2}
                #4
            \end{multicols*}
            \advancedMoves
            \begin{multicols*}{2}
                #5
            \end{multicols*}
        }
      }
    }

\newcommand
    {\pageTwoShort}[2]
    {
      \margined{
        % left column: bonds, alignment, gear, blanks
        \begin{minipage}[t]{\dimexpr0.3\textwidth - 2mm\relax}
            #1
        \end{minipage}
        \vbreak
        % right column: moves
        \begin{minipage}[t]{\dimexpr0.65\textwidth - 2mm\relax}
            \advancedMoves
        
            \begin{multicols*}{2}
                #2
            \end{multicols*}
        \end{minipage}
      }
    }

\newcommand
    {\pageThree}[4][m]
    {
      \margined{
        % left column: filler lines
        \begin{minipage}[t]{\dimexpr0.3\textwidth - 2mm\relax}
            \notes\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}\gap
            \blank{5.8}
    
        \end{minipage}
        \vbreak
        % right column: moves
        \begin{minipage}[t]{\dimexpr0.65\textwidth - 2mm\relax}
            #2  

            \ifx m#1\begin{multicols*}{2}\fi
                #3
            \ifx m#1\end{multicols*}\fi
            
            #4
        \end{minipage}
      }
    }

\newcommand
    {\resourceLinksPage}[1]
    {
      \margined{
        ~\gap

        This playbook template is freely available at:\\\url{https://github.com/rfkeepers/dw-playbooks-tex}
        ~\gap

        Playbooks made by the author of this tool can be found at:\\\url{https://innumerable-engines.net/dwplaybooks}
        ~\gap

        Dungeon World 2 is designed by Spencer Moore and Helena Real, and can be found at:\\\url{https://dungeon-world.com}
        ~\gap

        This playbook and its template is licensed under Creative Commons BY-SA v4.0:\\\url{https://creativecommons.org/licenses/by-sa/4.0/legalcode.txt}.
        ~\gap

        #1
      }
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    icons
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\defiance}
    [1]
    {
      \def\x{0.45}
      \begin{tikzpicture}[scale=0.5]
        \draw [color={#1},fill=mainPageColor,thick]
              (\x+1.5,1)
              to [out=160,in=330] (\x+0.75,1.25)
              to [out=210,in=20] (\x,1)
              to [out=270,in=165] (\x+0.75,-0.25)
              to [out=15,in=270] cycle (\x+0.5,0.75);
      \end{tikzpicture}
    }

\newcommand
    {\coin}
    {
      \def\x{1.7}
      \begin{tikzpicture}[baseline=(current bounding box.north)]
          \filldraw [rotate=30,color=black,fill=pale,thick]
              (\x+2.52,-2) circle (6.5mm and 4.5mm);
          \filldraw [rotate=30,color=black,fill=pale,thick]
              (\x+2.5,-1.9) circle (6.5mm and 4.5mm);

          \draw [color=paleish] (\x+2.87,0.475) node {\hugetext{¢}};
      \end{tikzpicture}
    }

\newcommand
    {\summoningCircle}
    {
        \def\x{-0.8}
        \def\y{0}
        \begin{tikzpicture}[baseline=(current bounding box.north),scale=0.6]
            \draw [color=boldTextColor,fill=mainPageColor,thick] (\x,\y) circle (6mm);
            \filldraw [color=boldTextColor,fill=mainPageColor]
                % bottom
                (\x,\y-0.65)
                % bottom left
                -- (\x-0.6,\y-0.185)
                % top left
                -- (\x-0.40,\y+0.5)
                % top right
                -- (\x+0.40,\y+0.5)
                % bottom right
                -- (\x+0.6,\y-0.185)
                -- cycle;
            \draw [color=shade,fill=mainPageColor] (\x,\y) circle (5mm);
        \end{tikzpicture}
    }

\newcommand
  {\skull}
  {
    \begin{tikzpicture}[baseline=(current bounding box.center), scale=0.3]
        % Main skull outline - bulbous rounded rectangle matching original
        \draw[boldTextColor, thick] 
            % Start from bottom left of main skull
            (-0.5, -0.5)
            % Left side curves inward then out (the "waist" indent)
            .. controls (-0.9, -0.4) and (-1.1, -0.1) ..
            (-1.1, 0.4)
            % Left side curves up to top
            .. controls (-1.1, 0.7) and (-0.8, 1.1) ..
            (-0.1, 1.1)
            % Top of skull - rounded
            .. controls (-0.1, 1.1) and (0.1, 1.1) ..
            (0.1, 1.1)
            % Top right curve down
            .. controls (0.8, 1.1) and (1.1, 0.7) ..
            (1.1, 0.4)
            % Right side curves inward then out (the "waist" indent)
            .. controls (1.1, -0.1) and (0.9, -0.4) ..
            (0.5, -0.5)

            % Straight line down to start of right curve
            -- (0.6, -0.9)
            % Curved corner through bottom right
            .. controls (0.6, -1.0) .. (0.5, -1.0)
            % Straight line across bottom
            -- (-0.5, -1.0)
            % Curved corner through bottom left
            .. controls (-0.6, -1.0) .. (-0.6, -0.9)

            % Top of left jaw
            -- cycle;

        % Left tooth line
        \draw[color=shade,fill=mainPageColor,thick] 
            (-0.2, -0.6) -- (-0.2, -1.0);
        
        % Right tooth line
        \draw[color=shade,fill=mainPageColor,thick] 
            (0.2, -0.6) -- (0.2, -1.0);
        
        % Left eye socket - large oval shape
        \def\xl{-0.4}
        \def\yl{0.25}
        \draw[color=shade,fill=mainPageColor,thick] 
            (\xl, \yl - 0.3)
            .. controls (\xl + 0.2, \yl - 0.25) and (\xl + 0.25, \yl - 0.05) ..
            (\xl + 0.2, \yl + 0.2)
            .. controls (\xl + 0.15, \yl + 0.35) and (\xl - 0.05, \yl + 0.35) ..
            (\xl - 0.2, \yl + 0.2)
            .. controls (\xl - 0.25, \yl - 0.05) and (\xl - 0.2, \yl - 0.25) ..
            (\xl, \yl - 0.3); 
        
        % Right eye socket - large oval shape
        \def\xr{0.4}
        \def\yr{0.25}
        \draw[color=shade,fill=mainPageColor,thick] 
            (\xr, \yr - 0.3)
            .. controls (\xr - 0.2, \yr - 0.25) and (\xr - 0.25, \yr - 0.05) ..
            (\xr - 0.2, \yr + 0.2)
            .. controls (\xr - 0.15, \yr + 0.35) and (\xr + 0.05, \yr + 0.35) ..
            (\xr + 0.2, \yr + 0.2)
            .. controls (\xr + 0.25, \yr - 0.05) and (\xr + 0.2, \yr - 0.25) ..
            (\xr, \yr - 0.3);

        % % Nasal cavity - small vertical oval
            %
        % \draw[boldTextColor, thick] 
        %     (0, -0.1) ellipse (0.06 and 0.15);
        
    \end{tikzpicture}
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    dice icons
%    from: https://tex.stackexchange.com/questions/144193/how-do-i-put-a-die-roll-at-the-top-of-each-page
%    thanks to John Kormylo and David Carlisle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\dfour}
    {
        \def\x{0cm}
        \def\y{1cm}
        \def\mult{1.8}

        \begin{tikzpicture}

        % left face
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.25cm*\mult)
            -- (\x-0.45cm*\mult,\y-0.5cm*\mult)
            -- (\x-0cm*\mult,\y-0.75cm*\mult)
            -- cycle;

        % top right
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.25cm*\mult)
            -- (\x+0.45cm*\mult,\y-0.5cm*\mult)
            -- (\x+0cm*\mult,\y-0.75cm*\mult)
            -- cycle;

        \draw [color=shade,thick]
            (\x+0.45cm*\mult,\y-0.5cm*\mult)
            -- (\x+0cm*\mult,\y-0.35cm*\mult)
            -- (\x-0.45cm*\mult,\y-0.5cm*\mult);

        \end{tikzpicture}
    }

\newcommand
    {\dsix}
    {
        \def\x{0cm}
        \def\y{0cm}
        \def\mult{2.6}

        \begin{tikzpicture}

        % primary face
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0cm*\mult)
            -- (\x+0.4cm*\mult,\y+0cm*\mult)
            -- (\x+0.4cm*\mult,\y+0.4cm*\mult)
            -- (\x+0cm*\mult,\y+0.4cm*\mult)
            -- cycle;

        % right face
        \draw [color=shade,fill=offWhite,thick]
            (\x+0.4cm*\mult,\y+0.4cm*\mult)
            -- (\x+0.4cm*\mult,\y+0cm*\mult)
            -- (\x+0.5cm*\mult,\y+0.1cm*\mult)
            -- (\x+0.5cm*\mult,\y+0.5cm*\mult)
            -- cycle;

        % right face
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.4cm*\mult)
            -- (\x+0.4cm*\mult,\y+0.4cm*\mult)
            -- (\x+0.5cm*\mult,\y+0.5cm*\mult)
            -- (\x+0.1cm*\mult,\y+0.5cm*\mult)
            -- cycle;

        \end{tikzpicture}
    }

\newcommand
    {\dsixtiny}
    [2]
    {
      \raisebox{0.1cm}{
        \tikz[baseline=(current bounding box.center), inner sep=0pt, outer sep=0pt]{
          \def\x{-0.2cm}
          \def\y{0cm}
          \def\mult{0.4}
          \def\numpips{#2}
          % primary face
          \draw [color=shade,fill=mainPageColor]
              (\x+0cm*\mult,\y+0cm*\mult)
              -- (\x+0.4cm*\mult,\y+0cm*\mult)
              -- (\x+0.4cm*\mult,\y+0.4cm*\mult)
              -- (\x+0cm*\mult,\y+0.4cm*\mult)
              -- cycle;
          % right face
            \draw [color=shade,fill=mainPageColor]
              (\x+0.4cm*\mult,\y+0.4cm*\mult)
              -- (\x+0.4cm*\mult,\y+0cm*\mult)
              -- (\x+0.5cm*\mult,\y+0.1cm*\mult)
              -- (\x+0.5cm*\mult,\y+0.5cm*\mult)
              -- cycle;
          % top face
            \draw [color=shade,fill=mainPageColor]
              (\x+0cm*\mult,\y+0.4cm*\mult)
              -- (\x+0.4cm*\mult,\y+0.4cm*\mult)
              -- (\x+0.5cm*\mult,\y+0.5cm*\mult)
              -- (\x+0.1cm*\mult,\y+0.5cm*\mult)
              -- cycle;
          \node [inner sep=0pt,color=mainTextColor] at (0.3cm,\y+0.1cm) {#1};
          % Draw pips
          \def\pipsize{0.008}
          \def\cx{-0.12} % center x of front face
          \def\cy{0.08} % center y of front face
          \ifnum\numpips=1
            % One pip: center
            \fill[color=boldTextColor] (\cx,\cy) circle (\pipsize);
          \fi
          \ifnum\numpips=2
            % Two pips: diagonal
            \fill[color=boldTextColor] (\cx-0.03,\cy-0.03) circle (\pipsize);
            \fill[color=boldTextColor] (\cx+0.03,\cy+0.03) circle (\pipsize);
          \fi
          \ifnum\numpips=3
            % Three pips: diagonal line
            \fill[color=boldTextColor] (\cx-0.03,\cy-0.03) circle (\pipsize);
            \fill[color=boldTextColor] (\cx,\cy) circle (\pipsize);
            \fill[color=boldTextColor] (\cx+0.03,\cy+0.03) circle (\pipsize);
          \fi
          \ifnum\numpips=4
            % Four pips: corners
            \fill[color=boldTextColor] (\cx-0.03,\cy-0.03) circle (\pipsize);
            \fill[color=boldTextColor] (\cx+0.03,\cy-0.03) circle (\pipsize);
            \fill[color=boldTextColor] (\cx-0.03,\cy+0.03) circle (\pipsize);
            \fill[color=boldTextColor] (\cx+0.03,\cy+0.03) circle (\pipsize);
          \fi
          \ifnum\numpips=5
            % Five pips: four corners + center
            \fill[color=boldTextColor] (\cx-0.03,\cy-0.03) circle (\pipsize);
            \fill[color=boldTextColor] (\cx+0.03,\cy-0.03) circle (\pipsize);
            \fill[color=boldTextColor] (\cx-0.03,\cy+0.03) circle (\pipsize);
            \fill[color=boldTextColor] (\cx+0.03,\cy+0.03) circle (\pipsize);
            \fill[color=boldTextColor] (\cx,\cy) circle (\pipsize);
          \fi
          \ifnum\numpips=6
            % Six pips: two columns of three
            \fill[color=boldTextColor] (\cx-0.03,\cy-0.04) circle (\pipsize);
            \fill[color=boldTextColor] (\cx-0.03,\cy) circle (\pipsize);
            \fill[color=boldTextColor] (\cx-0.03,\cy+0.04) circle (\pipsize);
            \fill[color=boldTextColor] (\cx+0.03,\cy-0.04) circle (\pipsize);
            \fill[color=boldTextColor] (\cx+0.03,\cy) circle (\pipsize);
            \fill[color=boldTextColor] (\cx+0.03,\cy+0.04) circle (\pipsize);
          \fi
        }
      }
    }

\newcommand
    {\deight}
    {
        \def\x{0cm}
        \def\y{0cm}
        \def\mult{1.8}

        \begin{tikzpicture}
        
        % primary face
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.5cm*\mult)
            -- (\x+0.433cm*\mult,\y-0.25cm*\mult)
            -- (\x-0.433cm*\mult,\y-0.25cm*\mult)
            -- cycle;
        
        % top right
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.5cm*\mult)
            -- (\x+0.433cm*\mult,\y+0.25cm*\mult)
            -- (\x+0.433cm*\mult,\y-0.25cm*\mult)
            -- cycle;
        
        % bottom
        \draw [color=shade,fill=offWhite,thick]
            (\x+0.433cm*\mult,\y-0.25cm*\mult)
            -- (\x+0cm*\mult,\y-0.5cm*\mult)
            -- (\x-0.433cm*\mult,\y-0.25cm*\mult)
            -- cycle;
        
        % top right
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.5cm*\mult)
            -- (\x-0.433cm*\mult,\y+0.25cm*\mult)
            -- (\x-0.433cm*\mult,\y-0.25cm*\mult)
            -- cycle;

        \end{tikzpicture}
    }

\newcommand
    {\dten}
    {
        \def\x{0cm}
        \def\y{0cm}
        \def\mult{1.8}

        \begin{tikzpicture}
        
        % primary face
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.5cm*\mult)
            -- (\x+0.294cm*\mult,\y-0.154cm*\mult)
            -- (\x-0cm*\mult,\y-0.3cm*\mult)
            -- (\x-0.294cm*\mult,\y-0.154cm*\mult)
            -- cycle;
        
        % top right
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.5cm*\mult)
            -- (\x+0.294cm*\mult,\y-0.154cm*\mult)
            -- (\x+0.475cm*\mult,\y-0.1cm*\mult)
            -- (\x+0.475cm*\mult,\y+0.1cm*\mult)
            -- cycle;

        % top left
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.5cm*\mult)
            -- (\x-0.294cm*\mult,\y-0.154cm*\mult)
            -- (\x-0.475cm*\mult,\y-0.1cm*\mult)
            -- (\x-0.475cm*\mult,\y+0.1cm*\mult)
            -- cycle;

        \draw [color=mainPageColor,fill=offWhite]
            (\x-0.25cm*\mult,\y-0.05cm*\mult)
            rectangle
            (\x+0.26cm*\mult,\y+0.12cm*\mult);

        % bottom right
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y-0.5cm*\mult)
            -- (\x+0cm*\mult,\y-0.3cm*\mult)
            -- (\x+0.294cm*\mult,\y-0.154cm*\mult)
            -- (\x+0.47cm*\mult,\y-0.11cm*\mult)
            -- cycle;
        
        % bottom left
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y-0.5cm*\mult)
            -- (\x+0cm*\mult,\y-0.3cm*\mult)
            -- (\x-0.294cm*\mult,\y-0.154cm*\mult)
            -- (\x-0.47cm*\mult,\y-0.11cm*\mult)
            -- cycle;

        \end{tikzpicture}
    }

\newcommand
    {\dwhat}
    {
        \def\x{0cm}
        \def\y{1cm}
        \def\mult{1.8}

        \begin{tikzpicture}

        % left face
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.25cm*\mult)
            -- (\x-0.45cm*\mult,\y+0.02cm*\mult)
            -- (\x-0cm*\mult,\y-0.75cm*\mult)
            -- cycle;

        % top right
        \draw [color=shade,fill=offWhite,thick]
            (\x+0cm*\mult,\y+0.25cm*\mult)
            -- (\x+0.45cm*\mult,\y-0.5cm*\mult)
            -- (\x+0cm*\mult,\y-0.75cm*\mult)
            -- cycle;

        \draw [color=shade,thick]
            (\x+0.45cm*\mult,\y+0.02cm*\mult)
            -- (\x-0.45cm*\mult,\y-0.5cm*\mult);

        \end{tikzpicture}
    }
