float[] tecla1Pos = { 5 , 1.2 };
float[] tecla2Pos = { 2 , 1.2 };
float[] tecla3Pos = { 1.2 , 1.2 };
float[] tecla4Pos = { 5 , 2 };
float[] tecla5Pos = { 2 , 2 };
float[] tecla6Pos = { 1.2 , 2 };
float[] tecla7Pos = { 5 , 5.5 };
float[] tecla8Pos = { 2 , 5.5 };
float[] tecla9Pos = { 1.2 , 5.5 };

int cont1= 0;
int cont2= 0;
int cont3= 0;
int cont4= 0;
int cont5= 0;
int cont6= 0;
int cont7= 0;
int cont8= 0;
int cont9= 0;

int contCP1= 0;
int contCP2= 0;
int contCP3= 0;
int contCP4= 0;
int contCP5= 0;
int contCP6= 0;
int contCP7= 0;
int contCP8= 0;
int contCP9= 0;

public class jueGato{
    private int TAM=3;
    private int nTablero[][]= new int[TAM][TAM];
    private int nGanador=-1;
    private int nContar=0;
    

    public jueGato() {
        empezarPartida();
        nContar=0;
    }
    
    public int[][] getTablero(){
        return nTablero;
    }
    
    public void empezarPartida(){
        for (int n=0;n<TAM;n++)
            for (int m=0;m<TAM;m++)
            {
                nTablero[n][m]=-1;
            }
        nGanador=-1;
    }
    
    public void  graficaOponenete(int n , int m)
    {
     
        switch(n)
        {
          
          case 0:
          println("fila 1 "+n);
          switch(m)
          { 
          case 0:
            G.pulsaBoton(0,0);
            if(contCP1 == 0)
            {
              E.asigna(width/tecla1Pos[0], height/tecla1Pos[1]); 
              //E.j = false;
              E.jugador();
              contCP1++;
            }
          break;
          
          case 1:
            G.pulsaBoton(0,1);
            if(contCP2 == 0)
            {
            E.asigna(width/tecla2Pos[0], height/tecla2Pos[1]);
            E.jugador();
            contCP2++;
            }
          break;
          
          case 2:
            G.pulsaBoton(0,2);
            if(contCP3 == 0)
            {
            E.asigna(width/tecla3Pos[0], height/tecla3Pos[1]);
            E.jugador();
            contCP2++;
            }
          break;
          
         }

          break;
          case 1: 
          println("fila 2 "+n);
          switch(m)
          { 
          case 0:
            G.pulsaBoton(1,0);
            if(contCP4 == 0)
            {
              E.asigna(width/tecla4Pos[0], height/tecla4Pos[1]); 
              //E.j = false;
              E.jugador();
              contCP4++;
            }
          break;
          
          case 1:
            G.pulsaBoton(1,1);
            if(contCP5 == 0)
            {
            E.asigna(width/tecla5Pos[0], height/tecla5Pos[1]);
            //E.j = true;
            E.jugador();
            contCP5++;
            }
          break;
          
          case 2:
            G.pulsaBoton(1,2);
            if(contCP6 == 0)
            {
            E.asigna(width/tecla6Pos[0], height/tecla6Pos[1]);
            //E.j = true;
            E.jugador();
            contCP6++;
            }
          break;
          
         }
          
 
          break;
          case 2:// println("Has pulsado el 3");
          println("fila 3 "+n);
          switch(m)
          { 
          case 0:
            G.pulsaBoton(2,0);
            if(contCP7 == 0)
            {
              E.asigna(width/tecla7Pos[0], height/tecla7Pos[1]); 
              //E.j = false;
              E.jugador();
              contCP7++;
            }
          break;
          
          case 1:
            G.pulsaBoton(2,1);
            if(contCP8 == 0)
            {
            E.asigna(width/tecla8Pos[0], height/tecla8Pos[1]);
            //E.j = true;
            E.jugador();
            contCP8++;
            }
          break;
          
          case 2:
            G.pulsaBoton(2,2);
            if(contCP9 == 0)
            {
            E.asigna(width/tecla9Pos[0], height/tecla9Pos[1]);
            //E.j = true;
            E.jugador();
            contCP9++;
            }
          break;
          
          }
          break;
        }
         E.dibuja();
         
    }
    
    //0 es la persona y 1 computadora, -1 no han puesto nadie en esa casilla
    
