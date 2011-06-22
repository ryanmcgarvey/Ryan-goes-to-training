pdf.font "Helvetica"
pdf.fill_color("444488")
pdf.text "Your Events", :size => 50, :style => :bold, :align => :center
pdf.move_down 20

@events.each do |event| 
  if pdf.y < 100
    pdf.start_new_page
  end 
                           
  pdf.fill_color("448844")
  pdf.text event.name, :size => 18, :style => :bold, :align => :center

  pdf.stroke_color("77aa77")
  pdf.stroke_rounded_rectangle([0, pdf.y - 7], 500, 30, 10) 
  pdf.move_down 44
  
  img = pdf.image File.join("public", event.image_location), :at => [0, pdf.y ]
  pdf.fill_color("000000")
  desc = event.description.strip.gsub(/\s+/, ' ')
  text_height = pdf.height_of(desc)
  pdf.text_box desc, :width => 400, :at => [ 100, pdf.y ] 
  pdf.move_down (text_height > img.height ? text_height : img.height)
end

pdf.number_pages "<page> of <total>", [ pdf.bounds.right-50,0]
