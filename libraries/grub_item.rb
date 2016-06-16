#
# Cookbook: grub
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#

require 'poise'

module GrubCookbook
  module Resource
    # Resource for managing the Grub Configuration file.
    class GrubItem < Grub
      include Poise(fused: true, parent: :grub)
      provides(:grub_item)

      attribute(:title, kind_of: String, name_attribute: true)
      attribute(:root, kind_of: String)
      attribute(:kernel, kind_of: String)
      attribute(:options, option_collector: true, default: {ro: true})
      attribute(:initrd, kind_of: String)

      def to_s
        buffer = StringIO.new
        buffer.puts "title #{title}"
        buffer.puts "\troot #{root}" 
        buffer.print "\tkernel #{kernel} "
        options.each do |k,v|
          if true === v
            buffer.print k
          else
            buffer.print "#{k}=#{v}"
          end
          buffer.print " "
        end
        buffer.puts "\n\tinitrd #{initrd}"
        buffer.string
      end

      action(:create) do
        notifying_block do
        end
      end
    end
  end
end
