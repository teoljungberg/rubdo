module Rubdo
  class Editor

    def self.edit(file, description)
      write_description(file, description)
      open_with_editor(file)
      read_description(file)
    end

    def self.add(file)
      open_with_editor(file)
      read_description(file)
    end

    private

    def self.open_with_editor(file)
      system "$EDITOR #{file}"
    end

    def self.write_description(file, description)
      File.open(file, 'w') { |f| f.write(description) }
    end

    def self.read_description(file)
      File.read(file)
    end

  end
end
