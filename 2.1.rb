
  #     Сделать хеш, содеращий месяцы и количество дней в месяце.
  #     В цикле выводить те месяцы, у которых количество дней ровно 30.

  month = Hash.new
  month["January"] = 31
  month["February"] = 28
  month["March"] = 31
  month["April"] = 30
  month["May"] = 31
  month["June"] = 30
  month["July"] = 31
  month["August"] = 31
  month["September"] = 30
  month["October"] = 31
  month["November"] = 30
  month["December"] = 31

  month.each do |name, day|
if day == 30
  puts name
end
end