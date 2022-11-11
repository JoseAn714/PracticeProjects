module DE_mod

   implicit none
   private 
   
   public :: rand01, X0, Vmut, Ucr, Sel, Best, DE_Method !rand1p, random_sample
   !Los comentados no son necesarios tenerlos públicos
  
   contains
    
    !Genera un aleatorio en [0,1)
    function rand01() result(fr)
     real(8) :: fr
     call random_number(fr)
    end function rand01
  
    ! Operador (función) que genera la población inicial
    ! fr = X0(m,bL,bU)
    ! m: número de individuos
    ! bL: Límites inferiores
    ! bU: Límites superiores
  
    function X0(m, bL, bU) result(fr)
     integer, intent(in) :: m 
     real(8), intent(in), dimension(:) :: bL, bU !1
     real(8), dimension(m,size(bL)) :: fr !2
     integer :: n, i, j
     real(8) :: r
  
     n = size (bL)
     do i = 1,m
      do j = 1,n
       r = rand01()
       fr(i, j) = bL (j) + r * (bU (j) - bL (j))
      end do
     end do
    end function X0 
    !1: dimension(:) es un arreglo de dimension desconocida de rango 1, dimension(:,:) sería igual pero para una matriz
    !2: Solo los argumentos llevan intent
  
    function rand1p(p) result(fr)
     !Genera un aleatorio del 1 al p
     integer, intent(in) :: p 
     integer :: fr 
     
     fr = floor(rand01()*p) + 1  !1
  
    end function rand1p
    !1: floor redondea hacia abajo para todos los decimales
  
    !Genera una muestra aleatoria de tamaño nrs de numeros del 1 al m
    function random_sample(m, nrs) result(fr)
     integer, intent(in) :: m, nrs 
     integer, dimension(nrs) :: fr
     integer, dimension(m) :: v
     integer :: k, rnd
  
     do k = 1,m 
        v(k) = k
     end do
  
     do k = 1,nrs 
        rnd = rand1p(m-k+1)
        fr(k) = v(rnd) 
        v(rnd) = v(m-k+1)
     end do 
  
    end function random_sample
    
    !Operador (función) que genera la mutación
    function Vmut(X,bL,bU,F,variante) result(V)
     real(8), intent(in), dimension(:,:) :: X 
     real(8), intent(in), dimension(size(X,2)) :: bL, bU
     real(8), intent(in) :: F 
     character(len=1), intent(in) :: variante !j o d, J o D
     real(8), dimension(size(X,1),size(X,2)) :: V 
     integer :: m, n, j, i, r0, r1, r2 
     integer, dimension(3) :: rv 
     real(8) :: rnd 
  
     m = size(X,1); n = size(X,2) !1
     
     if(variante == 'D' .or. variante == 'd') then !2
        do i = 1,m
         rv = random_sample(m, 3)
         r0 = rv (1); r1 = rv (2); r2 = rv (3)
         rnd = rand01()
           do j = 1,n
            V(i, j) = X(r0, j) + F * rnd * (X(r1, j) - X(r2, j))
              if (V (i, j) < bL (j) .or. V (i, j) > bU (j)) & !3
               V(i, j) = bL(j) + rand01() * (bU(j) - bL(j))
           end do
        end do
     elseif(variante == 'J' .or. variante == 'j') then
        do i = 1,m
           rv = random_sample(m, 3)
           r0 = rv (1); r1 = rv (2); r2 = rv (3)
             do j = 1,n
              rnd = rand01()
              V(i, j) = X(r0, j) + F * rnd * (X(r1, j) - X(r2, j))
                if (V (i, j) < bL (j) .or. V (i, j) > bU (j)) &
                 V(i, j) = bL(j) + rand01() * (bU(j) - bL(j))
             end do
          end do
        else
           print*, 'variante debe ser J o D' 
     end if
  
    end function Vmut
    !1: Se pueden poner varias instrucciones en una misma linea con ;
    !2: Para if, si solo es un enunciado se puede usar sin tener un end
    !si se tiene mas de un enunciado se utiliza 'then' despues del enunciado y ya se pone end if
    !3: para continuar una misma linea en otra linea se usa el &
   
    !Operador (función) que genera la cruza
   function Ucr(X, V, Cr) result(U)
     real(8), intent(in), dimension(:,:) :: X, V 
     real(8), intent(in) :: Cr 
     real(8), dimension(size(X,1),size(X,2)) :: U 
     !real(8), allocatable, dimension(:,:) :: U !1
     !allocate(U(m,n)) !1
     integer :: m, n, i, j, jrand
     real(8) :: r 
  
     m = size(X,1)
     n = size(X,2)
  
     U = X 
     do i=1,m 
        do j=1,n 
           r = rand01()
           jrand = rand1p(n)
           if (r <= Cr .or. j == jrand)  U(i, j) = V(i, j)
        end do
     end do 
     
   end function Ucr
   !1: Esta es otra forma en la que se puede resolver si no se saben las medidas de U
   
   !Operador (función) que genera la selección
   function Sel(fob, X, U, maxmin) result(S)
     interface
        function fob(r) result(fr)
           real(8), intent(in), dimension(:) :: r 
           real(8) :: fr
        end function
     end interface !1
  
     real(8), intent(in), dimension(:,:) :: X, U 
     character(len=1), intent(in) :: maxmin
     real(8), dimension(size(X,1),size(X,2)) :: S 
     integer :: m, i 
     real(8), dimension(size(X,2)) :: ui, xi 
  
     m = size (X, 1)
     S = X
     if (maxmin == 'm') then
      do i = 1,m
         ui = U(i,:)
         xi = X(i,:)
         if (fob(ui) <= fob(xi))  S(i,:) = ui !2
      end do 
     else if (maxmin == 'M') then
      do i = 1,m
         ui = U(i,:)
         xi = X(i,:)
         if (fob(ui) >= fob(xi))  S(i,:) = ui !2
      end do 
     end if
   end function Sel
   !1: Genera una variable función
   !2: El simbolo <= se tiene porque se busca minimizar, solo seria cambiarlo para maximizar
  
   !Operador del método de evolución diferencial (diferential evolution - DE)
   subroutine Best(fob,X,maxmin,mejor,resultado)
     interface
        function fob(r) result(fr)
           real(8), intent(in), dimension(:) :: r 
           real(8) :: fr
        end function
     end interface
  
     real(8), intent(in), dimension(:,:) :: X 
     real(8), intent(out), dimension(size(X,2)) :: mejor  !3
     real(8), intent(out) :: resultado 
     real(8), dimension(size(X,1)) :: vecval  !4 
     integer :: m, k
     integer, dimension(1) :: respos 
     character(len=1), intent(in) :: maxmin
  
     m = size(X,1)
     do k=1,m 
        vecval(k) = fob(X(k,:))
     end do 
  
     if (maxmin == 'm') respos = minloc(vecval) !1 !2
     if (maxmin == 'M') respos = maxloc(vecval)
     mejor = X(respos(1),:)
     resultado = vecval(respos(1))
      
  end subroutine Best
  !1: minloc arroja un vector con todas las posiciones con mínimo 
  !2: se definira respos como vector de una dimension para que solo se tenga un valor
  !3: size(X,2) es el la dimensión de las columnas
  !4: size(X,1) es el la dimensión de las filas
  
  subroutine DE_Method(fob,bL,bU,m,gmax,Cr,F,variante,maxmin,resultado,mejor,tm)
     interface
         function fob(r) result(fr)
         real(8), intent(in), dimension(:) :: r 
         real(8) :: fr
         end function
     end interface
  
     !Agrugemntos de la subrutina
     real(8), intent(in), dimension(:) :: bL, bU
     integer, intent(in) :: m, gmax 
     real(8), intent(in) :: Cr, F 
     character(len=1), intent(in) :: variante 
     character(len=1), intent(in) :: maxmin
     real(8), intent(out), dimension(size(bL)) :: mejor 
     real(8), intent(out) :: resultado, tm 
  
     !Argumentos fuera de la subrutina
     real(8), dimension(m,size(bL)) :: Xi, X, V, U, S 
     integer :: i 
     real(8) :: t1 
  
     call cpu_time(t1)
     Xi = X0(m,bL,bU)
     X = Xi   
     do i = 1,gmax 
        V = Vmut(X,bL,bU,F,variante)
        U = Ucr(X,V,Cr)
        S = Sel(fob,X,U,maxmin)
        X = S 
     end do   
     call Best(fob,X,maxmin,mejor,resultado)
     call cpu_time(tm)
  
     tm = tm - t1 
  
  end subroutine DE_Method
  
  end module DE_mod