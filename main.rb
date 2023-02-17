$LOAD_PATH << '.'

require 'ruby2d'
require 'Pawn'
require 'Board'

set width: 200, height: 200, title: 'Chess'
set background: 'blue'

b = Board.new
tick = 0

update do
    if tick % 60 == 0
    end
    tick += 1
end

show