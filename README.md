# latex2format
Convert LaTeX file to ODT, DOC, or PDF (outdated)

I wrote this utility script in 2007 to help convert my LaTeX documents to the
MS Word format, OpenOffice ODT format, and PDF. I also added a script to run
these conversion automatically on a directory tree.

This program is outdated; I moved to [pandoc](http://pandoc.org) for all my
document conversion needs as it more general and, over-all, a lot better than
these simple helper scripts. Still, someone might have a use for it.

## Usage

You can run the latex2odt, lated2doc, and latex2pdf scripts as follows:

    latex2odt filename.tex

It will create `filename.odt`. The same for the other two scripts. 

If you want to convert a directory tree, use `LatexTreeWalker.rb` like

    LatexTreeWalker.rb dirname

It will convert recursively all `.tex` files in ODT and PDF files. Adapt to
suit your needs.    

## Requirements

- tex4ht (for conversion to ODT)

- OpenOffice/LibreOffice (for conversion to DOC). Furthermore, you have to
  register a macro in OpenOffice/LibreOffice; follow instructions on
  http://www.xml.com/pub/a/2006/01/11/from-microsoft-to-openoffice.html

- latex (for conversion to PDF)
