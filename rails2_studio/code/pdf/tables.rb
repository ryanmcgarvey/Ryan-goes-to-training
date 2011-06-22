#START:constants1
require "bundler"
Bundler.setup
Bundler.require
   
constants = Float.constants.map {|c| [c.to_s, Float.const_get(c)]}

Prawn::Document.generate("constants1.pdf") do
  table(constants)  
end        
#END:constants1

#START:constants2
Prawn::Document.generate("constants2.pdf") do
  table([[ "Name", "Value" ], *constants]) do  |t| 
    t.header = true
    t.row_colors = [ "aaaaff", "aaffaa", "ffaaaa" ]
    t.row(0).style :background_color => '448844', :text_color => 'ffffff'
    t.columns(1).align = :right
  end
end    
#END:constants2
               
#START:bill
Prawn::Document.generate("bill.pdf") do 

  self.font_size = 9

  Widths = [50, 90, 170, 90, 90, 50]
  Headers = ["Date", "Patient Name", "Description", "Charges / Payments", 
             "Patient Portion Due", "Balance"]

  head = make_table([Headers], :column_widths => Widths)

  data = []

  def row(date, pt, charges, portion_due, balance)
    rows = charges.map { |c| ["", "", c[0], c[1], "", ""] }

    # Date and Patient Name go on the first line.
    rows[0][0] = date
    rows[0][1] = pt

    # Due and Balance go on the last line.
    rows[-1][4] = portion_due
    rows[-1][5] = balance

    # Return a Prawn::Table object to be used as a subtable.
    make_table(rows) do |t|
      t.column_widths = Widths
      t.cells.style :borders => [:left, :right], :padding => 2
      t.columns(4..5).align = :right
    end

  end

  data << row("1/1/2010", "", [["Balance Forward", ""]], "0.00", "0.00")
  5.times do |i|
    details = []
    (i+1).times do |d|
      details << [ "Item #{d*100 + i}", "Cost code #{d*13 + i * 91}"]
    end
    data << row("1/1/2010", "John", details, "5.00", "0.00")
  end


  # Wrap head and each data element in an Array -- the outer table has only one
  # column.
  table([[head], *(data.map{|d| [d]})], :header => true, :row_colors => %w[eeffee ffddff]) do
    
    row(0).style :background_color => '330033', :text_color => 'ffffff'
    cells.style :borders => []
  end

end   
#END:bill