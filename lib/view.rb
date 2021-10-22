class View 
  
  def create_gossip
    puts "C'est quoi ton blase ?"
    print "> "
    author_user_input = gets.chomp

    puts "Allez, lache-toi, balance ton gossip."
    print "> "
    content_user_input = gets.chomp
    return params = { content: content_user_input, author: author_user_input }
  end

  def index_gossips(gossips)
    gossips.each do |gossip|
      puts " '#{gossip.content}' - by #{gossip.author} "
    end
  end

  def delete_gossip
    puts "De quel auteur souhaites-tu supprimer les gossips ?"
    delete_user_input = gets.chomp.to_i
    return delete_user_input
  end

end