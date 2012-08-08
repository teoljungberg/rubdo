module Rubdo
  class CLI
    def initialize
      @list = List.new
      @id = ARGV[1].to_i - 1 
    end

    def add
      @list.add ARGV[1]
    end

    def done
      @list.done @id
    end

    def remove
      @list.remove @id
    end

    def save
      @list.write
    end

    def list
      @list.items.each_with_index { |item, index| puts "#{index + 1}: #{item.description}" }
    end

    def info
      puts @list.info @id
    end

    def completed
      @list.completed.each { |item| puts "#{item.description}, completed at: #{item.completed_at.strftime('%m.%d.%y - %H:%M')}" }
    end

    def edit
      tmp_file = '/tmp/todo_desc.txt'
      system("echo '#{@list.items[@id].description}' > #{tmp_file}")
      system("$EDITOR #{tmp_file}")
      @list.items[@id].description = File.read(tmp_file).chomp
      File.delete(tmp_file)
    end

    def remove
      @list.items.delete_at(@id)
    end

    def help(onoe = nil)
      puts <<-HELP
                                                  Commands for todo:
------------------     
add/a [task description] - Add a new tas
list/ls - Lists all tasks
completed - List all completed tasks
done/d [task id] - Complete a task
info [task id] - Gives info about the specific task
edit/e [task id] - Opens up $EDITOR to edit the task description
remove/rm [task id] - Deleted task id from the list
help - Prints out this information
      HELP
    end

    alias_method :a, :add
    alias_method :ls, :list
    alias_method :d, :done
    alias_method :e, :edit
    alias_method :rm, :remove
  end
end
