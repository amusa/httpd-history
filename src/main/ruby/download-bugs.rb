#!/usr/bin/env ruby
require 'csv'
require 'mechanize'
require 'ruby-progressbar'

a = Mechanize.new

num_files = File.open("allbugs.csv").readlines.size

puts "Downloading #{num_files} files into xml/\nThis could take about #{num_files/20} minutes.\n"
progress = ProgressBar.create(:starting_at => 0, :total => num_files)

CSV.foreach("allbugs.csv") do | row |
  bug_id = row[0].to_i
  #print "Downloading bug #{bug_id}..."
  a.get("https://issues.apache.org/bugzilla/show_bug.cgi?ctype=xml&id=#{bug_id}") do | page |
    File.open("./xml/#{bug_id}.xml","w+"){ |file| file.write(page.body) }
  end
  progress.increment
end

