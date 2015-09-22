#!/usr/bin/env ruby
#
# Install script for my dotfiles
#
require 'fileutils.rb'

class DotFiles
    @@home_dir = File.expand_path "~"
    @@dotfiles_root = File.expand_path("..", File.dirname(__FILE__))

    def initialize(backup = false)
        @options = {:backup => backup}
        dotfiles_sym = File.join(@@home_dir, ".dotfiles")
        unless File.symlink? dotfiles_sym and @@dotfiles_root == File.readlink(dotfiles_sym)
            FileUtils.safe_unlink dotfiles_sym
            FileUtils.ln_sf @@dotfiles_root, dotfiles_sym 
            puts "Creating symlink #{dotfiles_sym} for .dotfiles root folder"
        end
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
            source = File.expand_path(dot, @@dotfiles_root)
            if File.exist? dest and not File.symlink? dest and @options[:backup]
                puts "File `#{dot}` backuped with .bak extenstion"
                FileUtils.cp(dest, File.join(dest + ".bak"))
            else
                unless File.readlink(dest) == source
                    FileUtils.safe_unlink dest
                    puts "Creating symlink at `#{@@home_dir}` for dotfile `#{dot}`"
                    FileUtils.ln_sf source, dest
                else
                    puts "Symlink for dotfile `#{dot}` already exist. Nothing to do."
                end
            end
        end
        puts "Installing successful done... Enjoy nerdy boy ⊂( ・ ̫・)⊃"
    end

    def dotfiles
        Dir.entries(@@dotfiles_root).reject{|entry| File.directory? File.expand_path(entry) or not File.basename(entry).start_with?(".") }
    end
end

DotFiles.new(false).install()


