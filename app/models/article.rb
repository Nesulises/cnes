  class Article < ActiveRecord::Base
  	# Esto es lo que se genero deesde la consola 
  	# Se puede decir que es la base de datos de Rails
  	# No se le dijo el nombre de la tabla va a toma
  	# el que se le dio a la clase en la terminal
  	# y tomo el nombre y lo pluraliso o le agrego la "S"
  	# y los campos los va agenara el Active Record
  	belongs_to :user  
  	validates :title, presence: true, uniqueness: true
  	validates :body, presence: true, length: { minimum: 10 }
    before_save :set_visits_count

    def update_visits_count
      self.save if self.visits_count.nil?
      self.update(visits_count: self.visits_count + 1)
    end

    private

    def set_visits_count
      self.visits_count ||= 0
    end
end
