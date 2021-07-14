%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    ID
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dw_playbook}[2021/07/02 Dungeon World Playbook Document Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    package declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[letterpaper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{libertinus}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\RequirePackage[T1]{fontenc}

\RequirePackage{dw_playbook}

\RequirePackage{enumitem}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{xargs}
\RequirePackage{xcolor}
\RequirePackage{multicol}

% import me last
\RequirePackage[colorlinks=true]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{a4paper}{\OptionNotUsed}
\DeclareOption{darkmode}{
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
    \definecolor{offWhiteD}{HTML}{EAEAEA}
    \colorlet{offWhite}{offWhiteD}
    \definecolor{paleD}{HTML}{F3F3F3}
    \colorlet{pale}{paleD}
    \definecolor{paleishD}{HTML}{CACACA}
    \colorlet{paleish}{paleishD}
    \definecolor{shadeD}{HTML}{CCCCCC}
    \colorlet{shade}{shadeD}
    \definecolor{shadeishD}{HTML}{A0A0A0}
    \colorlet{shadeish}{shadeishD}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

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

\setlist{
    leftmargin=0mm,
    rightmargin=0mm,
    itemsep=0mm,
    parsep=0mm,
    partopsep=0mm,
}

\hypersetup{urlcolor=cyan}

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
        \begin{minipage}[t]{0.31\textwidth}
            \str\\

            \int
        \end{minipage}
        \begin{minipage}[t]{0.31\textwidth}
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

            \draw [color=paleish] (\x+2.87,0.475) node {\headertext{¢}};
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
            \draw [color=headerTextColor] (1.2,0.375  ) node {\headertext{Level}};

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

            \draw [color=headerLightColor] (\x+3.365,0.365) node {\Large{XP}};
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

            \draw [text width=1cm,color=headerTextColor] (6.8,0.4) node {\headertext{Armor}};
        \end{tikzpicture}
    }

\newcommand
    {\hitpoints}
    [1]
    {
        \def\x{7.25}
        \begin{tikzpicture}
            \filldraw [color=headerFill] (0,0) rectangle (8.5,0.75);
            \draw [text width=1cm,color=headerTextColor] (1,0.4) node {\headertext{Hit Points}};
  
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

            \draw [text width=1cm,color=headerTextColor] (6.55,0.35) node {\headertext{Damage}};
        \end{tikzpicture}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    looks, race, alignment, bonds, gear
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
            \begin{FlushLeft}
                \important{#1}: #2
            \end{FlushLeft}
        \end{minipage}
    }

\newcommand
    {\race}
    {\header{Race}{5.8}{1}\\[2mm]}
\newcommand
    {\raceOption}
    [2]
    {\selectable{#1}{#2}\\[3mm]}

\newcommand
    {\alignment}
    {\headerl{Alignment}{5.8}{1}{0.325}\\[2mm]}
\newcommand
    {\alignmentOption}
    [2]
    {\selectable{#1}{#2}}

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
            \begin{FlushLeft}
                #1
            \end{FlushLeft}
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
            \begin{FlushLeft}
                \small{#1}
            \end{FlushLeft}
        \end{minipage}
    }
\newcommand
    {\gearOptionSelectable}
    [1]
    {\tinySelectable{#1}\\[2mm]}
\newcommand
    {\dungeonRations}
    {\gearOption{\important{Dungeon Rations} (5 uses, ration, 1 weight)}}
\newcommand
    {\adventuringGear}
    {\gearOption{\important{Adventuring Gear} (5 uses, 1 weight)}}

\newcommand
    {\notes}
    {\header{Notes}{5.8}{1}\\}

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
    {\sixUpMoves}
    {
        \begin{minipage}[t]{\textwidth}
            {\separator{13}}\\[1mm]
            \subtext{When you gain a level from 6-10, you may choose from these moves:}
        \end{minipage}
    }