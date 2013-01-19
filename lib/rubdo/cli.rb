require 'tempfile'

module Rubdo
  class CLI
    def initialize
      todos = List.read(todo_file)
      @list = List.new(todos)
      @id = ARGV[1].to_i - 1
    end

    def add
      if ARGV[1]
        @list.add ARGV[1]
      else
        Tempfile.open('new_task') { |tf| @list.add Rubdo::Editor.add(tf.path) }
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
      abort("not a valid id") if @id > @list.to_a.size
      Tempfile.open('new_description') { |tf| task.description = Rubdo::Editor.edit(tf.path, task.description) }
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

    def task
      @list.to_a[@id]
    end

    def todo_file
      @todo_file ||= '~/.tasks/Todo.yml'
    end
  end
end
