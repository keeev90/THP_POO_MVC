require 'gossip'
require 'view'

class Controller

  def initialize
    @view = View.new #pointage / redirection automatique vers le View à chaque lancement de l'app
  end

  def create_gossip
    params = @view.create_gossip #exécute la méthode create_gossip de la View afin de récupérer les infos de l'utilisateur (= le contenu et l'auteur du nouveau gossip)
    gossip = Gossip.new(params[:author] ,params[:content]) #instancier un nouveau gossip via Gossip (model) à partir des inputs users (view)
    gossip.save # demande au model de l'inscrire dans le CSV
  end 

  def index_gossips
    all_gossips = Gossip.all #Demander au model un array qui contient tous les potins que l'on a en base
    @view.index_gossips(all_gossips) #Demander à la view d’exécuter sa propre méthode index_gossips qui affichera tous les potins
  end

  def delete_gossip 
    author_gossips_to_delete = @view.delete_gossip
    Gossip.delete_gossip(author_gossips_to_delete) #NB : self-méthode de classe Gossip non finalisée...
  end
end