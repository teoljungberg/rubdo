require 'tempfile'

module Rubdo
  class CLI

    def initialize
      todos = ENV['TODO_FILE'] ? List.read : List.read('~/.tasks/Todo.yml')
      @list = List.new(todos)
      @id = ARGV[1].to_i - 1
    end

    def add
      if ARGV[1]
        @list.add ARGV[1]
      else
        tf = Tempfile.new('new_task')
        open_file_with_editor(tf)
        if File.read(tf.path).empty?
          puts "aborted due to empty file"
        else
          @list.add File.read(tf).chomp
        end
      end
      save
    end

    def done
      @list.done @id
      save
    end
    alias_method :rm, :done

    def list
      list_tasks unless @list.to_a.empty?
    end
    alias_method :ls, :list

    def edit
      abort("not a valid id") if @id == -1 or @id > @list.to_a.length
      tf = Tempfile.new('new_description')
      write_task_to_file(tf)
      open_file_with_editor(tf)
      @list.to_a[@id].description = File.read(tf.path).chomp
      save
    end

    def help
      puts <<-HELP
-----------------
add/a [task description] - Add a new task. If the description is empty, $EDITOR is opened
list/ls - Lists all tasks
done/d [task id] - Complete a task
edit/e [task id] - Opens up $EDITOR to edit the task description
remove/rm [task id] - Deletes the specific task, same as done
help - Prints out this information
      HELP
    end

    private

    def save
      @list.write
    end

    def list_tasks
      @list.to_a.each_with_index { |item, index| puts "#{index + 1}: #{item.description}" }
    end

    def open_file_with_editor(file)
      system("$EDITOR #{file.path}")
    end

    def write_task_to_file(file)
      File.open(file.path, 'w') { |f| f.write(@list.to_a[@id].description) }
    end
  end
end
