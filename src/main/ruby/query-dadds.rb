#!/usr/bin/env ruby
require 'nokogiri'
require 'trollop'
require 'base64'

pwd = Dir.getwd

opts = Trollop::options do
  banner "Count the number of comments in Bugzlla bugs stored in xml files"
  opt :xmls, "The xml/ directory of Bugzillas", :default => './xml/'
  opt :bugs, "A file with the bug IDs to collect", :default => ''
end

Trollop::die "xml directory must be a directory" unless Dir.exists?(opts[:xmls])
Trollop::die "bugs file not found!" unless File.exists?(opts[:bugs]) || opts[:bugs].eql?('')

if opts[:bugs].nil? || opts[:bugs].eql?('')
  Dir.chdir(opts[:xmls]); 
  files = Dir.glob("*.xml")
  Dir.chdir(pwd)
else
  files = File.open(opts[:bugs]).readlines.collect {|f| f.strip + ".xml" }
  puts files
end

def read_bug(file)
  xml = Nokogiri::XML(File.open(file,"r"))

  # Query the XML for stuff
  id = xml.at_xpath("//bug_id").content.to_i
  patches = xml.xpath("//attachment[@ispatch=1]")
  votes = xml.at_xpath("//votes").content.to_i
  priority = xml.at_xpath("//priority").content
  severity = xml.at_xpath("//bug_severity").content
  status = xml.at_xpath("//bug_status").content
  resolution = xml.at_xpath("//resolution").content
  comments = xml.xpath("//thetext")
  comment_ids = xml.xpath("//commentid")
  commentor_nodes = xml.xpath("//who")
  reporter = xml.at_xpath("//reporter").content
  
  # Pull the commentors
  commentors = []
  commentor_nodes.each { |c| commentors << c.content }
  commentors.uniq!

  # Count the number of comments not made by the reporter
  non_reporter_comments = 0
  commentor_nodes.each { |c| non_reporter_comments+=1 if !reporter.eql?(c.content) }

  # Count the number of files for each patch
  patch_files = []
  patches.each do |node|
    Base64.decode64(node.at_xpath("//data").content).each_line do |line| 
      patch_files << line.split("\t")[0].split(" ")[1] if line.start_with? "+++ "
    end
  end
  patch_files.uniq!

  # Count the number of comments that were a reply to another comment
  replies = 0
  comments.each{|c| replies +=1 if c.content.include? "(In reply to comment"}

  # Did any comments mention RFC?
  mention_rfc = "No"
  comments.each{|c| mention_rfc = "Yes" if c.content.downcase.include? "rfc"}

  # Print to console!
  puts "#{id}\t#{comment_ids.size}\t#{commentors.size}\t#{votes}\t#{patches.size}\t#{patch_files.size}\t#{replies}\t#{non_reporter_comments}\t#{mention_rfc}\t#{priority}\t#{severity}\t#{status}\t#{resolution}"

end

Dir.chdir(opts[:xmls]) do 
  files.each do |file|
    read_bug file
  end
end

puts "ID\tCommments\tCommentors\tVotes\tPatches\tFiles in Patches\tReplies\tNon-Reporter Comments\tMention RFC?\tPriority\tSeverity\tStatus\tResolution"
