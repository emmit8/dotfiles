#!/usr/bin/env ruby

require 'fileutils.rb'

class DotFiles
    @@home_dir = File.expand_path "~"
    @@dotfiles_root = File.expand_path "..", Dir.pwd

    def initialize(backup = false)
        @options = {:backup => backup}
    end

    def backup?
        puts "Backup existing files ? [Yes/No]"
        if ["yes", "y"].include? gets.chomp.downcase
            @options[:backup] = true
        end
    end

    def install
        puts "Installing emmit's dotfiles..."
        backup?()
        dotfiles().each do |dot|
            dest = File.join @@home_dir, dot
            if File.exist? dest and not File.symlink? dest and @options[:backup]
                puts "File `#{dot}` backuped with .bak extenstion"
                FileUtils.cp(dest, File.join(dest + ".bak"))
            else
                puts "Creating symlink at `#{@@home_dir}` for dotfile `#{dot}`"
                FileUtils.ln_sf File.expand_path(dot, @@dotfiles_root), dest
            end
        end
        puts "Installing successful done..."
    end

    def dotfiles
        Dir.entries(@@dotfiles_root).reject{|entry| File.directory?(File.join("./../", entry)) || entry =~ /LICENSE|README/ }
    end
end
DotFiles.new(false).install()


