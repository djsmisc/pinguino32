// Programme C d'après Jeux d'ECHECS sur PIC18 C.Dupaty Académie d'Aix-MArseille 03/2004
// Moteur de calcul d'après PROTEUS VSM TINY CHESS http://www.multipower-fr.com/cao/prod01.htm 
// Adaptation au Pinguino par Régis Blanchot 05/2011

#include "chess.h"
#include "validate.c"

// Global Variables
BOARD board;
MASK validmovemask;
MASK capturemask;
int movecount;
unsigned char movetype;
unsigned char rate;
unsigned char piecerate;
unsigned char lastmove;

// Check/Checkmate.
LOC wh_king_pos;
LOC bl_king_pos;
LOC opp_king_pos;
BOOL kingcapture;

// Castling.
unsigned char wh_base_cont;
unsigned char bl_base_cont;

MASK currcapturemask;
MASK currmovemask;

FUNCPTR validate[7] = { val_empty, val_pawn, val_rook, val_knight,val_bishop,val_queen,val_king};

void setup()
{ 
	//CDC.begin(9600);		// 9600,n,8,1 reception en IT
	movecount   = 1;
	kingcapture = FALSE;
	movetype = NO_MOVE;      
	init_board();
	CDC.print("\r\n");
	CDC.print("\r\n");
	CDC.print("---------------------------------\r\n");
	CDC.print("- PLAY CHESS WITH YOUR PINGUINO -\r\n");
	CDC.print("- input example : e2e4          -\r\n");
	CDC.print("---------------------------------\r\n");
}
 
// Control Function for a single player game.

void loop()
{
	LOC from, to, cpufrom,cputo;
	PIECE p;
	unsigned char i = 0, j = 0;
	unsigned char movefrom,bestfrom,moveto,bestto; 
	unsigned char illegal = FALSE;

	// User Move (White).
	if ((movecount+1)%2 == 0)
	{ 
		draw_chessboard();
		CDC.print("Play : ");

		if (!illegal);
		else
			illegal = FALSE;   

		// Get the move.
		while (!read_movement(from, to));
		
		p = board[from[0]][from[1]];
		//getindex(to[0],to[1]);

		// Get valid moves for given piece.
		validate[piecetype(p)] (from,WHITE);

		// Next, Verify that we can make the move and
		// deal with the King/Check logic.          
		if (is_valid_move(to[0],to[1]) && test_singlemove(from,to,board[from[0]][from[1]]))
		{ 
			draw_move(from,to,p);
			CDC.print("\r\n");
			CDC.print("You play : ");
			CDC.write(from[1]+'a');
			CDC.write(from[0]+'1');
			CDC.print(" -> ");
			CDC.write(to[1]+'a');
			CDC.write(to[0]+'1');
			CDC.print("\r\n");
			movecount++;
		}
		else
		{ 
			CDC.print("\r\nIllegal move from this piece\r\n");
			illegal = TRUE;
		}

		// Finally, Clear our masks and reset bools.
		for (i = 0; i < 8;++i)
		{// Clear our mask.
			validmovemask[i] = 0;
			capturemask[i] = 0;
		}
	}

	// CPU move.
	else if ((movecount+1)%2 == 1)
	{
		bestfrom = bestto = NO_MOVE;
		rate = piecerate = 0;
		CDC.print("I'm thinking ...");
		// For every black piece... 
		for (i = 0; i < 8;++i)
		{
			for (j = 0;j < 8;++j)
			{
				if (board[i][j] & 0x08)
				{ // Get possible moves.
					cpufrom[0] = i;
					cpufrom[1] = j;
					p = board[i][j];
					validate[piecetype(p)](cpufrom,BLACK);

					// Get best move for that piece. 
					moveto   = getbestpiecemove(cpufrom);
					movefrom = getindex(cpufrom[0],cpufrom[1]); 

					// Prevent consistent moving of the same piece.
					if (((board[cpufrom[0]][cpufrom[1]]&0x07) == lastmove) && (movetype < 3))
						piecerate -= 3;

					if (piecerate > rate)
					{
						rate     = piecerate;
						bestfrom = movefrom;
						bestto   = moveto;
					}

					moveto = movefrom = -1;
				}
				movetype = NO_MOVE;  
			}  
		}
		// We can move.
		if (rate != 0) 
		{
			getcoord (cpufrom[0],cpufrom[1],bestfrom);   
			getcoord (cputo[0],cputo[1],bestto);   
			p = board[(cpufrom[0])][(cpufrom[1])];
			draw_move(cpufrom,cputo,p);
			lastmove = (((p&0x07) != PAWN) && ((p&0x07) != KING)) ? p&0x07 : 0;
			CDC.print("\r\n");
			CDC.print("I play : ");
			CDC.write(cpufrom[1]+'a');
			CDC.write(cpufrom[0]+'1');
			CDC.print(" -> ");
			CDC.write(cputo[1]+'a');
			CDC.write(cputo[0]+'1');
			CDC.print("\r\n");
			movecount++;
		}
		//Checkmate.
		else
		{
			CDC.print("Pinguino lost - You win!\r\n");
			movecount++;   
			while(1);//break;
		} 
	}
	// Trying to move CPU piece.
	else
	{
		CDC.print("Well done my friend!\r\n");
		while(1);//break;
	}
}

