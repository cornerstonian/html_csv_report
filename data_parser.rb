# How much of a bonus did each employee get? (bonuses are paid to employees who pilot the Planet Express)
# How many trips did each employee pilot
require 'csv'
require 'erb'




pilots = ["Fry", "Amy", "Bender", "Leela"]
#arrays to hold each employees trips
fry = []
amy = []
bender = []
leela = []
title = "Voyage Data"
new_money = []


#List of all Shipments (create a table with the shipments listed)
@csv_table = CSV.open("planet_express_logs.csv", :headers => true).read


#h1 with the total money we made this week
CSV.foreach("planet_express_logs.csv", headers: true) do |row|

    row.to_h.select {|k,v| new_money << v.to_i  if k == "Money"}
        new_money.reduce(:+)
end

#puts hashes of employees trips in a corresponding arrays
CSV.foreach("planet_express_logs.csv", headers: true) do |row|
            row = row.to_h

      case row["Destination"]
      when "Earth"
          fry << row
      when "Mars"
            amy << row
      when "Uranus"
            bender << row
      else
            leela << row
      end


end


#data for the pie chart of the money each employee delivered
fry_money = fry.collect do |trip|
          trip["Crates"].to_i
end

 amy_money = amy.collect do |trip|
           trip["Crates"].to_i
end

bender_money = bender.collect do |trip|
            trip["Crates"].to_i
end

leela_money = leela.collect do |trip|
             trip["Crates"].to_i
end




# List of all employees and their number of trips and bonus
fry_trips = fry.collect do |trip|
          trip["Money"].to_i * 0.10
end

amy_trips = amy.collect do |trip|
          trip["Money"].to_i * 0.10
end

bender_trips = bender.collect do |trip|
          trip["Money"].to_i * 0.10
end

leela_trips = leela.collect do |trip|
          trip["Money"].to_i * 0.10
end




# 1) open the template
html_string = File.read("report.erb")

# 2) compile the erb
compiled_html = ERB.new(html_string).result(binding)

# 3) output the html
File.open("./index-output.html", "wb") {|file|
    file.write(compiled_html)
    file.close()
}