    public void pulsaBoton(int n, int m){
        if (n>=0 && m>=0 && n<TAM && m<TAM && nTablero[n][m]==-1){
            if (nGanador==-1){
                nTablero[n][m]=0;
                nGanador = ganaPartida();
                ponerFichaOrdenador();
            }
        }
    }
    
    public int ganaPartida(){
        if (nTablero[0][0] != -1 && nTablero[0][0] == nTablero[1][1]
                && nTablero[0][0] == nTablero[2][2])
                {
                //println("Ganaste");
                return nTablero[0][0];
                }
        if (nTablero[0][2] != -1 && nTablero[0][2] == nTablero[1][1]
                && nTablero[0][2] == nTablero[2][0])
            return nTablero[0][2];
        for (int n=0;n<TAM;n++){
            if (nTablero[n][0] != -1 && nTablero[n][0] == nTablero[n][1]
                    && nTablero[n][0] == nTablero[n][2])
                return nTablero[n][0];
            if (nTablero[0][n] != -1 && nTablero[0][n] == nTablero[1][n]
                    && nTablero[0][n] == nTablero[2][n])
                return nTablero[0][n];
        }
        return -1;
    }
    
    public int getGanador(){
        return nGanador;
    }
    
    //Algoritmo minimax
    private boolean tableroCompleto(){
        for (int n=0;n<TAM;n++)
            for (int m=0;m<TAM;m++)
                if (nTablero[n][m]==-1)
                    {
                      return false;
                    }
        return true;
    }
    
    private boolean finPartida(){
        return tableroCompleto() || ganaPartida()!=-1;
    }
    
    private void ponerFichaOrdenador(){
        if (!finPartida()){
            int f=0, c=0;
            int v=Integer.MIN_VALUE;
            int aux;
            for (int n=0;n<TAM;n++){
                for (int m=0;m<TAM;m++){
                    if (nTablero[n][m]==-1){
                        nTablero[n][m]=1;
                        aux=min();
                        if (aux>v) {
                            v=aux;
                            f=n;
                            c=m;
                        }
                        nTablero[n][m]=-1;
                    }
                }
            }
            nTablero[f][c]=1;
            println("Puse la ficha en "+f+c);
            graficaOponenete(f,c);
            
        }
        nGanador=ganaPartida();
        
    }
    
    private int max(){
        if (finPartida()){
            if (ganaPartida()!=-1) return -1;
            else return 0;
        }
        int v=Integer.MIN_VALUE;
        int aux;
        for (int n=0;n<TAM;n++){
            for (int m=0;m<TAM;m++){
                if (nTablero[n][m]==-1){
                    nTablero[n][m]=1;
                    aux=min();
                    if (aux>v) v=aux;
                    nTablero[n][m]=-1;
                    
                }
            }
        }
        return v;
    }
    
    private int min(){
        if (finPartida()){
            if (ganaPartida()!=-1) return 1;
            else return 0;
        }
        int v=Integer.MAX_VALUE;
        int aux;
        for (int n=0;n<TAM;n++){
            for (int m=0;m<TAM;m++){
                if (nTablero[n][m]==-1){
                    nTablero[n][m]=0;
                    aux=max();
                    if (aux<v) v=aux;
                    nTablero[n][m]=-1;
                }
            }
        }
        return v;
    }

};

class Estado {
  float x, y; //coordenadas para dibujar en pantalla cruz o aro
  boolean j; // jugador 1 o jugador 2
  //boolean establecido = false;

  // cambio de jugador
  void jugador() {
    j=!j;
    //j = (j==true)?false:true;
  }
  void asigna(float _x, float _y) {
    x=_x;
    y=_y;
  }
  void dibuja() {
    if (j) {//pinta un aro verde
      noStroke(); //sin linea
      fill(20, 250, 20); //relleno en RGB
      circle(x, y, 100);  //pinta un circulo
      fill(0);          //relleno negro
      circle(x, y, 80);   //pinta un circulo
    } else { //pinta una cruz roja
      strokeWeight(10); //ancho de linea
      stroke(200, 20, 20); //color de linea
      line(x-50, y-50, x+50, y+50);
      line(x+50, y-50, x-50, y+50);
    }
  }
};

Estado E = new Estado();
jueGato G = new jueGato();

