=begin
run Proc.new { |env| 
	if env['PATH_INFO'] == '/'
		[200, {}, ['Hola mundoo!']]
	else
		[404, {}, ['Pagina no existe']]
	end
}
=end
#--------------------------
require './application'
run Application


