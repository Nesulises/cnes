  class Article < ActiveRecord::Base
  	# Esto es lo que se genero deesde la consola 
  	# Se puede decir que es la base de datos de Rails
  	# No se le dijo el nombre de la tabla va a toma
  	# el que se le dio a la clase en la terminal
  	# y tomo el nombre y lo pluraliso o le agrego la "S"
  	# y los campos los va agenara el Active Record
  	validates :title, presence: true, uniqueness: true
  	validates :body, presence: true, length: { minimum: 10 }
end
