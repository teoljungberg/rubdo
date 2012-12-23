# Rubdo

Why does todo applications need to be so complicated?

## Usage

Since version `0.3.0`, `rubdo` can handle several TODO files with
environment variables. So you can change TODO file by setting:

```bash
$ export TODO_FILE="PATH/TO/TODO_FILE" # i.e ~/.tasks/Work.yml
```

When you are done with your other TODO file, just simply kill the
environment variable or reload the shell

Here are the available commands for `rubdo`

```bash
Commands for rubdo:
-------------------
add/a [task description] - Add a new task. If the description is empty, $EDITOR is opened
list/ls - Lists all tasks
done/d [task id] - Complete a task
edit/e [task id] - Opens up $EDITOR to edit the task description
remove/rm [task id] - Deletes the specific task, same as done
help - Prints out this information
```

`rubdo` createas _~/.tasks_ where it holds the YAML file with the todos inside.
If you want to keep your todos synced accross your machines, make a symlink to say
directory inside of _~/Dropbox_

```bash
$ ln -s ~/Dropbox/tasks/ ~/.tasks
```

 Make sure to save your todos first!

A tip is to alias `rubdo` to `t` for easier typing
for `bash` and `zsh`

```bash
alias t="rubdo"
```

and add that to your _{bash, zsh}rc_

## Installation

Add this line to your application's Gemfile:

```bash
gem 'rubdo'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install rubdo
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
