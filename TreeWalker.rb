require 'fileutils'

# TreeWalker walks through directories and processes files with extention
# For actual funcitonality, subcalss TreeWalker and implement process_file( filename )
# TreeWalker can exclude hidden fiels (Default) and work recursively (default)
# Furthermore, files with extension which are not to be processed can be ex-
# cluded.
class TreeWalker

  def initialize( extension, recursive = true, hidden = false )
    @excluded_files = []
    @recursive = recursive
    @ext = extension
    @hidden = hidden
  end
  
  def exclude_file( filename )
    @excluded_files.push( filename )
  end

  def process_file( filename )
    puts filename
  end
  
  def file_excluded?( filename )
    return @excluded_files.include?( filename )
  end
  
  def process_directory( dir )
  
    old_dir = FileUtils.pwd
    
    # Enter new directory
    FileUtils.cd dir
    
    Dir.foreach(".") do |item| 
    
      if File.directory?(item) and @recursive then
        # The current directory and the parent are not processed.
        if not (item == "." or item == "..") then
          if @hidden and item =~ /^\..+/ then
            process_directory( item )
          else
            process_directory( item )
          end
        end
        
      elsif File.exists?( item ) and File.extname( item ) == ".#{@ext}" then
        # Excluded texfiles are not processed
        if not file_excluded?( item ) then
          process_file( item )
        end
        
      end
    end
    
    # Go back to the old directory
    FileUtils.cd old_dir
  end

end