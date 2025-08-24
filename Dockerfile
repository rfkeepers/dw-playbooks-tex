# Use official TeX Live Docker image (small variant) - maintained and up-to-date
FROM texlive/texlive:latest-small

# Install additional packages we need
RUN apt-get update \
    && apt-get install -qy \
        bash \
        wget \
        unzip \
    && rm -rf /var/lib/apt/lists/*

# Install libertinus fonts and other LaTeX package dependencies using tlmgr
RUN tlmgr install libertinus libertinus-type1 fontaxes titlesec

# Create directory for dw-playbooks
RUN mkdir -p /usr/local/texlive/texmf-local/tex/latex/dw-playbooks

# Create directory for template files
RUN mkdir -p /usr/local/share/dw-playbook-templates

# Copy the class and style files directly into the TeX system
COPY dw1/dw1_playbook.cls /usr/local/texlive/texmf-local/tex/latex/dw-playbooks/
COPY dw1/dw1_playbook.sty /usr/local/texlive/texmf-local/tex/latex/dw-playbooks/
COPY dw2/dw2_playbook.cls /usr/local/texlive/texmf-local/tex/latex/dw-playbooks/
COPY dw2/dw2_playbook.sty /usr/local/texlive/texmf-local/tex/latex/dw-playbooks/

# Copy template files for user access
COPY dw1/template_playbook.tex /usr/local/share/dw-playbook-templates/dw1_template.tex
COPY dw2/template_playbook.tex /usr/local/share/dw-playbook-templates/dw2_template.tex

# Update TeX database to recognize the new files
RUN mktexlsr

# Copy and set up the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the working directory
WORKDIR /tex

# Set entrypoint to our wrapper script
# Usage: docker run --rm -v "$(pwd):/tex" dw-playbooks-tex <version> <mode> <input.tex> <output.pdf>
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
