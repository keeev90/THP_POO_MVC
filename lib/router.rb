require 'controller'

class Router
  
  #On veut qu'un "Router.new" lancé par app.rb, crée automatiquement une instance "@controller" passe-plat vers les méthodes de classe Controller
  def initialize
    @controller = Controller.new
  end

  #rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit donc perform.
  def perform 
    puts
    puts " ⭐⭐⭐ BIENVENUE DANS THE GOSSIP PROJECT ⭐⭐⭐"
    puts

    while true

      #on affiche le menu
      puts "Tu veux faire quoi jeune mouss' ? Entre le numéro correspondant à ta demande."
      puts
      puts "1. Je veux créer un gossip 📢" 
      puts "2. Je veux voir l'ensemble des gossips 🔍"
      puts "3. Je veux supprimer un gossip ❌"
      puts "4. Je veux quitter l'app 👋"
      print "> "
      params = gets.chomp.to_i #on attend le choix de l'utilisateur
      puts 
      
      case params #en fonction du choix
      when 1
        puts "Tu as choisi de créer un gossip" 
        @controller.create_gossip
        puts "Bravo champion, ton gossip est bien créé." 
      
      when 2
        puts "Tu as choisi de voir l'ensemble des gossips. Et voici, à votre service : "
        @controller.index_gossips
      
      when 3
        puts "Tu as choisi de supprimer un gossip" 
        @controller.delete_gossip
        puts "Le gossip est bien supprimé." 

      when 4
        puts "Ciao l'artiste ! (t'as raison barre-toi, les ragots c'est mauvais pour la santé) "
        break #Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.

      else
        puts "Pas si vite la mouche ! Ce choix n'existe pas, merci de ressayer" #Si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". 
        #C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)
      end
    end
  end
end
