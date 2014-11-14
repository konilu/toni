#not really sure, perhaps force it to use ruby
#!/usr/bin/env ruby

#look like some class, assign  alue true
STDOUT.sync = true

#this could be something in related to requiring files, I'm not sure what is %w, but lib, seams fuckaround with loading path
$:.unshift File.join(File.dirname(__FILE__), *%w{ .. lib })

#requairing main lib jekyl
require 'jekyll'
#require the next libary
require 'mercenary'

%w[jekyll-import].each do |blessed_gem|
	begin
		require blessed_gem
	rescue LoadError
	end
end
Jekyll::PluginManager.require_from_bundler
Jekyll::Deprecator.process(ARGV)
Mercenary.program(:jekyll) do |p|
	p.version Jekyll::VERSION
	p.description 'Ali kako nije tako, static site generator in Ruby'
	p.syntax 'jekyll <subcommand> [options]'
	p.option 'source', '-s', '--source [DIR]', 'Source directory (defaults to ./)'
	p.option 'destination', '-d', '--destination [DIR]', 'Destination directory (defaults to ./_site)'
	p.option 'safe', '--safe', 'Safe mode (defaults to false)'
	p.option 'plugins', '-p', '--plugins PLUGINS_DIR1[,PLUGINS_DIR2[,...]]', Array, 'Plugins directory (defaults to ./_plugins)'
	p.option 'layouts', '--layouts DIR', String, 'Layouts directory (defaults to ./_layouts)'
	Jekyll::Command.subclasses.each { |c| c.init_with_program(p) }
	p.action do |args, options|
		if args.empty?
			puts p
		else
			unless p.has_command?(args.first)
				Jekyll.logger.abort_with "Invalid command. Use --help for more information"
			end
		end
	end
end

||=
	.to_sym
%w
File.file?(dir) }.to_set
=~
