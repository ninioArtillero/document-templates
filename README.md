# Document Templates

This repository contains templates for generating different _simple document flavors_,
in PDF format, from markdown files using [Pandoc](https://pandoc.org/).

Features:

* Embed music scores using [Lylipond](https://lilypond.org/) codeblocks:
    ```lilypond {#id .ly-fragment ly-caption="The C major scale" ly-name="c-major"}
    \version "2.24.4"

    \paper {
      line-width = 60\mm
      indent = 7\mm
    }

    {
      \relative {
        c' d e f g a b c
      }
    }
    ```



## Dependencies

You need `pandoc`, `make` and `pdflatex`(included in any 
[standard LaTex installation](https://www.latex-project.org/get/).
Also install `lilypond` if you want to create scores.

This has been tested only with Pandoc v.3.6.4, but should be ok with other recent
versions.

## Usage

Clone this repository and run `make` at the repository root to create an example
document of each supported flavor.

For an specific type, run `make <type>`.

The following flavors are currently available: `article`, `letter` and `thesis`.

To create your own document erase the existing markdown files and put
your own at the top level or in whatever subdirectory arrangement you want.
Make sure to modify the [Makefile](./Makefile) and change the `SOURCE` variable
to your files (using relative paths).

Also, change the included [references.bib](./references.bib) with your own
references in bibtex or biblatex format. If you don't need citations
you can leave this as is (they are not rendered if no citation is called),
but if you delete the file make sure to clear it references in the Makefile.

## Configuration

Some configuration options you would probably want to tweak can be found at
[`templates/common-options.yaml`](./templates/common-options.yaml) and
[`templates/common-defaults.yaml`](./templates/common-defaults.yaml),
which apply to all document flavors.
