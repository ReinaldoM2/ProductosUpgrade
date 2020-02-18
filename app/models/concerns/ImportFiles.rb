require 'open-uri' 
class ImportFile
  def import_single_image_from_url(url)
    open(url) do |file| 
      puts file
    end
  end
end