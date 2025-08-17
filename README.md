# dw-playbooks-tex

Innumerable Engines' LaTeX files for composing Dungeon World Playbooks

## Quick Start (Docker - Recommended)

**No LaTeX installation required!** Use Docker to build your playbooks:

1. **Install prerequisites:**
   - [Docker](https://docs.docker.com/get-docker/) or equivalent (try orbstack?)
   - [Just](https://github.com/casey/just#installation) to run the commands

2. **Generate a PDF:**

   ```bash
   just my-template.tex my-character.pdf
   ```

That's it! The Docker image will be pulled automatically and your PDF will be generated.

### Docker Usage

The basic command is:

```bash
just <input.tex> <output.pdf>
```

**Examples:**

```bash
# Generate the template playbook
just template_playbook.tex template.pdf

# Create your own character sheet
just my-character.tex my-character.pdf
```

## Building Your Own Playbooks (Traditional LaTeX)

Want to use these files with a local LaTeX installation? All you need is LaTeX 2e installed and ready to compile your work. Once the language is installed, grab the three files listed below (no other images or fonts involved), put them into a folder, tell them to compile, and that's it. If everything goes well, the Template should compile neatly into a pdf, and that's your signal to start ripping out the boilerplate and plugging in your own content.

This is all open source, so you don't need to ask me for permission to use or modify any of it.  Get it and go crazy.  All I ask is that you retain the link on the last page so that others can find the resource as well.

It's always fun to see what people make with these things, or hear how the process went.  Show me what you've worked on, or give me suggestions or feedback [via email](mailto:keepers@innumerable-engines.net).

Happy typesetting!

## Files

(The dw1 and dw2 dirs have their own version of each of these.)

- template_playbook.tex : an example of a complete playbook as a boilerplate guide to making your own playbook.  Copy and modify this to start!
- dw*_playbook.cls : The primary tex document structure containing the document standards and primary commands.
- dw*_playbook.sty : The re-usable structures and styles utilized in both the document and the playbooks.
