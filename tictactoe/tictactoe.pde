int[][] board;
int winner = 0, shifts = 0, num_Start = (int)(Math.random()*2), chckWin;
int player = 1, x, y, cont, cont2 = 0;
int IA = -1, aux = 0, aux2 = 0, board_Choose = (int)(Math.random()*4), num1, num2;
PFont f;
String msg;

void setup(){
  size(600,600);
  f = createFont("AkaashNormal", 16, true);
  board = new int[3][3];
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      board[i][j] = 0;
    }
  }
}

void drawBoard(){
  strokeWeight(7);
  for(int i = 1; i < 3; i++){
    line(10, i*200, 590, i*200);
    line(i*200, 10, i*200, 590);
  }
}

void drawX(int x, int y){
  line(x*200+20, y*200+20, x*200+200-20, y*200+200-20);
  line(x*200+200-20, y*200+20, x*200+20, y*200+200-20);
}

void drawO(int x, int y){
  fill(192,192,192);
  ellipse(x*200+100, y*200+100, 160, 160);
}

void locator(int x, int y){
  if (board[y][x] == 1)
    drawX(x, y);
  if (board[y][x] == -1)
    drawO(x, y);
}

void drawMarks(){
  for(int y = 0; y < 3; y++){
    for(int x = 0; x < 3; x++){
      locator(x, y);
    }
  }
}

void check(){
  for(int i = 0; i < 3; i++){
    // Validacion para jugador
    if(board[i][0] == board[i][1] && board[i][0] == board[i][2] && board[i][0] == 1)
      winner = 1;
    if(board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] == 1)
      winner = 1;
    if(board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] == 1)
      winner = 1;
    if(board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] == 1)
      winner = 1;
    // Validacion para IA
    if(board[i][0] == board[i][1] && board[i][0] == board[i][2] && board[i][0] == -1)
      winner = 2;
    if(board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] == -1)
      winner = 2;
    if(board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] == -1)
      winner = 2;
    if(board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] == -1)
      winner = 2;
  }
}
    
public boolean checkWinIA(){
  // Victorias horizontales
  for(int i = 0; i < 3; i++){
    if(board[i][0] == -1 && board[i][1] == -1 && board[i][2] == 0){
      board[i][2] = -1;
      return true;
    }
    if(board[i][1] == -1 && board[i][2] == -1 && board[i][0] == 0){
      board[i][0] = -1;
      return true;
    }
    if(board[i][0] == -1 && board[i][2] == -1 && board[i][1] == 0){
      board[i][1] = -1;
      return true;
    }
  }
  // Victorias verticales
  for(int i = 0; i < 3; i++){
    if(board[0][i] == -1 && board[1][i] == -1 && board[2][i] == 0){
      board[2][i] = -1;
      return true;
    }
    if(board[1][i] == -1 && board[2][i] == -1 && board[0][i] == 0){
      board[0][i] = -1;
      return true;
    }
    if(board[0][i] == -1 && board[2][i] == -1 && board[1][i] == 0){
      board[1][i] = -1;
      return true;
    }
  }
  // Victorias cruzadas
  if(board[0][0] == -1 && board[1][1] == -1 && board[2][2] == 0){
    board[2][2] = -1;
    return true;
  }
  if(board[1][1] == -1 && board[2][2] == -1 && board[0][0] == 0){
    board[0][0] = -1;
    return true;
  }
  if(board[0][0] == -1 && board[2][2] == -1 && board[1][1] == 0){
    board[1][1] = -1;
    return true;
  }
  if(board[0][2] == -1 && board[1][1] == -1 && board[2][0] == 0){
    board[2][0] = -1;
    return true;
  }
  if(board[1][1] == -1 && board[2][0] == -1 && board[0][2] == 0){
    board[0][2] = -1;
    return true;
  }
  if(board[0][2] == -1 && board[2][0] == -1 && board[1][1] == 0){
    board[1][1] = -1;
    return true;
  }
  return false;
}

public boolean checkBlockIA(){
  // Bloqueos horizontales
  for(int i = 0; i < 3; i++){
    if(board[i][0] == 1 && board[i][1] == 1 && board[i][2] == 0){
      board[i][2] = -1;
      return true;
    }
    if(board[i][1] == 1 && board[i][2] == 1 && board[i][0] == 0){
      board[i][0] = -1;
      return true;
    }
    if(board[i][0] == 1 && board[i][2] == 1 && board[i][1] == 0){
      board[i][1] = -1;
      return true;
    }
  }
  // Bloqueos verticales
  for(int i = 0; i < 3; i++){
    if(board[0][i] == 1 && board[1][i] == 1 && board[2][i] == 0){
      board[2][i] = -1;
      return true;
    }
    if(board[1][i] == 1 && board[2][i] == 1 && board[0][i] == 0){
      board[0][i] = -1;
      return true;
    }
    if(board[0][i] == 1 && board[2][i] == 1 && board[1][i] == 0){
      board[1][i] = -1;
      return true;
    }
  }
  // Bloqueos cruzadas
  if(board[0][0] == 1 && board[1][1] == 1 && board[2][2] == 0){
    board[2][2] = -1;
    return true;
  }
  if(board[1][1] == 1 && board[2][2] == 1 && board[0][0] == 0){
    board[0][0] = -1;
    return true;
  }
  if(board[0][0] == 1 && board[2][2] == 1 && board[1][1] == 0){
    board[1][1] = -1;
    return true;
  }
  if(board[0][2] == 1 && board[1][1] == 1 && board[2][0] == 0){
    board[2][0] = -1;
    return true;
  }
  if(board[1][1] == 1 && board[2][0] == 1 && board[0][2] == 0){
    board[0][2] = -1;
    return true;
  }
  if(board[0][2] == 1 && board[2][0] == 1 && board[1][1] == 0){
    board[1][1] = -1;
    return true;
  }
  return false;
}
    
