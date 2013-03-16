






   



    
char lectura[21], *bloque;
int par1, valor, cont, i;
    
void setup() {
 }
   
void leer_cadena() {
    unsigned char valor_leido[21];
    unsigned char receivedbyte;
    int cont=1;
    while (cont){    
        receivedbyte=CDCgets(valor_leido);
        valor_leido[receivedbyte]=0;
        if (receivedbyte>0) cont=0;}
    strcpy(lectura,valor_leido);}
     
void loop() {
    
leer_cadena();
cont=0;
    
if (strncmp(lectura, "pinMode", 7)==0){
 for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){ 
 switch (cont){
 case 0: break;
 case 1:
  par1=atoi(bloque);
  break;
 case 2:
  if (strncmp(bloque, "INPUT", 5)==0) pinmode(par1,INPUT);
  else if (strncmp(bloque, "OUTPUT", 6)==0) pinmode(par1,OUTPUT);
  break;
 } 
 cont+=1;
 }
}
    
else if (strncmp(lectura, "digitalWrite", 12)==0){
 for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){
 switch (cont){
 case 0: break;
 case 1:
  par1=atoi(bloque);
  break;
 case 2:
  if (strncmp(bloque, "HIGH", 4)==0) digitalwrite(par1,HIGH);
  else if (strncmp(bloque, "LOW", 3)==0) digitalwrite(par1,LOW);
  break;
 } 
 cont+=1;
 }
}
    
else if (strncmp(lectura, "analogWrite", 11)==0){
 for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){
 switch (cont){
 case 0: break;
 case 1:
  par1=atoi(bloque);
  break;
 case 2:
  PWM_set_dutycycle(par1,atoi(bloque));
  break;
 } 
 cont+=1;
 }
}
    
else if (strncmp(lectura, "digitalRead", 11)==0){
 for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
 switch (cont){
 case 0: break;
 case 1:
  CDCprintf("%d\n",digitalread(atoi(bloque)));
  break;
 } 
 cont+=1;
 }
}
    
else if (strncmp(lectura, "analogRead", 10)==0){
 for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
 switch (cont){
 case 0: break;
 case 1:
  CDCprintf("%d\n",analogread(atoi(bloque)));
  break;
 } 
 cont+=1;
 }
}
   
else if (strncmp(lectura, "eepromRead", 10)==0){
 for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
 switch (cont){
 case 0: break;
 case 1:
  CDCprintf("%d\n",EEPROM_read8(atoi(bloque)));
  break;
 } 
 cont+=1;
 }
}
   
else if (strncmp(lectura, "eepromWrite", 11)==0){
 for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){
 switch (cont){
 case 0: break;
 case 1:
  par1=atoi(bloque);
  break;
 case 2:
  bloque = strtok(bloque,")");
  EEPROM_write8(par1, atoi(bloque));
  break;
 } 
 cont+=1;
 }
}
   
else if (strncmp(lectura, "delay", 5)==0){
 for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
 switch (cont){
 case 0: break;
 case 1:
  Delayms(atoi(bloque));
  break;
 } 
 cont+=1;
 }
}
     
else if (strncmp(lectura, "delayMicroseconds", 17)==0){
 for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
 switch (cont){
 case 0: break;
 case 1:
  Delayus(atoi(bloque));
  CDCprintf("Done\n");
  break;
 } 
 cont+=1;
 }
}
     
else if (strncmp(lectura, "allOutput", 9)==0){
 for (i=0;i<=TotalPines;i++){
  pinmode(i,OUTPUT);
  digitalwrite(i,LOW);
 }
}
   
else if (strncmp(lectura, "allInput", 8)==0){
 for (i=0;i<=TotalPines;i++)
  pinmode(i,INPUT);
}
   
else if (strncmp(lectura, "allHigh", 7)==0){
 for (i=0;i<=TotalPines;i++){
  pinmode(i,OUTPUT);
  digitalwrite(i,HIGH);
 }
}
   
else if (strncmp(lectura, "allLow", 6)==0){
 for (i=0;i<=TotalPines;i++){
  pinmode(i,OUTPUT);
  digitalwrite(i,LOW);
 }
}
     
else if (strncmp(lectura, "reset", 5)==0)
 reset();
     
}

