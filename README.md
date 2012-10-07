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

    Commands for rubdo:
    ------------------     
    add/a [task description] - Add a new task. If the description is empty, $EDITOR is opened
    list/ls - Lists all tasks
    done/d [task id] - Complete a task
    edit/e [task id] - Opens up $EDITOR to edit the task description
    remove/rm [task id] - Deletes the specific task, same as done
    help - Prints out this information

`rubdo` createas _~/.tasks_ where it holds the YAML files with the todos inside.
If you want to keep your todos synced accross your machines, make a symlink to say
a directory inside of _~/Dropbox_ 

    $ ln -s ~/Dropbox/tasks/ ~/.tasks

Make sure to save your todos first!

A tip is to alias `rubdo` to `t` for easier typing
for `bash` and `zsh`

    alias t="rubdo"

and add that to your _{bash, zsh}rc_ 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
