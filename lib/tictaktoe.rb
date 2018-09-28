class TicTakToe
 def initialize(size = 3 ,nameP1 = "Player 1",nameP2 = "Player 2")
   c = 0
   while c < 1
    begin
      if Integer(size)
        c = 1
        @size = size.to_i
      else
        puts"size is not greater than 2:"
        size = gets.chomp
        c = 0
      end
    rescue
       puts"size not is a number repeat please:"
       size = gets.chomp
       c = 0
    end
   end
   @wp1 = 0
   @wp2 = 0
   @p1 = nameP1
   @p2 = nameP2
   @board = Array.new(@size){Array.new(@size)}
   @player = true
   fill_board
 end

def start
  answer = 1
  while answer == 1
    for i in 0...(@board.length*@board.length)
      if select_position_board
      else
        break
      end
    end
    val = false
    while val == false
      begin
        puts "Play again? 1:Yes 2:No"
        answer = gets.chomp
        if Integer(answer) && (answer.to_i == 2 || answer.to_i == 1)
          answer = answer.to_i
          val = true
          fill_board
        end
      rescue
        puts "Its not an answer"
        val = false
      end
    end

  end

end
  def fill_board(board = @board)
    for i in 0...board.length
      for b in 0...board.length
       board[i][b] = " "
      end
    end
  end
  def  select_position_board
         res = false
       while res == false
           system("cls")
           draw_board
           puts "Select position of x:"
           x = gets.chomp
           puts "Select position of y:"
           y = gets.chomp
         begin
           if Integer(x) && Integer(y)
             x = x.to_i
             y = y.to_i
             if @board[y][x] == " "
               res = true
             else
               puts "position occupied"
             end

           end
         rescue
              puts "The position it not within the range or not is a number"
         end
       end

        if @player == true
          @board[y][x] = "X"
          @player = false
          answer = @board[y][x]
        else
          @board[y][x] = "O"
          @player = true
          answer = @board[y][x]
        end
        if validate_position(x,y,answer)
          if @player == false
              winner = @p1
              @wp1 = @wp1 + 1
          else
              winner = @p2
              @wp2 = @wp2 + 1
          end
            system("cls")
            puts "The winner is: " + winner
            draw_board
          return false
        else
          return true
        end



  end
  def draw_board(wp1 = @wp1,wp2 = @wp2)
    changef = true
    change = true
    puts "\e[0;36m    #{@p1.to_s} #{wp1.to_s}:#{wp2.to_s} #{@p2.to_s}\e[m"
    line = 'y\x'
    for c in 0...@board.length
      line = line.to_s + "   " + c.to_s + " "
    end
    puts line.to_s
    for a in 0...@board.length
      line = a.to_s + "   "
      for b in 0...@board.length
        if change == true
          line =line.to_s + "\e[0;34m\e[45m\  " + @board[a][b].to_s + "  \e[m"
          change = false
        else
         line = line.to_s + "\e[0;34m\e[47m\  " + @board[a][b].to_s + "  \e[m"
         change = true
        end
      end
      puts line
      changef =!changef
      change = changef
    end
  end
  def validate_position(x,y,answer,board = @board)
    combo = 0
      for i in 0...@size
         if board[i][x] === answer
           combo = combo + 1
           break if combo >= 3
         else
           combo = 0
         end
      end

      if combo < 3
        combo = 0
        for i in 0...@size
           if board[y][i] === answer
             combo = combo + 1
             break if combo >= 3
           else
             combo = 0
           end
        end
      end

      if combo < 3
        combo = 0
        if x <= y
          xtem = 0
          ytem = y-x
          limit = @size - ytem
        else
          xtem = x-y
          ytem = 0
          limit = @size - xtem
        end
        for c in 0...limit
          if board[ytem+c][xtem+c] === answer
            combo = combo + 1
            break if combo >= 3
          else
            combo = 0
          end
        end
      end

      if combo < 3
        combo = 0
        if (x+y) < @size
          xtem = x+y
          ytem = 0
          limit = xtem + 1
        else
          ytem = y - ((@size-1)-x)
          xtem = x + ((@size-1) - x)
          limit = @size - ytem
        end
        for d in 0...limit
          if board[ytem+d][xtem-d] === answer
             combo = combo + 1
             break if combo >= 3
           else
             combo = 0
          end
        end
      end
      if combo >= 3
        return true
      else
        return false
      end

  end
end
