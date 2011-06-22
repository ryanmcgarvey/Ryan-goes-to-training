require 'bundler'
Bundler.setup
Bundler.require

Prawn::Document.generate(__FILE__.sub(/\.rb/, '.pdf')) do |pdf|
  pdf.font "Courier" 
  pdf.move_down 20
  File.foreach(__FILE__) do |line|
    height = pdf.height_of(line)
    pdf.draw_text(line, :at => [0, pdf.y] )
    pdf.move_down(height*1.2)
  end
end