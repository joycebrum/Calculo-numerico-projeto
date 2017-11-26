function[ret, erro] = AproximacaoLinear()//relacao linear da nota com a taxa e o nivel usando minimos quadrados
    //z = ax + by + c x=nivel y=taxa z=nota
    T = Entrada();//recebe a matriz com todos os pontos
    N = size(T)
    n = N(1,1)//numero de linhas da matriz T
    A = zeros(n,3)
    //A = zeros(n,2)
    b = zeros(n,1)
    for i=1:1:n
        A(i,1) = T(i,1)//nivel
        A(i,2) = T(i,2)//taxa de aprovacao
        A(i,3) = 1
        b(i,1) = T(i,3)/10//nota de 0 a 100
    end
    At = A'*A
    bt = A'*b
    ret = At\bt//resolve o sistema linear
    a = ret(1,1)//pega os valores dos coeficientes para montar a funcao
    b = ret(2,1)
    c = ret(3,1)
    //desenhar a funcao
    deff('z=f(x,y)','z=a*x+b*y+c')
    x=0:0.2:100 ;y = x ;
    clf() ;fplot3d(x,y,f,alpha=5,theta=31)
    erro = Erro(A, ret, b);
endfunction

function[nota] = preveNotaLinear(ponto, y)//recebe um ponto do tipo (nivel socio-economico, taxa de aprovação) e o vetor retornado em Aproximacao Linear e retonar a Nota possivel
    nota = y(1,1)*ponto(1,1) + y(2,1)*ponto(2,1) + y(3,1) //a*x + b*y + c
    if nota>100 then
        nota = 100
    end
    if nota < 0 then
        nota = 0
    end
endfunction

function[erro] = Erro(A,x ,b)
    erro = norm((A*x) - b)//verificar
endfunction

