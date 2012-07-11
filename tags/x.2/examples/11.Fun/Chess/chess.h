// D'après Jeux d'ECHECS sur PIC18 C.Dupaty Académie d'Aix-MArseille 03/2004
// Moteur de calcul d'après PROTEUS VSM TINY CHESS http://www.multipower-fr.com/cao/prod01.htm 
// Adaptation au Pinguino par Régis Blanchot 05/2011
               
#ifndef __CHESS_H_
#define __CHESS_H_
                                                 
// Constants:
//#define TRUE  1
//#define FALSE 0
//#define ON    1
//#define OFF   0
#define YES   1
#define NO    0
#define OK    0
#define ERR   -1

// Portability types:

//typedef int BOOL;
typedef unsigned long FLAG;

// System Types
typedef unsigned char COORD;
typedef COORD LOC[2];
typedef unsigned char PIECE;
typedef unsigned char BOARD[8][8];
typedef void (*FUNCPTR) (LOC,BOOL);
typedef unsigned char MASK[8];

// Codes for chess piece tokens
#define EMPTY   0
#define PAWN    1
#define ROOK    2
#define KNIGHT  3
#define BISHOP  4
#define QUEEN   5
#define KING    6
#define WHITE   0
#define BLACK   8

//Play Control.
#define WH_PAWN_BASEROW 1
#define BL_PAWN_BASEROW 6
#define MAX_INDEX 63
#define MIN_INDEX 0
#define MAX_COL   7
#define MAX_ROW   7
#define MIN_COL   0
#define MIN_ROW   0

// CPU Move Types.
#define NO_MOVE     -1
#define NORMAL      1
#define SAFE        2
#define CAPTURE     3
#define SAFECAPTURE 4
#define ESCAPE      4

// Global Variables - 
extern  BOARD board;
extern  MASK  validmovemask;
extern  MASK  capturemask;
extern  int   movecount;
extern  LOC   wh_king_pos;
extern  LOC   bl_king_pos;
extern  LOC   opp_king_pos;
extern  BOOL  kingcapture;
extern  unsigned char  wh_base_cont;
extern  unsigned char  bl_base_cont;
extern  unsigned char  movetype;
extern  unsigned char  rate;
extern  unsigned char  piecerate;

// Translate coords into 0-based index.
#define getindex(r,c) (r * 8) + c;     
// Translate index into coords.      
#define getcoord(r,c,i) r = i/8; c = i%8; 
// Determine the type of piece.
#define piecetype(p) (p & 0x07)
//Boolean - True if piece is opponents, false if not.
#define is_opp_piece(r,c,p) ((((board[r][c] & 0x08) >> 3) ^ ((p & 0x08) >> 3)) && (board[r][c]))
//Boolean - True if move is valid, false if not.
#define is_valid_move(r,c) (validmovemask[r] & (1 << c))

// Piece Validation Functions. These functions set bits in our 
// board mask array indicating valid moves for the specified piece.
void val_empty  (LOC from, BOOL piececolour);
void val_pawn   (LOC from, BOOL piececolour);
void val_bishop (LOC from, BOOL piececolour);
void val_knight (LOC from, BOOL piececolour);
void val_rook   (LOC from, BOOL piececolour);
void val_queen  (LOC from, BOOL piececolour);
void val_king   (LOC from, BOOL piececolour);

extern FUNCPTR validate[7];

// Directional Validation functions.
void val_north     (LOC from,BOOL piececolour,BOOL depth);
void val_south     (LOC from,BOOL piececolour,BOOL depth);
void val_west      (LOC from,BOOL piececolour,BOOL depth);
void val_east      (LOC from,BOOL piececolour,BOOL depth);
void val_northwest (LOC from,BOOL piececolour,BOOL depth);
void val_northeast (LOC from,BOOL piececolour,BOOL depth);
void val_southwest (LOC from,BOOL piececolour,BOOL depth);
void val_southeast (LOC from,BOOL piececolour,BOOL depth);

//Utility.
void updatekingpos(LOC to, BOOL piececolour);
int  getbestpiecemove(LOC from);
BOOL test_singlemove (LOC from,LOC to,PIECE p);
int rate_move(PIECE piece,LOC to, unsigned char posrate);
//void draw_move(LOC from, LOC to,PIECE p);
void init_board ();
void draw_move (LOC from, LOC to,PIECE p);

//USART output
void draw_chessboard(void);
BOOL read_movement (LOC from, LOC to);

#endif	/* __CHESS_H_ */

