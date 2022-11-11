#define _SNAKEPLUSPLUS_H
#include <iostream>
#include <windows.h>
#include <string.h>
#include <conio.h>
#include <stdlib.h>
#include <fstream>

using namespace std;

void gotoxy(int x, int y); //Basado en material brindado en el aula
void setcolor(int col); //Basado en material brindado en el aula
void lecturaM(); //Basado en Programación ATS
void lecturaM2(); //Basado en Programación ATS
void lecturaSNAKE(); //Basado en Programación ATS
void lecturaMenu(); //Basado en Programación ATS con ajustes personales
void lecturaMenuS(); //Basado en Programación ATS
void lecturaP(); //Basado en Programación ATS
void lecturaPU(); //Basado en Programación ATS
void menu (int x, int y, int col, int col2); //Elaborado personalmente
void menuS (int x, int y, int col, int col2); //Elaborado personalmente
void SNAKEPLUSPLUS(int x, int y, int xc, int yc, int S); //Elaborado personalmente
void GAMEOVER(int P, int S); //Elaborado personalmente

void gotoxy(int x, int y){
    HANDLE hConsoleOutput;
    COORD coord;
    hConsoleOutput = GetStdHandle (STD_OUTPUT_HANDLE);
    coord.X = x; coord.Y = y;
    SetConsoleCursorPosition (hConsoleOutput, coord);
}

void setcolor(int col){
    SetConsoleTextAttribute (GetStdHandle (STD_OUTPUT_HANDLE),col);
} 

void lecturaM(){
    ifstream archivo;
    string marco;
    archivo.open("Marco.txt",ios::in);
    while (!archivo.eof()){
        getline(archivo,marco);
        cout << marco << endl;
    }
    archivo.close();
}

void lecturaM2(){
    ifstream archivo;
    string marco;
    archivo.open("Marco2.txt",ios::in);
    while (!archivo.eof()){
        getline(archivo,marco);
        cout << marco << endl;
    }
    archivo.close();
}

void lecturaSNAKE(){
    ifstream archivo;
    string titulo;
    archivo.open("SNAKE.txt",ios::in);
    while (!archivo.eof()){
        getline(archivo,titulo);
        cout << titulo << endl;
    }
    archivo.close();
}

void lecturaMenu(){
    int a=8;
    ifstream archivo;
    string menu;
    archivo.open("Menu.txt",ios::in);
    while (!archivo.eof()){
        getline(archivo,menu);
        gotoxy (18,a);
        cout << menu << endl;
        a++;
    }
    archivo.close();
}

void lecturaMenuS(){
    int a=8;
    ifstream archivo;
    string menuS;
    archivo.open("MenuS.txt",ios::in);
    while (!archivo.eof()){
        getline(archivo,menuS);
        gotoxy (18,a);
        cout << menuS << endl;
        a++;
    }
    archivo.close();
}

void lecturaP(){
    ifstream archivo;
    string programador;
    archivo.open("Programador.txt",ios::in);
    while (!archivo.eof()){
        getline(archivo,programador);
        cout << programador << endl;
    }
    archivo.close();
}

void lecturaPU(){
    ifstream archivo;
    string puntuacion;
    archivo.open("Puntuacion.txt",ios::in);
    while (!archivo.eof()){
        getline(archivo,puntuacion);
        cout << puntuacion << endl;
    }
    archivo.close();
}

