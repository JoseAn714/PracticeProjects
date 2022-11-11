include './DE_Method/DE_mod.f90'
include './Fun/Functions.f90'

 !main program
 program DifferentialEvolution
  use DE_mod
  use fun_mod
  implicit none
  
  integer, parameter :: m = 1000, n = 2, gmax = 100
  real(8), parameter :: F = 1d0, Cr = 0.5, PI=4d0*DATAN(1d0)
  real(8), parameter, dimension(n) :: bL = [-5d0,-5d0], bU = [5d0,5d0]
  !real(8), parameter, dimension(n) :: bL = [0d0,0d0], bU = [PI,PI] !Para función Michalewicz
  character(len=1), parameter :: variante = 'D' !D o d, dither; j o J, Jither
  character(len=1), parameter :: maxmin = 'm' !m, mínimo; M, máximo
  real(8), dimension(n) :: mejor
  real(8) :: resultado, tm 
  integer :: entrada

  print*, ' '
  print*,'Selecciona la funcion:'
  print*, 'Cosine_Mixture: 1'
  print*, 'Griewank: 2'
  print*, 'Inverted_Cosine_Wave: 3'
  print*, 'Michalewicz: 4'
  print*, 'Rastrigin: 5'
  print*, 'Rosenbrock: 6'
  print*, 'Shubert 7'
  print*, 'Sinusoidal_Problem: 8'
  print*, 'Sphere: 9'
  print*, 'Zakharov: 10'
  write(*,'(a)',ADVANCE='NO')  'Enter size= '
  read(*,*) entrada

  if(entrada == 1) then
    call DE_Method(Cosine_Mixture,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Cosine_Mixture'  
 
  else if(entrada == 2) then
    call DE_Method(Griewank,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Griewank'  

  else if(entrada == 3) then
    call DE_Method(Inverted_Cosine_Wave,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Inverted_Cosine_Wave'

  else if(entrada == 4) then
    call DE_Method(Michalewicz,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Michalewicz'

  else if(entrada == 5) then
    call DE_Method(Rastrigin,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Rastrigin'

  else if(entrada == 6) then
    call DE_Method(Rosenbrock,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Rosenbrock'  

  else if(entrada == 7) then
    call DE_Method(Shubert,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Shubert'

  else if(entrada == 8) then
    call DE_Method(Sinusoidal_Problem,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Sinusoidal_Problem'

  else if(entrada == 9) then
    call DE_Method(Sphere,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Sphere'


  else if(entrada == 10) then
    call DE_Method(Zakharov,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
    print*, ' '
    print*, 'Zakharov'

  else 
    print*, ' '
    print*, 'Tiene que se ser un número entero del 1 al 10.'
    print*, ' '

  end if

  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  if (maxmin == 'M') print*, 'Maximo'
  if (maxmin == 'm') print*, 'Minimo'
  write(*,('(f0.6)')) resultado
  print*, 'Tiempo:', tm
  print*, ' '

 end program DifferentialEvolution
 !gfortran .\DE.f90 -o DE.exe