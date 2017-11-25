//Como o nivel socio esconomico era dado apenas como muito alto, alto, medio alto etc coloquei porcentagens associadas a cada numero
//Muito Alto 100
//Alto 83.3333333333
//Medio Alto 66.6666666666
//Medio 50
//Medio Baixo 33.3333333333
//Baixo 16.6666666666
//Muito Baixo 0

function[ret] = AproximacaoQuadNivel()//matriz do tipo [nivel , taxa de aprovacao , nota]
    //tentar achar uma relacao entre o nivel socio economico de uma escola e sua taxa de aprovacao( passar alunos direto eh uma boa ideia?)
    //a matriz cujas linhas possuem os valores de nivel socioeconomico e taxa de aprovacao
    //z = ax^2 + by + c x=nivel y=resenca z=nota
    T = Entrada()
    N = size(T)
    n = N(1,1)
    A = zeros(n,3)
    b = zeros(n,1)
    for i=1:1:n
        A(i,1) = T(i,1)^2 //x^2 -- nivel socio economico
        A(i,2) = T(i,2) //y--taxa de aprovacao
        A(i,3) = 1
        b(i,1) = T(i,3)/10 //z--nota de 0 a 100
    end
    At = A'*A
    bt = A'*b
    ret = At\bt
    a = ret(1,1)
    b = ret(2,1)
    c = ret(3,1)
    //desenhar a funcao
    deff('z=f(x,y)','z=a*x^2+b*y+c')
    x=0:0.2:100 ;y = x ;
    clf() ;fplot3d(x,y,f,alpha=5,theta=31)
endfunction

function[nota] = preveNotaQuadNivel(ponto, y)
    nota = y(1,1)*ponto(1,1)^2 + y(2,1)*ponto(2,1) + y(3,1)
    if nota>100 then
        nota = 100
    end
    if nota < 0 then
        nota = 0
    end
endfunction


function[ret] = AproximacaoQuadTaxa()//matriz do tipo [nivel , taxa de aprovacao , nota]
    //tentar achar uma relacao entre o nivel socio economico de uma escola e sua taxa de aprovacao( passar alunos direto eh uma boa ideia?)
    //a matriz cujas linhas possuem os valores de nivel socioeconomico e taxa de aprovacao
    //z = ax + by^2 + c x=nivel y=resenca z=nota
    T = Entrada()
    N = size(T)
    n = N(1,1)
    A = zeros(n,3)
    b = zeros(n,1)
    for i=1:1:n
        A(i,1) = T(i,1) //x -- nivel socio economico
        A(i,2) = T(i,2)^2 //y^2--taxa de aprovacao
        A(i,3) = 1
        b(i,1) = T(i,3) //z--nota
    end
    At = A'*A
    bt = A'*b
    ret = At\bt
    a = ret(1,1)
    b = ret(2,1)
    c = ret(3,1)
    //desenhar a funcao
    deff('z=f(x,y)','z=a*x+b*y^2+c')
    x=0:0.2:100 ;y = x ;
    clf() ;fplot3d(x,y,f,alpha=5,theta=31)
endfunction

function[nota] = preveNotaQuadTaxa(ponto, y)
    nota = y(1,1)*ponto(1,1) + y(2,1)*ponto(2,1)^2 + y(3,1)
    if nota>100 then
        nota = 100
    end
    if nota < 0 then
        nota = 0
    end
endfunction

