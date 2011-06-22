pdf.font "Helvetica"

pdf.fill_color("#444488")
pdf.text "Your Events", :size => 50, :style => :bold

@events.each do |event| 
  if pdf.y < 100
    pdf.start_new_page
  end
  
  pdf.fill_color("#448844")
  pdf.text event.name, :size => 18, :style => :bold
    
  pdf.fill_color("000000")
  pdf.text event.description.strip
  pdf.move_down 10
end