// This function tests all the valid moves for
// the specified piece and returns the index
// of the best move.
int getbestpiecemove(LOC from)
{
	//unsigned char chaine[6];
	unsigned char i,j,k;
	unsigned char tmp;
	LOC to;
	unsigned char move,bestmove,curr_pos_rate;
	bestmove = NO_MOVE;
	piecerate = tmp = 0;

	// validmovemask and capturemask at this point
	// refer to our piece. That is, pieces we can take
	// and moves we can make with the current piece.
	// We need to take a copy and then clear these masks
	// prior to testing for opponents positions/captures.
	for (i = 0; i < 8;++i)
	{
		currmovemask[i]    = validmovemask[i];
		currcapturemask[i] = capturemask[i];
		validmovemask[i] = 0;
		capturemask[i] = 0;
	}

	for (i = 0; i < 8; ++i)
	{
		for (j = 0; j < 8; ++j)
		{
			// Test a Valid Move.
			if (currmovemask[i] & 0x01)
			{
				to[0] = i;
				to[1] = j; 
				// At this point the validmovemask and capturemask
				// refer to our opponents pieces. Of interest to us is
				// the capturemask as it tells us if we are moving into danger.
				if (test_singlemove(from,to,board[from[0]][from[1]]))
				{
					move = getindex(to[0],to[1]);
					movetype = NORMAL;  
					// Piece can be taken - add some weight to escape. 
					if ((validmovemask[from[0]] >> from[1]) & 1)            
					tmp = (board[from[0]][from[1]] & 0x07)/2;

					// Best Case Scenario - We can Capture a piece and cannot be
					// captured in turn.
					if((!((capturemask[i] >> j) & 1)) && ((currcapturemask[i] >> j) & 1))
						movetype = SAFECAPTURE;
					// Can Capture a piece.
					else if ((currcapturemask[i] >> j) & 1)
						movetype = CAPTURE;
					// Safe move.
					else if (!((capturemask[i] >> j) & 1))
						movetype = SAFE;

					// Rate the position of the move against our designates ideal pos.(3,3).
					curr_pos_rate  = (to[0] > 3)? to[0]-3 : 3-to[0];
					k  = (to[1] > 3)? to[1]-3 : 3-to[1];
					curr_pos_rate += k;      

					// Rate the move.               
					tmp += rate_move((board[from[0]][from[1]]),to,curr_pos_rate);

					// A better move that any so far with this piece.
					if (tmp > piecerate)
					{
						piecerate = tmp;
						bestmove = move;
					}   
					tmp = 0;  
				}
				// Reset Masks.
				for (k = 0; k < 8; ++k)
				{
					validmovemask[k] = 0;
					capturemask[k]   = 0;
				}
			}
			currmovemask[i] = currmovemask[i] >> 1;
		}
	}

	// possibilité d'afficher les recherches du meilleur coup du moteur d'echecs
/*
	if (bestmove != NO_MOVE) 
	{
		CDC.printf("Best move : %d", bestmove);
		CDC.print(",de : ");
		CDC.write(from[0]+'0');
		CDC.write(from[1]+'0');
		CDC.printf(",rate : %d", piecerate);
		CDC.printf(",type of movement : %d\r\n", movetype);
	else
	{
*/
		CDC.write('.');
//	}
	return bestmove;
}

// When a piece can move into a position we check whether
// that violates rules such as check, castling.
// Return true if move ok, false otherwise.

