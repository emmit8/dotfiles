#!/usr/bin/env ruby

require 'fileutils.rb'

class DotFiles
    @@home_dir = File.expand_path "~"
    @@dotfiles_root = File.expand_path "..", Dir.pwd

    def initialize(overwrite_all = false, backup = false)
        @options = {:overwrite_all => overwrite_all, :backup => backup} 
        @inputs = {:Yes => true, :No => false}
    end

    def install
        puts "Installing emmit's dotfiles..."
        dotfiles().each do |dot| 
            destanation = File.join @@home_dir, dot 
            if not @options[:overwrite_all] and File.exist? destanation
                print "File [#{dot}] already exists. Overwrite all? (Yes/No) "
                if @inputs[gets.chomp.to_sym]
                    @options[:overwrite_all] = true
                end
            else
                if File.exist? destanation and not File.symlink? destanation 
                    unless @options[:backup]
                        puts "Backup existing files ? (Yes/No)"
                        if @inputs[gets.chomp.to_sym]
                            @options[:backup] = true
                        end
                    else
                        FileUtils.cp(destanation, File.join(destanation + ".bak"))
                    end
                end
            end
        end
    end

    def dotfiles
       Dir.entries(@@dotfiles_root).reject{|entry| File.directory?(File.join("./../", entry)) || entry =~ /LICENSE|README/ }
    end
end
DotFiles.new(false, false).install()


