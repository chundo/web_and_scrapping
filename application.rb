require "erb"
require "httparty"

class Application
	def self.call(env)
		if env['PATH_INFO'] == '/'
			url = 'http://jsonplaceholder.typicode.com/posts'
			@respuesta = HTTParty.get(url)
			@posts = JSON.parse(@respuesta.body)
			#body = ERB.new(File.open('index.html.erb'))
			body = ERB.new(File.read('index.html.erb'))
			[200, {}, [body.result(binding)]]
		elsif env['PATH_INFO'] == '/srespana'
			body = ERB.new(File.read('srespana.html.erb'))
			@cookie = env['HTTP_COOKIE']
			[200, {}, [body.result(binding)]]
		else
			[404, {}, ['Pagina no existe']]
		end
	end
end