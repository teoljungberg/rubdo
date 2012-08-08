# Rubdo

A quick and dirty todo application

## Installation

Add this line to your application's Gemfile:

    gem 'rubdo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubdo

## Usage

Here are the available commands for `rubdo`

    Commands for todo:
    ------------------     
    add/a [task description] - Add a new task
    list/ls - Lists all tasks
    completed - List all completed tasks
    done/d [task id] - Complete a task
    info [task id] - Gives info about the specific task
    edit/e [task id] - Opens up $EDITOR to edit the task description
    remove/rm [task id] - Deleted task id from the list
    help - Prints out this information

`rubdo` createas _~/tasks_ where it holds the YAML files with the todos inside.
If you want to keep your todos synced accross your machines, make a symlink to say
a directory inside of _Dropbox_ 

    $ ln -s ~/Dropbox/tasks/ ~/tasks

Make sure to save your todos first!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