void playIA(){
  // Despues empezar la jugada
  if(aux == 10){
    switch(aux2){
      case 1: // Arriba
        if(checkWinIA())
          System.out.println("WIN IA");
        else if(checkBlockIA())
          System.out.println("BLOCK IA");
        else if(board[0][0] == 0)
          board[0][0] = -1;
        else if(board[0][2] == 0)
          board[0][2] = -1;
        break;
      case 2:// Izquierda
        if(checkWinIA())
          System.out.println("WIN IA");
        else if(checkBlockIA())
          System.out.println("BLOCK IA");
        else if(board[0][0] == 0)
          board[0][0] = -1;
        else if(board[2][0] == 0)
          board[2][0] = -1;
        break;
      case 3:// Derecha
        if(checkWinIA())
          System.out.println("WIN IA");
        else if(checkBlockIA())
          System.out.println("BLOCK IA");
        else if(board[0][2] == 0)
          board[0][2] = -1;
        else if(board[2][2] == 0)
          board[2][2] = -1;
        break;
      case 4:// Abajo
        if(checkWinIA())
          System.out.println("WIN IA");
        else if(checkBlockIA())
          System.out.println("BLOCK IA");
        else if(board[2][0] == 0)
          board[2][0] = -1;
        else if(board[2][2] == 0)
          board[2][2] = -1;
        break;
    }
  }
  // Empezar jugada
  if(aux == 1){
    if(board[0][0] == 0 && board[0][1] == 0 && board[0][2] == 0){// Arriba
      board[0][1] = -1;
      aux2 = 1;
    } else if(board[0][0] == 0 && board[1][0] == 0 && board[2][0] == 0){// Izquierda
      board[1][0] = -1;
      aux2 = 2;
    } else if(board[0][2] == 0 && board[1][2] == 0 && board[2][2] == 0){// Derecha
      board[1][2] = -1;
      aux2 = 3;
    } else if(board[2][0] == 0 && board[2][1] == 0 && board[2][2] == 0){// Abajo
      board[2][1] = -1;
      aux2 = 4;
    }
    aux = 10;
  }
  // Iniciando jugada
  if(board[1][1] == 0){
      board[1][1] = -1;
      aux = 1;
  }
}



// Si empieza segundo la IA
void blockPlayIA(){
  num1 = (int)(Math.random()*3);
  num2 = (int)(Math.random()*3);
  if(aux == 1){
    if(checkWinIA())
      System.out.println("WIN IA");
    else if(checkBlockIA())
      System.out.println("BLOCK IA");
    else if(board[num1][num2] == 0)
      board[num1][num2] = -1;
    else if(board[num1][num2] != 0){
      aux2 = 1;
      while(aux2 == 1){
        if(aux == 1){
          num1 = (int)(Math.random()*3);
          num2 = (int)(Math.random()*3);
          if(board[num1][num2] == 0){
            board[num1][num2] = -1;
            aux2 = 0;
          }
        }
      }
    }
  }
  
  if(aux == 0){
    if(board[1][1] == 0){
        board[1][1] = -1;
        aux = 1;
    } else 
        switch(board_Choose){
          case 0:
            board[0][0] = -1;
            break;
          case 1:
            board[0][2] = -1;
            break;
          case 2:
            board[2][0] = -1;
            break;
          case 3:
            board[2][2] = -1;
            break;
        }
        aux = 1;
  }
}

void validate(){
  // Empieza el jugador
  if(num_Start == 0){
    x = mouseX;
    y = mouseY;
    y = y/200;
    x = x/200;
    if(board[y][x] == 0){
      board[y][x] = player;
      if(cont <= 3)
        blockPlayIA();
      cont++;
      cont2+=2;
    }
  }
  // Empieza la IA
  if(num_Start == 1){
    if(shifts == 0){
      playIA();
      shifts = 1;
    }
    if(shifts == 1 && mousePressed){
      x = mouseX;
      y = mouseY;
      y = y/200;
      x = x/200;
      if(board[y][x] == 0){
        board[y][x] = player;
        shifts = 0;
        cont2+=2;
      }
    }
  }
}

void declare(){
  if(winner == 1){
    textFont(f, 80);
    fill(255,215,0);
    textAlign(CENTER);
    msg = "WIN";
    text(msg, 300, 300);
  }
  if(winner == 2 || (cont2 >= 9 && winner == 0)){
    textFont(f, 80);
    fill(255,0,0);
    textAlign(CENTER);
    msg = "DRAW";
    text(msg, 300, 300);
   }
}

void draw(){
  background(192,192,192);
  drawBoard();
  drawMarks();
  if(mousePressed && num_Start == 0)
    validate();
  if(num_Start == 1)
    validate();
  check();
  declare();
}
