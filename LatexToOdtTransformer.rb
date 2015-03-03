require '/home/htdebeer/bin/Transformer.rb'

# Transform a LaTeX 2e file into a odt file by running oolatex and bibtex 
class LatexToOdtTransformer < Transformer
  def initialize()
    super( "tex", "odt" )
  end
  
  def process( name )
    system( "oolatex", "#{name}" )
    system( "bibtex", "#{name}" )
    system( "oolatex", "#{name}" )
  end
end
