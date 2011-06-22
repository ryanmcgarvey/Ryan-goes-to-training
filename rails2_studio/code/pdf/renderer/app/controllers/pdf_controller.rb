#START:eg1
class PdfController < ApplicationController
  load 'example_pdf.rb'
  
  def eg1
    pdf_data = ExamplePdf.generate_pdf
    send_data pdf_data, :content_type => Mime::PDF, :disposition => "inline"
  end
#END:eg1  

#START:eg2
  def eg2
    pdf_data = ExamplePdf.generate_pdf
    send_data pdf_data, :content_type => Mime::PDF, :filename => "example.pdf"
  end
#END:eg2  

#START:eg1
end
#END:eg1