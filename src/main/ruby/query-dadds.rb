#!/usr/bin/env ruby
require 'nokogiri'
require 'trollop'
require 'base64'
require 'tokenizer'

pwd = Dir.getwd

opts = Trollop::options do
  banner "Count the number of comments in Bugzlla bugs stored in xml files"
  opt :xmls, "The xml/ directory of Bugzillas", :default => './xml/'
  opt :committers, "A listing of Bugzilla commentor IDs who are also committers", :default => 'committer-bugzilla-ids.txt'
  opt :bugs, "A file with the bug IDs to collect", :default => ''
  opt :dadd_map, "A file that maps a bug ID to Yes/No DaDD", :default => ''
end

Trollop::die "xml directory must be a directory" unless Dir.exists?(opts[:xmls])
Trollop::die "bugs file not found!" unless File.exists?(opts[:bugs]) || opts[:bugs].eql?('')
Trollop::die "dadd map file not found!" unless File.exists?(opts[:dadd_map]) || opts[:dadd_map].eql?('')
Trollop::die "committer file not found!" unless File.exists?(opts[:committers])

if opts[:bugs].nil? || opts[:bugs].eql?('')
  Dir.chdir(opts[:xmls]); 
  files = Dir.glob("*.xml")
  Dir.chdir(pwd)
else
  files = File.open(opts[:bugs]).readlines.collect {|f| f.strip + ".xml" }
end

if !opts[:dadd_map].eql?('')
  @dadd_map = Hash.new
  File.open(opts[:dadd_map]).readlines.each do |line|
    @dadd_map[line.split[0].to_i] = line.split[1]
  end
end

# Load committer bugzilla IDs
@committer_bugzillas = File.open(opts[:committers]).readlines.collect{|c| c.strip}

def committer? (bugzilla_commentor)
  @committer_bugzillas.include? bugzilla_commentor
end

def parent(file)
  begin
    Nokogiri::XML(File.open("#{file.at_xpath("//dup_id").content}.xml","r"))
  rescue # File doesn't exist?
    nil
  end
end

def read_bug(file)
  xml = Nokogiri::XML(File.open(file,"r"))

  # Go right to the parent bug if this is a duplicate
  while(xml.at_xpath("//resolution").content.eql?("DUPLICATE"))
    xml = parent(xml)
    if xml.nil? #Duplicate of a file that doesn't exist
      $stderr.puts "#{file} leads to a duplicate of a non-HTTPD bug"
      return nil
    end
  end

  # Query the XML for stuff
  id = xml.at_xpath("//bug_id").content.to_i
  patches = xml.xpath("//attachment[@ispatch=1]")
  ccs = xml.xpath("//cc")
  votes = xml.at_xpath("//votes").content.to_i
  priority = xml.at_xpath("//priority").content
  severity = xml.at_xpath("//bug_severity").content
  status = xml.at_xpath("//bug_status").content
  resolution = xml.at_xpath("//resolution").content
  comments = xml.xpath("//thetext")
  comment_ids = xml.xpath("//commentid")
  commentor_nodes = xml.xpath("//who")
  reporter = xml.at_xpath("//reporter").content
  comment_nodes = xml.xpath("//thetext")

  # Pull the commentors
  commentors = []
  commentor_nodes.each { |c| commentors << c.content }

  # Count exchanges
  prev = commentors[0]
  exchanges = 0
  nonrep_exchanges=0
  commentors.each do |c|
    nonrep_exchanges +=1 if !c.eql?(prev) && !c.eql?(reporter) && !prev.eql?(reporter)
    exchanges +=1 if !c.eql?(prev)
    prev = c
  end

  # Count committer comments
  committer_comments=0
  commentors.each{|c| committer_comments+=1 if committer? c}

  #Now let's work from a unique list of commentors
  commentors.uniq!

  #Count committers
  committers=0
  commentors.each{|c| committers+=1 if committer? c}

  #Was the reporter a committer
  rep_committer = (committer? reporter) ? "Yes" : "No"

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

  # What is the maximum, non-reporter word length?
  non_reporter_word_max = 0.0
  comment_nodes.each do |c| 
    if !reporter.eql?(c.parent.at_xpath("./who").content)
      words = Tokenizer::Tokenizer.new.tokenize(c.content).size 
      non_reporter_word_max = words if non_reporter_word_max < words
    end
  end

  # How many opinionated words?
  # Another common word is "internal"
  opinion_words = ["disagree", "agree", "imho", "imo", "opinion", "think", "suggest", "+1 ", "insist", "according to"]
  opinions = 0
  opinion_words.each do |word|
    comment_nodes.each do |c|
      opinions += c.content.downcase.scan(word).size
    end
  end

  # How many comments say that another bug was a duplicate of this bug? (child duplicates)
  dups = 0
  comment_nodes.each{ |c| dups+=1 if c.content.include?("*** Bug") && c.content.include?("has been marked as a duplicate of this bug. ***")}

  # If we specified, add the DaDD stuff
  dadd_data = ""
  if !@dadd_map.nil?
    if @dadd_map[id].nil?
      dadd_data = "\t??"
      $stderr.puts "No DaDD map for #{file}"
    else
      dadd_data = "\t" << @dadd_map[id]
    end
  end

  # Print to console!
  puts "#{id}\t#{comment_ids.size}\t#{committer_comments}\t#{commentors.size}\t#{committers}\t#{rep_committer}\t#{votes}\t#{ccs.size}\t#{patches.size}\t#{patch_files.size}\t#{replies}\t#{non_reporter_comments}\t#{non_reporter_word_max}\t#{nonrep_exchanges}\t#{exchanges}\t#{opinions}\t#{mention_rfc}\t#{dups}\t#{priority}\t#{severity}\t#{status}\t#{resolution}#{dadd_data}"

end

puts "ID\tCommments\tCommitter Comments\tCommentors\tCommentor Committers\tReporter Committer?\tVotes\tCCs\tPatches\tFiles in Patches\tReplies\tNon-Rep. Comments\tNon-Rep. Word Max\tNon-Rep. Exchanges\tExchanges\tOpinionated Words\tRFC?\tDups\tPriority\tSeverity\tStatus\tResolution#{"\tDaDD?" if !opts[:dadd_map].eql?('')}"

Dir.chdir(opts[:xmls]) do 
  files.each do |file|
    read_bug file
  end
end