BOOL test_singlemove(LOC from,LOC to,PIECE p)
{
	int i = 0,j = 0; 
	LOC opp_pos;
	PIECE opp_piece,tmpdest;

	// If a king has moved update our internal record.
	if ((p & 0x07) == KING) updatekingpos(to,(p & 0x08));

	// Take a copy of the destination contents in case our move is invalid.
	tmpdest = board[to[0]][to[1]];

	// Update our internal matrix with the move.
	board[from[0]][from[1]] = EMPTY;
	board[to[0]][to[1]] = p;

	// Test our opponents pieces to see if any can capture our king.
	kingcapture = FALSE;
	i = j = 0;
	// scan rows.
	while ((i < 8) && (!kingcapture))
	{
		// scan columns.
		while ((j < 8) && (!kingcapture))
		{
			// Opponents Piece - Get valid moves.
			if (is_opp_piece(i,j,(p&0x08)))
			{
				opp_pos[0] = i, opp_pos[1] = j,opp_piece = board[i][j];
				validate[piecetype(opp_piece)] (opp_pos,(opp_piece & 0x08));
			}
			j++;
		}
		j = 0;
		i++;
	}
	// Finished Testing - Restore our internals. 
	board[to[0]][to[1]] = tmpdest;
	board[from[0]][from[1]] = p;
	if ((p & 0x07) == KING)
		updatekingpos(from,(p & 0x08));

	return (kingcapture) ? FALSE : TRUE;
}

// Calculate the relative worth of making
// a move. Based on the type of move, piece
// being moved, position moved to and subsequent danger.
// posrate is a level between 0-8  indicating closeness to
// the center of the board.
// Some manual 'fudging' is involved here to improve performance.

int rate_move(PIECE piece, LOC to,unsigned char posrate)
{
	unsigned char tmp, value, rating;

	// We dont want our king charging down the board...
	value = ((piece & 0x07)== KING) ? 0 : (piece&0x07);    

	switch (movetype)
	{
		case NORMAL:		// Move low value pieces if possible.
			rating = (6-value) + posrate/2;  
			break;
		case SAFE:			// Manouver better pieces to better positions.
			rating = (value)+((8-posrate));      
			break;
		case SAFECAPTURE:	// Capture safely if possible.
			rating = 14;                            
			break;
		case CAPTURE:		// Take an opponents piece here if it is better than our own.
			// Values are arbitrary.
			tmp = (board[to[0]][to[1]]&0x07)-(value);
			rating = (tmp < 249) ? 12 : 4;
			break; 
		default:
			rating = 0;
			break;
	}
	return rating;
}

// Update the panel with a move.
void draw_move (LOC from, LOC to,PIECE p)
{
	unsigned char *basemask,baserow;
	basemask = (p & 0x08) ? &bl_base_cont : &wh_base_cont;
	baserow = (p & 0x08) ? 7 : 0;

	// King Move.
	if (piecetype(p) == KING) 
	{
		updatekingpos(to,(p&0x08));
		board[from[0]][from[1]] = EMPTY;
		board[to[0]][to[1]] = p;
	// Castle Move.
		if (((to[1] - from[1]) != 1) && ((from[1] - to[1]) != 1))
		{
			if (((*basemask) & 0x1F)== 0x11)
			{ 
				//			draw_chessboard();
				board[to[0]][0] = EMPTY;
				board[to[0]][3] = ((p&0x08)|ROOK);
				CDC.printf("Queenside Castle\n");
			}
			else if (((*basemask) & 0xF0) == 0x90)
			{ 
				//			draw_chessboard();
				board[to[0]][7] = EMPTY;
				board[to[0]][5] = ((p&0x08)|ROOK);
				CDC.printf("Kingside Castle\n");
			}
		}
	}
	// Queening a pawn.
	else if (((p == 0x09) && (to[0] == 0)) || ((p == 1) && (to[0] == 7)))
	{
		board[from[0]][from[1]] = EMPTY;
		board[to[0]][to[1]] = QUEEN |(p&0x08);
	}       
	// Normal move.
	else
	{
		if (board[to[0]][to[1]] != EMPTY);
		board[from[0]][from[1]] = EMPTY;
		board[to[0]][to[1]] = p;
	}

	// Reflect any changes in the base row. After a Castle this becomes superflous.
	if ((from[0] == baserow) && ((*basemask) & (1 << from[1])))
		(*basemask) &= ~(1 << from[1]);
}

// Update our record of the kings position.
void updatekingpos(LOC to, BOOL piececolour)
{
	if (!piececolour)
	{
		wh_king_pos[0] = to[0];
		wh_king_pos[1] = to[1];
	}
	else
	{
		bl_king_pos[0] = to[0];
		bl_king_pos[1] = to[1];
	}
}

