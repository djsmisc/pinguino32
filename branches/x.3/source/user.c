void setup() {
	
	
	}

<<<<<<< .mine











=======
void loop() {
	
>>>>>>> .r275




<<<<<<< .mine

const unsigned char lgntirets[]="---------------------------------------------------------------";


 BOARD board;
 MASK validmovemask;
 MASK capturemask;
 int movecount;
 unsigned char movetype;
 unsigned char rate;
 unsigned char piecerate;
 unsigned char lastmove;

 LOC wh_king_pos;
 LOC bl_king_pos;
 LOC opp_king_pos;
 BOOL kingcapture;

 unsigned char wh_base_cont;
 unsigned char bl_base_cont;

 MASK currcapturemask;
 MASK currmovemask;

FUNCPTR validate[7] = { val_empty, val_pawn, val_rook, val_knight,val_bishop,val_queen,val_king};

void setup()
{ 
	serial_begin(9600);		
	movecount   = 1;
	kingcapture = FALSE;
	movetype = NO_MOVE;      
	init_board();
	RCLF();RCLF();
	serial_printf(lgntirets); RCLF();
	serial_printf("-JOUEZ AUX ECHECS AVEC UN PIC18 - ACADEMIE D AIX-MARSEILLE - CD"); RCLF();
	serial_printf(" exemple de saisie : e2e4* (* termine la saisie) "); RCLF();
	serial_printf(lgntirets); RCLF();
}
 


void loop()
{
	LOC from, to, cpufrom,cputo;
   PIECE p;
   unsigned char i = 0, j = 0;
   unsigned char movefrom,bestfrom,moveto,bestto; 
   unsigned char illegal = FALSE;

	
      if ((movecount+1)%2 == 0)
       { 
	     trace_jeux();
		 serial_printf("Jouez : ");
		 
         if (!illegal);
         else
            illegal = FALSE;   

         
         while (!lit_coup_joueur(from, to))
            ;
         p = board[from[0]][from[1]];
         
            
         
         validate[piecetype(p)] (from,WHITE);
         
         
         
         if (is_valid_move(to[0],to[1]) && test_singlemove(from,to,board[from[0]][from[1]]))
          { 
			draw_move(from,to,p);
			RCLF();
			serial_printf("Vous jouez : ");
			serial_putchar(from[1]+'a');
			serial_putchar(from[0]+'1');
			serial_printf(" -> ");
			serial_putchar(to[1]+'a');
			serial_putchar(to[0]+'1');
			RCLF();
            movecount++;
          }
         else
          { 
			RCLF();
			serial_printf ("Deplacement invalide de cette piece");
			RCLF();
            illegal = TRUE;
          }

         
         for (i = 0; i < 8;++i)
          {
            validmovemask[i] = 0;
            capturemask[i] = 0;
          }
       }
  
      
      else if ((movecount+1)%2 == 1)
       { bestfrom = bestto = NO_MOVE;
         rate = piecerate = 0;
         serial_printf ("Je reflechis .");
	       
         for (i = 0; i < 8;++i)
          { for (j = 0;j < 8;++j)
             { if (board[i][j] & 0x08)
                { 
                  cpufrom[0] = i;
                  cpufrom[1] = j;
                  p = board[i][j];
                  validate[piecetype(p)](cpufrom,BLACK);

                  
                  moveto   = getbestpiecemove(cpufrom);
                  movefrom = getindex(cpufrom[0],cpufrom[1]); 
               
                  if (((board[cpufrom[0]][cpufrom[1]]&0x07) == lastmove) && (movetype < 3))
                   { 
                     piecerate -= 3;
                   }
                  
                 if (piecerate > rate)
                   { rate     = piecerate;
                     bestfrom = movefrom;
                     bestto   = moveto;
                   }

                  moveto = movefrom = -1;
                }
               movetype = NO_MOVE;  
             }  
          }
        if (rate != 0) 
         { 
           getcoord (cpufrom[0],cpufrom[1],bestfrom);   
           getcoord (cputo[0],cputo[1],bestto);   
           p = board[(cpufrom[0])][(cpufrom[1])];
           draw_move(cpufrom,cputo,p);
           lastmove = (((p&0x07) != PAWN) && ((p&0x07) != KING)) ? p&0x07 : 0;
			RCLF();
			serial_printf("Je joue : ");
			serial_putchar(cpufrom[1]+'a');
			serial_putchar(cpufrom[0]+'1');
			serial_printf(" -> ");
			serial_putchar(cputo[1]+'a');
			serial_putchar(cputo[0]+'1');
			RCLF();
           movecount++;
         }
        else
         { 
           serial_printf("Le PIC18 a perdu - Vous gagnez");
		   RCLF();
           movecount++;   
		   break;
         } 
       }

      else
       { 
         serial_printf("Bon essai l'ami un beau PAT");
		RCLF();
		break;
       }
}

=======
	}
