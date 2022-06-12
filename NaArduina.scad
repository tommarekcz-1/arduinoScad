include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

// Definice
sirkaMat = 3.9;  // Je to sirka toho materialu
diraDelka = 10;     // Delka diry na slicovani
diraMezera = 10; // Mezera mezi jednotlivymi dirami

/* Arduino 68 x 53 x 30 mm

Malina 68 x 56 x 40 mm

3 patra 
na patre 6 pozic



*/

arduinoX = 53;
arduinoY = 68;
arduinoZ = 30;
ardDX = 6;
ardDY = 10;

pocetArduin = 6;

sirkaPolice = pocetArduin*arduinoX + pocetArduin*ardDX;

policeVyska = sirkaMat + 2*arduinoZ;
policePocet = 3;

//deska(200,200, false);

//Police();

for(k=[0:(policePocet-1)]){
    translate([0,0, k*policeVyska]) Police();
    
}

module Police(){
        
    cube([sirkaPolice, arduinoY + 2* ardDY, sirkaMat]);
    
    for(i=[0:(pocetArduin - 1)]){
       translate([ardDX/2 + i*(arduinoX + ardDX), ardDY,sirkaMat]) Arduino();        
    }
    
}

//Arduino();
module Arduino(){
    color("red") cube([arduinoX, arduinoY, arduinoZ]);    
}

module DopnkovaKostrka(){
      cube(sirkaMat);
}

module deska(x = 100, y = 100, v1 = true, v2 = true, v3 = true, v4 = true, v1Posun = 0, v2Posun = 0, v3Posun = 0, v4Posun = 0){
  sirkaV1 = (v1==true? sirkaMat: v1);
  sirkaV2 = (v2==true? sirkaMat: v2);
  sirkaV3 = (v3==true? sirkaMat: v3);
  sirkaV4 = (v4==true? sirkaMat: v4);
  
  //echo(sirkaV1);
  
  difference(){
    cube([x, y, sirkaMat]);
    
    // Vyriznuti po X
    for (i = [diraMezera: diraMezera + diraDelka: x + diraMezera + diraDelka]){
      if(sirkaV1 > 0) translate([i + v1Posun, -0.1, -0.1]) cube([10, sirkaV1+0.1, sirkaMat + 0.2]);
      if(sirkaV3) translate([i + v3Posun, y - sirkaV3+0.1, -0.1]) cube([10, sirkaV3+0.1, sirkaMat + 0.2]);
    }
    
    // Vyriznuti po Y
    for (i = [diraMezera: diraMezera + diraDelka: y + diraMezera + diraDelka]){
      if(sirkaV2) translate([-0.1, i + v2Posun, -0.1]) cube([sirkaV2+0.1, 10, sirkaMat + 0.2]);
     if(sirkaV4) translate([x - sirkaV4 +0.1, i + v4Posun, -0.1]) cube([sirkaV4+0.1, 10, sirkaMat + 0.2]);
    }
  }  
}

module DoplnekDeskyKlice(posun = 100){
  translate([posun - sirkaMat, 0, 0]) cube([sirkaMat, sirkaMat, sirkaMat]);
}

// Udela dirky pro nasazeni doprostredka toho mista
module Dirky(x = 100){
  for (i = [diraMezera: diraMezera + diraDelka: x]){
      translate([i, -sirkaMat / 2, -0.1]) cube([10, sirkaMat, sirkaMat + 0.2]);
  }
}


module ProstorProSupliky(){
    vyska = 220;
   hloubka = 150;
  delka = 730;
  
    translate([0, 0,0])  %cube([730, 150, 220]);   
}