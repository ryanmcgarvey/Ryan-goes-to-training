require 'bundler'
Bundler.setup
Bundler.require

pdf = Prawn::Document.generate('example.pdf') do |pdf|
  pdf.font "Helvetica"
  10.times do |i|
    pdf.draw_text "Hello World", :at => [50,5*i*i], :size => 10 + 10*i, :rotate => 4*i
  end
end
