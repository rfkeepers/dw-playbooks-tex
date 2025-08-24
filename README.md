# dw-playbooks-tex

Innumerable Engines' LaTeX files for composing Dungeon World Playbooks

## Quick Start (Docker - Recommended)

**No LaTeX installation required!** Use Docker to build your playbooks:

### 1. **Install prerequisites:**

- [Docker](https://docs.docker.com/get-docker/) or equivalent (try orbstack?)
- (local runs only) [Just](https://github.com/casey/just#installation)

### 2. **Download the runner:**

   ```bash
    curl -o dw-pdf https://raw.githubusercontent.com/ryankeepers/dw-playbooks-tex/main/dw-pdf
    chmod +x dw-pdf
   ```

### 3. Copy a template file

   ```bash
    # copy the playbook template for dw2 to my_playbook.tex
    ./dw-pdf template 2 my_playbook.tex
   ```

   Edit the file to your little heart's content, and then...

### 4

   ```bash
    # generates a pdf from a dw2 playbook in Light mode.
    ./dw-pdf 2 l my_playbook.tex my_finished_playbook.pdf
   ```

## Working locally (Traditional LaTeX... not recommended)

Want to use these files with a local LaTeX installation? All you need is LaTeX 2e installed and ready to compile your work. Once the language is installed, grab the three files listed below (no other images or fonts involved), put them into a folder, tell them to compile, and that's it. If everything goes well, the Template should compile neatly into a pdf, and that's your signal to start ripping out the boilerplate and plugging in your own content.

This is all open source, so you don't need to ask me for permission to use or modify any of it.  Get it and go crazy.  All I ask is that you retain the link on the last page so that others can find the resource as well.

It's always fun to see what people make with these things, or hear how the process went.  Show me what you've worked on, or give me suggestions or feedback [via email](mailto:keepers@innumerable-engines.net).

Happy typesetting!

## Files

(The dw1 and dw2 dirs have their own version of each of these.)

- template_playbook.tex : an example of a complete playbook as a boilerplate guide to making your own playbook.  Copy and modify this to start!
- dw*_playbook.cls : The primary tex document structure containing the document standards and primary commands.
- dw*_playbook.sty : The re-usable structures and styles utilized in both the document and the playbooks.
