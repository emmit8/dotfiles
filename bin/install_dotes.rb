#!/usr/bin/env ruby
#
# Install script for my dotfiles
#
require 'fileutils'
require 'json'

class DotFiles
    @@home_dir = File.expand_path "~"
    @@excludes = [".git", ".gitignore"]
    @@dotfiles_root = File.expand_path("..", File.dirname(__FILE__))
    @@mappings = {
        "vscode" => "~/Library/Application\ Support/Code/User/"
    }
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
    def copy(dest, src)
        dot = File.basename src
        if File.exist? dest and not File.symlink? dest and @options[:backup]
            puts "File `#{dot}` backuped with .bak extenstion"
            FileUtils.cp(dest, File.join(dest + ".bak"))
        else
            unless File.file?(dest) && File.readlink(dest) == src
                FileUtils.safe_unlink dest
                puts "Creating symlink at `#{dest}` for dotfile `#{dot}`"
                FileUtils.ln_sf src, dest
            else
                puts "Symlink for dotfile `#{dot}` already exist. Nothing to do."
            end
        end 
    end
    def install
        puts "Installing emmit's dotfiles..."
        backup?()
        (dotfiles() - @@excludes).each do |dot|
            path = File.expand_path(dot, @@dotfiles_root)
            if File.directory? path and @@mappings.key?(dot)
                entries  = Dir.entries(path).reject{ |f| File.directory?(f) }
                mapping  = @@mappings[dot]
                dir_root = File.expand_path dot, @@dotfiles_root
                entries.each { |d| 
                    dest = @@mappings[File.join dot, d]
                    dest ||= mapping
                    dest = File.expand_path(dest)
                    FileUtils.mkdir_p(dest) unless File.directory?(dest)
                    copy(dest, File.expand_path(d, dir_root)) 
                }
            else 
                copy(File.join(@@home_dir, dot), File.expand_path(dot, @@dotfiles_root))
            end
        end
        puts "Installing successful done... Enjoy nerdy boy ⊂( ・ ̫・)⊃"
    end

    def dotfiles
        Dir.entries(@@dotfiles_root).select {|entry| 
            path = File.expand_path(entry, @@dotfiles_root)
            (File.directory?(path) and @@mappings.key?(entry)) or (not File.directory?(path) and File.basename(entry).start_with?("."))
        }
    end
end

DotFiles.new(false).install()