void setup() {
  //tamaño de la ventana de la aplicación
  size(700, 700);
  background(0);
  G.empezarPartida();
  /*ejemplo de asignar las coordenadas del centro de la 
   pantalla para mostrar la ficha del jugador. Si 
   jugador == true, pinta un aro, si jugador== false
   pinta una cruz*/
   
   
  //E.asigna(width/2, height/2); 
  //E.j=false;

  // E.jugador(); //cambio de jugador
}

void draw() {
  // en escala de grises el 0 representa el color negro
  //background(0);
  //inicio de pintar las lineas del gato
  stroke(20, 20, 250);
  strokeWeight(4);
  line(width/3, 0, width/3, height);
  line(2*width/3, 0, 2*width/3, height);
  line(0, height/3, width, height/3);
  line(0, 2*height/3, width, 2*height/3);
  //fin de pintar las lineas del tablero del gato

  //pinta un aro o una cruz dependiento de la variable j (jugador)  
  //E.dibuja();
  compruebaGanador();
  E.dibuja();



  if (keyPressed)
  {
     //println("Has pulsado la tecla:" + key);
    switch(key)
    {
    case '1':   
    //println("Has pulsado el 1");
    G.pulsaBoton(0,0);
    if(cont1 == 0)
    {
      E.asigna(width/tecla1Pos[0], height/tecla1Pos[1]); 
      //E.j = false;
      E.jugador();
      cont1++;
    }
    break;
    case '2': 
    //println("Has pulsado el 2");
    G.pulsaBoton(0,1);
    if(cont2 == 0)
    {
    E.asigna(width/tecla2Pos[0], height/tecla2Pos[1]);
    //E.j = true;
    E.jugador();
    cont2++;
    }
    break;
    case '3':// println("Has pulsado el 3");
    G.pulsaBoton(0,2);
    if(cont3 == 0)
    {
    E.asigna(width/tecla3Pos[0], height/tecla3Pos[1]);
    //E.j = false;
    E.jugador();
    cont3++;
    }
    break;
    case '4': //println("Has pulsado el 4");
    G.pulsaBoton(1,0);
    if(cont4 == 0)
    {
    E.asigna(width/tecla4Pos[0], height/tecla4Pos[1]);
    //E.j = true;
    E.jugador();
    cont4++;
    }
    break;
    case '5': //println("Has pulsado el 5");
    G.pulsaBoton(1,1);
    if(cont5 == 0)
    {
    E.asigna(width/tecla5Pos[0], height/tecla5Pos[1]);
    //E.j = false;
    E.jugador();
    cont5++;
    }
    break;
    case '6': //println("Has pulsado el 6");
    G.pulsaBoton(1,2);
    if(cont6 == 0)
    {
    E.asigna(width/tecla6Pos[0], height/tecla6Pos[1]);
    //E.j = true;
    E.jugador();
    cont6++;
    }
    break;
    case '7': //println("Has pulsado el 7");
    G.pulsaBoton(2,0);
    if(cont7 == 0)
    {
    E.asigna(width/tecla7Pos[0], height/tecla7Pos[1]);
    //E.j = false;
    E.jugador();
    cont7++;
    }
    break;
    case '8': //println("Has pulsado el 8");
    G.pulsaBoton(2,1);
    if(cont8 == 0)
    {
    E.asigna(width/tecla8Pos[0], height/tecla8Pos[1]);
    //E.j = true;
    E.jugador();
    cont8++;
    }
    break;
    case '9': //println("Has pulsado el 9");
    G.pulsaBoton(2,2);
    if(cont9 == 0)
    {
    E.asigna(width/tecla9Pos[0], height/tecla9Pos[1]); 
    //E.j = false;
    E.jugador();
    //println("hola");
    cont9++;
    }
    break;    
    }

  }  
}

void compruebaGanador()
{
  if(0 == G.getGanador())
    {

    println("Ganaste");
    size(700, 700);
    textSize(100);
    fill(255, 255, 255);// defino el color 1
    text("TERMINO \nEL JUEGO\nGANASTE",150,200);
    stop();
    //background(1);
    }
    else
    if(1== G.getGanador())
    {
      
      println("Gano IA");
      size(700, 700);
      textSize(100);
      fill(255, 255, 255);// defino el color 1
      text("TERMINO\nEL JUEGO\nGANO IA",150,200);
      stop();
      
      //background(1);
    }
    else
    if(G.tableroCompleto())
    {
      
      size(700, 700);
      textSize(100);
      fill(255, 255, 255);// defino el color 1
      text("TERMINO\nEL JUEGO\nEMPATE",150,200);
      stop();
    } 
  
}