void menu (int x, int y, int col, int col2){
    int S, n=5;
    char t;
    setcolor(col);
    for (int i=1; i<=n; i++){
      gotoxy (x,y);
        switch (y){
            case 9:
                cout << "JugarSNAKE++";
                break;
            case 10:
                cout << "Puntuaciones";
                break;
            case 11:
                cout << "Programador ";
                break;
            case 12:
                cout << "Como jugar  ";
                break;
            case 13:
                cout << "Salir       ";
        }
        y++;
    }
    gotoxy (x,y);
    while (t!=13){
        if (kbhit())
            fflush(stdin);
            t = getch();
        switch (t){
            case 'H':
                if (y>9)
                    y--;
                break;
            case 'P':
                if (y<13)
                    y++;
                break;
        }
        gotoxy (19,y);
        switch (y){
            case 9:
                setcolor (col2);
                cout << "JugarSNAKE++";
                break;
            case 10:
                setcolor (col2);
                cout << "Puntuaciones";
                break;
            case 11:
                setcolor (col2);
                cout << "Programador ";
                break;
            case 12:
                setcolor (col2);
                cout << "Como jugar  ";
                break;
            case 13:
                setcolor (col2);
                cout << "Salir       ";
                break;
            default: setcolor(col);
                }
            if (y!=9){
                    gotoxy(19,9);
                setcolor (col);
                    cout << "JugarSNAKE++";
            }
            if (y!=10){
                    gotoxy(19,10);
                setcolor (col);
                    cout << "Puntuaciones";
                    gotoxy(19,10);
            }
            if (y!=11){
                    gotoxy(19,11);
                setcolor (col);
                    cout << "Programador ";
            }
            if (y!=12){
                    gotoxy(19,12);
                setcolor (col);
                    cout << "Como jugar  ";
            }
            if (y!=13){
                    gotoxy(19,13);
                setcolor (col);
                    cout << "Salir       ";
            }
    }
    if (kbhit())
        fflush(stdin);
    t = getch();
    switch (t){
        case 13:
            if (y==9){ 
                setcolor(0x0F);               
                system("CLS");
                setcolor(14);
                lecturaMenuS();
                setcolor(3);
                lecturaSNAKE;
                menuS(x,y,col,col2);
                cin.get();
            }
            if (y==10){
                setcolor(0x0F);
                system("CLS");
                lecturaPU();
                cin.get();
            }
            if (y==11){
                setcolor(9);
                system("CLS");
                lecturaP();
                cin.get();
            }
            if (y==12){
                setcolor(7);
                system("CLS");
                cout << "Como jugar...\n-El objetivo del juego es conseguir la mayor cantidad de puntos alcanzando el punto rojo con la carita feliz." << endl;
                cout << "-El obstaculo de Snake++ es que al pasar los 3 puntos, al girar una segunda vez sin esperar que la cola gire completamente queda un rastro que no puede ser tocado despues." << endl;
                cout << "-Una vez obtenido un punto, el campo se limpia." << endl;
                cout << "-Las dificultades se basan en el incremento de la velocidad." << endl;
                cout << "-Usar las flechas del teclado para moverse." << endl;
                cout << "-Presionar \"enter\" para terminar la partida." << endl;
                cin.get();
            }
            if (y==13){
                exit(0);
            }
            break;
    }
}

void menuS (int x, int y, int col, int col2){
    char t;
    int n=3;
    setcolor(col);
    for (int i=1; i<=n; i++){
        gotoxy (x,y);
        switch (y){
            case 9:
                cout << "Facil       ";
                break;
            case 10:
                cout << "Normal      ";
                break;
            case 11:
                cout << "Dificil     ";
                break;
        }
        y++;
    }
    gotoxy (x,y);
    while (t!=13){
        if (kbhit())
            fflush(stdin);
            t = getch();
        switch (t){
            case 'H':
                if (y>9)
                    y--;
                break;
            case 'P':
                if (y<11)
                    y++;
                break;
        }
        gotoxy (19,y);
        switch (y){
            case 9:
                setcolor (col2);
                cout << "Facil       ";
                break;
            case 10:
                setcolor (col2);
                cout << "Normal      ";
                break;
            case 11:
                setcolor (col2);
                cout << "Dificil     ";
                break;
            default: setcolor(col);
                }
            if (y!=9){
                    gotoxy(19,9);
                setcolor (col);
                    cout << "Facil       ";
            }
            if (y!=10){
                    gotoxy(19,10);
                setcolor (col);
                    cout << "Normal      ";
                    gotoxy(19,10);
            }
            if (y!=11){
                    gotoxy(19,11);
                setcolor (col);
                    cout << "Dificil     ";
            }
    }
    if (kbhit())
        fflush(stdin);
    t = getch();
    switch (t){
        case 13:
            if (y==9){ 
                setcolor(0x0F);               
                system("CLS");
                SNAKEPLUSPLUS(3,3,3,3,150);
            }
            if (y==10){
                setcolor(0x0F);               
                system("CLS");
                SNAKEPLUSPLUS(3,3,3,3,100);
            }
            if (y==11){
                setcolor(0x0F);               
                system("CLS");
                SNAKEPLUSPLUS(3,3,3,3,50);
            }
    }
}

