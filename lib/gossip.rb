#require 'pry'

class Gossip 
  attr_accessor :author, :content 

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    ### Create and save in a new CSV File ###
    CSV.open("db/gossip.csv","a+") do |csv| #https://simonsomlai.com/en/rubyshorts-csv-manipulation-ruby
      csv << [@author, @content]
    end
  end

  def self.all # lire chaque ligne du CSV, puis retourner un array contenant des instances de potins du genre : [potin_1, potin_2, …, potin_n]. J'insiste sur un point: il s'agit d'un array d'objets de la classe Gossip. Donc si je fais potin_1.author, je récupère l'auteur du potin_1. Si je fais potin_2.content, je récupère le contenu du potin_2. 
    all_gossips = [] # 1)création d'un array vide qui s'appelle all_gossips
    CSV.foreach("db/gossip.csv") do |row| # 2)chaque ligne de ton CSV.each do |ligne|
      gossip_provisoire = Gossip.new(row[0] , row[1]) # 2-a) gossip_provisoire = Gossip.new(paramètres de la ligne) - permet de créer un objet gossip
      all_gossips << gossip_provisoire
    end
    return all_gossips # 3)on renvoie le résultat
  end

  #def self.delete_gossip()
  ##
  #end

end

#binding.pry
#puts "end of file"