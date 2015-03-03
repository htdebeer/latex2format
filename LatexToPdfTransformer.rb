require '/home/htdebeer/bin/Transformer.rb'

# Transform a LaTeX 2e file into a pdf file by running pdflatex and bibtex 
class LatexToPdfTransformer < Transformer
  def initialize()
    super( "tex", "pdf" )
  end
  
  def process( name )
    system( "pdflatex", "#{name}" )
    system( "pdflatex", "#{name}" )
    system( "bibtex", "#{name}" )
    system( "pdflatex", "#{name}" )
    system( "pdflatex", "#{name}" )
  end
end