>>>>>>> .r275
int getbestpiecemove(LOC from)



 { unsigned char chaine[6];
   unsigned char i,j,k;
   unsigned char tmp;
   LOC to;
   unsigned char move,bestmove,curr_pos_rate;
   bestmove = NO_MOVE;
   piecerate = tmp = 0;

   
   
   
   
   
   for (i = 0; i < 8;++i)
    { currmovemask[i]    = validmovemask[i];
      currcapturemask[i] = capturemask[i];
      validmovemask[i] = 0;
      capturemask[i] = 0;
    }

   for (i = 0; i < 8; ++i)
    { for (j = 0; j < 8; ++j)
       { if (currmovemask[i] & 0x01)
          { 
            to[0] = i;
            to[1] = j; 
            if (test_singlemove(from,to,board[from[0]][from[1]]))
             { 
               
               
               move = getindex(to[0],to[1]);
               movetype = NORMAL;  
               if ((validmovemask[from[0]] >> from[1]) & 1)            
                { 
                  tmp = (board[from[0]][from[1]] & 0x07)/2;
                }
   
               if((!((capturemask[i] >> j) & 1)) && ((currcapturemask[i] >> j) & 1))
                { 
                  
                  movetype = SAFECAPTURE;
                }
               else if ((currcapturemask[i] >> j) & 1)
                { 
                  movetype = CAPTURE;
                }
               else if (!((capturemask[i] >> j) & 1))
                { 
                  movetype = SAFE;
                }  
                              

               
               curr_pos_rate  = (to[0] > 3)? to[0]-3 : 3-to[0];
               k  = (to[1] > 3)? to[1]-3 : 3-to[1];
               curr_pos_rate += k;      
               
               
               tmp += rate_move((board[from[0]][from[1]]),to,curr_pos_rate);

               if (tmp > piecerate)
                { 
                  piecerate = tmp;
                  bestmove = move;
                }   
               tmp = 0;  
             }
            for (k = 0; k < 8; ++k)
             { 
               validmovemask[k] = 0;
               capturemask[k]   = 0;
             }
          }
         currmovemask[i] = currmovemask[i] >> 1;
       }
    }
  if (bestmove != NO_MOVE) 
		{



			serial_putchar('.');
		}
 return bestmove;
 }

BOOL test_singlemove (LOC from,LOC to,PIECE p)



 { int i = 0,j = 0; 
   LOC opp_pos;
   PIECE opp_piece,tmpdest;

   
   if ((p & 0x07) == KING) updatekingpos(to,(p & 0x08));

   
   
   tmpdest = board[to[0]][to[1]];

   
   board[from[0]][from[1]] = EMPTY;
   board[to[0]][to[1]] = p;
    
           
   
   kingcapture = FALSE;
   i = j = 0;
   while ((i < 8) && (!kingcapture))
    { 
      while ((j < 8) && (!kingcapture))
       { 
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
   
   board[to[0]][to[1]] = tmpdest;
   board[from[0]][from[1]] = p;
   if ((p & 0x07) == KING) updatekingpos(from,(p & 0x08));

   return (kingcapture) ? FALSE : TRUE;
 }

int rate_move(PIECE piece, LOC to,unsigned char posrate)






 { unsigned char tmp, value, rating;
   
   
   value = ((piece & 0x07)== KING) ? 0 : (piece&0x07);    

   switch (movetype)
    { case NORMAL     : 
                        rating = (6-value) + posrate/2;  
                        break;
      case SAFE       : 
                        rating = (value)+((8-posrate));      
                        break;
      case SAFECAPTURE: 
                        rating = 14;                            
                        break;
      case CAPTURE    : 
                        
                        tmp = (board[to[0]][to[1]]&0x07)-(value);
                        rating = (tmp < 249) ? 12 : 4;
                        break; 
      default         : rating = 0;
                        break;
    }
   return rating;
 }



void draw_move (LOC from, LOC to,PIECE p)

 { unsigned char *basemask,baserow;
   basemask = (p & 0x08) ? &bl_base_cont : &wh_base_cont;
   baserow = (p & 0x08) ? 7 : 0;

   if (piecetype(p) == KING) 
    { 
      updatekingpos(to,(p&0x08));
      board[from[0]][from[1]] = EMPTY;
      board[to[0]][to[1]] = p;
      if (((to[1] - from[1]) != 1) && ((from[1] - to[1]) != 1))
       { 
         if (((*basemask) & 0x1F)== 0x11)
          { 

            board[to[0]][0] = EMPTY;
            board[to[0]][3] = ((p&0x08)|ROOK);
            serial_printf("Queenside Castle\n");
          }
        else if (((*basemask) & 0xF0) == 0x90)
          { 

            board[to[0]][7] = EMPTY;
            board[to[0]][5] = ((p&0x08)|ROOK);
            serial_printf("Kingside Castle\n");
          }
       }
    }
   else if (((p == 0x09) && (to[0] == 0)) || ((p == 1) && (to[0] == 7)))
    {
     board[from[0]][from[1]] = EMPTY;
     board[to[0]][to[1]] = QUEEN |(p&0x08);
    }       
   else
    { 

      if (board[to[0]][to[1]] != EMPTY);

      board[from[0]][from[1]] = EMPTY;
      board[to[0]][to[1]] = p;
    }

   if ((from[0] == baserow) && ((*basemask) & (1 << from[1])))
    { 
      
      (*basemask) &= ~(1 << from[1]);
    }
 }

void updatekingpos(LOC to, BOOL piececolour)
 
 { if (!piececolour)
    { wh_king_pos[0] = to[0];
      wh_king_pos[1] = to[1];
    }
   else
    { bl_king_pos[0] = to[0];
      bl_king_pos[1] = to[1];
    }
 }

void init_board () 
 { COORD i, j;
    
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
    { board[6][i] = BLACK|PAWN;
      board[1][i] = WHITE|PAWN;
    }
   
   
   wh_king_pos[0] = 0;
   wh_king_pos[1] = 4;
   bl_king_pos[0] = 7;
   bl_king_pos[1] = 4;  

   
   wh_base_cont = bl_base_cont = 0xFF;
 }


