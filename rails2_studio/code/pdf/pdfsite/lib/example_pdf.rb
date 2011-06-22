module ExamplePdf

  def self.generate_pdf
    pdf = Prawn::Document.new
    pdf.font "Helvetica"
    10.times do |i|
      pdf.draw_text "Hello World", :at => [50,5*i*i], :size => 10 + 10*i, :rotate => 4*i
    end
    pdf.render
  end
end