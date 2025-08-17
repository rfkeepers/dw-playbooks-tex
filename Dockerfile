# Use the official TeX Live full distribution
FROM texlive/texlive:latest

# Install additional packages that might be needed
RUN apt-get update && apt-get install -y \
    ghostscript \
    && rm -rf /var/lib/apt/lists/*

# Create local TeX directory structure in texmf-local (the standard location)
RUN mkdir -p /usr/local/texlive/texmf-local/tex/latex/dw-playbooks

# Copy the class and style files directly into the TeX system
COPY dw1/dw1_playbook.cls /usr/local/texlive/texmf-local/tex/latex/dw-playbooks/
COPY dw1/dw1_playbook.sty /usr/local/texlive/texmf-local/tex/latex/dw-playbooks/
COPY dw2/dw2_playbook.cls /usr/local/texlive/texmf-local/tex/latex/dw-playbooks/
COPY dw2/dw2_playbook.sty /usr/local/texlive/texmf-local/tex/latex/dw-playbooks/

# Update TeX database to recognize the new files
RUN mktexlsr

# Set the working directory
WORKDIR /tex

# Default command - compile a tex file
# Usage: docker run --rm -v "$(pwd):/tex" dw-playbooks-tex pdflatex filename.tex
CMD ["pdflatex", "--help"]