void init_board () 
{
	COORD i, j;

	board[7][0] = board[7][7] = BLACK|ROOK;
	board[7][1] = board[7][6] = BLACK|KNIGHT;
	board[7][2] = board[7][5] = BLACK|BISHOP;
	board[7][3] = BLACK|QUEEN;
	board[7][4] = BLACK|KING;

	board[0][0] = board[0][7] = WHITE|ROOK;
	board[0][1] = board[0][6] = WHITE|KNIGHT;
	board[0][2] = board[0][5] = WHITE|BISHOP;
	board[0][3] = WHITE|QUEEN;
	board[0][4] = WHITE|KING;

	for (i=2; i<6; ++i)
		for (j=0; j<8; ++j)
			board[i][j] = 0;

	for (i=0; i<8; ++i)
	{
		board[6][i] = BLACK|PAWN;
		board[1][i] = WHITE|PAWN;
	}

	// Initialise our records of the kings position
	wh_king_pos[0] = 0;
	wh_king_pos[1] = 4;
	bl_king_pos[0] = 7;
	bl_king_pos[1] = 4;  

	// Base rows fully occupied.
	wh_base_cont = bl_base_cont = 0xFF;
}

// version sans quadrillage
/*
void draw_chessboard(void)
{
	char i,j;
	CDC.print("\r\n");
	for (i=7;i>=0;i--)
	{
		for(j=0;j<8;j++)
		{
		switch (board[i][j])
		{
			case 0 : CDC.write('');break;
			case BLACK|PAWN : CDC.write('p');break;
			case WHITE|PAWN : CDC.write('P');break;
			case BLACK|ROOK : CDC.write('t');break;
			case WHITE|ROOK : CDC.write('T');break;
			case BLACK|KNIGHT : CDC.write('c');break;
			case WHITE|KNIGHT : CDC.write('C');break;
			case BLACK|BISHOP : CDC.write('f');break;
			case WHITE|BISHOP : CDC.write('F');break;
			case BLACK|QUEEN : CDC.write('r');break;
			case WHITE|QUEEN : CDC.write('R');break;
			case BLACK|KING : CDC.write('k');break;
			case WHITE|KING : CDC.write('K');break;
		}
	}
	CDC.write(' ');
	CDC.write(i + '1');
	CDC.print("\r\n");
	}
	CDC.print("abcdefgh\r\n\r\n");
}
*/

// version avec quadrillage
const char ligne[]=" +-+-+-+-+-+-+-+-+";

void draw_chessboard(void)
{
	char i,j;

	CDC.printf("\r\n%s\r\n", ligne);
	for (i=7;i>=0;i--)
	{
		CDC.write(' ');
		CDC.write('|');
		for(j=0;j<8;j++)
		{
			switch (board[i][j])
			{
				case 0 : CDC.write(' ');break;
				case BLACK|PAWN : CDC.write('p');break;
				case WHITE|PAWN : CDC.write('P');break;
				case BLACK|ROOK : CDC.write('t');break;
				case WHITE|ROOK : CDC.write('T');break;
				case BLACK|KNIGHT : CDC.write('c');break;
				case WHITE|KNIGHT : CDC.write('C');break;
				case BLACK|BISHOP : CDC.write('f');break;
				case WHITE|BISHOP : CDC.write('F');break;
				case BLACK|QUEEN : CDC.write('r');break;
				case WHITE|QUEEN : CDC.write('R');break;
				case BLACK|KING : CDC.write('k');break;
				case WHITE|KING : CDC.write('K');break;
			}
			CDC.write('|');
		}
		CDC.write(' ');
		CDC.write(i+'1');
		CDC.printf("\r\n%s\r\n", ligne);
	}
	CDC.print("  a b c d e f g h\r\n\r\n");
}

// lit le coup du jour sur USART, retourne vrai a la fin
BOOL read_movement (LOC from, LOC to)
{ 
	//unsigned char key, fdelay, fstate=0;
	PIECE p;
	char * chaine;

	chaine = CDC.getstring(); // recupere le coup jour de la forme e2e4

	// Store the 'from' position
	from[1] = chaine[0]-'a';
	from[0] = chaine[1]-'1';

	// Check moving correct piece.

	p = board[from[0]][from[1]];
	if (p == EMPTY || p & BLACK)
	{
		CDC.printf("\r\nillegal move!\r\n");
		return FALSE;
	}

	to[1] = chaine[2]-'a';
	to[0] = chaine[3]-'1'; 

	return from[0] != to[0] || from[1] != to[1];
}
