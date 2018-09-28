<header class=text-center>

# Tictaktoe

![](https://i.imgur.com/8egglps.jpg)



</header>


<section class=text-justify>

## Introduction


The three in line, also known as zeros and crosses, three in a row (Spain, Ecuador and Bolivia), Michi (in Peru), cat game, Triqui (in Colombia), Cuadritos, Gato (in Chile and Mexico), Triqui traka, Equis Zero, Tic-Tac-Toe (in the United States), is a pencil-and-paper game between two players: O and X, which mark the spaces of a 3 × 3 board alternately

</section>

<section class=text-justify>

## How to install

First you have to clone the repository


<pre><code>git clone https://github.com/Bryancg95/TicTakToeGem.git</code></pre>

Or you can also directly download the tictaktoe-0.0.3.gem file

![](https://i.imgur.com/o2jAgCI.png)


And pressing the button download

![](https://i.imgur.com/MTYdFxK.png)


To install the gem you have to use the following command in the terminal

<pre><code>gem install ./tictaktoe-0.0.3.gem</code></pre>



To use it you need to add it to the project

<pre><code>require "tictaktoe"</code></pre>


</section>

## functions


To initialize the class you have to put

<pre><code>new_tictaktoe = TicTakToe.new(size,player1,player2) </code></pre>


>The player names are optional if they are not sent, default will be "player 1" and "player 2"

If you want to execute the game in the console, you use

<pre><code>start</code></pre>


To prepare the board is used


<pre><code>fill_board(board)</code></pre>

>The board is an optional variable if you want to use the one that includes the class, this has to be a two-dimensional array


To paint the board in the console the following command is used


<pre><code>draw_board(win_player_1,win_player_2)</code></pre>

>The win_player_1 and 2 are optional the class carries a counter of the victories of each of the players

The next one works is used to validate the board and to know if one of the two players win is sent the parameters and the answer is if it has to look for an O or X

<pre><code>validate_position(x,y,answer,board)</code></pre>

>The board is an optional variable by default the class will use the one included
