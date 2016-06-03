#How much money did we make this week?
# How much of a bonus did each employee get? (bonuses are paid to employees who pilot the Planet Express)
# How many trips did each employee pilot
require 'csv'

new_money = []

CSV.foreach("planet_express_logs.csv", headers: true) do |row|

    row.to_h.select {|k,v| new_money << v.to_i  if k == "Money"}
end

        new_money.reduce(:+)

 puts "We made $#{new_money.reduce(:+)} this week"
