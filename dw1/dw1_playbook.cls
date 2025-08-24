%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    ID
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dw1_playbook}[2021/07/02 Dungeon World Playbook Document Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    package declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[letterpaper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{libertinus}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\RequirePackage[T1]{fontenc}

\RequirePackage{dw1_playbook}

\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{multicol}

% import me last
\RequirePackage[colorlinks=true]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
    \definecolor{offWhiteD}{HTML}{303030}
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

\newcommand{\playbook}{Playbook_Name}
\newcommand
    {\setPlaybook}
    [1]
    {\renewcommand{\playbook}{#1}}

\newcommand{\damagedie}{\dten}
\newcommand
    {\setDamage}
    [1]
    {\renewcommand{\damagedie}{#1}}

\newcommand{\hpbase}{6}
\newcommand
    {\setMinHitPoints}
    [1]
    {\renewcommand{\hpbase}{#1}}

\newcommand{\loadbase}{6}
\newcommand
    {\setMinLoad}
    [1]
    {\renewcommand{\loadbase}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand
    {\maketitle}
    {
        \fcolorbox{titleFill}{titleFill}{
        \begin{minipage}[t]{\textwidth}
            \medskip
            \textbf{\color{headerTextColor} \Huge~~~\@title}
            \smallskip
        \end{minipage}
        }
    }

\newcommand
    {\names}
    [1]
    {\subtext{Names: #1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    stat block
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\str}
    {\stat{Strength}{STR}}
\newcommand
    {\dex}
    {\stat{Dexterity}{DEX}}
\newcommand
    {\con}
    {\stat{Constitution}{CON}}
\renewcommand
    {\int}
    {\stat{Intelligence}{INT}}
\newcommand
    {\wis}
    {\stat{Wisdom}{WIS}}
\newcommand
    {\cha}
    {\stat{Charisma}{CHA}}

\newcommand
    {\stats}
    {
        \begin{minipage}[t]{0.323\textwidth}
            \str\\

            \int
        \end{minipage}
        \begin{minipage}[t]{0.323\textwidth}
            \dex\\

            \wis
        \end{minipage}
        \begin{minipage}[t]{0.3\textwidth}
            \con\\
            
            \cha
        \end{minipage}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    level, armor, hitpoints, damage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\level}
    {
        \def\x{4.4}
        \begin{tikzpicture}
            \filldraw [color=headerFill] (0,0) rectangle (8.5,0.75);
            \draw [color=headerTextColor] (1.2,0.375  ) node {\hugetext{Level}};

            \filldraw [color=black,fill=white,thick]
                (\x+1.75,0.7) -- (\x+2.25,1)
                -- (\x+2.25,1) -- (\x+2.75,0.7)
                -- (\x+2.75,0.7) -- (\x+2.75,0.05)
                -- (\x+2.75,0.05) -- (\x+2.25,-0.25)
                -- (\x+2.25,-0.25) -- (\x+1.75,0.05)
                -- (\x+1.75,0.05) -- (\x+1.75,0.7);

            \filldraw [color=black,fill=white,thick]
                (\x+2.85,0.7) -- (\x+3.35,1)
                -- (\x+3.35,1) -- (\x+3.85,0.7)
                -- (\x+3.85,0.7) -- (\x+3.85,0.05)
                -- (\x+3.85,0.05) -- (\x+3.35,-0.25)
                -- (\x+3.35,-0.25) -- (\x+2.85,0.05)
                -- (\x+2.85,0.05) -- (\x+2.85,0.7);

            \draw [color=headerLightColor] (\x+3.365,0.365) node {\Large{\color{paleish} XP}};
        \end{tikzpicture}
    }

\newcommand
    {\armor}
    {
        \def\x{0.45}
        \begin{tikzpicture}
            \filldraw [color=headerFill] (0,0) rectangle (8.5,0.75);
            \draw [color=black,fill=white,thick]
                (\x+1.5,1)
                to [out=160,in=330] (\x+0.75,1.25)
                to [out=210,in=20] (\x,1)
                to [out=270,in=165] (\x+0.75,-0.25)
                to [out=15,in=270] cycle (\x+0.5,0.75);

            \draw [text width=1cm,color=headerTextColor] (6.8,0.4) node {\hugetext{Armor}};
        \end{tikzpicture}
    }

\newcommand
    {\hitpoints}
    [1]
    {
        \def\x{7.25}
        \begin{tikzpicture}
            \filldraw [color=headerFill] (0,0) rectangle (8.5,0.75);
            \draw [text width=1cm,color=headerTextColor] (1,0.4) node {\hugetext{Hit Points}};
  
            % thanks to A.Ellett for the heart:
            % https://tex.stackexchange.com/questions/139733/can-we-make-a-love-heart-with-latex
            \draw [color=black,fill=white,thick]
                (\x,-0.5)
                .. controls (\x,0.15) and (\x-1,0)
                .. (\x-1,0.65)
                arc (180:0:0.5)
                -- cycle;
            \draw [color=black,fill=offWhite,thick]
                (\x,-0.5)
                .. controls (\x,0.15) and (\x+1,0)
                .. (\x+1,0.65)
                arc (0:180:0.5)
                -- cycle;

            \draw (5,0.155) node {\textsl{\color{headerLightColor}\footnotesize Max (#1+Constitution)}};
        \end{tikzpicture}
    }

\newcommand
    {\damage}
    [1]
    {
        \begin{tikzpicture}
            \filldraw [color=headerFill] (0,0) rectangle (8.5,0.75);

            #1

            \draw [text width=1cm,color=headerTextColor] (6.55,0.35) node {\hugetext{Damage}};
        \end{tikzpicture}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    looks, race, alignment, bonds, gear (also background, drives, flags)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\looks}
    {
        \begin{minipage}[t]{\textwidth}
            \header{Looks}{5.8}{1}\\[2mm]
            \subtext{Choose one from each, or write your own:}
        \end{minipage}
    }
\newcommand
    {\looksOption}
    [2]
    {
        \begin{minipage}[t]{\textwidth}
            \vspace{3mm}
            \begin{flushleft}
                \important{#1}: #2
            \end{flushleft}
        \end{minipage}
    }

\newcommand
    {\race}
    {\header{Race}{5.8}{1}\\[2mm]}
\newcommand
    {\raceOption}
    [2]
    {\move{#1}{#2}\\[3mm]}

\newcommand
    {\alignment}
    {\headerl{Alignment}{5.8}{1}{0.325}\\[2mm]}
\newcommand
    {\alignmentOption}
    [2]
    {\move{#1}{#2}}

\newcommand
    {\drives}
    {\header{Drives}{5.8}{1}\\[2mm]}
\newcommand
    {\drivesOption}
    [2]
    {\move{#1}{#2}}

\newcommand
    {\background}
    {\headerl{Background}{5.8}{1}{0.325}\\[2mm]}
\newcommand
    {\backgroundOption}
    [2]
    {\move{#1}{#2}\\[3mm]}

\newcommand
    {\bonds}
    {
        \begin{minipage}[t]{\textwidth}
            \header{Bonds}{5.8}{1}\\[1.5mm]
            \subtext{Fill in at least one with the name of a companion, or write your own:}
        \end{minipage}
    }
\newcommand
    {\bondOption}
    [1]
    {
        \begin{minipage}[t]{\textwidth}
            \vspace{2mm}
            \begin{flushleft}
                #1
            \end{flushleft}
        \end{minipage}
    }

\newcommand
    {\flags}
    [1][two]
    {
        \begin{minipage}[t]{\textwidth}
            \headerl{Flags}{5.8}{1}{0.325}\\[1.5mm]
            \subtext{Choose #1:}
        \end{minipage}
    }
\newcommand
    {\flagsOption}
    [2]
    {
        \begin{minipage}[t]{\textwidth}
            \vspace{2mm}
            \begin{flushleft}
                #1 - #2
            \end{flushleft}
        \end{minipage}
    }
\newcommand
    {\emptyFlagsOption}
    {
        \begin{minipage}[t]{\textwidth}
            \vspace{3mm}
            \begin{flushleft}
                {\blank{1.5}~~-~~\blank{3.7}}
            \end{flushleft}
        \end{minipage}
    }
    

\newcommand
    {\gear}
    {\header{Gear}{5.8}{1}\\[2mm]}
\newcommand
    {\gearOption}
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
    {\gearOptionSelectable}
    [1]
    {\select{#1}\\[2mm]}

\newcommand
    {\gearOptionMaybeSelectable}
    [2]
    {
        \ifx u#1 \gearOption{#2}\fi%
        \ifx s#1 \gearOptionSelectable{#2}\fi%
    }
\newcommand
    {\dungeonRations}
    [1][u]
    {\gearOptionMaybeSelectable{#1}{\important{Dungeon Rations} (5 uses, \tag{ration}, 1 weight)}}
\newcommand
    {\adventuringGear}
    [1][u]
    {\gearOptionMaybeSelectable{#1}{\important{Adventuring Gear} (5 uses, 1 weight)}}
\newcommand
    {\bandages}
    [1][u]
    {\gearOptionMaybeSelectable{#1}{\important{Bandages} (3 uses, slow, 0 weight)}}

\newcommand
    {\notes}
    {\header{Notes}{5.8}{1}\\}

\newcommand
    {\load}
    {
        \def\x{2.4}
        \begin{tikzpicture}[baseline=(current bounding box.north)]
            \filldraw [color=headerFill] (0,0) rectangle (5.8,0.75);

            \filldraw [color=black,fill=pale,thick]
                (\x+2,0.9) -- (\x+2.85,0.9)
                -- (\x+3.1,-0.2) -- (\x+1.75,-0.2)
                -- cycle;

            \filldraw [color=black,fill=pale,thick]
                (\x+2.1,0.9) -- (\x+2.2,1)
                -- (\x+2.65,1) -- (\x+2.75,0.9)
                -- (\x+2.65,0.9) -- (\x+2.55,0.925)
                -- (\x+2.3,0.925) -- (\x+2.2,0.9)
                -- cycle;

            \draw (\x+0.9,0.155) node {\textsl{\color{headerLightColor}\footnotesize Max (\loadbase+STR)}};
            \draw [text width=1cm,color=headerTextColor] (1,0.4) node {\hugetext{Load}};
        \end{tikzpicture}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    starting and advanced moves
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\startingMoves}
    {\headerl[r]{Starting Moves}{12.9}{10.75}{0.35}}

\newcommand
    {\advancedMoves}
    {
        \begin{minipage}[t]{\textwidth}
            \header[r]{Advanced Moves}{12.9}{11.2}\\

            \subtext{When you gain a level from 2-10, you may choose from these moves:}
        \end{minipage}
    }

\newcommand
    {\advancedMovesCont}
    {
        \begin{minipage}[t]{\textwidth}
            \header[r]{Advanced Moves (cont.)}{12.9}{9.2}\\
        \end{minipage}
    }

\newcommand
    {\advancedMovesContWithSubtext}
    {
        \begin{minipage}[t]{\textwidth}
            \header[r]{Advanced Moves}{12.9}{11.2}\\

            \subtext{When you gain a level from 6-10, you may choose from these moves:}
        \end{minipage}
    }

\newcommand
    {\sixUpMoves}
    {
        \begin{minipage}[t]{\textwidth}
            {\separator{13}}\\[1mm]
            \subtext{When you gain a level from 6-10, you may choose from these moves:}
        \end{minipage}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    page layouts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand
    {\pageOne}[3]
    {\maketitle
    \begin{minipage}[t]{0.05\textwidth}
        ~ % left margin hack
    \end{minipage}
    \begin{minipage}[t]{0.90\textwidth}
        % the playbook content goes here
        \begin{minipage}{\textwidth}
            #1
        \end{minipage}

        % top section: stats, level, armor, etc
        \begin{minipage}{0.465\textwidth}
            \vspace{3mm}
            \level\\
            \armor\\
            \hitpoints{\hpbase}\\
            \damage{\damagedie}
        \end{minipage}
        \begin{minipage}{0.52\textwidth}
            \begin{minipage}[t]{\textwidth}
                \begin{minipage}[t]{0.15\textwidth}
                    \coin
                \end{minipage}
                \begin{minipage}[t]{0.85\textwidth}
                    \vspace{3mm}
                    \hugetext{Name:}
                    \blank{5.9}
                \end{minipage}
            \end{minipage}

            \vspace{1mm}
            \stats
        \end{minipage}

        \vspace{0.3cm}
        % lower left column: looks, race, etc
        \begin{minipage}[t]{0.3\textwidth}
            #2
        \end{minipage}
        % whitespace divider
        \begin{minipage}[t]{4mm}
            ~
        \end{minipage}
        % lower right column: starting moves
        \begin{minipage}[t]{0.65\textwidth}
            \startingMoves\\[2mm]
            \begin{multicols*}{2}
                #3
            \end{multicols*}
        \end{minipage}
    \end{minipage}
    \begin{minipage}[t]{0.05\textwidth}
        ~ % right margin hack
    \end{minipage}}

\newcommand
    {\pageTwo}[3]
    {
        \begin{minipage}[t]{0.05\textwidth}
            ~ % left margin hack
        \end{minipage}
        \begin{minipage}[t]{0.9\textwidth}
        
            % left column: bonds, alignment, gear, blanks
            \begin{minipage}[t]{0.3\textwidth}
                #1
            \end{minipage}
            % whitespace divider
            \begin{minipage}[t]{4mm}
                ~
            \end{minipage}
            % right column: moves
            \begin{minipage}[t]{0.65\textwidth}
                \advancedMoves
            
                \begin{multicols*}{2}
                    #2
                \end{multicols*}
                \sixUpMoves
                \begin{multicols*}{2}
                    #3
                \end{multicols*}
            \end{minipage}
        \end{minipage}
        \begin{minipage}[t]{0.05\textwidth}
            ~ % right margin hack
        \end{minipage}}

\newcommand
    {\pageTwoShort}[2]
    {
        \begin{minipage}[t]{0.05\textwidth}
            ~ % left margin hack
        \end{minipage}
        \begin{minipage}[t]{0.9\textwidth}
        
            % left column: bonds, alignment, gear, blanks
            \begin{minipage}[t]{0.3\textwidth}
                #1
            \end{minipage}
            % whitespace divider
            \begin{minipage}[t]{4mm}
                ~
            \end{minipage}
            % right column: moves
            \begin{minipage}[t]{0.65\textwidth}
                \advancedMoves
            
                \begin{multicols*}{2}
                    #2
                \end{multicols*}
            \end{minipage}
        \end{minipage}
        \begin{minipage}[t]{0.05\textwidth}
            ~ % right margin hack
        \end{minipage}}

\newcommand
    {\pageThree}[4][m]
    {
        \begin{minipage}[t]{0.05\textwidth}
            ~ % left margin hack
        \end{minipage}
        \begin{minipage}[t]{0.9\textwidth}
        
            % left column: filler lines
            \begin{minipage}[t]{0.3\textwidth}
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
            % whitespace divider
            \begin{minipage}[t]{4mm}
                ~
            \end{minipage}
            % right column: moves
            \begin{minipage}[t]{0.65\textwidth}
                #2
        
                \ifx m#1\begin{multicols*}{2}\fi
                    #3
                \ifx m#1\end{multicols*}\fi
                
                #4
            \end{minipage}
        \end{minipage}
        \begin{minipage}[t]{0.05\textwidth}
            ~ % right margin hack
        \end{minipage}}

\newcommand
    {\pageThreeShort}[3][m]
    {
        \begin{minipage}[t]{0.05\textwidth}
            ~ % left margin hack
        \end{minipage}
        \begin{minipage}[t]{0.9\textwidth}
        
            % left column: filler lines
            \begin{minipage}[t]{0.3\textwidth}
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
            % whitespace divider
            \begin{minipage}[t]{4mm}
                ~
            \end{minipage}
            % right column: moves
            \begin{minipage}[t]{0.65\textwidth}
                #2
                \begin{multicols*}{2}
                    #3
                \end{multicols*}
            \end{minipage}
        \end{minipage}
        \begin{minipage}[t]{0.05\textwidth}
            ~ % right margin hack
        \end{minipage}}

\newcommand
    {\resourceLinks}[1]
    {
        \begin{minipage}[t]{0.1\textwidth}
            ~ % left margin hack
        \end{minipage}
        \begin{minipage}[t]{0.8\textwidth}
            ~\gap

            The \LaTeX~template for this playbook, and other playbooks made with this resource, can be found at:\\\url{https://innumerable-engines.net/dwplaybooks}
            ~\gap

            Dungeon World is designed by Sage LaTorra and Adam Koebel and can be found at:\\\url{https://dungeon-world.com}
            ~\gap

            This playbook is licensed under Creative Commons BY-SA v4.0:\\\url{https://creativecommons.org/licenses/by-sa/4.0/legalcode.txt}.
            ~\gap

            #1
        \end{minipage}
        \begin{minipage}[t]{0.1\textwidth}
            ~ % right margin hack
        \end{minipage}
    }