void SNAKEPLUSPLUS(int x, int y, int xc, int yc, int S){
    char k, s[60][22], d[60][22], o[60][22], c[60][22];
    int m, xo=40, yo=10, Puntuacion=0, a=0, xm=0, ym=0, x2, y2;
    string N;
    for(int i=0;i<=59;i++){
                for(int j=0;j<=21;j++){
                    c[i][j]=0;
                }
            }
    setcolor(2);
    lecturaM2();
    gotoxy(0,23);
    setcolor(14);
    cout << "Puntuacion:  0";
    gotoxy(x,y);
    while (k!=13){
        if (kbhit())
            k = getch();
        switch(k){
            case 'H':
                m = 1;
                break;
            case 'P':
                m = 2;
                break;
            case 'M':
                m = 3;
                break;
            case 'K':
                m = 4;
                break;
        }
        if(a!=0){
            x2=x;
            y2=y;
            setcolor(1);
            gotoxy(x2,y2);
            c[x2][y2]=79;
            cout << c[x2][y2];
        }
        if(xc!=0 && yc!=0 && xc!=59 && yc!=21){
            gotoxy(xc,yc);
            d[xc][yc]=0;
            cout << d[xc][yc];
            if(a!=0){
                x2=xc;
                y2=yc;
                c[x2][y2]=0;
            }
        }
        switch(m){
            case 1: //arriba
                if(y>0){
                    if(xc==x){       
                        y--;
                        yc=(y+a);
                    }
                    if(xc<x){
                        xc++;
                        y--;
                    }
                    if(xc>x){
                        xc--;
                        y--;
                    }
                }               
                break;
            case 2: //abajo
                if(y<21){
                    if(xc==x){    
                        y++;
                        yc=(y-a);
                    }
                    if(xc<x){
                        xc++;
                        y++;
                    }
                    if(xc>x){
                        xc--;
                        y++;
                    }
                }
                break;
            case 3: //derecha
                if(x<59){
                    if(yc==y){    
                        x++;
                        xc=(x-a);
                    }
                    if(yc<y){
                        yc++;
                        x++;
                    }
                    if(yc>y){
                        yc--;
                        x++;
                    }
                }
                break;
            case 4: // izquierda
                if(x>0){
                    if(yc==y){    
                        x--;
                        xc=(x+a);
                    }
                    if(yc<y){
                        yc++;
                        x--;
                    }
                    if(yc>y){
                        yc--;
                        x--;
                    }
                }
                break;
        }
        gotoxy(x,y);
        if(c[x][y]==79)
            break;
        if (x==0 || y==0 || x==59 || y==21)
            break;
        else{
            s[x][y]=2;
            setcolor(1);
            cout << s[x][y];
        } 
        Sleep(S);
        setcolor(4);
        gotoxy(xo,yo);
        o[xo][yo]=15;
        cout << o[xo][yo];
        if (x==xo && y==yo){
            xo = rand()%57 + 1;
            yo = rand()%19 + 1;
            gotoxy(xo,yo);
            cout << o[xo][yo];
            setcolor(14);
            Puntuacion+=1;
            gotoxy(13,23);
            cout << Puntuacion;
            a++;
            for(int i=0;i<=59;i++){
                for(int j=0;j<=21;j++){
                    c[i][j]=0;
                }
            }
            gotoxy(xm,ym);
            setcolor(2);
            lecturaM2();
        }
    }
    cin.get();
    GAMEOVER(Puntuacion, S);
}

void GAMEOVER(int P, int S){
    string N, D;
    system("CLS");
    setcolor(0xF4);
    cout << "GAME OVER" << endl << endl;
    setcolor(0xDF);
    cout << "Tu puntuacion es: " << P << endl;
    setcolor(0x0F);
    cout << "Ingrese un Nickname de 4 letras: ";
    cin >> N;
    if(S==150)
        D="Facil";
    if(S==100)
        D="Normal";
    if(S==50)
        D="Dificil";
    ofstream archivo ("Puntuacion.txt",ios::app);
    if (archivo.is_open()){
        archivo << N << "\t" << P << " " << D << endl;
        archivo.close();
    }
    cin.get();
}

