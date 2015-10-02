require 'io/console'

class Display
  def self.display_board(field)
    print field.display_board
    puts
  end

  def self.prompt(msg)
    puts
    print msg
    gets.chomp
  end

  def self.promptc(msg)
    puts
    print msg
    $stdin.getch
  end

  def self.prompt_yn(msg)
    ans = promptc msg
    ans == 'y' || ans == 'Y'
  end

  def self.display(msg)
    puts msg
  end

  def self.display_list(list)
  end

  def self.select(list)
  end
end
