#include <iostream>
#include <fstream>
#include "SnakePlusPlus.h"

using namespace std;

int main(int argc, char *argv[])
{
    setcolor(9);
    lecturaM();
    setcolor(15);
    gotoxy (10,11);
        cout << "Ajueste la pantalla antes de comenzar"; 
    gotoxy (3,12);
        cout << "*Fuente recomendada:\"Fuentes de mapa de bits\" (12x16)*";
    gotoxy (9,13);
    system("PAUSE");
    system("CLS");
    for(;;) { 
        system("CLS");
        setcolor(10);
        lecturaSNAKE();
        setcolor(4);
        lecturaMenu();
        menu(19,9,0xCF,0xE6);
    }
    return 0;
}

